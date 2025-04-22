import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/loginPage.dart';
import 'package:myapp/registrationPage.dart';

class ResetPasswordPageScreen extends StatefulWidget {
  const ResetPasswordPageScreen({super.key});

  @override
  State<ResetPasswordPageScreen> createState() => _ResetPasswordPageScreenState();
}

class _ResetPasswordPageScreenState extends State<ResetPasswordPageScreen> {

  TextEditingController Newpassword = TextEditingController();
 TextEditingController ConfirmPassword = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isHidden_ConfirmPassword = true; 
bool _isHidden_NewPassword = true;

  void _togglePasswordView_ConfirmPassword() {
    setState(() {
      _isHidden_ConfirmPassword = !_isHidden_ConfirmPassword;
    });
  }

    void _togglePasswordView_NewPassword() {
    setState(() {
      _isHidden_NewPassword = !_isHidden_NewPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
          
                Stack(
                  children: [
                   
                    Container(
                      child: Image.asset("assets/LOGIN.png", fit: BoxFit.fill,),
                    ),
          
                     Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Container(
                              child: Text("Reset Password",style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                              ),
                          ),
                        ),
                  ],
                ),
                Container(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
          
                          Container(
                            child: Text("Enter New Password",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),),
                          ),
                          Container(

                            height: 70,
                            width: 350,
                            child: Text("Your New Password Must be Different from Previously used Password",textAlign: TextAlign.center,style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.normal,
                                color: Colors.black45
                              ),),
                          ),
                          
                              
                            SizedBox(
                              height: 30,
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                  
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: _isHidden_NewPassword,
                                  obscuringCharacter: "*",
                  
                                  validator: (var value) {
                                     if(Newpassword.text.isEmpty)
                                    {
                                      return "Invalid password";
                                    }else if(Newpassword.text != ConfirmPassword.text)
                                    {
                                      return "Invalid password";
                  
                                    }
                                    else{
                                      return null;
                                    }
                                  },
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    weight: 40,
                                    size: 25,
                                  ),

                                  suffix: InkWell(
                                                  onTap: _togglePasswordView_NewPassword,
                                                  child: Icon(
                                                    
                                                          _isHidden_NewPassword
                                                          ? Icons.visibility 
                                                          : Icons.visibility_off,
                                                      ),
                                                  ),
                                  labelText: "New Password",
                                  hintText: "password",
                                  border: OutlineInputBorder()
                                ),
                                  controller: Newpassword,
                                  ),
                              ),
                        
                              
                            ),
                        
                            SizedBox(
                              height: 20,
                            ),
                        
                             Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20),
                              child: Container(
                                child: TextFormField(
                                obscureText: _isHidden_ConfirmPassword,
                                   obscuringCharacter: "*",
                                   keyboardType: TextInputType.visiblePassword,
                                validator: (var value)
                                {
                                  if(ConfirmPassword.text.isEmpty)
                                  {
                                    return "Invalid Password";
                                  }else if(ConfirmPassword.text != Newpassword.text)
                                    {
                                      return "Invalid Password";
                  
                                    }
                                  else 
                                  {
                                    return null;
                                  }
                                },
                                
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30)
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    weight: 40,
                                    size: 25,
                                  ),
                                  suffix: InkWell(
                                                  onTap: _togglePasswordView_ConfirmPassword,
                                                  child: Icon(
                                                    
                                                          _isHidden_ConfirmPassword 
                                                          ? Icons.visibility 
                                                          : Icons.visibility_off,
                                                      ),
                                                  ),
                                  labelText: "Confirm Password",
                                  hintText: "Password",
                                 border: OutlineInputBorder(),
                                ),
                                  controller: ConfirmPassword,
                                  ),
                              ),
                        
                              
                            ),
                        
                            SizedBox(
                              height: 17,
                            ),
                        
                            Container(
                              width: 180,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlue
                                ),
                                onPressed:() async
                              {
                              if(_formKey.currentState!.validate())
                              {
                                
                                   showDialog(context: (context), builder: (context)
                                   { 
                                    return AlertDialog(
                                      title: Text("Success", textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),),

                                      content: Text("Your Password Has been Reset Successfully", textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal
                                      ),),

                                      actions: [
                                        TextButton(

                                          onPressed: ()
                                        {
                                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPageScreen()));

                                        }, child: Text("Done", textAlign: TextAlign.center,style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,

                                      ),))
                                      ],
                                    );

                                   });
                                    print("Password Reset Successful");
            
                                    Fluttertoast.showToast(
                                      msg:"Password Reset Successful" ,
                                      timeInSecForIosWeb: 2,
                                      toastLength: Toast.LENGTH_SHORT,
                                      fontSize: 20,
                                      backgroundColor: Colors.green,
              
                                      );
                              }else{
                                 Fluttertoast.showToast(
                                    toastLength: Toast.LENGTH_LONG,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 20,
                                    msg: "Password Reset failed"
                                    
                                    );
                              }
              
                                Newpassword.clear();
                                ConfirmPassword.clear();
                              
                               
                              }, child: Text("Reset Password", textAlign: TextAlign.center ,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                              ),)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed:(){
                               Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> RegistrationpageScreen()));
                        
                              }, child: Text("New User? Sign Up", style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),)),
                            ),
                    
                      ],),
                    ),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}