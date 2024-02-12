import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  List<Map> informationList = [
    {"icon": Icons.policy, "name": "Policy"},
    {"icon": Icons.terminal, "name": "Code"},
    {"icon": Icons.map, "name": "Location"},
    {"icon": Icons.app_blocking, "name": "Blocking"},
    {"icon": Icons.portable_wifi_off_outlined, "name": "Wifi"},
    {"icon": Icons.location_city, "name": "Maps"},
    {"icon": Icons.logo_dev, "name": "Logout"},
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("NewScreen"),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Photos",
              ),
              Tab(
                text: "Information",
              ),
              Tab(
                text: "Profile",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const PhotoTab(),
            InformationTab(informationList: informationList),
            const ProfileTab(),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatefulWidget {
  const ProfileTab({
    super.key,
  });

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            children: [
              ProfileSwitchButton(
                isSelected: isSelected == 0 ? true : false,
                text: 'Sign In',
                onPressed: () {
                  setState(() {
                    isSelected = 0;
                  });
                },
              ),
              const SizedBox(
                width: 12,
              ),
              ProfileSwitchButton(
                isSelected: isSelected == 1 ? true : false,
                text: 'Register',
                onPressed: () {
                  setState(() {
                    isSelected = 1;
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ProfileSwitchButton extends StatelessWidget {
  const ProfileSwitchButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  });

  final String text;
  final Function() onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        height: 50,
        onPressed: onPressed,
        color: isSelected ? Colors.blue : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}

class InformationTab extends StatelessWidget {
  const InformationTab({
    super.key,
    required this.informationList,
  });

  final List<Map> informationList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: informationList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            final data = Uri.parse("https://www.google.com");
            if (index == 0) {
              await _launchInBrowserView(data);
            } else {
              await openImageGallery();
            }
          },
          child: Card(
            margin: const EdgeInsets.only(left: 18, right: 18, bottom: 10),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(informationList[index]['icon']),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(informationList[index]['name']),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  Future openImageGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
  }
}

class PhotoTab extends StatelessWidget {
  const PhotoTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset("assets/images/broadway.webp"),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(labelText: "username"),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(labelText: "password"),
              ),
              const SizedBox(
                height: 50,
              ),
              MaterialButton(
                height: 50,
                onPressed: () {},
                minWidth: MediaQuery.of(context).size.width,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
