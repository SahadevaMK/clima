import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http ;
import 'dart:convert';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void getLocation()async {
    Location location = Location();
    await location.getCurrentLocation();
  }
  void initState(){
    super.initState();
    getLocation();
  }
  void getData() async{
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=a071362a38a997c096c8a62a64339fdc'));
    if (response.statusCode==200){
      String Data = response.body;
      var longitude = jsonDecode(Data)["main"]["temp"];
      var weatherData = jsonDecode(Data)["weather"][0]["id"];
      var namee= jsonDecode(Data)['name'];
      print(weatherData);
    }else{
      print(response.statusCode);
    }
  }
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}