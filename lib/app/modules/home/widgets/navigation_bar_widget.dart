import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 12.0, right: 12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Colors.white,
            iconTheme: MaterialStateProperty.all(
              const IconThemeData(color: Colors.white),
            ),
            indicatorColor: Colors.blue.shade400,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            selectedIndex: 1,
            height: 48,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: [
              Container(),
              const NavigationDestination(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
