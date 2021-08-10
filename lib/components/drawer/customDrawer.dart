import 'package:flutter/material.dart';

class CustomDrawer extends Drawer {
  final Widget child;

  CustomDrawer(BuildContext context)
      : child = ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('flutter_web'),
            ),
            ListTile(
              title: const Text('Test1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Test2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
}
