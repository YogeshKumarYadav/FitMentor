import 'package:flutter/material.dart';
import '../data/models/user_profile_model.dart';
import 'widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text("Your Profile", style: Theme.of(context).textTheme.headlineMedium),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProfileCard(profile: profile),
      ),
    );
  }
}
