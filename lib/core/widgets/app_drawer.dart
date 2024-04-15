import 'package:flutter/material.dart';

import '../../features/category/presentation/screens/category_screen.dart';
import '../../features/setting/presentation/screens/setting_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            // <-- SEE HERE
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            accountName: const Text(
                "آرمین مهرآیین",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
            ),
            accountEmail: const Text(
              "armin.mehraeen@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: const CircleAvatar(child: Icon(Icons.person)),
          ),
          ListTile(
              leading: const Icon(
                  Icons.person
              ),
              title: const Text('پروفایل'),
              onTap: () => Navigator.pop(context)
          ),
          ListTile(
              leading: const Icon(
                  Icons.dashboard
              ),
              title: const Text('دسته بندی ها'),
              onTap: () async {

                Navigator.pop(context) ;
                Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryScreen())) ;

              }
          ),
          ListTile(
              leading: const Icon(
                Icons.settings,
              ),
              title: const Text('تنظیمات'),
              onTap: () {
                Navigator.pop(context) ;
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen())) ;
              }
          ),
        ],
      ),
    ) ;
  }
}
