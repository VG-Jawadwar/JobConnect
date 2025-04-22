import 'package:flutter/material.dart';

class AboutUsPageScreen extends StatefulWidget {
  const AboutUsPageScreen({super.key});

  @override
  State<AboutUsPageScreen> createState() => _AboutUsPageScreenState();
}

class _AboutUsPageScreenState extends State<AboutUsPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Text("About Us", style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                  child: Text("Hi, this is Vaibhav Jawadwar ,My experience with the recent Flutter training program, It was a fantastic opportunity to learn and build practical skills in mobile app development using Flutter and Dart programming.\n\nThe training provided a hands-on approach, allowing me to create multiple applications.This practical learning style helped me solidify my understanding of the concepts.like i have build the Calculator, Chess app etc.\n\n At DWANI, we learnt about many more intresting fact and technologies about flutter Framework like Stateful and Stateless Widget, container widget,sizedbox, and going towards some complex like ListView , GridView .. etc, and Many more with a live implemntation.\n\nI was particularly grateful for the guidance of our mentor. Her approachability and willingness to answer questions made a significant difference in my learning journey.\n\nOverall, my experience with the Flutter training program was exceptional. I gained valuable practical skills, received excellent mentorship, and enjoyed the learning environment.  I'm excited to continue building my Flutter development skills and applying them to future projects.", textAlign: TextAlign.justify,style: TextStyle(
                    fontSize: 20,
                    
                  ),),
                ),
                  
                  SizedBox(
                    height: 15,
                  ),    
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("© 2024 .Job Connect", style: TextStyle(
                        fontSize: 17,
                        color: Colors.black38
                      ),),
                  )
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}