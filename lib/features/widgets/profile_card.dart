import 'package:flutter/material.dart';
import '../../data/models/user_profile_model.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(profile.name,
              style: Theme.of(context).textTheme.headlineMedium
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.calendar_month, color: Colors.blue[600], size: 20),
                const SizedBox(width: 15),
                Text("Age: ${profile.age} years",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                profile.gender == "Male"
                    ? Icon(Icons.male_rounded, color: Colors.blue[600], size: 20)
                    : Icon(Icons.female_rounded, color: Colors.blue[600], size: 20),
                const SizedBox(width: 15),
                Text("Gender: ${profile.gender}",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.height_rounded, color: Colors.blue[600], size: 20),
                const SizedBox(width: 15),
                Text("Height: ${profile.height} cm",
                    style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.monitor_weight, color: Colors.blue[600], size: 20),
                const SizedBox(width: 15),
                Text("Weight: ${profile.weight} kg",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.health_and_safety, color: Colors.blue[600], size: 20),
                const SizedBox(width: 15),
                Text("Medical: ${profile.medicalConditions.join(', ')}",
                  style: Theme.of(context).textTheme.bodyLarge
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
