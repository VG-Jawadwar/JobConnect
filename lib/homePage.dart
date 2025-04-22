
import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:myapp/aboutuspage.dart';
import 'package:myapp/categories.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/profileDetails.dart';
import 'package:myapp/profilePage.dart';
import 'package:myapp/recommendations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
 var size, height, width;


   Widget addlistTile(var Value, var subValue, Widget Navigatepage)
  {
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> Navigatepage));
      },
      // leading: CircleAvatar(
      //   backgroundImage: AssetImage("assets/PO_02.jpeg")),
      title: Text("$Value", style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20
      ),),
      subtitle: Text("$subValue", style: TextStyle(
        color: Colors.black,
        fontSize: 16
      ),),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 30,
        color: Colors.black,
      ),
    );
  }

   Widget Divideradd()
  {
    return  Divider(
                color: Colors.black45,
                thickness: 1,
              );
  } 

  List page = [RecommendationsScreenPage(), JobsCategoriesScreenPage(), IDCardPageScreen()];
  GlobalKey<CurvedNavigationBarState> _curvedNavigationBar = GlobalKey<CurvedNavigationBarState>();
  int currentindex = 0;

 
  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(

    bottomNavigationBar: CurvedNavigationBar(
      key: _curvedNavigationBar,
      index: 0,
      height: height*0.064,
      items: [
        Icon(
          Icons.home,
          size: 30,
        ),
         Icon(
          Icons.explore_outlined,
          size: 30,
        ),
      
        Icon(
          Icons.person,
          size: 30,
        ),
    ],
    buttonBackgroundColor: Colors.white,
    backgroundColor: Colors.lightBlueAccent,
    animationCurve: Curves.easeInOut,
    animationDuration: Duration(microseconds: 600),
    onTap: (index)
    {
      setState(() {
        currentindex = index;
      });
    },
    letIndexChange: (index)=> true,
    ),
    appBar: AppBar(
      backgroundColor: Colors.lightBlue.shade200,
      title: Text("Welcome to Job Connect", style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold
      ),),
    ),

     drawer: Drawer(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                             height: height*0.128,
                             width: width*0.255,
                            child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/ProfileImg.jpeg",),
                                    backgroundColor: Colors.white,
                                  
                                    ),
                          ),
                    
                          Container(
                            child: Text("Vaibhav Jawadwar", style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                  ),
              ),
          
                     addlistTile("Home", "", HomePageScreen()),
                     Divideradd(),
                     addlistTile("Change Country", "In India", HomePageScreen()),
                     Divideradd(),
                    addlistTile("View Profile", "", IDCardPageScreen()),
                     Divideradd(),
                     addlistTile("Help Center", "", ProfilePageScreen()),
                    Divideradd(),
                     addlistTile("About Us", "About Me", AboutUsPageScreen()),
                     Divideradd(),
              

                      ListTile(
                        onTap: () async
                        {
                          showDialog(context: (context), builder: (context)
                             {
                              return AlertDialog(
                                title: Text("Logout", style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),),
                                content: Text("Are you sure want to Logout from App?",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal
                                ),),
                                actions: [
                                  TextButton(onPressed: ()async
                                  {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove(LoginPageScreenState.BOOLCHECK);
                                    print(LoginPageScreenState.BOOLCHECK);
                                    FlutterExitApp.exitApp();
                                  }, child: Text("Confirm",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),)),

                                  TextButton(onPressed: ()async
                                  {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    var b = prefs.getBool(LoginPageScreenState.BOOLCHECK);
                                     print(b);
                                    Navigator.pop(context);
                                  }, child: Text("No",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),))
                                ],
                              );
                             });
                        },
                      title: Text("LogOut", style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),),

                          trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 30,
                        color: Colors.red,
                      ),
                             ),
          
                     ListTile(
                      title: Text("© 2024 Job Connect", style: TextStyle(
                        fontSize: 17,
                        color: Colors.black38
                      ),),
                     )         
            ],
          ),
        ),
      ),
    ),
    body: page[currentindex],
    );
  }
} 