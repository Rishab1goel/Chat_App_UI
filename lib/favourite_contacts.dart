import 'package:chatappui/chat_screen.dart';
import 'package:flutter/material.dart';
import 'message_model.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>
      [
        Padding(
          padding: EdgeInsets.symmetric(horizontal:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
             Text('Favourite Contacts'),

            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ],


        ),
      ),
        Container(
          height: 100,
          child: ListView.builder(

              padding: EdgeInsets.only(left:8.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
              itemBuilder:(BuildContext context,int index){
              return GestureDetector(
                onTap: ()=>Navigator.push(
                    context,MaterialPageRoute(builder: (_)=>ChatScreen(user: favorites[index],))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children:<Widget>
                    [
                      CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage( favorites[index].imageUrl),

                      ),
                    Text(favorites[index].name)
                    ],
                   ),
                ),
              );

            }
        ),
        ),
      ],
    );


  }
}
