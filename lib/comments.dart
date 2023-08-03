import 'dart:convert';
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class comments extends StatefulWidget {
  const comments({Key? key}) : super(key: key);

  @override
  State<comments> createState() => _commentsState();
}

class _commentsState extends State<comments> {
  List comments=[];
  Future addcomment(String comment)async{
    print("111");
    print("enaillllll$comment");
    var response = await http.post(
        Uri.parse('$url/api/user/medicine/1/question/'),
        body:<String,String>
        {
          'comment': comment,

        },
        headers: {
          "Accept":"application/json",
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWM3NWMzMzRkMzAzZGYxOWMxZDU5ZjVlZWRlMTA3NTgwMzE4NDBiNGM2YzkwZTllNGI3MWJlMzc5ZTY1MDdiNTliMmJiMzFlMDg0NzYzNGYiLCJpYXQiOjE2OTEwNzMwNzAuNDg5ODgxLCJuYmYiOjE2OTEwNzMwNzAuNDg5ODg1LCJleHAiOjE3MjI2OTU0NzAuMzMyMzAzLCJzdWIiOiIxMDQiLCJzY29wZXMiOlsidXNlciJdfQ.NfrAcIkplBSi5aE5UUqsP3vzl1R7fTUS5GGGJffNxNO6PcxUwEdtm8Q2loOrXL8kKGiD-SytlcIDQILJ0jrUqAIXwsDBRQ67rWQThur05dYpUwSSLfqOzNbm4YKjjLxcHaeIJRwkhzkv4S1WO_LywlrL1-AOm0rbCy_JyfHa8nZOEhN31Q2UFT0Ib0TguNoXpY5O3FnG0VDjarW07Kg-wkqTIw0JpOmVwXs6rluGR9yh4-h9IdluKxePgayRV6L_fRgxE9v767-bGmR6S_gLB6aAv56GYN7KrR7m66PiiKVcvyMcyGe0EtZlL_BdfBLK9aE74BuxRd_Kpb2G5T3ellJEwv2b9cS3m7LWbX68m8KgLet6A0SItZJGv6DG1xal0NAklB5fTCx-IkFhT-U8OoKj1jgWx-Jl5KN1bRS0I71p8_RJyxMIQcz80HugYFZdONG3DxyJUPRN-aa7FhZDmz-7WfODIm0t3mAu6a2gyVdpM-FN3V52KQhVlpXJ1zbU-T45b9ahE31Twd8e6_rPa8Cg2gXx-FfsbI6_WEEtIYh5N3WZ2oHH7Z0GvKRV5wBQH24MCo7EfveV3X9lM5X07pSph1tC6R05X01fwuYwOAiVHuqsf7-YSi-bUcdjWdaV9pZDCr_PeoIRhBgNJuo7A1y3IXelHHcyolKV9ujL2QI'

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
        Uri.parse('$url/api/user/medicine/1/question/'),
        headers: <String, String>{
          "Accept": "application/json",
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYWM3NWMzMzRkMzAzZGYxOWMxZDU5ZjVlZWRlMTA3NTgwMzE4NDBiNGM2YzkwZTllNGI3MWJlMzc5ZTY1MDdiNTliMmJiMzFlMDg0NzYzNGYiLCJpYXQiOjE2OTEwNzMwNzAuNDg5ODgxLCJuYmYiOjE2OTEwNzMwNzAuNDg5ODg1LCJleHAiOjE3MjI2OTU0NzAuMzMyMzAzLCJzdWIiOiIxMDQiLCJzY29wZXMiOlsidXNlciJdfQ.NfrAcIkplBSi5aE5UUqsP3vzl1R7fTUS5GGGJffNxNO6PcxUwEdtm8Q2loOrXL8kKGiD-SytlcIDQILJ0jrUqAIXwsDBRQ67rWQThur05dYpUwSSLfqOzNbm4YKjjLxcHaeIJRwkhzkv4S1WO_LywlrL1-AOm0rbCy_JyfHa8nZOEhN31Q2UFT0Ib0TguNoXpY5O3FnG0VDjarW07Kg-wkqTIw0JpOmVwXs6rluGR9yh4-h9IdluKxePgayRV6L_fRgxE9v767-bGmR6S_gLB6aAv56GYN7KrR7m66PiiKVcvyMcyGe0EtZlL_BdfBLK9aE74BuxRd_Kpb2G5T3ellJEwv2b9cS3m7LWbX68m8KgLet6A0SItZJGv6DG1xal0NAklB5fTCx-IkFhT-U8OoKj1jgWx-Jl5KN1bRS0I71p8_RJyxMIQcz80HugYFZdONG3DxyJUPRN-aa7FhZDmz-7WfODIm0t3mAu6a2gyVdpM-FN3V52KQhVlpXJ1zbU-T45b9ahE31Twd8e6_rPa8Cg2gXx-FfsbI6_WEEtIYh5N3WZ2oHH7Z0GvKRV5wBQH24MCo7EfveV3X9lM5X07pSph1tC6R05X01fwuYwOAiVHuqsf7-YSi-bUcdjWdaV9pZDCr_PeoIRhBgNJuo7A1y3IXelHHcyolKV9ujL2QI',
        });
    var responsebody = jsonDecode(response.body);
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
    return Form(
      key: formkey,
      child: Container(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Stack(
              children:<Widget> [
                Container(
                  color: Colors.white,height: MediaQuery.of(context).size.height,width:  MediaQuery.of(context).size.width,),
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
                              controller: usercomment,
                              decoration: InputDecoration(
                                  hintText: " Write Your Comment Here ",
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  suffixIcon: IconButton (icon :Icon(Icons.send),onPressed: (){
                                    print("pressd");
                                    addcomment(usercomment.text);

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
    // TODO: implement build
    return  ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Container(
        margin: EdgeInsets.only(top: 15)
        ,child: Text(
        "nagham",
      ),
      ),
      subtitle: Container(padding: EdgeInsets.all(10),color: Colors.grey[100],child: Text(comment)),
    );


}}
