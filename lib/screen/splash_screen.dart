import 'package:day_1/widget/item_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Image.asset("assets/images/broadway.webp"),
          ),
          // Image.network(
          //     "https://broadwayinfosys.com/uploads/ourclients/1664167254.png"),

          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const Text(
            "Welcome to broadway",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SplashScreen()));
            },
            child: const DashboardItemWidget(
              textStyle: TextStyle(),
              text: "Ayush",
            ),
          )
        ],
      ),
    );
  }
}
