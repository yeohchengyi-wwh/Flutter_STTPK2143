import 'package:assignment1/homepage.dart';
import 'package:flutter/material.dart';

class SpalshPage extends StatefulWidget {
  const SpalshPage({super.key});

  @override
  State<SpalshPage> createState() => _SpalshPageState();
}

class _SpalshPageState extends State<SpalshPage> {
  @override
  
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      if(!mounted)return;
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/fuelIcon.png',scale: 4),
            SizedBox(height: 20),
            Text('Trip Fuel Cost Estimator',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blueGrey),),
            SizedBox(height: 20),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}