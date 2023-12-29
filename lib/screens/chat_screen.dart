import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:public_chats/main.dart';
import 'package:public_chats/models/chat_user_model.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: _appBar(),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(mq.height * .3),
          child: CachedNetworkImage(
            width: mq.height * .05,
            height: mq.height * .05,
            imageUrl: widget.user.image,
            errorWidget: (context, url, error) => CircleAvatar(
              child: Icon(Icons.person),
            ),
          ),
        ),
        Column(
          children: [
            Text(widget.user.name,style: TextStyle(fontSize: 16,color: Colors.black54,),)
          ],
        )
      ],
    );
  }
}
