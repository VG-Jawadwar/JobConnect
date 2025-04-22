import 'package:flutter/material.dart';
import 'package:myapp/diploma_Jobs.dart';
import 'package:myapp/healthcare_Jobs.dart';
import 'package:myapp/hr_Jobs.dart';
import 'package:myapp/it_Jobs.dart';
import 'package:myapp/marketing_Jobs.dart';
import 'package:myapp/sales_Jobs.dart';

class JobsCategoriesScreenPage extends StatefulWidget {
  const JobsCategoriesScreenPage({super.key});

  @override
  State<JobsCategoriesScreenPage> createState() => _JobsCategoriesScreenPageState();
}

class _JobsCategoriesScreenPageState extends State<JobsCategoriesScreenPage> {
  var size, height, width;

  List Name = ["HR","IT","NON IT","Health Care","Sales","Marketing"];

   List IconName = [
   Icons.groups,
   Icons.computer_sharp,
   Icons.question_mark,
   Icons.health_and_safety_rounded,
   Icons.sell_sharp,
   Icons.volume_up_sharp
  ];

  Widget addGridView(index, Widget navigationPage)
  {
    return Container(
              height: height*0.294,
              width: width*0.453,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> navigationPage));
                  },
                  child: Card(
                    elevation: 30,
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              child: Icon(IconName[index], size: 50,color: Colors.lightBlue,),
                            ),
                          ),
                        ),
                         Align(
                          alignment: Alignment.bottomCenter,
                           child: Container(
                            child: Text(Name[index], style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                          ),
                         )
                      ],
                    ),
                  ),
                )
              ),
            );
  }
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size; 
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text("Select Your Job Category", style: TextStyle(
                        fontSize: 30, 
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                  ),
                   Container(
                        width:width*0.893 ,
                        child: Text("you have to Climb higher for Dream and we are here to help you",textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Colors.black38
                        ),),
                      ),
            
                      Row(
                        children: [
                           addGridView(0,HRcategoryJobsScreen()),
                        addGridView(1,ITCategoryJobsScreen()),
            
                        ],
                      ),
                        Row(
                        children: [
                           addGridView(2,DiplomaJobsScreen()),
                      addGridView(3,HealthCareCategoryJobsScreen()),
            
                        ],
                      ),
                        Row(
                        children: [
                           addGridView(4,SalesCategoryJobsScreen()),
                      addGridView(5,MarketingCategoryJobsScreen()),
            
                        ],
                      )
      
                ],
              ),),
          ),
        ),
      ),
    );
  }
}