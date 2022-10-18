import 'package:flutter/material.dart';
import 'package:weightlosstracker/Screens/BFP/bfpCalculator.dart';
import 'package:weightlosstracker/Screens/BMI/bmiCalculator.dart';
import 'package:weightlosstracker/Screens/BMR/bmrCalculator.dart';
import 'package:weightlosstracker/Screens/EER/eerCalculator.dart';
import 'package:weightlosstracker/Screens/TDEE/tdeCalculator.dart';
import 'package:weightlosstracker/Screens/WHR/whrCalculator.dart';

class AllCalculator extends StatefulWidget{
  final int index;

  const AllCalculator({super.key, required this.index});
  @override
  State<AllCalculator> createState() => _AllCalculatorState();
}

class _AllCalculatorState extends State<AllCalculator> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: widget.index == 0? Text("BMI Calculator", style: TextStyle(color: Colors.black),)
            :widget.index == 1? Text("BFP Calculator", style: TextStyle(color: Colors.black),)
            :widget.index == 2? Text("BMR Calculator", style: TextStyle(color: Colors.black),)
            :widget.index == 3? Text("EER Calculator", style: TextStyle(color: Colors.black),)
            :widget.index == 4? Text("TDEE Calculator", style: TextStyle(color: Colors.black),)
            :widget.index == 5? Text("WHR Calculator", style: TextStyle(color: Colors.black),):SizedBox(),
      ),
      body: widget.index == 0?BMICalculator():widget.index == 1?BFPCalculator():widget.index == 2?BMRCalculator():widget.index == 3?EERCalculator():widget.index == 4?TDEECalculator():WHRCalculator(),
    );
  }
}