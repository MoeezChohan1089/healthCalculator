import 'package:flutter/material.dart';
import 'package:weightlosstracker/Widgets/customText.dart';

class WHRResultPage extends StatefulWidget{
  final double? whr;
  final String? headline;

  const WHRResultPage({super.key, this.whr, this.headline});
  @override
  State<WHRResultPage> createState() => _WHRResultPageState();
}

class _WHRResultPageState extends State<WHRResultPage> {
  late double whrResult;
  var headlineResult = "";
  @override
  void initState() {
    whrResult = widget.whr!;
    headlineResult = widget.headline!;
    print("BMI: ${whrResult}");
    print("Headline: ${headlineResult}");
    super.initState();
  }

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
        title: Text("Result", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "${whrResult.toStringAsFixed(3)}",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xff27AE85),
              )
          ),
          SizedBox(
            height: 15,
          ),
          Center(
              child: CustomText(
                title: "${headlineResult}",
                fontSize: 25,
                color: Color(0xff27AE85),
              )
          ),
          SizedBox(
            height: 20,
          ),

          RadialGuage(),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr!<0.34)? Colors.blue.shade100:Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.blue, size: 15,),
                  Expanded(child: Text("Extremely Slim")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.34 and below")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr! > 0.34 && widget.whr! <0.42)?Colors.blue.shade100:Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.blue, size: 15,),
                  Expanded(child: Text("Slim")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.35 to 0.42")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr! > 0.42 && widget.whr! <= 0.52)?Colors.green.shade300:Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.blue, size: 15,),
                  Expanded(child: Text("Healthy")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.43 to 0.52")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr! > 0.52 && widget.whr! <= 0.57)?Colors.orange.shade100:Colors.transparent,
                 ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.orange, size: 15,),
                  Expanded(child: Text("Overweight")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.53 to 0.57")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr! > 0.57 && widget.whr! <= 0.62)?Colors.red.shade100:Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.red, size: 15,),
                  Expanded(child: Text("Highly Overweight")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.58 to 0.62")))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.whr! > 0.62)?Colors.red.shade100:Colors.transparent,
              ),
              padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              child: Row(
                children: [
                  Icon(Icons.square, color: Colors.red, size: 15,),
                  Expanded(child: Text("Morebidly Obese")),
                  Expanded(child: Align(
                      alignment: Alignment.topRight,
                      child: Text("0.63 and above")))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double angle = 12.57;
  String bmi_category = "";

  double pixelHeight = 1;
  double pixelWidth = 1;

  RadialGuage() {
    if (widget.whr! < 0.34) {
      angle = 11.00;
    } else if (widget.whr! >= 0.35 && widget.whr! < 0.42) {
      angle = 11.30;
    } else if (widget.whr! >= 0.43 && widget.whr! < 0.52) {
      angle = 11.87;
    } else if (widget.whr! >= 0.53 && widget.whr! < 0.62) {
      angle = 12.70;
    } else if (widget.whr! > 0.62) {
      angle = 13.80;
    }

    return Container(

      child: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [

          Image.asset(
            "assets/images/groupmeter.png",
            height: pixelHeight * 136,
          ),
          Container(
            padding: EdgeInsets.only(top: pixelHeight * 50,),
            margin: EdgeInsets.only(left: 10, right: 10),
            child: Transform.rotate(
              angle: angle,
              child: Container(
                //   margin: EdgeInsets.only(top: 25),
                child: Image.asset(
                  "assets/images/needle_box.webp",
                  height: pixelHeight * 160,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}