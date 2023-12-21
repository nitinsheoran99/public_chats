import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:public_chats/api/apis.dart';
import 'package:public_chats/main.dart';
import 'package:public_chats/models/chat_user_model.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.redAccent,
          onPressed: () async {
            await APIs.auth.signOut();
            await GoogleSignIn().signOut();
          },
          icon: const Icon(
            Icons.logout,
          ),
          label: Text("Logout"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * .05),
        child: Column(
          children: [
            //for adding some space
            SizedBox(
              width: mq.width,
              height: mq.height * .03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * .1),
              child: CachedNetworkImage(
                width: mq.height * .2,
                height: mq.height * .2,
                fit: BoxFit.fill,
                imageUrl: widget.user.image,
                errorWidget: (context, url, error) => CircleAvatar(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            //for adding some space
            SizedBox(
              height: mq.height * .03,
            ),
            Text(
              widget.user.email,
              style: TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              height: mq.height * .05,
            ),
            TextFormField(
              initialValue: widget.user.name,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "eg. Happy Singh",
                label: Text("Name"),
              ),
            ),
            SizedBox(
              height: mq.height * .02,
            ),
            TextFormField(
              initialValue: widget.user.about,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                hintText: "eg. Felling Happy",
                label: Text("About"),
              ),
            ),
            SizedBox(
              height: mq.height * .02,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                minimumSize: Size(mq.width * .5, mq.height * .6),
               ),
              onPressed: () {},
              icon: Icon(Icons.edit,size: 28,),
              label: Text("UPDATE",style: TextStyle(fontSize: 16),),
            ),
          ],
        ),
      ),
    );
  }
}
