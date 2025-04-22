import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/resetPasswordPage.dart';

class OTPAuthenticationPageScreen extends StatefulWidget {
  const OTPAuthenticationPageScreen({super.key});

  @override
  State<OTPAuthenticationPageScreen> createState() => _OTPAuthenticationPageScreenState();
}

class _OTPAuthenticationPageScreenState extends State<OTPAuthenticationPageScreen> {
   TextEditingController OTP1 = TextEditingController();
  TextEditingController OTP2 = TextEditingController();
  TextEditingController OTP3 = TextEditingController();
  TextEditingController OTP4 = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var height , width , size;
  String ConcatinateOTP = "";
  String FinalOTP = "2006";

  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
     return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),

              Container(
                height: height*0.384,
                child: Image.asset("assets/forget_Pass.png")
              ),

              

             
              Container(
                //height: 400 ,
                child: Center(child: Icon(
                  Icons.password,
                  size: 120,
                  color: Colors.blue,
                )),
              ),

               Container(
                width: width*0.815,
                height: height*0.077,
                child: Text("We will send you one Time Password on your Registered Mobile Number", textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black38
                ),),
              ),
        
              Container(
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Container(
                        width: width*0.242,
                        height: height*0.128,
                        padding: EdgeInsets.only(left: 10, right: 2),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: OTP1,
                            validator: (var value) {
                            if(OTP1.text.isEmpty)
                            {
                              return "Invalid OTP";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                                          
                          ),
                        ),
                      ),
                        Container(
                           width: width*0.242,
                        height: height*0.128,
                          padding: EdgeInsets.only(left: 10,right: 2),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                          controller: OTP2,
                            validator: (var value) {
                            if(OTP2.text.isEmpty)
                            {
                              return "Invalid OTP";
                            }else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                           ),
                        ),
                        Container(
                           width: width*0.242,
                        height: height*0.128,
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                          controller: OTP3,
                          validator: (var value) {
                            if(OTP3.text.isEmpty)
                            {
                              return "Invalid OTP";
                            }else{
                              return null;
                            }
                          },
                           decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                         ),
                        ),
                        Container(
                           width: width*0.242,
                        height: height*0.128,
                          padding: EdgeInsets.only(left: 10, right: 2),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                          controller: OTP4,
                            validator: (var value) {
                            if(OTP4.text.isEmpty)
                            {
                              return "Invalid OTP";
                            }else{
                              return null;
                            }
                          },
                           decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          ),
                             ),
                        )
                    ],
                  ),
                ),
              ),
              Container(
                child: ElevatedButton.icon(
                  onPressed: ()
                {
                  ConcatinateOTP = OTP1.text+OTP2.text+OTP3.text+OTP4.text;
                  print(FinalOTP.compareTo(ConcatinateOTP));
                  if(_formKey.currentState!.validate() && FinalOTP.compareTo(ConcatinateOTP) == 0)
                  { 
                      Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 20,
                            msg: "OTP Verified"
                            );
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> ResetPasswordPageScreen()));
                  }else{
                         Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            msg: "OTP Failed"
                            );
                  }

                  OTP1.clear();
                  OTP2.clear();
                  OTP3.clear();
                  OTP4.clear();

                }, label: Text("Submit", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.white,
                  size: 28,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                ),
              )
        
        
            ],
          ),
        ),
      ),
    );
  }
}