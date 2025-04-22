import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/profileDetails.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            colors:[
          Color(0xfffA1C4FD),
          Color(0xfffC2E9FB)
          ])
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text("Profile", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  if(ImageBytes.isEmpty)
                     CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 80,
                       backgroundImage: AssetImage("assets/ProfileImg.jpeg"),
                      )
                    else
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage("assets/ProfileImg.jpeg"),
                    ),
        
                     Container(
                    alignment: Alignment.center,
                    child: Text("Vaibhav Jawadwar", style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
            
                    Container(
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child:ElevatedButton.icon(
                              onPressed: () {
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
                                  TextButton(onPressed: () async
                                  {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.remove(LoginPageScreenState.BOOLCHECK);
                                    print(LoginPageScreenState.BOOLCHECK);
                                    FlutterExitApp.exitApp();
                                  }, child: Text("Confirm",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),)),

                                  TextButton(onPressed: ()
                                  {
                                    Navigator.pop(context);
                                  }, child: Text("No",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),))
                                ],

                              );
                             });
                            },label: Text("Log Out",style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                   color: Colors.red,
                                  ),),
                            icon: Icon(Icons.logout_sharp,color: Colors.red),),
                          )
                        ],
                      ) ,
                    ),
            
                   Divider(),
        
                   ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> IDCardPageScreen()));
                    },
                     title: Text("Profile Page",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          ),),
                    trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                   ),
            
                   ListTile(
                    onTap: ()
                    {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                      context: (context), builder: (context)
                      {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text("Contact Our Friendly Team", style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                Container(
                                  child: Text("Let Us Know how can we help you", style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal
                                  ),),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 150,
                                  width: 270,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 40,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text("Chat To Support",style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text("Email: jobconnectapp@gmail.com",style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                  SizedBox(
                                  height: 150,
                                  width: 270,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 40,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Text("Call us",style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          child: Text("+91 9999999999",style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                    title: Text("Contact The Developer",style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black
                          ),),
                    trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 30,
                          color: Colors.black,
                        ),
                   ),
                   ListTile(
                    leading: Icon(Icons.travel_explore),
                    title: Text("Apps Language",style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal
                            ),),
            
                    subtitle: Text("English(Device Language)",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black45
                      ),),
                   ),
                   SizedBox(
                    height: 15,
                   ),
            
                   Container(
                    child: Text("Frequently Asked Questions", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                   ),
            
                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: ExpansionTile(
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text("Where do jobseekers go after clicking job posting?",style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      children: [
                        Container(
                          child: Text("When a person clicks on your job posting on Job Connect, they will be able to see the full job description and a button to apply. Candidates can then upload their all info if they are interested in the role.",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                        ),),
                        )
                      ],
                     ),
                   ),
            
                      Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: ExpansionTile(
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text("Is it free to post a job on Job Connect?",style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      children: [
                        Container(
                          child: Text("Most jobs on Job Connect can be posted for free.* But if you want a larger number of applicants, sponsoring your job gives your job post better visibility to jobseekers. \n\n*Terms, conditions, quality standards and usage limits apply.",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                        ),),
                        )
                      ],
                     ),
                   ),
        
                    Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: ExpansionTile(
                      trailing: Icon(Icons.arrow_drop_down),
                      title: Text("Fraudulent job postings?",style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      children: [
                        Container(
                          child: Text("1.Do not send money to a recruiter or prospective employer.\n2.Do not send money to anyone claiming to have found you a job as part of working for Job Connect or for a company using Job Connect for recruitment.   (We don't do this.)\n3.Do not give out personal or financial account information to a new employer via email or messaging service.\n4.Do not cash checks or transfer funds for your employer.\n5.Beware of spelling errors and bad grammar.\n6.If something sounds too good to be true, it probably is.\n7.Beware of job postings that ask you to send your resume to a free email address (e.g. @gmail.com, @mail.com, etc.).Job Connect and its employees do not conduct outreach via WhatsApp. ",style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black
                        ),),
                        )
                      ],
                     ),
                   ),  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Uint8List ImageBytes = Uint8List(0);
  Future<void> _addImage() async{
       final imagepicker = ImagePicker();
       final pickedimage = await imagepicker.pickImage(source: ImageSource.gallery,
       maxHeight: 1000,
       maxWidth: 1000
       );
       if(pickedimage!= null)
       {
        XFile? imageFile = XFile(pickedimage.path);
         ImageBytes= await imageFile.readAsBytes();

        setState(() {
         
        });
        
       }
  }
}