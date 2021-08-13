import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  int selectedindex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.red,
      child: ListView.builder(
         scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){

              setState(() {
                selectedindex=index;
              });


            },

            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal:10,
                vertical:10,
              ),
              child: Text(categories[index],style: TextStyle(fontWeight: FontWeight.bold,color: index==selectedindex? Colors.white:Colors.white60,),),
            ),
          );
        },


      ),
    );
  }
}