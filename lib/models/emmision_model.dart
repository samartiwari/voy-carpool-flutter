class EmissionModel {
  final bool success;
  final int numberOfRides;
  final double totalCarbonSavedKg;

  EmissionModel({
    required this.success,
    required this.numberOfRides,
    required this.totalCarbonSavedKg,
  });

  factory EmissionModel.fromJson(Map<String, dynamic> json) {
    return EmissionModel(
      success: json['success'],
      numberOfRides: json['data']['calculation_breakdown']['cars_saved'],
      totalCarbonSavedKg: json['data']['calculation_breakdown']['total_emissions_saved_kg'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "success": success,
      "number_of_rides": numberOfRides,
      "total_carbon_saved_kg": totalCarbonSavedKg,
    };
  }
}
