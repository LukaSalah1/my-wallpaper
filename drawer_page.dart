import 'package:flutter/material.dart';
import 'package:westtips/about_faq.dart';
import 'package:westtips/home_page.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 200,
      backgroundColor: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
        child: ListView(
          children: [
            Builder(
              builder:
                  (context) => ListTile(
                    title: Text(
                      '''Wallpapers''',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    },
                  ),
            ),
            Builder(
              builder:
                  (context) => ListTile(
                    title: Text(
                      'About Us',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AboutUs()),
                      );
                    },
                  ),
            ),
            Builder(
              builder:
                  (context) => ListTile(
                    title: Text(
                      'FAQ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context); // Close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => Faq()),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
    //endDrawer
  }
}
