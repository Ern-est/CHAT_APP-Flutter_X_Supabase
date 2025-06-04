import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  final supabase = Supabase.instance.client;

  void _sendMessage() async {
    final content = _controller.text.trim();
    if (content.isEmpty) return;

    await supabase.from('messages').insert({
      'content': content,
      'sender_id': supabase.auth.currentUser!.id,
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Type a message...'),
            ),
          ),
          IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
        ],
      ),
    );
  }
}
