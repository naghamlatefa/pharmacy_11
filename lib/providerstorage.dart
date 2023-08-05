import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/provider/dark_theme_provider.dart';
import 'package:pharmacy_1/ssearchresult.dart';
import 'package:pharmacy_1/suppdrawer.dart';
import 'package:pharmacy_1/supplyinfo.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class provstorage extends StatefulWidget {
  const provstorage({Key? key}) : super(key: key);

  @override

  State<provstorage> createState() => _provstorageState();

}
var search=TextEditingController();
class _provstorageState extends State<provstorage> {


  List Smeds=[];

  Future getMeds() async {
    var response = await http.get(Uri.parse('$url/api/user/asSupplier/supply/all'),
        headers:<String,String>{
        'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      Smeds.addAll(responsebody);
      print (Smeds.length);
      print(Smeds[0][0]['quantity']);
    });

  }
  Future updatesupply(String quantity,String expdate, suppIDU)async {
    var response4 = await http.post(
        Uri.parse('$url/api/user/asSupplier/supply/update/$suppIDU'),
        body: <String, String>
        {
          'quantity': quantity,
          'exp_date': expdate
        },

        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        }
    );
    if(response4.statusCode==200){

      print("success");
      Navigator.push(context, MaterialPageRoute(builder: (context) => provstorage(

      ),),);
      
    }
    else{
      openDialogue2(context);
    }

    ;
  }
  var QuantityController = TextEditingController();
  var ExpController = TextEditingController();
  Future openDialogue1(BuildContext context, int suppIDU) =>
      showDialog(context: context, builder: (BuildContext context) =>
          AlertDialog(
            shape: RoundedRectangleBorder(),

            title: Text('Enter quantity and expiration date'),
            content: Column(children: [
              TextFormField(decoration: InputDecoration(hintText: 'Quantity'),controller: QuantityController,validator: (value){
                if(value!.isEmpty){
                  return 'Please enter Quantity';
                }
                return null;
              } ,),
              TextFormField(decoration: InputDecoration(hintText: 'Exp Date: Y-M-D'),controller: ExpController,validator: (value){
                if(value!.isEmpty){
                  return 'Please enter Exp Date';
                }
                return null;
              } ,)
            ],),
            actions: [TextButton(onPressed: () {
              Navigator.of(context).pop();
            }
                , child: Text('Cancel')), TextButton(child: Text('Update Supply'),onPressed: ()=>setState(() {
              updatesupply(QuantityController.text, ExpController.text, suppIDU)
                ;})
            )
            ],
          ));

  Icon cusIcon = Icon(Icons.search);
  bool ispressed=false;
  Widget cusBar= Text("Storage",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),);
  Widget cusSearch= TextFormField(
    controller: search,
    cursorColor: Color.fromRGBO(13,142,171, 1),
    decoration: InputDecoration(
        fillColor: Color.fromRGBO(201, 201, 201, 100),
        filled: true,
        hintText: 'Search...'
    ),);

  @override
  void initState(){
    getMeds();
    print("length is ${Smeds.length}");
    super.initState();
  }
  Widget build(BuildContext context) {


    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      drawer: sdrawer(),
      appBar: AppBar(title: ispressed? cusSearch:cusBar,
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(13,142,171, 1),
        actions: [ispressed? Row(
          children: [IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ssersearch(ssearchinput:search.text)));
          }, icon: Icon(Icons.arrow_forward_ios))
            , IconButton(icon: ispressed? Icon(Icons.cancel):Icon(Icons.search),
                onPressed: (){
                  setState(() {
                    ispressed= !ispressed;
                  });
                } ),
          ],
        ):IconButton(icon: ispressed? Icon(Icons.cancel):Icon(Icons.search),
            onPressed: (){
              setState(() {
                ispressed= !ispressed;
              });
            })],
      ),
      body:
      Smeds==null || Smeds.isEmpty? Center(child: CircularProgressIndicator()):

        ListView.builder(
          itemCount: Smeds[0].length
          ,itemBuilder: (context,i){
            return Dismissible(
              key: Key(i.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction){
                if (direction==DismissDirection.endToStart){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('${Smeds[0][i]['medicine']['name']} has been deleted')));
deletesupply(Smeds[0][i]['id']);
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
                  builder: (context) => suppinfo(suppID: Smeds[0][i]['id'])));},
                child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),padding: EdgeInsets.all(screenheight/60),width: screenwidth,height: screenheight/5 ,child: ListView(physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/panadol.jpg'))),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${Smeds[0][i]['medicine']['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Exp date: +${Smeds[0][i]['exp_date']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${Smeds[0][i]['medicine']['strength']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${Smeds[0][i]['medicine']['ActiveIngredient']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Quantity: +${Smeds[0][i]['quantity']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight: FontWeight.bold)),Text('Price: +${Smeds[0][i]['medicine']['sellingPrice']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),RawMaterialButton(onPressed: ()=>openDialogue1(context, Smeds[0][i]['id'])

                    ,elevation: 2,fillColor: Color.fromRGBO(13,142,171, 1),child: Icon(Icons.add,color: Colors.white,size: screenwidth/16,),shape: CircleBorder(),)],))],),
                  SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
                ),),
              ),
            );

          }
        ),
      )
      
    ;
  }
}
Future deletesupply(int suppID) async{
  var response1 = await http.delete(Uri.parse('$url/api/user/asSupplier/supply/delete/$suppID'),headers:<String,String>{
    'Authorization': 'Bearer $Token',
  });

  if (response1.statusCode==200){
    print("deleted");}
  else {
    print("error deleting");
    print(response1.body);
  }
}


Future openDialogue2(BuildContext context) =>
    showDialog(context: context, builder: (BuildContext context) =>
        AlertDialog(title: Text("Please enter valid information"),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("ok"))],

        ));