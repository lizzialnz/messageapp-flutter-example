import 'package:flutter/material.dart';
import 'package:messageappflutter/presentation/widgets/chat/her_message_bubble.dart';
import 'package:messageappflutter/presentation/widgets/chat/my_message_bubble.dart';
import 'package:messageappflutter/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images-stylist.s3-eu-west-1.amazonaws.com/app/uploads/2020/01/21072140/jennifer-aniston-sag-crop-1579591317-1090x1090.jpg'),
          ),
        ),
        title: const Text('Ana Maria'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const MyMessageBubble()
                        : const HerMessageBubble();
                  }),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
