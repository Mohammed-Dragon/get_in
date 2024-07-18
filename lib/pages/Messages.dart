import 'package:flutter/material.dart';

class ChatMessage {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});
}

class MessagesScreen extends StatefulWidget {
  final List<Map<String, dynamic>> messages;

  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      controller: _scrollController,
      itemBuilder: (context, index) {
        final messageData = widget.messages[index];
        final message = messageData['text'] as String;
        final isUserMessage = messageData['isUserMessage'] as bool;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment:
                isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(isUserMessage ? 0 : 20),
                    topLeft: Radius.circular(isUserMessage ? 20 : 0),
                  ),
                  color: isUserMessage
                      ? Color.fromARGB(255, 0, 79, 121)
                      : Color.fromARGB(255, 57, 62, 70),
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(
                  message,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
