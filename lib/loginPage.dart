import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/homePage.dart';
import 'package:myapp/otpAuthenticationPage.dart';
import 'package:myapp/registrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({super.key});

  @override
  State<LoginPageScreen> createState() => LoginPageScreenState();
}

class LoginPageScreenState extends State<LoginPageScreen> {

 TextEditingController username = TextEditingController();
 TextEditingController password = TextEditingController();
 GlobalKey<FormState> _formKey = GlobalKey<FormState>(); 
 var height,width,size;
 FocusNode fc = FocusNode();
 static String BOOLCHECK = "Login";

 var userNm = "Vaibhav";
var pwd = "pass@123";

  String USER_KEYNAME = "Username";
  String PASS_KEYNAME = "Password";

void getvalue() async
{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username_prefs = prefs.getString(USER_KEYNAME);
  var  Password_prefs = prefs.getString(PASS_KEYNAME);
  var LoginCheckBool = prefs.getBool(BOOLCHECK);

    bool Login_check = username_prefs!=null && username_prefs.toString() == userNm && Password_prefs!=null && Password_prefs.toString() == pwd;

  if(LoginCheckBool!)
  {
    print("Aceess successfull");
    setState(() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
    });
 
  }

}


@override
  void initState() {
    super.initState();
    getvalue();
  }

   bool _isHidden_Password = true;

    void _togglePasswordView_NewPassword() {
    setState(() {
      _isHidden_Password = !_isHidden_Password;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(
      
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,

        decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      Color(0xfff7F7FD5),
                      Color(0xfff91EAE4),
                    ]
                  )
                ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                                    // ignore: prefer_const_constructors
                                    child: CircleAvatar(
                        backgroundImage: AssetImage("assets/logo2.png"),
                        radius: 50,
                        backgroundColor: Colors.black,
                        ),
                                    ),
                      ),
                            
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text("Welcome Back", style: 
                        TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          
                        decoration: TextDecoration.underline,
                        decorationThickness: 3,
                        decorationColor: Colors.greenAccent
                        ),),
                      ),
                    ),
                  
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 25),
                        child: Text("Lets Log in, Apply Jobs", style: TextStyle(
                          fontSize: 19,
                         color: Colors.black38
                        ),),
                      ),
                    ),
                  
                    SizedBox(
                      height: 40,
                    ),
          
                    Container(
                      alignment: Alignment.center,
                          child: Text("Login", style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                    
                        SizedBox(
                          height: 30,
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 20),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: TextFormField(
              
                              keyboardType: TextInputType.emailAddress,
              
              
                              validator: (var value) {
                                 if(username.text.isEmpty)
                                {
                                  return "Invalid Email Id";
                                }else if(username.text != userNm)
                                {
                                  return "Invalid Email Id";
              
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
                              labelText: "Enter Email",
                              hintText: "Email",
                              border: OutlineInputBorder()
                            ),
                              controller: username,
                              ),
                          ),
                    
                          
                        ),
                    
                        SizedBox(
                          height: 20,
                        ),
                    
                         Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 20),
                          child: Container(
                            child: TextFormField(
                            
                              obscureText: _isHidden_Password,
                              obscuringCharacter: "*",
                              
                            validator: (var value)
                            {
                              if(password.text.isEmpty)
                              {
                                return "Invalid Password";
                              }else if(password.text != pwd)
                                {
                                  return "Invalid Password Id";
              
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
                                                  onTap: _togglePasswordView_NewPassword,
                                                  child: Icon(
                                                    
                                                          _isHidden_Password
                                                          ? Icons.visibility 
                                                          : Icons.visibility_off,
                                                      ),
                                                  ),
                              labelText: "Enter Password",
                              hintText: "Password",
                             border: OutlineInputBorder(),
                            ),
                              controller: password,
                              ),
                          ),
                    
                          
                        ),
                        SizedBox(
                          height: 10,
                        ),
                    
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            child: TextButton(
                              onPressed:()
                            {
                              print("Click here to Reset Password");
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> OTPAuthenticationPageScreen()));
                            }, child: Text("Forget Password?", style: TextStyle(
                              fontSize: 19,
                              color: Colors.amber.shade300
                            ),)),
                          ),
                        ),
                    
                        SizedBox(
                          height: 10,
                        ),
                    
                        Container(
                          width: width*0.382,
                          height: height*0.077,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.lightBlue
                            ),
                            onPressed:() async
                          {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString(USER_KEYNAME, username.text);
                            prefs.setString(PASS_KEYNAME, password.text);
                            
                          if(_formKey.currentState!.validate())
                          {
                            
                                print("Login Successful");
                                prefs.setBool(BOOLCHECK, true);
          
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePageScreen()));
          
                                Fluttertoast.showToast(
                                  msg:"Login Successful" ,
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
                                msg: "Login failed"
                                
                                );
          
                          }
          
                            username.clear();
                            password.clear();
                          
                           
                          }, child: Text("Login", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 25
                          ),)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed:(){
                           Navigator.push(context, MaterialPageRoute(builder:(context)=> RegistrationpageScreen()));
                    
                          }, child: Text("New User? Sign Up", style: TextStyle(
                            fontSize: 20,
                            color: Colors.amber.shade300,
                          ),)),
                        ),
                
                  ],),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}