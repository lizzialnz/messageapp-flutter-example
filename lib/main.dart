import 'package:flutter/material.dart';
import 'package:messageappflutter/config/theme/app_theme.dart';
import 'package:messageappflutter/presentation/providers/chat_provider.dart';
import 'package:messageappflutter/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 5).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
