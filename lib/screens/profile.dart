import 'package:scids/constants/colors.dart';
import 'package:scids/constants/images.dart';
import 'package:scids/widgets/setting_item.dart';
import 'package:scids/widgets/setting_switch.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      appBar: AppBar(
        backgroundColor: tertiaryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
      ),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                    ),
                    child: Image.asset(welcomeImage, width: 70, height: 70),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Youtube Channel",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Prince Kiboi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
              indent: 10,
              endIndent: 10,
            ),
            const SizedBox(height: 20),
            SettingContainer(
              title: "Language",
              icon: Icons.home,
              bgColor: Colors.orange.shade100,
              iconColor: Colors.orange,
              value: "English",
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingSwitch(
              title: "Dark Mode",
              icon: Icons.home,
              bgColor: Colors.purple.shade100,
              iconColor: Colors.purple,
              value: isDarkMode,
              onTap: (value) {
                setState(() {
                  isDarkMode = value;
                });
              },
            ),
            const SizedBox(height: 20),
            SettingContainer(
              title: "Notifications",
              icon: Icons.notifications,
              bgColor: Colors.blue.shade100,
              iconColor: Colors.blue,
              onTap: () {},
            ),
            const SizedBox(height: 20),
            SettingContainer(
              title: "Help",
              icon: Icons.home,
              bgColor: Colors.red.shade100,
              iconColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
