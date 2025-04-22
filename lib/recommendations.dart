// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/diploma_Jobs.dart';
import 'package:myapp/it_Jobs.dart';
import 'package:myapp/postApi_IT.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:myapp/postApi_Diploma.dart';

class RecommendationsScreenPage extends StatefulWidget {
  const RecommendationsScreenPage({super.key});

  @override
  State<RecommendationsScreenPage> createState() => _RecommendationsScreenPageState();
}

class _RecommendationsScreenPageState extends State<RecommendationsScreenPage> {
   var size, height, width;

  Widget addsizedbox(double height , double width){
    return SizedBox(
      height: height,
      width: width,
    );
  }

  List<PostIt> posts_IT = [];

   Future<List<PostIt>> getData() async
{
  final response = await http.get(Uri.parse("https://mocki.io/v1/29f669eb-9d93-480c-b8aa-62e066b06ba4"));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200)
  {
    for (Map<String, dynamic> index in data)
    {
      posts_IT.add(PostIt.fromJson(index));
    }
    return posts_IT;

  }else{
    return posts_IT;
  }
}

List<PostDiploma> posts_diploma = [];

  Future<List<PostDiploma>> getData_diploma() async
{
  final response = await http.get(Uri.parse("https://mocki.io/v1/03322769-f078-44b1-92e9-50687faccaa3"));
  var data = jsonDecode(response.body.toString());
  if(response.statusCode == 200)
  {
    for (Map<String, dynamic> index in data)
    {
      posts_diploma.add(PostDiploma.fromJson(index));
    }
    return posts_diploma;

  }else{
    return posts_diploma;
  }
}

List<Color> _iconcolor = [
  Colors.blueAccent,
  Colors.amber,
  Colors.greenAccent,
  Colors.teal,
  Colors.pink,
  Colors.deepPurpleAccent.shade200
];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:[
                        Color(0xfffd2ffff),
                        Color(0xfff0694c6),
                      ]
                    )
                  ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
          
                      Container(
                        child: Row(
                          children: [
                           Container(
                         
                          child: Text("Featured Jobs", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
          
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(              
                              onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> ITCategoryJobsScreen()));
                              print("Clicked on See all Button");
                            }, 
                           
                            child: Text("Discover all",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                     
                                    ), 
                                    ),
                                    ),
                          ),
                        )
          
                          ],
                        ),
                      ),
          
                      Container(
                        height: 280,
                        width: 490,
                        child: FutureBuilder(
                          future: getData(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData)
                            {
                            return CardSwiper(
                              cardsCount: 6,
                              isLoop: true,
                              cardBuilder: (context , index, x, y)
                              {
                                return SizedBox(
                                  height: 280,
                                  width: 490,
                                  child: InkWell(
                                    onTap:()
                                    {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> ITCategoryJobsScreen()));
                                    },
                                    child: Card(
                                      elevation: 40,
                                      color: _iconcolor[index],
                                      child: Column(
                                        children: [
                                          Container(
                                            child:  Center(
                                                child: Text(posts_IT[index].title, style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ),
                                          ),
                                    
                                           Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(posts_IT[index].companey,style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(posts_IT[index].location, style: TextStyle(fontSize: 18),),
                                      ),
                                    ),
                                    addsizedbox(10, 0),
                                    SizedBox(
                                      width: 280,
                                      height: 40,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("${posts_IT[index].salary} Per Year/Month", style: TextStyle(
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
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          ),
                                            
                                          Container(
                                            child: Text("Easily Apply", style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                              
                                            ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                      ]
                                    )
                                    ),
                                  )
                            );
                              }
                            );
                          }else
                          {
                            return Center(child: CircularProgressIndicator());
                          }
                          },
                        ),
                      ),
                      addsizedbox(20, 0),
                      Container(
                        child: Row(
                          children: [
                           Container(
                      
                          child: Text("NON IT Jobs", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
          
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(              
                              onPressed: ()
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DiplomaJobsScreen()));
                              print("Clicked on See all Button");
                            }, 
                          
                            child: Text("Discover all",style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                     
                                    ), 
                                    ),
                                    ),
                          ),
                        )
                          ],
                        ),
                      ),
          
                       Container(
                        height: 280,
                        width: 490,
                        child: FutureBuilder(
                          future: getData_diploma(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData)
                            {
                            return CardSwiper(
                              cardsCount: 6,
                              isLoop: true,
                              cardBuilder: (context , index, x, y)
                              {
                                return SizedBox(
                                  height: 280,
                                  width: 490,
                                  child: InkWell(
                                    onTap:()
                                    {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> DiplomaJobsScreen()));
                                    },
                                    child: Card(
                                      elevation: 40,
                                      color: _iconcolor[index],
                                      child: Column(
                                        children: [
                                          Container(
                                            child:  Center(
                                                child: Text(posts_diploma[index].title, style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                ),),
                                              ),
                                          ),
                                    
                                           Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(posts_diploma[index].companey,style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                        ),),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(posts_diploma[index].location, style: TextStyle(fontSize: 18),),
                                      ),
                                    ),
                                    addsizedbox(10, 0),
                                    SizedBox(
                                      width: 280,
                                      height: 40,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        child: Center(
                                          child: Text("${posts_diploma[index].salary} Per Year/Month", style: TextStyle(
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
                                              color: Colors.white,
                                              size: 50,
                                            ),
                                          ),
                                            
                                          Container(
                                            child: Text("Easily Apply", style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight:  FontWeight.bold
                                              
                                            
                                            ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                      ]
                                    )
                                    ),
                                  )
                            );
                              }
                            );
                          }else
                          {
                            return Center(child: CircularProgressIndicator());
                          }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      Container(
                        child: Text("Our Partners..", style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: CircleAvatar(backgroundImage: AssetImage("assets/Glogo.jpeg"),backgroundColor: Colors.black,radius: 130,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              child:  Image.asset("assets/Alogo.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                             Container(
                
                              child: CircleAvatar(backgroundImage: AssetImage("assets/Dlogo.png"),backgroundColor: Colors.black,radius: 50,),
                            ),

                          ],
                        ),
                      ),
                       Container(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: CircleAvatar(backgroundImage: AssetImage("assets/Hlogo.png"),backgroundColor: Colors.black,radius: 130,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              child:  Image.asset("assets/Clogo.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                             Container(
                               height: 120,
                              width: 122,
                              child: Image.asset("assets/Adlogo.png",),
                            ),

                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset("assets/Mlogo.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 100,
                              width: 150,
                              child:  Image.asset("assets/SiLogo.png"),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                             Container(
                               height: 100,
                              width: 122,
                              child: Image.asset("assets/Slogo.png"),
                            ),

                          ],
                        ),
                      ),
                       Container(
                        child: Row(
                          children: [
                            Container(
                              height: 80,
                              width: 120,
                              child: Image.asset("assets/Tlogo.jpeg", fit: BoxFit.fill,),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 80,
                              width: 150,
                              child:  Image.asset("assets/Zlogo.jpg"),
                            ),
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
}