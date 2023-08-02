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
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2RiOTczNDJmYWM0NjY1YTUyMjQ2ZTBlNGUyOTlkNjlhZTdiZTNlNjk3ZjA2YTY5YzdiZTRjMDE3NjlkOTdlODAyNWJlMTBhZDkzNjYwNWUiLCJpYXQiOjE2OTA5MDM5MTkuNDM5MzQ0LCJuYmYiOjE2OTA5MDM5MTkuNDM5MzQ3LCJleHAiOjE3MjI1MjYzMTkuMTg2MzE1LCJzdWIiOiIxMDQiLCJzY29wZXMiOlsidXNlciJdfQ.i9syIdmOzrfk-RZy6TdTFL9Y6tp30-NwwD0yQMuB6hdv-5mDsygCl0pAA45JetgVqegZtvHYBW7yxnDMZsm5pD_HFVhLWqERsOSEbsl0847pGaWvf46UI-I68k0HV8DQ1R43ZuHW1glFNdYZW3mCnMPsSRYBQLwvRKFGNQVtZalrtjy3Z1oKRiYa2j-Mq38vnG3vwBSqyDdsT6Bi0moCXvo6in-kpUqRypi8V_aN2MB6xDkb_uG-x7NUgYZ1SUJpSKmrMiuXnRSboHzvvC4JhtBf1sjEiX24k0sXsa8rqZuOMSI4h_KajjZwGCwt3-vZR1ROfVstFoF9meEqC2ffLJuupoVv84WYoMspNVNEdQHg2qvFDLPgYr3ULPLY8FqN17zX9RTOS6e1RkvLWiyDwmQNpX1AIXZPFj2YdguhKiuYl58k_1rjlXOiMd8g3u46j9COXCqud-ZyntlRuxHk68UIQkzNPN5EPCwCy53oeDoYQKCzXd_LzliuKAqRf-AiUexxDgnD52Ni55MDZkg-EZSW2OZYi5B1VPJADDsN-41dvR-HzJ__5lz0APnXT5fwUgmYTe2m9jwT7ss6FodDItbRaYkv5MllOhg_zpPv4OtwgLjJb_S_d9zMIDiiwOs-gKOD6wWg8_eqDDbyVrRhdetCDt_ny5vfOb15EmxaVzM'

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
    var response = await http.get(Uri.parse('$url/api/user/medicine/1/question/'),
        headers:<String,String>{
          "Accept":"application/json",
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiN2RiOTczNDJmYWM0NjY1YTUyMjQ2ZTBlNGUyOTlkNjlhZTdiZTNlNjk3ZjA2YTY5YzdiZTRjMDE3NjlkOTdlODAyNWJlMTBhZDkzNjYwNWUiLCJpYXQiOjE2OTA5MDM5MTkuNDM5MzQ0LCJuYmYiOjE2OTA5MDM5MTkuNDM5MzQ3LCJleHAiOjE3MjI1MjYzMTkuMTg2MzE1LCJzdWIiOiIxMDQiLCJzY29wZXMiOlsidXNlciJdfQ.i9syIdmOzrfk-RZy6TdTFL9Y6tp30-NwwD0yQMuB6hdv-5mDsygCl0pAA45JetgVqegZtvHYBW7yxnDMZsm5pD_HFVhLWqERsOSEbsl0847pGaWvf46UI-I68k0HV8DQ1R43ZuHW1glFNdYZW3mCnMPsSRYBQLwvRKFGNQVtZalrtjy3Z1oKRiYa2j-Mq38vnG3vwBSqyDdsT6Bi0moCXvo6in-kpUqRypi8V_aN2MB6xDkb_uG-x7NUgYZ1SUJpSKmrMiuXnRSboHzvvC4JhtBf1sjEiX24k0sXsa8rqZuOMSI4h_KajjZwGCwt3-vZR1ROfVstFoF9meEqC2ffLJuupoVv84WYoMspNVNEdQHg2qvFDLPgYr3ULPLY8FqN17zX9RTOS6e1RkvLWiyDwmQNpX1AIXZPFj2YdguhKiuYl58k_1rjlXOiMd8g3u46j9COXCqud-ZyntlRuxHk68UIQkzNPN5EPCwCy53oeDoYQKCzXd_LzliuKAqRf-AiUexxDgnD52Ni55MDZkg-EZSW2OZYi5B1VPJADDsN-41dvR-HzJ__5lz0APnXT5fwUgmYTe2m9jwT7ss6FodDItbRaYkv5MllOhg_zpPv4OtwgLjJb_S_d9zMIDiiwOs-gKOD6wWg8_eqDDbyVrRhdetCDt_ny5vfOb15EmxaVzM',
        });
    var responsebody=jsonDecode(response.body);
    print(responsebody);

   /* setState(() {
      print(responsebody['medicines'][0]['name']);
    });*/

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
                                  for(int i=0;i<snapshot.data;i++) commentslist(comment: snapshot.data[i]['comment'],)

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
