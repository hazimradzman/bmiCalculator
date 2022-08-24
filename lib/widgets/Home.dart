import 'package:flutter/material.dart';
import 'dart:math';
class myHome extends StatefulWidget {
  const myHome({Key? key}) : super(key: key);

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {

  double _heightSliderValue = 170;
  double _weightSliderValue = 70;
  double _bmi = 0;
  String _message ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator'),backgroundColor: Colors.red,),
      body: Column(
        children: [
          Text('BMI',style: TextStyle(fontSize: 40,color: Colors.redAccent),),
          Text('Calculator',style: TextStyle(fontSize: 40,color: Colors.redAccent),),
          //Image.network('https://i.natgeofe.com/k/7bfcf2d2-542e-44f0-962a-c36f2efa98a5/heart.jpg?w=636&h=358'),
          Text('We care about your health',style: TextStyle(color: Colors.grey),),
          SizedBox(height: 10,),
          Text('Height(${_heightSliderValue.round()}cm)',style: TextStyle(fontSize: 30,color: Colors.grey),),
          Slider(
            value: _heightSliderValue,
            max: 200,
            label: _heightSliderValue.round().toString(),
            onChanged: (double value){
              setState(() {
                _heightSliderValue = value;
              });

            }
          ),
          SizedBox(height: 10,),
          Text('Weight(${_weightSliderValue.round()}kg)',style: TextStyle(fontSize: 30,color: Colors.grey),),
          Slider(
              value: _weightSliderValue,
              max: 150,
              label: _weightSliderValue.round().toString(),
              onChanged: (double value){
                setState(() {
                  _weightSliderValue = value;
                });

              }
          ),
          SizedBox(height: 10,),
          TextButton.icon(
            onPressed: (){
              var bmiTemp = _weightSliderValue / pow((_heightSliderValue / 100),2);
              var messageTemp = "";
              if (bmiTemp<18){
                messageTemp = 'You are Underweight';

              }
              else if (bmiTemp<25){
                messageTemp = 'You are Normal';

              }
              else {
                messageTemp = 'You Are Overweight';
              }
              setState(() {
                _bmi = bmiTemp;
                _message = messageTemp;
              });
              print('Your BMI is ${_bmi.round()}');
            },
            icon: Icon(Icons.favorite),
            label: Text('Calculate'),
          ),
          _bmi !=0 ? Text('Your BMI is ${_bmi.round()}',style: TextStyle(fontSize: 20),) : SizedBox(),
          Text(_message)
        ],
      ),
    );
  }
}


