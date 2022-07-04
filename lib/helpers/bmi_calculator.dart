import 'package:bmi/constans/constan.dart';

class BmiCalculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCalculator({required this.height, required this.weight});
  BmiCalculator.fromBmiValue(this.bmi) {
    //this.bmi = bmi;
  }

  double calculateBmi() {

    double heightInMeter = height! / 100;

    // final h = pow(height, 2)
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  } 

    determineBmiCategory(double bmiValue) {
    String category = "";
    if (bmiValue < 16.0) {
      category = underweightSevere;
    } else if ( bmiValue < 17) {
      category = underweightModerate;
    } else if ( bmiValue < 18.5) {
      category = underweightMild;
    } else if ( bmiValue < 25 ) {
      category = normal;
    }  else if ( bmiValue < 30) {
      category = overweight;
    }  else if ( bmiValue < 35) {
      category = obeseI; 
    }  else if ( bmiValue < 40) {
      category = obeseII;   
    }  else if (bmiValue >= 40 ) {
      category = obesseIII;  
    }

    bmiCategory = category;
    return bmiCategory!;
  }   

  String getHealRiskDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case underweightSevere:
      case underweightModerate:
      case underweightMild:
      desc = "Possible nutritional deficiency and osteoporosis.";
      break;
      case normal:
      desc = "Low risk (healthy range).";
      break;
      case overweight:
      desc = "Moderat risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
      break;
      case obeseI:
      case obeseII:
      case obesseIII:
      desc = "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus, metabolic syndrome.";
      break;
      default:
    }
    bmiDescription = desc;
    return desc;
  }

}