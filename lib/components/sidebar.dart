import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  final SidebarXController controller;
  const Sidebar({Key? key, required this.controller}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      theme: const SidebarXTheme(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 25, 30, 41),
          borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
        ),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        selectedIconTheme: IconThemeData(
          color: Color.fromARGB(255, 1, 195, 141)
        ),
        textStyle: TextStyle(
          color: Colors.white,
        ),
        selectedTextStyle: TextStyle(
          color: Color.fromARGB(255, 1, 195, 141),
          fontWeight: FontWeight.w500
        ),
        itemPadding: EdgeInsets.symmetric(horizontal: 20.0),
        selectedItemPadding: EdgeInsets.symmetric(horizontal: 30.0)
      ),
      extendedTheme: const SidebarXTheme(
        width: 200
      ),
      controller: controller,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/store-logo.png",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Game Store",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              )
            ],
          )
        );
      },
      showToggleButton: false,
      items: [
        SidebarXItem(
          icon: Icons.home, 
          label: 'Store',
          onTap: () {
          }
        ),
        SidebarXItem(
          icon: Icons.gamepad_rounded, 
          label: 'My Games',
          onTap: () {
            
          }
        ),
      ],
    );
  }
}