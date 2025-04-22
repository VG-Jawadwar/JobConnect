import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/welcomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3),(){
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=> ContactusPageScreen()));
  //   });
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    whereTGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100,
      body: Container(
        // color: Colors.amber,
        height: double.infinity,
        width: double.infinity,
        child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/logo2.png"),
                  radius: 70,
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            
            Container(
              child: Text("V 1.0.0",style: TextStyle(
                fontSize: 20,
                color: Colors.black 
              ),),
            )
          ],
        ),
      ),
    );
  }
  
  void whereTGo()async {
    SharedPreferences prefs =await SharedPreferences.getInstance();
   var Welcomecheck =  prefs.getBool(WelcomePageScreenState.welcomeCheck);

   Future.delayed(Duration(seconds: 2),()
   {
     if(Welcomecheck!=null)
    {
      if(Welcomecheck)
      {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginPageScreen()));
      }else {
         Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> WelcomePageScreen()));
      }
    }else{
       Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> WelcomePageScreen()));
    }
  });

   }

   
}