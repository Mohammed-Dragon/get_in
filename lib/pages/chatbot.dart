import 'package:flutter/material.dart';
import 'package:get_in/pages/messages.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:provider/provider.dart';
import 'package:get_in/pages/Save.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  _ChatbotState createState() => _ChatbotState();

  static void sendMessage(BuildContext context, String message) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.addMessage(message, false); // Add chatbot message
  }
}

bool _hasSentGreeting = false;

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) {
      dialogFlowtter = instance;
      if (!_hasSentGreeting) {
        sendGreetingMessage();
        _hasSentGreeting = true; // Update flag
      }
    });
  }

  void handleLocationPermissionDenied() {
    final appState = Provider.of<AppState>(context, listen: false);
    final message =
        "Great, you must now go to the Places page to choose the appropriate location for you.";
    appState.addMessage(message, false); // Add chatbot message
  }

  void sendGreetingMessage() async {
    final appState = Provider.of<AppState>(context, listen: false);
    final greetingMessage =
        "Hello, I am your personal navigation assistant. Where do you want to go today?";
    appState.updateMessage(greetingMessage);
    appState.addMessage(greetingMessage, false); // Add chatbot message
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 185, 217, 222),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: appState.messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color.fromARGB(255, 0, 173, 181),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.black),
                      cursorColor: const Color.fromARGB(255, 0, 173, 181),
                      cursorErrorColor: Colors.deepPurple,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      final appState = Provider.of<AppState>(context, listen: false);
      appState.updateMessage(text);
      appState.addMessage(text, true); // Add user message
      if (text.toLowerCase().contains("location permission denied")) {
        // Handle message when location permission is denied
        handleLocationPermissionDenied();
      } else {
        final response = await dialogFlowtter.detectIntent(
            queryInput: QueryInput(text: TextInput(text: text)));
        if (response.message != null) {
          final message = response.message!.text?.text?.first ?? '';
          appState.addMessage(message, false); // Add chatbot message
        }
      }
    }
  }
}
