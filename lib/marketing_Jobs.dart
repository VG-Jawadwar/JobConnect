import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/applyNowPage.dart';
import 'dart:convert';

import 'package:myapp/postApi_marketing.dart';

class MarketingCategoryJobsScreen extends StatefulWidget {
  const MarketingCategoryJobsScreen({super.key});

  @override
  State<MarketingCategoryJobsScreen> createState() => _MarketingCategoryJobsScreenState();
}

class _MarketingCategoryJobsScreenState extends State<MarketingCategoryJobsScreen> {
   var size, height, width;
  bool Dcheck = false;
  bool Echeck = false;
bool Datecheck = false;
Color iconcolor = Colors.black;

List date= [
    10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42
  ];
Widget addsizedbox(double height , double width){
    return SizedBox(
      height: height,
      width: width,
    );
  }
  List<PostMarketing> posts_marketing = [];

  
  Future<List<PostMarketing>> getData() async
{
  final response = await http.get(Uri.parse("https://mocki.io/v1/f12b6edd-c70a-44a2-8cd1-eafb7503da08"));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200)
  {
    for (Map<String, dynamic> index in data)
    {
      posts_marketing.add(PostMarketing.fromJson(index));
    }
    return posts_marketing;

  }else{
    return posts_marketing;
  }
}


 Widget addListview()
{
  return FutureBuilder(
    future: getData(),
    builder: (context, snapshot) {
      if(snapshot.hasData )
      {
      return ListView.builder(
                      reverse: false,
                      shrinkWrap: true,
                      itemCount: 30,
                      // posts_diploma.length,
                      
                      itemBuilder: (context, index)
                    {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Card(
                            elevation: 9,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black,width: 1),
                                          
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            onPressed: ()
                                            {
                                              print(height);
                                              print(width);
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context, builder: (context)
                                              {
                                                
                                                return Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Container( 
                                                    height: height*0.75,
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(posts_marketing[index].title,textAlign: TextAlign.center,style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                          ),
                                                        ),
                                                        addsizedbox(5, 0),
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            child: Text(posts_marketing[index].companey,style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                        addsizedbox(5, 0),
                                                        Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                        child: Text("Location: ${posts_marketing[index].location}",style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.normal
                                                        ),),
                                                      ),
                                                    ),
                                                    addsizedbox(10, 0),
                                                    Divider(
                                                      color: Colors.black,
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(                                               
                                                        child: Text("Job Details: ",style: TextStyle(
                                                              fontSize: 18.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                      ),
                                                    ),
                                                    addsizedbox(5, 0),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Icon(Icons.payments_outlined,
                                                            size: 40,),
                                                          ),
                                                  
                                                        addsizedbox(0, 15),
                                                        Container(
                                                          child: Text("Pay", style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                        ],
                                                      ),
                                                    ),
                                                    addsizedbox(0, 10),
                                                    SizedBox(
                                                        width: width*0.69,
                                                        height: height*0.07,
                                                        child: Card(
                                                          elevation: 10,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide(color: Colors.black)
                                                          ),
                                                          //color: Colors.grey.shade300,
                                                          child: Center(
                                                            child: Text("${posts_marketing[index].salary} Per Month/Year", style: TextStyle(
                                                              fontSize: 16.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                      addsizedbox(15, 0),
                                                      Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Icon(Icons.cases_outlined,
                                                            size: 40,),
                                                          ),
                                                  
                                                        addsizedbox(0, 5),
                                                        Container(
                                                          child: Text("Job Type",style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                        ],
                                                      ),
                                                    ),
                                                  
                                                    addsizedbox(0, 15),
                                                    SizedBox(
                                                        width: width*0.384,
                                                        height: height*0.052,
                                                        child: Card(
                                                          elevation: 10,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide(color: Colors.black)
                                                          ),
                                                          //color: Colors.grey.shade300,
                                                          child: Center(
                                                            child: Text("Full Time", style: TextStyle(
                                                              fontSize: 16.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                      addsizedbox(10, 0),
                                                       Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Text("Experience Req.: ", style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                            Container(
                                                              child: Text(posts_marketing[index].experience, style: TextStyle(
                                                                fontSize: 20,
                                                                
                                                              ),),
                                                            )
                                                          ],
                                                        )
                          
                                                      ),
                                                      addsizedbox(10, 0),
                          
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Text("Job Id: ", style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                            Container(
                                                              child: Text("#${posts_marketing[index].id}", style: TextStyle(
                                                                fontSize: 20,
                                                                
                                                              ),),
                                                            )
                                                          ],
                                                        )
                          
                                                      ),
                                                      addsizedbox(10, 0),
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                child: Text("Department: ", style: TextStyle(
                                                                        fontSize: 25,
                                                                        fontWeight: FontWeight.bold
                                                                      ),),
                                                              ),
                          
                                                               Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10.0),
                                                                child: Container(
                                                          
                                                            child: Text(posts_marketing[index].department, textAlign: TextAlign.left,style: TextStyle(
                                                              fontSize: 20
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                            ],
                                                          ),
                                                        ), 
                                                      ),
                                                     
                                                  
                                                      addsizedbox(15, 0),
                                                      Container(
                                                        width: width*0.55,
                                                        
                                                        child: ElevatedButton.icon(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.blue.shade900,
                                                          ),
                                                          
                                                          onPressed: ()
                                                        {
                                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ApplyNowPageScreen()));
                                                  
                                                        },
                                                         label: Text("Apply Now ", style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white
                                                         ),),
                                                         icon: Icon(
                                                          Icons.arrow_forward,
                                                          size: 25,
                                                          color: Colors.white,
                                                         ),),
                                                      )
                                                                                        
                                                  
                                                      ],
                                                    ),
                                                  ),
                                                );
                                
                                              });
                                            },
                                            child: Center(
                                              child: Text(posts_marketing[index].title, style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  addsizedbox(5, 0),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text("${posts_marketing[index].gender} Only",style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(posts_marketing[index].location, style: TextStyle(fontSize: 18),),
                                    ),
                                  ),
                                  addsizedbox(10, 0),
                                  SizedBox(
                                    width: width*0.715,
                                    height: height*0.052,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      color: Colors.grey.shade300,
                                      child: Center(
                                        child: Text("${posts_marketing[index].salary} Per Month/Year", style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                  ),
                                          
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.keyboard_double_arrow_right_sharp,
                                            color: Colors.blue.shade900,
                                            size: 50,
                                          ),
                                        ),
                                          
                                        Container(
                                          child: Text("Easily Apply", style: TextStyle(
                                            fontSize: 20,
                                            
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                              
                                  addsizedbox(10, 0),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Text("Active ${date[index]} Days Ago", style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                            ),),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      
                    });
      }else{
        return Center(child: CircularProgressIndicator());
      }
    }
  );
   }

