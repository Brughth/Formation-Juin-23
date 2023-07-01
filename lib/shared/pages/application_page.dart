import 'package:flutter/material.dart';
import 'package:formation_juin_23/chats/presentation/chats_screen.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "WhatsApp",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.camera_alt,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.search,
          ),
          SizedBox(width: 15),
          Icon(
            Icons.more_vert,
          ),
          SizedBox(width: 8)
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.people),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Stature",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const ChatsScreen(),
          const ChatsScreen(),
          const ChatsScreen(),
          const ChatsScreen(),
        ],
      ),
    );
  }
}
