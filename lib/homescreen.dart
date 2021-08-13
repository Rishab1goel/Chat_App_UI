import 'package:flutter/material.dart';
import 'category_selector.dart';
import 'favourite_contacts.dart';
import 'message_model.dart';
import 'recent_chats.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 25,
          color: Colors.white,
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 25,
            color: Colors.white,
            onPressed: (){},
          ),

        ],

        title: Text('CHAT APP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          centerTitle: true,
        elevation: 0,

      ),

      body: Column(

        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(

              decoration: BoxDecoration(color: Colors.yellow[50],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),

              ),
              child: Column(
              children: <Widget>[
                FavouriteContacts(),
                RecentChats(),
              ],
             ),
            ),
          ),

        ],




      ),










    );
  }
}
