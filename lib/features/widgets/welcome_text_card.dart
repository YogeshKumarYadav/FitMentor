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
      child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Text("Hi $name, you're doing great today!",
              style: Theme.of(context).textTheme.displaySmall
            ),
          )
        ],
      ),
      )
    );
  }
}