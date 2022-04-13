
import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main()
{
  runApp(bmi_calculator());
}

class bmi_calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.green),
      home: calculator(),
    );
  }
}

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {

 Color maleGenderBackgroundColor = Colors.grey;
 Color femaleGenderBackgroundColor = Colors.grey;
 double bmi = 0;
 int gender = -1;
 String bodyType = "";
 final heightController = TextEditingController();
 double globalHeight = 0;
 final weightController = TextEditingController();
 double clickForAdviseHeight = 0.0;
 double clickForAdviseWidth = 0.0;
 String genderText = "";
 int resetCode = 0;
 bool isCalculate = false;
 double currentSliderWeightValue = 65;
 double currentSliderHeightValue = 1.60;
 double minusPlusButtonValue = 0;

// 0 male, 1 female
 genderButtonPressed(int genderType)
 {
   setState(()
   {
     if( genderType == 0)
     {
       gender = 0;
       maleGenderBackgroundColor = Colors.blueAccent;
       femaleGenderBackgroundColor = Colors.grey;
     }
     else
     {
       gender = 1;
       maleGenderBackgroundColor = Colors.grey;
       femaleGenderBackgroundColor = Colors.pinkAccent;
     }
   });

 }

 calculateButtonPressed(double Height,double Weight,gender)
 {

   setState(()
   {
         if(gender == 0 || gender == 1)
         {

             double height = Height;
             globalHeight = height;
             double weight = Weight;

             if((height >= 1.00 && height <= 2.50) && (weight >= 0.0 && weight <= 200.0))
             {

               clickForAdviseHeight = 80.0;
               clickForAdviseWidth = double.infinity;

               bmi = weight/(height*height);
               bmi = double.parse(bmi.toStringAsFixed(2));
               isCalculate = true;

               if(gender == 0)
               {
                 genderText = "(For Male)";
               }
               else if(gender == 1)
               {
                 genderText = "(For Female)";
               }
             }
             else
             {
               bodyType = "Please Enter a Valid Height or Weight!";
             }

         }
         else
         {
           bmi = 0;
           bodyType = "Please Select a Valid Gender!";
         }

         if(bmi > 0 && bmi < 18)
         {
           bodyType = "Your Body Type is Thin";
         }
         else if(bmi >= 18 && bmi < 25)
         {
           bodyType = "Your Body Type is Normal";
         }
         else if(bmi >= 25 && bmi < 30)
         {
           bodyType = "Your Body Type is Overweight";
         }
         else if(bmi >= 30 && bmi < 35)
         {
           bodyType = "Your Body Type is First Degree Obese";
         }
         else if(bmi >= 35 && bmi < 45)
         {
           bodyType = "Your Body Type is Second Degree Obese";
         }
         else if(bmi >= 45)
         {
           bodyType = "Your Body Type is Overobese";
         }

   });
 }

 minusHeight()
 {
   setState(() {
     currentSliderHeightValue = currentSliderHeightValue - 0.01;
   });
 }
 plusHeight()
 {
   setState(() {
     currentSliderHeightValue = currentSliderHeightValue + 0.01;
   });
 }
 minusWeight()
 {
   setState(() {
     currentSliderWeightValue--;
   });
 }
 plusWeight()
 {
   setState(() {
     currentSliderWeightValue++;
   });
 }

 resetButtonPressed()
 {
   setState((){
     maleGenderBackgroundColor = Colors.grey;
     femaleGenderBackgroundColor = Colors.grey;
     bmi = 0;
     gender = -1;
     bodyType = "";
     genderText = "";
     heightController.text = "";
     weightController.text = "";
     clickForAdviseHeight = 0;
     clickForAdviseWidth = 0;
     globalHeight = 0;
     resetCode = 0;
     isCalculate = false;
     currentSliderWeightValue = 65;
     currentSliderHeightValue = 1.60;
   });

 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Center(child: Text(
          'BMI Calculator',style: TextStyle(fontSize: 35.0),),),
        backgroundColor: Colors.green,
      ),
      body: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(2.7, 10, 10, 0),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    child: Image(
                      image: AssetImage(
                          'images/male.png'),
                    ),
                    height: 200.0,
                    width: 181.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: maleGenderBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),

                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                    height: 200.0,
                    width: 181.0,
                    child: Image(
                      image: AssetImage(
                          "images/female.png"),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: femaleGenderBackgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 171.0,
                    margin: EdgeInsets.fromLTRB(5, 4, 0, 0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      splashColor: Colors.greenAccent,
                      onPressed: () => genderButtonPressed(0),
                      child:  Text(
                        'MALE', style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.w600),),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 171.0,
                    margin: EdgeInsets.fromLTRB(35, 4, 5, 0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      splashColor: Colors.greenAccent,
                      onPressed: () => genderButtonPressed(1),
                      child: Text(
                        'FEMALE', style: TextStyle(fontSize: 28.0,fontWeight: FontWeight.w600),),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(5, 20, 15, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: IconButton(
                        icon: Image(image: AssetImage("images/minus.png")),
                        onPressed: () => minusHeight(),
                        splashColor: Colors.greenAccent,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    height:50.0,
                    width: 250.0,
                    margin: EdgeInsets.fromLTRB(0, 20, 13, 0),
                    alignment: Alignment.center,
                    child: Text("HEIGHT(M)\n"+double.parse(currentSliderHeightValue.toStringAsFixed(2)).toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w700),),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: IconButton(
                        icon: Image(image: AssetImage("images/plus.png")),
                        onPressed: () => plusHeight(),
                      splashColor: Colors.greenAccent,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Container(
                height:35.0,
                width: 250.0,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Slider(
                  min: 1.00,
                  max: 2.50,
                  divisions: 150,
                  value: currentSliderHeightValue,
                  onChanged: (double value)
                  {
                    setState(() {
                      currentSliderHeightValue = value;
                    });
                  },
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(5, 10, 15, 0),
                    child: IconButton(
                      icon: Image(image: AssetImage("images/minus.png")),
                      onPressed: () => minusWeight(),
                      splashColor: Colors.greenAccent,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                  ),
                  Container(
                    height:50.0,
                    width: 250.0,
                    margin: EdgeInsets.fromLTRB(0, 10, 13, 0),
                    alignment: Alignment.center,
                    child: Text("WEIGHT(KG)\n"+currentSliderWeightValue.round().toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.w700),),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: IconButton(
                      icon: Image(image: AssetImage("images/plus.png")),
                      onPressed: () => plusWeight(),
                      splashColor: Colors.greenAccent,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Container(
                height:35.0,
                width: 250.0,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Slider(
                    min: 0,
                    max: 200,
                    divisions: 200,
                    value: currentSliderWeightValue,
                    onChanged: (double value)
                  {
                    setState(() {
                      currentSliderWeightValue = value;
                    });
                  },
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(5, 5, 5, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    splashColor: Colors.greenAccent,
                    onPressed: () => calculateButtonPressed(currentSliderHeightValue, currentSliderWeightValue, gender),
                    child: Text(
                      'CALCULATE',textAlign: TextAlign.center,style: TextStyle(fontSize: 30.0),)),
              ),
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 70.0,
                    width: 270.0,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      genderText+" Your BMI is => "+bmi.toString()+". "+bodyType,textAlign: TextAlign.center,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 60.0,
                    width: 111.0,
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      splashColor: Colors.greenAccent,
                      onPressed: () => resetButtonPressed(),
                      child: Text(
                        'RESET',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w500),),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                height: clickForAdviseHeight,
                width: clickForAdviseWidth,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
                child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    splashColor: Colors.greenAccent,
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => resultscreen(title: bodyType,check: isCalculate,BMI: bmi,gender: gender,height: globalHeight))),
                    child: Text("Click For Advise",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w500))),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}







