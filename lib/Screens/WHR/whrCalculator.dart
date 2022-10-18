import 'package:flutter/material.dart';
import 'package:weightlosstracker/Screens/WHR/resultScreen.dart';
import 'package:weightlosstracker/Utilies/constants.dart';
import 'package:weightlosstracker/Widgets/customButton.dart';
import 'package:weightlosstracker/Widgets/customText.dart';
import 'package:weightlosstracker/Widgets/customTextField.dart';

class WHRCalculator extends StatefulWidget {
  @override
  State<WHRCalculator> createState() => _WHRCalculatorState();
}

class _WHRCalculatorState extends State<WHRCalculator> {
  int gender = 0;
  List<String> list = ['kg', 'lb'];
  String selectList = 'kg';
  List<String> listHeight = ['ft', 'cm'];
  String selectListHeight = 'cm';
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController feetController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  var whr;
  String headline = '';

  List<DropdownMenuItem> generateItems(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem> generateItemsHeight(List<String> spesialis) {
    List<DropdownMenuItem> items = [];
    for (var item in spesialis) {
      items.add(
        DropdownMenuItem(
          child: Text("$item"),
          value: item,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: kHrPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      setState(() {
                        gender = 0;
                      });
                    },
                    title: "Male",
                    textColor: gender == 0 ? Colors.white : Colors.black,
                    btnColor: gender == 0 ? Color(0xff27AE85) : Colors.white,
                    btnBorderColor: gender == 0? Colors.transparent:Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      setState(() {
                        gender = 1;
                      });
                    },
                    title: "Female",
                    textColor: gender == 1 ? Colors.white : Colors.black,
                    btnColor: gender == 1 ? Color(0xff27AE85) : Colors.white,
                    btnBorderColor: gender == 1? Colors.transparent:Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Your Age",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomTextField(
                      controller: ageController,
                      hintText: "0",
                      hintTextColor: Colors.grey.shade500,
                      fieldborderColor: Colors.transparent,
                      keyboardType: TextInputType.number,
                      isOutlineInputBorderColor: Colors.transparent,
                      textFieldFillColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CustomText(
                        title: "Years",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Height",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  (selectListHeight == "cm")
                      ? Expanded(
                          flex: 5,
                          child: CustomTextField(
                            controller: heightController,
                            hintText: "0",
                            hintTextColor: Colors.grey.shade500,
                            fieldborderColor: Colors.transparent,
                            keyboardType: TextInputType.number,
                            isOutlineInputBorderColor: Colors.transparent,
                            textFieldFillColor: Colors.transparent,
                          ),
                        )
                      : Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                      border: Border(right: BorderSide(color: Colors.grey, width: 2))
                                  ),
                                  child: CustomTextField(
                                    controller: feetController,
                                    hintText: "feet",
                                    hintTextColor: greyColor,
                                    isOutlineInputBorderColor:
                                        Colors.transparent,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                      border: Border(right: BorderSide(color: Colors.grey, width: 2))
                                  ),
                                  child: CustomTextField(
                                    controller: inchController,
                                    hintText: "in",
                                    hintTextColor: greyColor,
                                    isOutlineInputBorderColor:
                                        Colors.transparent,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                  Expanded(
                    child: DropdownButton(
                      underline: SizedBox(),
                      value: selectListHeight,
                      items: generateItemsHeight(listHeight),
                      onChanged: (dynamic item) {
                        setState(() {
                          selectListHeight = item;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: kHrPadding,
            child: CustomText(
              title: "Waist",
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: kHrPadding,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 2)
                //  color: GreyColor
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomTextField(
                      controller: waistController,
                      hintText: "0",
                      hintTextColor: Colors.grey.shade500,
                      fieldborderColor: Colors.transparent,
                      keyboardType: TextInputType.number,
                      isOutlineInputBorderColor: Colors.transparent,
                      textFieldFillColor: Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CustomText(
                        title: "Inches",
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: "Cancel",
                    textColor: Colors.black,
                    btnBorderColor: Colors.grey,
                    btnBorderWidth: 2,
                    btnRadius: 5,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      if (selectListHeight == "cm") {
                        if (ageController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            waistController.text.isNotEmpty) {
                          getWHR(waistController.text, heightController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WHRResultPage(
                                whr: whr,
                                headline: headline,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "All fields are required.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            backgroundColor: Color(0xff666666),
                            duration: Duration(milliseconds: 1000),
                          ));
                        }
                      } else {
                        if (ageController.text.isNotEmpty &&
                            heightController.text.isNotEmpty &&
                            waistController.text.isNotEmpty) {
                          getWHRFt(waistController.text, feetController.text,
                              inchController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WHRResultPage(
                                whr: whr,
                                headline: headline,
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "All fields are required.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            backgroundColor: Color(0xff666666),
                            duration: Duration(milliseconds: 1000),
                          ));
                        }

                      }
                    },
                    title: "Calculate",
                    textColor: Colors.white,
                    btnColor: Color(0xff27AE85),
                    btnRadius: 5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  converInToCm(inch) {
    return inch * 2.54;
  }

  convertFt_InToCm(ft, inch) {
    return ft * 30.48 + inch * 2.54;
  }

  getWHR(
    waist_,
    height_1,
  ) {
    var height;

    try {
      waist_ = double.parse(waist_);
      height_1 = double.parse(height_1);
      //  height_2 = double.parse(height_2);

      waist_ = converInToCm(waist_);

      if (selectListHeight == "cm") {
        height = height_1;
        // height = convertFt_InToCm(height_1, height_2);
      }

      whr = waist_ / height;
      if (whr! < 0.34) {
        print("Extremely Slim");
        print("Extremely Slim");
        // comment = "";
        headline = "Extremely Slim";
      } else if (whr >= 0.35 && whr < 0.42) {
        // comment = "";
        headline = "Slim";
      } else if (whr > 0.42 && whr <= 0.52) {
        // comment = "You are at overweight.";
        headline = "Healthy";
      } else if (whr > 0.52 && whr <= 0.57) {
        // comment = "You are obese.";
        headline = "Overweight";
      } else if (whr > 0.57 && whr <= 0.62) {
        // comment = "You are obese.";
        headline = "Highly Overweight";
      } else if(whr > 0.62){
        // comment = "You are obese.";
        headline = "Morbidly Obese";
      }
      return num.parse(whr.toStringAsFixed(2));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }

  getWHRFt(waist_, height_1, height_2) {
    var height;

    try {
      waist_ = double.parse(waist_);
      height_1 = double.parse(height_1);
      height_2 = double.parse(height_2);

      waist_ = converInToCm(waist_);

      if (selectListHeight == "ft") {
        height = convertFt_InToCm(height_1, height_2);
      }

      whr = waist_ / height;
      if (whr! < 0.34) {
        print("Extremely Slim");
        print("Extremely Slim");
        // comment = "";
        headline = "Extremely Slim";
      } else if (whr >= 0.35 && whr < 0.42) {
        // comment = "";
        headline = "Slim";
      } else if (whr > 0.42 && whr <= 0.52) {
        // comment = "You are at overweight.";
        headline = "Healthy";
      } else if (whr > 0.52 && whr <= 0.57) {
        // comment = "You are obese.";
        headline = "Overweight";
      } else if (whr > 0.57 && whr <= 0.62) {
        // comment = "You are obese.";
        headline = "Highly Overweight";
      } else if(whr > 62) {
        // comment = "You are obese.";
        headline = "Morbidly Obese";
      }
      return num.parse(whr.toStringAsFixed(2));
    } on FormatException catch (ex) {
      print(ex.toString());
    }
    ;
  }
}
