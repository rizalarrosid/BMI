
// ignore_for_file: prefer_const_constructors

import 'package:bmi/constans/constan.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {

  int height = 100;
  int weight= 50;
  int age= 20;
  String? gender;

  double calculateBmi() {

    double heightInMeter = height / 100;

    // final h = pow(height, 2)
    final h = (heightInMeter * heightInMeter);
    final bmi = weight / h;

    return bmi;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff0A0E21),
      appBar: AppBar(
      title: const Text ("BMI Calculator"), 
    ),
    body: Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "male";
                    setState(() {});
                
                  },
                  child: BmiCard(
                    borderColor: 
                    (gender == "male") ? Colors.white : primaryColor,
                              child: const GenderIconText(
                  icon: Icons.male,
                  title: 'Male', 
                  ),    
                  ),
                )),
                Expanded(
                child: GestureDetector(
                  onTap: () {
                    gender = "female";
                    setState(() {});
                  },
                  child: BmiCard(
                     borderColor: 
                    (gender == "female") ? Colors.white : primaryColor,
                    child:const GenderIconText(
                      icon: Icons.female,
                       title: 'Female',
                      
                      ),
                    ),
                ),
                ),
              ],
            ),
        ),
        Expanded(
          child: BmiCard(
           child:Column(
             mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("HEIGHT",
             style: labelTextStyle?.copyWith( 
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
             ),
              const SizedBox(height: 12),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Text(
                 "$height",
                 style: numberTextStyle,
                 ),
                
                 Text(
                   "cm",
                 style: labelTextStyle,
                 ),
               ],
             ),
             Slider(
               value:height.toDouble(),
               min: 80,
               max: 200, 
               thumbColor: Colors.red,
               activeColor: Colors.white,
             onChanged: (value) {
               height= value.toInt();
               setState(() {  
               });
             }
             )
           ],
          )),
     ),
        Expanded(child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded (
              child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("WEIGHT"),
                  Text("$weight",
                  style: numberTextStyle,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          weight+= 1;
                          setState(() {});
                        },
                        elevation: 0,
                        child:const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                        fillColor:const Color(0xff212747),
                        constraints: BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        ),
                        SizedBox(width: 10),
                        RawMaterialButton(
                        onPressed: () {
                          weight-= 1;
                          setState(() {});
                        },
                        elevation: 0,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        shape: const CircleBorder(),
                        fillColor: const Color(0xff212747),
                        constraints: BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        ),
              
                    ],
                  )
                ],
              )
            ),
            ),
            Expanded (
               child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("AGE"),
                  Text("$age",
                  style: numberTextStyle,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          age++;
                          setState(() {});
                        },
                        elevation: 0,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        shape: CircleBorder(),
                        fillColor: Color(0xff212747),
                        constraints: BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        ),
                        SizedBox(width: 10),
                        RawMaterialButton(
                        onPressed: () {
                           age--;
                          setState(() {});
                        },
                        elevation: 0,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                        shape: CircleBorder(),
                        fillColor: Color(0xff212747),
                        constraints: BoxConstraints.tightFor(
                          width: 56,
                          height: 56,
                        ),
                        ),
              
                    ],
                  )
                ],
              )
            ),

            ),
          ],
        )),
        GestureDetector(
          onTap: () {
            print(calculateBmi());
            final bmiCalculator = BmiCalculator(height: height, weight: weight);
            bmiCalculator.calculateBmi();

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return BmiResultScreen(
                    bmi: bmiCalculator.bmi!,
                  );
                }),
                ),
            );
          },
          child:Container(
            height: 80,
            color: Color(0xffEC3C66),
            child: Center(child: Text(" Hitung BMI ",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            ), 
          ),
        )

      ],)
    );
       
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child, 
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color (0xff272A4E),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor!),
        ),
        margin: EdgeInsets.all(15),
      child: child
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, 
    required this.title, 
    required this.icon,
  }) : super(key: key);

final String title;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
          ),
         const SizedBox(height: 15),
        Text(
          title,
        style: 
        labelTextStyle,
        ),
      ],
    );
  }
}