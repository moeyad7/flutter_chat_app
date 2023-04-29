import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) => Container(
            padding: EdgeInsets.all(8),
            child: Text('This works!'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            FirebaseFirestore.instance
                .collection('chats/mnoH2T214xGHnBE2ADVY/messages')
                .snapshots()
                .listen((data) {
              data.docs.forEach((doc) {
                print(doc['text']);
              });
            });
          },
        ));
  }
}
