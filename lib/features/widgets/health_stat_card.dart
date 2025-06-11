import 'package:flutter/material.dart';

class HealthStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const HealthStatCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: Colors.blue[600],
                  size: 35,
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                    const SizedBox(height: 5),
                    Text(
                      value,
                      style: Theme.of(context).textTheme.headlineSmall
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
