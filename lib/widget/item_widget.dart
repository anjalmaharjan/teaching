import 'package:flutter/material.dart';

class DashboardItemWidget extends StatelessWidget {
  const DashboardItemWidget({
    super.key,
    required this.textStyle,
    this.text = 'Alish',
  });

  final TextStyle textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 5,
              child: Text(
                text,
                style: textStyle,
              ),
            ),
            const Flexible(
              flex: 2,
              child: Icon(
                Icons.cabin,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
