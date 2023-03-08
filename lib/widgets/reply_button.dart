import 'package:carve_app/models/forum_model.dart';
import 'package:carve_app/models/user_model.dart';
import 'package:carve_app/providers/user_provider.dart';
import 'package:carve_app/screens/forum_detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carve_app/providers/forum_reply_provider.dart';
import 'package:provider/provider.dart';

class ReplyButton extends StatelessWidget {
  Future<void>? createNewReply(
      String authorName, String content, String forumId, DateTime replyId) {
    FirebaseFirestore.instance.collection('forumReply').doc().set({
      "authorName": authorName,
      "content": content,
      'forumId': forumId,
      'replyId': replyId,
      'publishedDate': DateTime.now(),
    });
  }

  final TextEditingController _content = TextEditingController();
  ReplyButton({Key? key}) : super(key: key);

  Color kBorderColor = Color(0XFF02084B).withOpacity(0.2);
  Color kFocusBorderColor = Color(0XFF02084B);
  Color kHintTextColor = Color(0XFF02084B).withOpacity(0.3);
  Color kHintFillColor = Color(0XFF02084B).withOpacity(0.1);
  double kBorderRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    UserModel currentUser =
        Provider.of<UserProvider>(context, listen: false).userProviderData;
    ForumModel displayedContent =
        ModalRoute.of(context)!.settings.arguments as ForumModel;

    var _provider = Provider.of<ForumReplyProvider>(context);
    _provider.selectDisplayedForumReplybyId(displayedContent.id);

    return Container(
      width: 348,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: _content,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                // createNewReply(currentUser.name, _content.text,
                //     displayedContent.id, DateTime.now());

                print(currentUser.name);
                print(displayedContent.id);
                print(_content.text);
                _provider.updateForumReplyList();
              },
              child: Icon(Icons.send, color: kFocusBorderColor)),
          contentPadding: EdgeInsets.only(left: 16, right: 16),
          fillColor: kHintFillColor,
          hintText: "Well, I think...",
          hintStyle: TextStyle(
            color: kHintTextColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kBorderRadius),
            borderSide: BorderSide(color: kBorderColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kFocusBorderColor),
          ),
        ),
      ),
    );
  }
}
