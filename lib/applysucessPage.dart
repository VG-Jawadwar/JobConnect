import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';

class ApplysucesspageSCreen extends StatefulWidget {
  const ApplysucesspageSCreen({super.key});

  @override
  State<ApplysucesspageSCreen> createState() => _ApplysucesspageSCreenState();
}

class _ApplysucesspageSCreenState extends State<ApplysucesspageSCreen> {

  @override
  void initState() {
    super.initState();
    setState(() {
      Future.delayed(Duration(seconds: 5),()
      {
        Navigator.of(context).popUntil((Route)=> Route.isFirst);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageScreen()));
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: CircleAvatar(backgroundImage: AssetImage("assets/success2.gif"),radius: 80,)),
              Container(
                child: Text("Success", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              )
            ],
          ),
        ),
      ),
    );
  }
}