// import 'package:tflite_flutter/tflite_flutter.dart';
//
// class MLService {
//   final Interpreter interpreter = Interpreter.fromAssetSync("health_score_model.tflite");
//
//   double getHealthScore(Map<String, dynamic> data) {
//     // Use a real input formatter for better accuracy
//     final input = [[data["steps"] / 20000, data["sleep"] / 10, data["heartRate"] / 180]];
//     final output = List.filled(1 * 1, 0).reshape([1, 1]);
//     interpreter.run(input, output);
//     return (output[0][0] * 100).roundToDouble();
//   }
// }
