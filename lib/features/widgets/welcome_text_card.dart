import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final String name;

  const WelcomeText({
    required this.name,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Hi ",
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(name,
                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF007BFF),
                  ),
                ),
              ],
            ),
            Text("you're doing great today!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        )
    );
  }
}