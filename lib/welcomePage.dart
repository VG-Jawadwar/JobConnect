import 'package:flutter/material.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/profilePage.dart';
import 'package:myapp/registrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({super.key});

  @override
  State<WelcomePageScreen> createState() => WelcomePageScreenState();
}

class WelcomePageScreenState extends State<WelcomePageScreen> {
  static String welcomeCheck = "notVisited";
  var size, height, width;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //wheretogo();
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      
  
      body: Center(
        child: SafeArea(
          child: Container(
           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Container(
                            height: height*0.531,
                            width: width*0.764,
                                  child: Image.asset("assets/Welcome2.png", fit: BoxFit.cover,),
                    ),
                ),
                                      
                
                            Container(
                            height: height*0.431,
                            decoration: BoxDecoration(
                               borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70)),
                                color: Colors.white,
                            
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 25, top: 30),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Container(
                                             child: Text.rich(
                                               TextSpan(
                                                 children:[
                                                 TextSpan(
                                                   text: "Your Dreams are\n",
                                                   style: TextStyle(
                                                     fontSize: 35,
                                                     fontWeight: FontWeight.bold,
                                                   )
                                                 ),
                                                 TextSpan(
                                                   text: "There for you!",
                                                   style: TextStyle(
                                                     fontSize: 30, 
                                                 fontWeight: FontWeight.bold,
                                                 
                                                   )
                                                 )
                                               ]
                                               )
                                             )
                                   ),
                                                 ),
                                  ),
                                    
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width:350 ,
                                  child: Text("you have to Climb higher for Dream and we are here to help you",textAlign: TextAlign.left,
                                  style: TextStyle(
                                    
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal
                                  ),),
                                ),
                                
                                 Expanded(
                                   child: Padding(
                                            padding: const EdgeInsets.only(left: 20,bottom: 30.0),
                                            child: Align(
                                             alignment: Alignment.bottomLeft,
                                              child: Container(
                                               width: 190,
                                               height: 60,
                                                child: ElevatedButton(       
                                                 onPressed:() async {

                                                  showDialog(context: (context), builder: (context)
                                                                      {
                                                                        return AlertDialog(
                                                                          title: Center(
                                                                            child: Text("Terms & Pre-Requisites", style: TextStyle(
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold
                                                                            ),),
                                                                          ),
                                                                          content: Container(
                                                                            child: SingleChildScrollView(
                                                                              child: Text("Terms & Prerequisites: Job Connect (Simulated Job Finder)\n\nWelcome to Job Connect!\n\nJobConnect is a simulated job finder app designed to help you develop your job search and project management skills in a safe and educational environment.\n\nHere's what you need to know:\n\nSimulated Job Listings: Explore a variety of simulated job postings across different industries and roles. Practice your resume tailoring and interview skills by finding the perfect project fit.\nEducational Tool: This app is intended to help you develop project management and job search skills.\n\nImportant Note: Internet Connection RequiredJob Connect relies on simulated data and requires an active internet connection to function properly.\n\nDisclaimer:All job postings and profiles within Job Connect are simulated and not associated with actual companies or individuals.Get Started!\n\nBy understanding these terms and prerequisites, you're ready to embark on your skill-building journey with Job Connect.",textAlign: TextAlign.left,style: TextStyle(
                                                                                fontSize: 20,
                                                                                fontWeight: FontWeight.normal
                                                                              ),),
                                                                            ),
                                                                          ),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () async
                                                                            {
                                                                              SharedPreferences prefs = await SharedPreferences.getInstance();
                                                                                prefs.setBool(welcomeCheck, true);
                                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPageScreen()));
                                                
                                                                            }, child: Text("Confirm",style: TextStyle(
                                                                            fontSize: 20,
                                                                            fontWeight: FontWeight.bold
                                                                          ),)),

                                                                            TextButton(onPressed: ()
                                                                            {
                                                                              Navigator.pop(context);
                                                                            }, child: Text("Decline",style: TextStyle(
                                                                            fontSize: 20,
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.red
                                                                          ),))
                                                                          ],

                                                                        );
                                                                      });
                                                     } ,
                                                 style: ElevatedButton.styleFrom(
                                                   backgroundColor: Colors.green,
                                                 ),
                                                  child: Text("Get Started", style: TextStyle(
                                                   fontSize: 20,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold
                                                  ),)
                                                  ),
                                              ),
                                            ),
                                   ),
                                 )
                              ],
                            ),
                                             ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // void wheretogo()async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var isLoggedin = prefs.getBool(LoginPageScreenState.BOOLCHECK);
  //   Future.delayed(Duration(seconds: 2),()
  //   {
  //     if(isLoggedin!=null)
  //     {
  //       if(isLoggedin)
  //       {
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePageScreen()));
  //       }else{
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPageScreen()));
  //       }
  //     }else{
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPageScreen()));
  //     }
  //   });

  // }
}