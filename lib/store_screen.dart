import 'package:flutter/material.dart';
import 'package:game_store/components/sidebar.dart';
import 'package:game_store/pages/my_games.dart';
import 'package:game_store/pages/store.dart';
import 'package:sidebarx/sidebarx.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _sidebarController = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Builder(
        builder: (context) {
          return Scaffold(
            key: _key,
            appBar: AppBar(
              title: const Text(
                "Game Store",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              ),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                )
              ),
              backgroundColor: const Color.fromARGB(255, 25, 30, 41),
            ),
            drawer: Sidebar(controller: _sidebarController),
            body: Center(
              child: AnimatedBuilder(
                animation: _sidebarController,
                builder: (context,build) {
                  switch(_sidebarController.selectedIndex) {
                    case 0: 
                      return const StorePage();

                    case 1:
                      return const MyGamesPage();

                    default: 
                      return const StorePage();
                  }
                },
              )
            ),
          );
        }
      ),
    );
  }
}