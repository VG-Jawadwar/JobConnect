import 'package:flutter/material.dart';

class IDCardPageScreen extends StatefulWidget {
  const IDCardPageScreen({super.key});

  @override
  State<IDCardPageScreen> createState() => _IDCardPageScreenState();
}

class _IDCardPageScreenState extends State<IDCardPageScreen> {
  var height,width,size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        // actions: [
        //   IconButton(
        //     onPressed: (){
        //       Navigator.pop(context);
        //   }, icon: Icon(
        //     Icons.logout,
        //     size: 30,
        //     color: Colors.black,
        //   ))
        // ],
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: height*0.767,
              width: width*0.944,
              child: Card(
                color: Colors.white,
                elevation: 90,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Container(
                              color: Colors.amber,
                              height: height*0.09,
                              width: width*0.942,
                              child: Image.asset("assets/ID_App_03.jpg",fit: BoxFit.fill,),
                            ),
                          )
            
                          // Container(
                          //   child: Column(
                          //     children: [
                          //       Container(
                          //         child: Text("Student Identity Card", style: TextStyle(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.bold 
                          //         ),),
                          //         ),
                          //         SizedBox(
                          //           height: 15,
                          //         ),
                          //         Container(
                          //           width: 250,
                          //           decoration: BoxDecoration(
                          //             borderRadius: BorderRadius.circular(20),
                          //             color: Colors.amber
                          //           ),
                          //           child: Center(
                          //             child: Text("Gramin Shikshan Prasarak Mandal", style: TextStyle(
                          //             color: Colors.red,
                          //             fontWeight: FontWeight.bold
                                    
                          //                 ),),
                          //               ),
                          //             ),
                                           
                          
                                          
                          //     ],
                          //   ),
                          // )
                      ,
                     Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
            
            
                      Container(
                      
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Gramin\n",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade600  
                              )
                            ),
                             TextSpan(
                              text: "Technical & Management Campus",
                               style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade600 
                              )
                            )
                          ]
                        )
                      ),
                     ),
            
                     SizedBox(
                      height: 5,
                     ),
            
                   
            
                       Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.pinkAccent,
                            width: 2,
                          )
                        ),
                          height: height*0.192,
                          width: width*0.382,
                          child: Image.asset("assets/ID_Card.png"),
                        ),
            
                        SizedBox(
                          height: 10,
                        ),
            
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            //color: Colors.red,
                                                child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Name: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                text: "Vaibhav Jawadwar",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                                                ),
                                               ),
                        ),
            
                      Padding(
                       padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                            //color: Colors.red,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Course: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                text: "Computer Engineering",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                        ),
                                             ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                            //color: Colors.red,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Year: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                text: "Third Year",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                        ),
                                             ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                            //color: Colors.red,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "DOB: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                text: "05-09-2006",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                        ),
                                             ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                            //color: Colors.red,
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Mob: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                text: "7083586756",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                        ),
                                             ),
                      ),
            
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                            //color: Colors.red,
                        child: Text.rich(
                          //textAlign: TextAlign.left,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Add: ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  
                                )
                              ),
                               TextSpan(
                                
                                text: "Lahoti Apartment, Flat No 201, \t\tChikhalwadi, Nanded",
                                 style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                 
                                )
                              )
                            ]
                          )
                        ),
                                             ),
                      ),
          
            
                     
                  
            
            
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}