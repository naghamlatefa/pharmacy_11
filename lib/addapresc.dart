import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
class addapresc extends StatefulWidget {
  const addapresc({Key? key}) : super(key: key);

  @override
  State<addapresc> createState() => _addaprescState();
}


class _addaprescState extends State<addapresc> {
  bool isimage=false;
  late File _file= File('C:\Users\USER\StudioProjects\pharmacy_11-master\assets\empty.jpg');
  Future pickercamera() async {
    final myfile= await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file= File(myfile!.path);
      isimage=true;
    });
  }
  Future addpresc(File _file) async {
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $Token'
    };
    var request = http.MultipartRequest('POST', Uri.parse('$url/api/user/prescription/add'));
    request.files.add(await http.MultipartFile.fromPath('image', _file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('the new prescription has been added')));
      print('success');
      print(await response.stream.bytesToString());
    }
    else {
      print('failed');
      print(response.reasonPhrase);
    }

  }
  @override
  
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(13,142,171, 1),
        title: Text('Add A Prescription',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: Container(padding: EdgeInsets.all(screenwidth/80),

        child: Center(
          child: Column(
            children: [Text('We will Remind you about water and medicine '.tr,style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/20),),SizedBox(height: screenheight/6,),Container(height: screenwidth/2,width: screenwidth/2,color: Colors.grey,child: isimage==false? Center(child: Text('No Picture',style: TextStyle(color: Colors.white),)) :Image.file(_file),),SizedBox(height: 10,),RawMaterialButton(onPressed: pickercamera,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,fillColor:Color.fromRGBO(13,142,171, 1) ,child: Text(" Take A Picture ",style:TextStyle(fontFamily: 'kalam',color: Colors.white),)),RawMaterialButton(onPressed:() {if(isimage==false){}else{addpresc(_file!);}},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,fillColor:Color.fromRGBO(13,142,171, 1) ,child: Text("Send",style:TextStyle(fontFamily: 'kalam',color: Colors.white),))],
          ),
        ),
      ),
    );
  }
}
Future openDialoguenopic(BuildContext context) =>
    showDialog(context: context, builder: (BuildContext context) =>
        AlertDialog(title: Text("Please add a picture"),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("ok"))],

        ));
