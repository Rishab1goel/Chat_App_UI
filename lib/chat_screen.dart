import 'package:chatappui/user_model.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class ChatScreen extends StatefulWidget {

  final User user;

  ChatScreen({required this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message,bool isMe){

    final Container msg=Container(
      margin:isMe? EdgeInsets.only(top:8,bottom: 8,left: 70): EdgeInsets.only(top:8,bottom: 8,right: 70),
      padding: EdgeInsets.symmetric(horizontal:25,vertical:15),
      decoration: BoxDecoration(
        color: isMe? Color(0xFFFFEFEE):Colors.yellow[50],
        borderRadius :BorderRadius.only(
          topLeft: Radius.circular(1.0),
          bottomLeft:Radius.circular(1.0),
        ),
      ),





      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(message.time,style:TextStyle(color:Colors.blueGrey,fontSize: 16.0,fontWeight:FontWeight.w600),),
            Text(message.text,style:TextStyle(color:Colors.blueGrey,fontSize: 16.0,fontWeight:FontWeight.w600),),
          ]
      ),
    );

    if(isMe){
      return msg;
    }

   return Row(
     children: <Widget>[


       msg,
       IconButton(

         icon:message.isLiked?Icon(Icons.favorite):Icon(Icons.favorite_border),
         iconSize: 30.0,
         color:message.isLiked?Theme.of(context).primaryColor:Colors.blueGrey,


         onPressed: (){

         },
       ),
    ],
   );

  }

  _buildMessageComposer(){

    return Container(

      padding:EdgeInsets.symmetric(horizontal:8.0),
      height: 70.0,
      color:Colors.white,
      child:Row(
        children: <Widget>[
          IconButton(
            icon:Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
           ),
          Expanded(

           child: TextField(
             textCapitalization: TextCapitalization.sentences,
             onChanged: (value){},

             decoration: InputDecoration.collapsed(
             hintText: 'Send a message...',
            ),
           ),
          ),



          IconButton(
            icon:Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: (){},
          ),
         ],
      ),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
         toolbarHeight: 70,
        title: Text(widget.user.name,style: TextStyle(fontSize: 20),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon:Icon(Icons.more_horiz),
            onPressed: (){},
              ),
        ],
         elevation: 0.0,
      ),
      
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(

          decoration: BoxDecoration(

              color:Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(40),

                  )
          ),
           child:ListView.builder(

              reverse:true,
              padding: EdgeInsets.only(top:15.0),
              itemCount: messages.length,
               itemBuilder: (BuildContext context,int index){
                final Message message=messages[index];
                final bool isMe=message.sender.id==currentUser.id;

                return _buildMessage(message,isMe);

               }
               ),
              ),
            ),
            _buildMessageComposer(),
         ],
        ),
      ),
    );
  }
}
