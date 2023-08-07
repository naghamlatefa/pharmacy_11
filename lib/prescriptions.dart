import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:pharmacy_1/medreminder.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_1/showpresc.dart';

import 'addapresc.dart';
import 'main.dart';

class prescs extends StatefulWidget {
  const prescs({Key? key}) : super(key: key);

  @override
  State<prescs> createState() => _prescsState();
}


class _prescsState extends State<prescs> {
  var presc;
  Future getpresc() async{
    var response = await http.get(Uri.parse('$url/api/user/prescription/all'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
var presc1;
    setState(() {
 presc=jsonDecode(response.body);



    });

  }
  Future deletepresc(int prescID) async{
    var response1 = await http.delete(Uri.parse('$url/api/user/prescription/delete/$prescID'),
        headers:<String,String>{
      'Authorization': 'Bearer $Token',
    });

    if (response1.statusCode==200){
      print("deleted");}
    else {
      print("error deleting");
      print(response1.body);
    }
  }
  
  @override
void initState() {
    getpresc();

    super.initState();
  }
  Widget build(BuildContext context) {
    
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13,142,171, 1),
        title: Text('Prescriptions'.tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
   body:presc==null || presc.isEmpty? Center(child: CircularProgressIndicator())
            : ListView.builder(
     itemCount: presc['Your Prescriptions '].length,
       itemBuilder: (context,i){
       return Dismissible(
       key: Key(i.toString()),
           direction: DismissDirection.endToStart
         ,onDismissed: (direction){
         if (direction==DismissDirection.endToStart){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('your precription $i has been deleted')));
           deletepresc(presc['Your Prescriptions '][i]['id']);
         }
       },
           background: Container(color: Colors.red,child: Align(alignment: Alignment.centerRight,child: Padding(
             padding: EdgeInsets.all(screenwidth/8),
             child: Icon(Icons.delete,color: Colors.white,),
           ),)),
         child: GestureDetector(onTap: (){
           Navigator.push(
               context,
               MaterialPageRoute(
                   builder: (context) => showpresc(prescID: presc['Your Prescriptions '][i]['id'], )));
         },
           child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),
             child: Row(children: [
               Container(height:screenheight/6,width: screenheight/6,child: Image.network('$url/${presc['Your Prescriptions '][i]['img_Url']}')),Text('Prescription $i',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),
             ],)
           ),
         ),
       );
       }
   )
        ,floatingActionButton: FloatingActionButton.extended(
      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => addapresc(),),);},
      backgroundColor: Color.fromRGBO(13,142,171, 1),
      label: const Text("Add a Prescription")  ,
      icon: const Icon(Icons.add,color: Colors.white,),
    ) ,

    );}
}
