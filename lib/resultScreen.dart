import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class resultscreen extends StatefulWidget {
  String title;
  bool check;
  double BMI;
  int gender;
  double height;

  resultscreen({@required this.title, @required this.check, @required this.BMI, @required this.gender,@required this.height});

  @override
  _resultscreenState createState() => _resultscreenState(title,check,BMI,gender,height);
}

class _resultscreenState extends State<resultscreen> {

  String title;
  bool check;
  double BMI;
  int gender;
  double height;
  int weight = 0;
  double healthyWeight;
  int healthyWeightInt;
  String healthyWeightText = "";
  double healthyWeightHeight = 0.0;
  double healthyWeightWidth = 0.0;
  Color healthyWeightTextBackgroundColor = Colors.white;
  Color genderBackgroundColor = Colors.green;
  String text = "";
  String imagePath = "";

  _resultscreenState(this.title, this.check, this.BMI, this.gender,this.height);

  @override
  void initState()
  {
    determineResultScreenTitle();
    determineGenderColor();
    determineHealthyWeight();
  }

  determineHealthyWeight()
  {
    if(check)
      {
        healthyWeightHeight = 100.0;
        healthyWeightWidth = 320.0;

        weight = (height*height*BMI).round();

        if(BMI < 18 && BMI >= 0)
        {
          healthyWeight = 18 - BMI;
          healthyWeight = healthyWeight*height*height;
          healthyWeightInt = healthyWeight.round();
          healthyWeightText = "The weight you need to gain to reach a normal weight is "+healthyWeightInt.toString()+"kg!";
        }
        else if(BMI >= 25)
        {
          healthyWeight = BMI - 25;
          healthyWeight = healthyWeight*height*height;
          healthyWeightInt = healthyWeight.round();
          healthyWeightText = "The weight you need to lose to reach a normal weight is "+healthyWeightInt.toString()+"kg!";
        }
        else
        {
          healthyWeightText = "You are healthy weight right now!";
        }
      }
  }

  determineResultScreenTitle() {
    setState(() {

      if(check)
        {
          if (BMI >= 0 && BMI < 18) {
            text = "Your weight is thin. You have to gain weight. You should eat meat and carbohydrate. "
                "If you do sport, you should do more less sport.";
            if(gender == 0)
              {
                imagePath = "images/thin.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/thinFemale.png";
              }

          }
          else if (BMI >= 18 && BMI < 25) {
            text = "Your weight is normal. If you do sport properly, you can gain muscles easily. "
                "Also, you have a healthy body.";
            if(gender == 0)
              {
                imagePath = "images/normal.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/normalFemale.png";
              }

          }
          else if (BMI >= 25 && BMI < 30) {
            text = "Your weight is overweight. You need to be careful about your weight. "
                "You must do sport. In addition, you have to make a diet. You should eat healthy food,"
                "like vegetables and fruits.";
            if(gender == 0)
              {
                imagePath = "images/overweight.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/overweight.png";
              }
          }
          else if (BMI >= 30 && BMI < 35) {
            text = "Your weight is first degree obese. You need to be careful about your weight. "
                "You must do sport. In addition, you have to make a diet. You should eat healthy food,"
                "like vegetables and fruits.";
            if(gender == 0)
              {
                imagePath = "images/overweight1Male.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/overweight1.png";
              }

          }
          else if (BMI >= 35 && BMI < 45) {
            text = "Your weight is second degree obese. You need to be careful about your weight. "
                "You must do sport. In addition, you have to make a diet. You should eat healthy food,"
                "like vegetables and fruits.";
            if(gender == 0)
              {
                imagePath = "images/overweight2Male.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/overweight2.png";
              }

          }
          else if (BMI >= 45) {
            text = "You are Overobese. You do just one more thing and that is watch TLC - My 600-lb Life.";
            if(gender == 0)
              {
                imagePath = "images/overobeseMale.png";
              }
            else if(gender == 1)
              {
                imagePath = "images/overobese.png";
              }

          }
        }
      else
        {
            imagePath = "";
        }
    });
  }

  determineGenderColor()
  {
    setState(() {

      if(gender == 0)
        {
          genderBackgroundColor = Colors.blue;
        }
      else if(gender == 1)
        {
          genderBackgroundColor = Colors.pinkAccent;
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Advises', style: TextStyle(fontSize: 35.0,)),
        backgroundColor: Colors.green,
      ),
      body: Wrap(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 240.0,
                  margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: genderBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Text(title + "(" + weight.toString() + ")",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 28.0, fontWeight: FontWeight.w500),),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 170.0,
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Text(text, textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 255.0,
                  width: 220.0,
                  child: Image(
                    image: AssetImage(imagePath),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: healthyWeightHeight,
                  width: healthyWeightWidth,
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(healthyWeightText,textAlign: TextAlign.center,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.w500),),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: genderBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
