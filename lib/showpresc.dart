import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
class showpresc extends StatefulWidget {
  const showpresc({Key? key,required this.prescID}) : super(key: key);
  final int prescID;

  @override
  State<showpresc> createState() => _showprescState();
}


class _showprescState extends State<showpresc> {
  var thispresc;
  Future showpresc () async {
    var response = await http.get(Uri.parse('$url/api/user/prescription/show/${widget.prescID}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      thispresc=responsebody;
      print(responsebody);
    });

  }
  @override
  void initState() {
   showpresc();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(13,142,171, 1),
        title: Text('Prescription Info',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body:thispresc==null || thispresc.isEmpty? Center(child: CircularProgressIndicator()): Container(
        padding: EdgeInsets.all(screenheight/60),
        child: Center(
          child: Column(
            children: [Container(color: Colors.grey,height: screenwidth/1.2,width: screenwidth/1.2,child:Image.network('$url/${thispresc['Prescription']['img_Url']}'))],
          ),
        ),
      ),
    );
  }
}
