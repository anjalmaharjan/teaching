import 'package:day_1/screen/first_screen.dart';
import 'package:day_1/widget/item_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var textStyle = const TextStyle(color: Colors.white);
  String? bikash = "test";

  String data = "Broadway";

  // List numberList = [11, 23, 4, 5];
  List<String> navigationList = ["First Page", "Second Page", "Third Page"];
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          MaterialButton(
            color: isSelected ? Colors.purple : Colors.white,
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            child: const Text("data"),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: navigationList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FirstScreen(
                      value: data,
                    ),
                    settings: RouteSettings(arguments: navigationList),
                  ),
                );
              },
              child: DashboardItemWidget(
                textStyle: textStyle,
                text: navigationList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
