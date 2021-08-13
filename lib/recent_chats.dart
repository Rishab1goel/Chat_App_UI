import 'package:chatappui/chat_screen.dart';
import 'package:flutter/material.dart';
import 'message_model.dart';
import 'chat_screen.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        height: 200,
        decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),

        child: ListView.builder(


            itemCount: chats.length,
            itemBuilder: (BuildContext context,int index){
              final Message chat=chats[index];
              return GestureDetector(
                onTap: ()=>Navigator.push(
                  context,MaterialPageRoute(builder: (_)=>ChatScreen(user: chat.sender,))
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 5.0,bottom:10.0,right: 5,),
                  padding:EdgeInsets.symmetric(vertical:15,horizontal:5,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color:chat.unread? Color(0xFFFFEFFE):Colors.white,

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Row(children:<Widget>[

                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                        ),
                      SizedBox(width :10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>[
                        Text(chat.sender.name),
                        SizedBox(height: 5.0,),
                        Container(
                          width:MediaQuery.of(context).size.width*0.45,
                            child: Text(
                              chat.text,
                              overflow: TextOverflow.ellipsis,)
                        ),


                        ],
                       ),
                        Column(
                          children: <Widget>[
                            Text(chat.time),
                            SizedBox(height:5.0),
                           chat.unread? Container(
                              alignment: Alignment.center,
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Colors.red,
                                ),
                                child: Text('New',style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold),)
                            ):Text(''),
                          ],
                        ),
                      ],
                    ),
                    ],
                  ),
                ),
              );
            }
        ),

      ),
    );

  }
}
