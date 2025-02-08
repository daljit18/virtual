// Suggested code may be subject to a license. Learn more: ~LicenseLog:4040148025.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2586569490.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:651112600.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3392762605.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2933639300.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1165473347.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1857699594.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:815447094.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3607586578.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3757414512.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1423718584.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:280150839.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3647114042.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:65240468.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3709684751.
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hello!", sender: "other"),
    ChatMessage(text: "Hi there!", sender: "user"),
    ChatMessage(text: "How are you?", sender: "other"),
    ChatMessage(text: "I'm doing great, thanks!", sender: "user"),
  ];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(ChatMessage(text: text, sender: "user"));
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => _handleSubmitted(_textController.text),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _messages.length,
              itemBuilder: (_, int index) =>
                  _buildChatItem(_messages[index]),
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildChatItem(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: message.sender == 'user'
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (message.sender != 'user')
            const CircleAvatar(
              child: Text('O'),
            ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.sender == 'user'
                    ? Colors.blue[100]
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(message.text),
            ),
          ),
           if (message.sender == 'user')
            const CircleAvatar(
              child: Text('U'),
            ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final String sender;

  ChatMessage({required this.text, required this.sender});
}
