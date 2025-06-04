Flutter Supabase Chat App

A real-time chat application built with **Flutter** and **Supabase**, featuring email/password authentication, user registration, and live messaging functionality.

## Features

-  User Authentication (Sign Up & Login)
-  Real-time chat powered by Supabase Realtime
-  User data stored in Supabase `users` table
-  Clean UI with modern Material Design
-  Logout functionality

## Tech Stack

- **Frontend:** Flutter (Dart)
- **Backend-as-a-Service:** Supabase
- **Realtime:** Supabase Realtime Streams
- **Auth:** Supabase Auth

## Screenshots

| Sign Up | Login | Chat |
|--------|-------|------|
| ![SignUp, ![Login] ![Chat]. |

##  Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/flutter-supabase-chat.git
cd flutter-supabase-chat
2. Install Dependencies
bash
Copy
Edit
flutter pub get
3. Configure Supabase
Create a Supabase project.

Enable Authentication and Realtime on your messages table.

Set up the following tables:

users table
Column	Type	Notes
id	uuid	Primary Key
username	text	Required
email	text	Required

messages table
Column	Type	Notes
id	uuid	Primary Key
content	text	Message content
sender_id	uuid	FK to auth.users.id
created_at	timestamp	default: now()

Update your lib/main.dart with your Supabase URL and anon key:

dart
Copy
Edit
await Supabase.initialize(
  url: 'https://your-project.supabase.co',
  anonKey: 'your-anon-key',
);
4. Run the App
bash
Copy
Edit
flutter run
📂 Folder Structure
css
Copy
Edit
lib/
│
├── auth/
│   ├── login_screen.dart
│   └── signup_screen.dart
│
├── chat/
│   ├── chat_screen.dart
│   └── widgets/
│       ├── message_input.dart
│       └── message_bubble.dart
│
└── main.dart


🧑‍🎓 Author
Ernest Cheruiyot
GitHub @Ern-est
Portfolio
Email: anest.developer@gmail.com

📄 License
This project is open source and available under the MIT License.




