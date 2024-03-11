import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zoomplay/controller/auth_controller.dart';
import 'package:zoomplay/pages/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: LottieBuilder.asset('lib/assets/logo.json'),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("H O M E"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("S E T T I N G S"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("L O G O U T"),
            onTap: () {
              AuthController.instance.logout();
            },
          ),
        ],
      ),
    );
  }
}
