import 'package:flutter/material.dart';
import '../data/models/user_profile_model.dart';
import 'widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile profile;

  const ProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: cardColor,
      appBar: AppBar(
        title: const Text("Your Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProfileCard(profile: profile),
      ),
    );
  }
}
