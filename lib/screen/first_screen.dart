import 'package:day_1/screen/second_screen.dart';
import 'package:day_1/widget/item_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.value});

  final String value;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(width);

    List? firstScreenData = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Column(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth > 350) {
                return const Row(
                  children: [
                    Text("data2"),
                    Text("data3"),
                    Text("data4"),
                  ],
                );
              } else {
                return const Column(
                  children: [
                    Text("data2"),
                    Text("data3"),
                    Text("data4"),
                  ],
                );
              }
            },
          ),
          Container(
            width: 1000,
            color: Colors.green,
            child: const Text("data"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                TextFormField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    labelText: "Username",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          isLoading
              ? const CircularProgressIndicator()
              : InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    //default navigation
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const FirstScreen(),
                    //   ),
                    // );

                    // Navigator.pushNamed(context, "first");

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(
                          userName: userNameController.text,
                          password: passwordController.text,
                        ),
                      ),
                    );

                    //routed navigation
                    // Navigator.pushNamed(context, "/first");
                  },
                  child: DashboardItemWidget(
                    textStyle: const TextStyle(),
                    text: widget.value,
                  ),
                ),
        ],
      ),
    );
  }
}
