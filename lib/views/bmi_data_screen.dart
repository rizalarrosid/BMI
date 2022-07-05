
// ignore_for_file: prefer_const_constructors

import 'package:bmi/constans/constan.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/views/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
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
List<Widget>generateList(start, end) {
List<Widget> weigths = [];
for (var i = start; i < end; i++) {
  weigths.add(
    Text(
      "$i",
      style: labelTextStyle!.copyWith(
        fontSize: 20,
      ),
    ),
  );
}
return weigths;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xff0A0E21),
      appBar: AppBar(
      title: const Text ("BMI Calculator"), 
    ),
    bottomNavigationBar: GestureDetector(
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
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            color:const Color(0xffEC3C66),
            ),
            child: Center(child: Text(" Hitung BMI ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            ), 
          ),
        ),
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Row(
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
                     child: Stack(
                       children: [
                         const Center(
                           child:  Padding(
                           padding: EdgeInsets.symmetric(vertical: 20.0),                       
                           child: GenderIconText(
                  icon: Icons.male,
                  title: 'Male', 
                  ),
                 ),
                ),
    
                  Positioned (
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.check_circle,
                      color: (gender== "male") ? Colors.white : primaryColor
                    ),
                  )
                       ],
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
                    child:Stack(
                      children: [
                        Center(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),   
                            child: GenderIconText(
                              icon: Icons.female,
                               title: 'Female',
                              
                              ),
                          ),
                        ),
                            Positioned (
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.check_circle,
                      color: (gender== "female") ? Colors.white : primaryColor
                    ),
                  )
                      ],
                    ),
                    ),
                ),
                ),
              ],
            ),
           const SizedBox(height: 30),
          Column(
            children: [
               Text("HEIGHT",
             style: labelTextStyle?.copyWith( 
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
             ),
              Row(
                children: [
                  Expanded(
                   child:Slider(
                       value:height.toDouble(),
                       min: 80,
                       max: 200, 
                       thumbColor: Colors.red,
                       activeColor: Colors.white,
                     onChanged: (value) {
                       height= value.toInt();
                       setState(() {  
                       });
                     },
                     ),
                     ),
                     Row(
                children: [
                 BmiCard(
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal:15.0,
                      vertical: 15.0,
                      ),
                     child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text(
                       "$height",
                       style: labelTextStyle,
                       ),
                      
                       Text(
                         " cm",
                       style: labelTextStyle,
                      ), 
                     ],
                     ),
                      ),
                  ),
                   ],
                 ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          Container(
            child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Expanded (
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "WEIGHT",
                      style: labelTextStyle,
                    ),
                    BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                            scrollController: FixedExtentScrollController(
                            initialItem: 30),
                            itemExtent: 25, 
                            magnification: 2,
                            useMagnifier: true,
                            onSelectedItemChanged: (val){
                              // print(val);
                              weight = val + 20;
                            }, 
                            children: generateList(20, 220),
                            
                            ),
                        ),
                        
                      ],
                    )
              ),
                  ],
                ),
              ),
              Expanded (
                 child: Column(
                   children: [
                    Text(
                      "AGE",
                      style: labelTextStyle,
                    ),
                     BmiCard(
                child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                initialItem: 5),
                                itemExtent: 25, 
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val){
                                  // print(val);
                                  weight = val + 20;
                                }, 
                                children: generateList(15, 90),
                                
                                ),
                            ),
                        
                      ],
                )
              ),
                   ],
                 ),
    
              ),
            ],
          )),
    
        ],),
    )
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