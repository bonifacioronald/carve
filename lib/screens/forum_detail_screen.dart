import '../models/forum_model.dart';
import '../models/user_model.dart';
import '../providers/forum_reply_provider.dart';
import '../providers/user_provider.dart';
import '../screens/loading_screen.dart';
import '../widgets/forum_content_page_card.dart';
import '../widgets/reply_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/models/colors.dart' as custom_colors;
import 'package:intl/intl.dart';

class forumPage extends StatefulWidget {
  static const routeName = '/forum-detail';
  const forumPage({super.key});

  @override
  State<forumPage> createState() => _forumPageState();
}

class _forumPageState extends State<forumPage> {
  final TextEditingController _content = TextEditingController();
  bool _isLoading = true;

  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumReplyProvider>(context, listen: false);
    if (_provider.forumReplyIdList.isEmpty) {
      _provider.fetchForumReplyId().then(
        (_) {
          print('Successfuly fetched ${_provider.forumReplyIdList.length} ids');
          _provider.fetchAllForumReplyData().then(
            (_) {
              setState(
                () {
                  _isLoading = false;
                },
              );
            },
          );
        },
      );
    } else {
      setState(
        () {
          _isLoading = false;
        },
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMM dd').format(now);
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ForumModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ForumModel;
    var _provider2 = Provider.of<ForumReplyProvider>(context);
    _provider2.selectDisplayedForumReplybyId(displayedContent.id);

    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: custom_colors.backgroundPurple,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 8),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new,
              size: 32, color: custom_colors.primaryDarkPurple),
        ),
        titleSpacing: 0,
        title: Text("View Forum",
            style: TextStyle(
                color: custom_colors.primaryDarkPurple,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      body: _isLoading
          ? LoadingScreen()
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        forumContentCard(
                            authorName: displayedContent.authorName,
                            category: displayedContent.category,
                            title: displayedContent.title,
                            content: displayedContent.content,
                            totalLikes: displayedContent.totalLikes,
                            publishedDate: displayedContent.publishedDate),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Replies (${_provider2.filteredForumReplyList.length})",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              "See all replies",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: custom_colors.primaryDarkPurple,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          height:
                              _provider2.filteredForumReplyList.length * 420 +
                                  _provider2.filteredForumReplyList.length * 50,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _provider2.filteredForumReplyList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  replyCard(
                                    authorName: _provider2
                                        .filteredForumReplyList[index]
                                        .authorName,
                                    content: _provider2
                                        .filteredForumReplyList[index].content,
                                    publishedDate: _provider2
                                        .filteredForumReplyList[index]
                                        .publishedDate,
                                  ),
                                  const SizedBox(height: 16)
                                ],
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
