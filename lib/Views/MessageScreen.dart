import 'package:flutter/material.dart';
import 'package:roommatch/Models/MatchedUserModel.dart';
import 'package:roommatch/Models/Message.dart';

class MessageScreen extends StatefulWidget {
  final MatchedUserModel matchedUser;
  final Function(String) onMessageSent;

  const MessageScreen(
      {Key? key, required this.matchedUser, required this.onMessageSent})
      : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.matchedUser.firstName} ${widget.matchedUser.lastName}',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.matchedUser.messages.length,
              itemBuilder: (context, index) {
                Message message = widget.matchedUser.messages[index];
                return ListTile(
                  title: Text(message.senderName),
                  subtitle: Text(message.content),
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                String message = textEditingController.text;

                widget.onMessageSent(message);
                textEditingController.clear();

                Future.delayed(Duration(milliseconds: 300), () {
                  if (mounted) {
                    setState(() {});
                  }
                });

                textEditingController.clear();

                Future.delayed(Duration(milliseconds: 300), () {
                  if (mounted) {
                    setState(() {});
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
