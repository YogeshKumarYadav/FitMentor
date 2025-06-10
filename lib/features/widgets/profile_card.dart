import 'package:flutter/material.dart';
import '../../data/models/user_profile_model.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${profile.name}, ${profile.age} years", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.accessibility),
                const SizedBox(width: 8),
                Text("Gender: ${profile.gender}"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.height),
                const SizedBox(width: 8),
                Text("Height: ${profile.height} cm"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.monitor_weight),
                const SizedBox(width: 8),
                Text("Weight: ${profile.weight} kg"),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.health_and_safety),
                const SizedBox(width: 8),
                Text("Medical: ${profile.medicalConditions.join(', ')}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
