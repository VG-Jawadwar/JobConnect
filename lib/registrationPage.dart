import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myapp/loginPage.dart';

class RegistrationpageScreen extends StatefulWidget {
  const RegistrationpageScreen({super.key});

  @override
  State<RegistrationpageScreen> createState() => _RegistrationpageScreenState();
}

class _RegistrationpageScreenState extends State<RegistrationpageScreen> {

  TextEditingController FName = TextEditingController();
  TextEditingController LName = TextEditingController();
  TextEditingController Mail = TextEditingController();
  TextEditingController Pwd = TextEditingController();
  TextEditingController College = TextEditingController();
   TextEditingController DOB = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent.shade100,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            colors:[
            Color(0xffffbd49),
            Color(0xffff7a5cb),
          ])
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 180,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,

                            ),
                            validator: (var value) {
                              if(FName.text.isEmpty)
                              {
                                return "Invalid Name";
                              }else{
                                return null;
                              }
                              
                            },
                            controller: FName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Reciptant Name",
                               prefixIcon: Icon(
                              Icons.people,
                              weight: 40,
                              size: 25,
                            ),
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "First"
                            
                            ),
                          
                        ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                  
                        Container(
                          width: 182,
                          child: TextFormField(
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              
                            ),
                            validator: (var value) {
                              if(LName.text.isEmpty)
                              {
                                return "Invalid Name";
                              }else{
                                return null;
                              }
                            },
                            controller:LName,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Reciptant Name",
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Last",
                               prefixIcon: Icon(
                              Icons.people,
                              weight: 40,
                              size: 25,
                            ),
                            
                            ),
                          
                        ),
                        ),
                  
                      ],
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              
                            ),
                      validator: (var value) {
                        if(College.text.isEmpty)
                              {
                                return "Invalid Collge Name";
                              }else{
                                return null;
                              }
                      },
                      controller: College,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "College Name",
                               prefixIcon: Icon(
                              Icons.school_rounded,
                              weight: 40,
                              size: 25,
                            ),
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "College"
                            
                            ),
            
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              
                            ),
                      validator: (var value) {
                        if(DOB.text.isEmpty)
                              {
                                return "Invalid Date of Birth";
                              }else{
                                return null;
                              }
                      },
                      controller: DOB,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Date of Birth",
                               prefixIcon: Icon(
                              Icons.date_range_sharp,
                              weight: 40,
                              size: 25,
                            ),
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Date"
                            
                            ),

                            onTap: (){
                              showDatePicker(
                                context: context, 
                                firstDate: DateTime(2000,01,01), 
                                lastDate: DateTime(2024,12,12,)
                                ).then((value)
                                {
                                 var dateformat =DateFormat("yyyy-MM-dd").format(value!);
                                  print(value); 
                                  DOB.text = dateformat.toString();
                                }
                                );
                            },
                    ),
                  ),
                    
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              
                            ),
                       validator: (var value) {
                        if(Mail.text.isEmpty)
                              {
                                return "Invalid Email Id";
                              }else{
                                return null;
                              }
                      },
                      controller: Mail,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Email Id",
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Email",
                  
                               prefixIcon: Icon(
                              Icons.email_outlined,
                              weight: 40,
                              size: 25,
                            ),
                            
                            ),
            
                    ),
                  ),
                    
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextFormField(
                      style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              
                            ),
                       validator: (var value) {
                        if(Pwd.text.isEmpty)
                              {
                                return "Invalid Password";
                              }else{
                                return null;
                              }
                      },
                      controller: Pwd,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Password",
                  
                               prefixIcon: Icon(
                              Icons.lock,
                              weight: 40,
                              size: 25,
                            ),
                            
                            ),
            
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                    
                    
                  Container(
                    height: 60,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue
                      ),
                      
                      onPressed: (){
                        if(_formKey.currentState!.validate())
                        {
                           Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 20,
                            msg: "Registered Successfully"
                            );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> LoginPageScreen()));
                        }else{
                           Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            msg: "Registration failed"
                            );
                        }
                        
                        FName.clear();
                        LName .clear();
                        Mail.clear();  
                        Pwd.clear();   
                        College.clear(); 
                         

                
                    }, child: Text("Register", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),)),
                  ),

                  SizedBox(height: 15,),

                   Container(
                    child: TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> LoginPageScreen()));
                    }, child: Text("Already have Account? Sign In", style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}