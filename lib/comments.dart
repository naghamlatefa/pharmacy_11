import 'dart:convert';
import 'package:pharmacy_1/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class comments extends StatefulWidget {
  const comments({Key? key,required this.medID1}) : super(key: key);
  final int medID1;

  @override
  State<comments> createState() => _commentsState();
}

class _commentsState extends State<comments> {
  List comments=[];
  Future addcomment(String comment)async{
    print("111");
    print("enaillllll$comment");
    var response = await http.post(
        Uri.parse('$url/api/user/medicine/${widget.medID1}/question/'),
        body:<String,String>
        {
          'comment': comment,

        },
        headers: {
          "Accept":"application/json",
          'Authorization': 'Bearer $Token'

        }
    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if(response.statusCode==200)
    {
      var js=jsonDecode(response.body);
      print('success');

    }
    else
    {
      print("sorry");
    }
  }
  Future getcomment() async {
    var response = await http.get(
        Uri.parse('$url/api/user/medicine/${widget.medID1}/question/'),
        headers: <String, String>{
          "Accept": "application/json",
          'Authorization': 'Bearer $Token',
        });
    var responsebody = jsonDecode(response.body);


      comments.addAll(responsebody);
      print(responsebody);
      return responsebody;

  }
  var usercomment=TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  void initState(){
    getcomment();
    super.initState();

  }
  Widget build(BuildContext context) {

    return Scaffold(
      body: Form(
          key: formkey,
          child: Container(

            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(

                body: Stack(
                  children:<Widget> [
                    Container(
                      height: MediaQuery.of(context).size.height,width:  MediaQuery.of(context).size.width,),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height:70 ,width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children:<Widget> [
                                IconButton(onPressed: (){
                                  print("canera");
                                }, icon: Icon(Icons.camera_alt_outlined,color: Colors.blue,)),
                                Container(
                                  // decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.black))),
                                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                    width: MediaQuery.of(context).size.width-50
                                    ,child: TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: usercomment,
                                  decoration: InputDecoration(
                                      hintText: " Write Your Comment Here ",

                                      filled: true,
                                      fillColor: Colors.grey[100],
                                      suffixIcon: IconButton (icon :Icon(Icons.send),onPressed: (){
                                        print("pressd");
                                        setState(() {
                                          addcomment(usercomment.text);
                                          getcomment();
                                        });


                                      },),
                                      contentPadding: EdgeInsets.all(5),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.grey,

                                          ),
                                          borderRadius: BorderRadius.circular(30),

                                      )
                                  ),
                                )),

                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Positioned(top: 30,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height -70,
                          child: SingleChildScrollView(
                            child:  FutureBuilder(
                              future: getcomment(),
                              builder: (
                                  BuildContext context,AsyncSnapshot snapshot) {
                                if(snapshot.hasData){
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      for(int i=0;i<snapshot.data.length;i++) commentslist(comment: snapshot.data[i]['comment'],)

                                    ],
                                  );
                                }
                                return Center(child: CircularProgressIndicator(),);
                              }),
                        ))

                    )],
                ),

            ),
          ),
        ),
      ),
    );

  }
}
class commentslist extends StatelessWidget{
  final comment;
  commentslist({
  this.comment
  });
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 15)
          ,child: Text(
          "nagham", style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color:themeState.getDarkTheme?Colors.white :Colors.black),
        ),
        ),
        subtitle: Container(decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(30)),padding: EdgeInsets.all(10),child: Text(comment,style: TextStyle(fontFamily: 'kalam'),),),
      );



}}
