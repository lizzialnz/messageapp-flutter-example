import 'package:flutter/material.dart';
import 'package:messageappflutter/domain/entities/message.dart';
import 'package:provider/provider.dart';

import 'package:messageappflutter/presentation/providers/chat_provider.dart';
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
    // esta pendiente de los cambios
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  }),
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