Widget addListview_reverse()
{
  return FutureBuilder(
    future: getData(),
    builder: (context, snapshot) {
      if (snapshot.hasData)
      {

         return ListView.builder(
          
                     reverse: true,
                      shrinkWrap: true,
                      itemCount: 30,
                      //posts_diploma.length ,
                      
                      itemBuilder: (context, index)
                    {
                      return SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10),
                          child: Card(
                            elevation: 9,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black,width: 1),
                                          
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            onPressed: ()
                                            {
                                              print(height);
                                              print(width);
                                               showModalBottomSheet(
                                                isScrollControlled: true,
                                                context: context, builder: (context)
                                              {
                                                
                                                return Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Container( 
                                                    height: height*0.75,
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Container(
                                                            child: Center(
                                                              child: Text(posts_marketing[index].title,textAlign: TextAlign.center,style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                          ),
                                                        ),
                                                        addsizedbox(5, 0),
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Container(
                                                            child: Text(posts_marketing[index].companey,style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                        addsizedbox(5, 0),
                                                        Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(
                                                        child: Text("Location: ${posts_marketing[index].location}",style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.normal
                                                        ),),
                                                      ),
                                                    ),
                                                    addsizedbox(10, 0),
                                                    Divider(
                                                      color: Colors.black,
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: Container(                                               
                                                        child: Text("Job Details: ",style: TextStyle(
                                                              fontSize: 18.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                      ),
                                                    ),
                                                    addsizedbox(5, 0),
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Icon(Icons.payments_outlined,
                                                            size: 40,),
                                                          ),
                                                  
                                                        addsizedbox(0, 15),
                                                        Container(
                                                          child: Text("Pay", style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                        ],
                                                      ),
                                                    ),
                                                    addsizedbox(0, 10),
                                                    SizedBox(
                                                        width: width*0.69,
                                                        height: height*0.07,
                                                        child: Card(
                                                          elevation: 10,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide(color: Colors.black)
                                                          ),
                                                          //color: Colors.grey.shade300,
                                                          child: Center(
                                                            child: Text("${posts_marketing[index].salary} Per Month/Year", style: TextStyle(
                                                              fontSize: 16.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                      addsizedbox(15, 0),
                                                      Container(
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            child: Icon(Icons.cases_outlined,
                                                            size: 40,),
                                                          ),
                                                  
                                                        addsizedbox(0, 5),
                                                        Container(
                                                          child: Text("Job Type",style: TextStyle(
                                                            fontSize: 23,
                                                            fontWeight: FontWeight.bold
                                                          ),),
                                                        ),
                                                        ],
                                                      ),
                                                    ),
                                                  
                                                    addsizedbox(0, 15),
                                                    SizedBox(
                                                        width: width*0.384,
                                                        height: height*0.052,
                                                        child: Card(
                                                          elevation: 10,
                                                          shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide(color: Colors.black)
                                                          ),
                                                          //color: Colors.grey.shade300,
                                                          child: Center(
                                                            child: Text("Full Time", style: TextStyle(
                                                              fontSize: 16.5,
                                                              fontWeight: FontWeight.bold
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                      addsizedbox(10, 0),
                                                       Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Text("Experience Req.: ", style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                            Container(
                                                              child: Text(posts_marketing[index].experience, style: TextStyle(
                                                                fontSize: 20,
                                                                
                                                              ),),
                                                            )
                                                          ],
                                                        )
                          
                                                      ),
                                                      addsizedbox(10, 0),
                          
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Text("Job Id: ", style: TextStyle(
                                                                fontSize: 25,
                                                                fontWeight: FontWeight.bold
                                                              ),),
                                                            ),
                                                            Container(
                                                              child: Text("#${posts_marketing[index].id}", style: TextStyle(
                                                                fontSize: 20,
                                                                
                                                              ),),
                                                            )
                                                          ],
                                                        )
                          
                                                      ),
                                                      addsizedbox(10, 0),
                                                      Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Container(
                                                          child: Row(
                                                            children: [
                                                              Container(
                                                                child: Text("Department: ", style: TextStyle(
                                                                        fontSize: 25,
                                                                        fontWeight: FontWeight.bold
                                                                      ),),
                                                              ),
                          
                                                               Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Padding(
                                                                padding: const EdgeInsets.only(left: 10.0),
                                                                child: Container(
                                                          
                                                            child: Text(posts_marketing[index].department, textAlign: TextAlign.left,style: TextStyle(
                                                              fontSize: 20
                                                            ),),
                                                          ),
                                                        ),
                                                      ),
                                                            ],
                                                          ),
                                                        ), 
                                                      ),
                                                     
                                                  
                                                      addsizedbox(15, 0),
                                                      Container(
                                                        width: width*0.55,
                                                        
                                                        child: ElevatedButton.icon(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.blue.shade900,
                                                          ),
                                                          
                                                          onPressed: ()
                                                        {
                                                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ApplyNowPageScreen()));
                                                  
                                                        },
                                                         label: Text("Apply Now ", style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white
                                                         ),),
                                                         icon: Icon(
                                                          Icons.arrow_forward,
                                                          size: 25,
                                                          color: Colors.white,
                                                         ),),
                                                      )
                                                                                        
                                                  
                                                      ],
                                                    ),
                                                  ),
                                                );
                                
                                              });
                                            },
                                            child: Center(
                                              child: Text(posts_marketing[index].title, style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                              ),),
                                            ),
                                          ),
                                        ),
                                      
                                      ],
                                    ),
                                  ),
                                  addsizedbox(5, 0),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(posts_marketing[index].companey,style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      child: Text(posts_marketing[index].location, style: TextStyle(fontSize: 18),),
                                    ),
                                  ),
                                  addsizedbox(10, 0),
                                  SizedBox(
                                   width: width*0.715,
                                    height: height*0.052,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      ),
                                      color: Colors.grey.shade300,
                                      child: Center(
                                        child: Text("${posts_marketing[index].salary} Per Month/Year", style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                  ),
                                          
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.keyboard_double_arrow_right_sharp,
                                            color: Colors.blue.shade900,
                                            size: 50,
                                          ),
                                        ),
                                          
                                        Container(
                                          child: Text("Easily Apply", style: TextStyle(
                                            fontSize: 20,
                                            
                                          ),),
                                        ),
                                      ],
                                    ),
                                  ),
                              
                                  addsizedbox(10, 0),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            child: Text("Active ${date[index]} Days Ago", style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600
                                            ),),
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      
                    });
                  }else{
                    return Center(child: CircularProgressIndicator());
                  }

    }
  );
     }


  @override
  Widget build(BuildContext context) {
     size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.lightBlue.shade100,
        title: Text("Marketing", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          
        ),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,

      
      floatingActionButton: FloatingActionButton(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        splashColor: Colors.black,
        backgroundColor: Colors.blue.shade800,
        onPressed: ()
      {
        

        showModalBottomSheet(
    
          
          context: (context), builder: (context)
        {
          
          return Container(
            height: height*0.25,
            child: Column(
              children: [
                Container(
                  child: Text("Filter Jobs", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              

                Container(

                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: StatefulBuilder(
                            builder: (context, StateSetter setState) {
                              return Checkbox(
                                value: Datecheck,
                               onChanged: (value)
                              {
                                setState(() {
                                  Datecheck = value!;
                                });
                                                      
                              });
                            }
                          ),
                        ),
                      ),
                      addsizedbox(0, 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: Column(
                            children: [
                              addsizedbox(15, 0),
                              Container(
                                child: Text("Filter by Date Posted", style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  child: Text("Oldest - Newest", style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black45
                                  ),),
                                ),
                              )
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                addsizedbox(10, 0),

                Container(

                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700
                    ),
                    onPressed: ()
                  {
                    if(Datecheck)
                    {
                      setState(() {

                        addListview_reverse();
                        Navigator.pop(context);
                      });
                    }else{
                      setState(() {
                        addListview();
                        Navigator.pop(context);
                      });
                    }

                  }, label: Text("Apply Changes" ,style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                   icon: Icon(
                    Icons.arrow_circle_right_sharp,
                    color: Colors.white,
                    size: 17,
                  )
                 ),
                )

              ],
            ),

          );
        });
      
        print("clicked on Floating action Button");

      } ,
      child: Icon(
        Icons.filter_alt_outlined,
        size: 30,
        color: Colors.white,
        ),),

      body:   Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill)
          ),
            height: height*0.9,
            child: Datecheck? addListview_reverse() : addListview(),
        ),
      ),

 
    );
  }
}