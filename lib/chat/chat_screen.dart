import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'widgets/message_bubble.dart';
import 'widgets/message_input.dart';
import '../auth/login_screen.dart'; // <- update path if needed

class ChatScreen extends StatelessWidget {
  final supabase = Supabase.instance.client;

  void _logout(BuildContext context) async {
    await supabase.auth.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(),
      ), // replace with your login screen
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final messageStream = supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at');

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: messageStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());

                final messages = snapshot.data!;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[messages.length - 1 - index];
                    return MessageBubble(
                      content: msg['content'],
                      isMe: msg['sender_id'] == supabase.auth.currentUser?.id,
                    );
                  },
                );
              },
            ),
          ),
          MessageInput(),
        ],
      ),
    );
  }
}
