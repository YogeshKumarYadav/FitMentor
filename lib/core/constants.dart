import 'dart:ui';

import '../data/models/user_profile_model.dart';

Color scaffoldBackgroundColor = const Color(0xFF343541);
Color cardColor = const Color(0xFF444654);

final defaultUser = UserProfile(
  id: 'U_00001',
  name: 'Alex Carter',
  age: 29,
  gender: 'Male',
  height: 175.0,
  weight: 72.0,
  medicalConditions: ['None'],
);