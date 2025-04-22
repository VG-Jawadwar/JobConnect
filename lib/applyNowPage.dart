import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myapp/applysucessPage.dart';

class ApplyNowPageScreen extends StatefulWidget {
  const ApplyNowPageScreen({super.key});

  @override
  State<ApplyNowPageScreen> createState() => _ApplyNowPageScreenState();
}

class _ApplyNowPageScreenState extends State<ApplyNowPageScreen> {

  TextEditingController FName = TextEditingController();
  TextEditingController LName = TextEditingController();
  TextEditingController Mail = TextEditingController();
  TextEditingController Qualification = TextEditingController();
  TextEditingController College = TextEditingController();
   TextEditingController DOB = TextEditingController();
  TextEditingController Experience = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int selectedValue = 1;
  var height , width, size;

  bool Dart = false;
  bool Java = false;
  bool JavaScript = false;
  bool Python = false;
  bool CPP = false;
  bool Swift = false;
  bool C_hash = false;
  

  Widget addcheckbox(CheckValue, name, path)
  {
    return  Container(
                    child: StatefulBuilder(
                      builder: (context, StateSetter setState) {
                        return CheckboxListTile(
                           activeColor: Colors.blue,
                          secondary: CircleAvatar(
                          backgroundImage: AssetImage("assets/$path"), 
                          radius: 20,
                        ),
                          dense: true,
                          title: Text(name, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),),
                          value: CheckValue, onChanged: (value)
                        {
                          setState(() {
                            CheckValue = value!;
                          });
                        
                        });
                      }
                    ),
                  );
 }


  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
  return Scaffold(
      appBar: AppBar(
        title: Text("Apply", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade300,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
            colors:[
           Colors.lightBlue.shade100,
           Colors.lightBlue.shade300
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
                          width: width*0.46,
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
                                borderRadius: BorderRadius.circular(17)
                              ),
                              labelText: "First",
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
                              hintText: "First Name"
                            
                            ),
                          
                        ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                  
                        Container(
                          width: width*0.459,
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
                                 borderRadius: BorderRadius.circular(17)
                              ),
                              labelText: "Last",
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Last Name",
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
                                 borderRadius: BorderRadius.circular(17)
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
                                
                                 borderRadius: BorderRadius.circular(17)
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
                                firstDate: DateTime(1800,01,01), 
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
                                 borderRadius: BorderRadius.circular(17)
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
                        if(Qualification.text.isEmpty)
                              {
                                return "Invalid Qualification";
                              }else{
                                return null;
                              }
                      },
                      controller: Qualification,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(17)
                              ),
                              labelText: "Qualification",
                              labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Highest Qualification",
                  
                               prefixIcon: Icon(
                              Icons.school,
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
                        if(Experience.text.isEmpty)
                              {
                                return "Invalid Date";
                              }else{
                                return null;
                              }
                      },
                      controller: Experience,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)
                              ),
                              border: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(17)
                              ),
                              labelText: "Experience",
                                labelStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                              hintText: "Experience",
                  
                               prefixIcon: Icon(
                              Icons.work_history,
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
                    child: Text("Gender",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),),
                  ),

                 RadioListTile( 
                  
                      title: Text('Male',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),), 
                      
                      value: 1, 
                      groupValue: selectedValue, 
                      onChanged: (value) { 
               setState(() { 
                selectedValue =  value!; 
              }); 
            }, 
          ), 

                  RadioListTile( 
                    title: Text('Female',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),),  
                    value: 2, 
                    groupValue: selectedValue, 
                    onChanged: (value) { 
                        setState(() { 
                          selectedValue =  value!; 
                        }); 
            }, 
          ), 

           RadioListTile( 
                    title: Text('Prefer Not to Say.',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,

                          ),),  
                    value: 3, 
                    groupValue: selectedValue, 
                    onChanged: (value) { 
                        setState(() { 
                          selectedValue =  value!; 
                        }); 
            }, 
          ), 
                  

                  Container(
                    child: Text("Progrmming Languages",style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ), ),
                  ),
                   SizedBox(
                    height: 6,
                  ),

                  addcheckbox(Dart, "Dart", "dart.png"),
                  addcheckbox(Java,"Java","java.png"),
                   addcheckbox(JavaScript, "JavaScript","JavaScript.png"),
                  addcheckbox(Python,"Python","Python.jpeg"),
                   addcheckbox(CPP, "CPP","CPP.png"),
                  addcheckbox(Swift,"Swift","Swift.jpeg"),
                 addcheckbox(C_hash,"C#","C_hash.png"),
    
        
                  Container(
                    height: height*0.077,
                    width: width*0.512,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue
                      ),
                      
                      onPressed: (){
                        if(_formKey.currentState!.validate())
                        {

                          showDialog(context: (context), builder: (context)
                             {
                              return AlertDialog(
                                title: Text("Apply", style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                                ),),
                                content: Text("Are you sure want to Apply for this Job?",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal
                                ),),
                                actions: [

                                  TextButton(
                                    onPressed: ()
                                  {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ApplysucesspageSCreen()));

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
                        }else{
                           Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 20,
                            msg: "Application failed"
                            );
                        }
                        
                        FName.clear();
                        LName .clear();
                        Mail.clear();  
                        Qualification.clear();   
                        College.clear();
                        Experience.clear();

                
                    }, child: Text("Apply Now", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),)),
                  ),

                  SizedBox(height: 15,),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}