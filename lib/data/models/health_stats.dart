enum STRESS {Low, Moderate, High}

class HealthStats {
  final int steps;
  final double sleep;
  final int heartRate;
  final STRESS stress;
  final double calories;

  HealthStats({
    required this.steps,
    required this.sleep,
    required this.heartRate,
    required this.stress,
    required this.calories,
  });
}