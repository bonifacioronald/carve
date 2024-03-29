import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/forum_provider.dart';
import '../screens/forum_detail_screen.dart';
import '../widgets/forum_card.dart';
import '/models/colors.dart' as custom_colors;

class ForumAllScreen extends StatefulWidget {
  static const routeName = '/forum-all';
  const ForumAllScreen({super.key});

  @override
  State<ForumAllScreen> createState() => _ForumAllScreenState();
}

class _ForumAllScreenState extends State<ForumAllScreen> {
  bool _isLoading = true;
  // bool isClicked = false;
  int currentClickedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    if (_provider.forumIdList.isEmpty) {
      _provider.fetchForumId().then(
        (_) {
          print('Successfuly fetched ${_provider.forumIdList.length} ids');
          _provider.fetchAllForumData().then(
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
    var _provider = Provider.of<ForumProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: custom_colors.backgroundPurple,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20,
            left: 20,
            right: 20,
            bottom: 60),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: (() => Navigator.of(context).pop()),
                icon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 40,
                  color: custom_colors.primaryDarkPurple,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'All Forum',
                style: TextStyle(
                    fontSize: 30,
                    color: custom_colors.primaryDarkPurple,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: _provider.forumIdList.length * 200 +
                    _provider.forumIdList.length * 25,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _provider.forumIdList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: (() => Navigator.of(context).pushNamed(
                              forumPage.routeName,
                              arguments: _provider.loadedForumList[index])),
                          child: ForumCard(
                            authorName:
                                _provider.loadedForumList[index].authorName,
                            publishedDate:
                                _provider.loadedForumList[index].publishedDate,
                            category: _provider.loadedForumList[index].category,
                            title: _provider.loadedForumList[index].title,
                            totalLikes:
                                _provider.loadedForumList[index].totalLikes,
                            totalReplies:
                                _provider.loadedForumList[index].totalReplies,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
