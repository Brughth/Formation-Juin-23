import 'package:flutter/material.dart';
import 'package:formation_juin_23/posts_api/posts/presentation/pages/posts_screen.dart';
import 'package:formation_juin_23/university/presentation/screens/search_university_screen.dart';
import 'package:formation_juin_23/whatsapp/authentification/presentation/pages/login_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formation Juin 23"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("WhatsApp"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Posts API"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PostsScreen(
                    title: "POSTS API",
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text("University"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchUniversityScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
