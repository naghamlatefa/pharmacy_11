import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:http/http.dart' as http;
import 'test.dart';
import 'main.dart';

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);
  @override
  State<categories> createState() => _categoriesState();
}
class _categoriesState extends State<categories> {
  Future<categoriess> fetchAlbum() async {
    print("before");
    final response = await http.get(Uri.parse('http://192.168.43.169:8000/api/user/asSupplier/category/all'),
        headers:<String,String>{
          "Accept":"application/json",
          'Authorization':'Bearer $Token',
        },
    );

    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if (response.statusCode == 200) {
      return categoriess.fromJson(jsonDecode(response.body));
    } else {
      print("sorry");
      throw Exception('Failed to load album');
    }
  }
  late Future<categoriess> futureAlbum;
  Icon cusIcon = Icon(Icons.search);
  bool ispressed=false;
  Widget cusBar= Text("Categories",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),);
  Widget cusSearch= TextFormField(
      cursorColor: Color.fromRGBO(13,142,171, 1),
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(201, 201, 201, 100),
          filled: true,
          hintText: 'Search...'
      ),);
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      drawer: drawer(),
      appBar: AppBar(title: ispressed? cusSearch:cusBar,
      centerTitle: true,
      backgroundColor:  Color.fromRGBO(13,142,171, 1),
     actions: [ispressed? Row(
       children: [IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
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
      /*ListView(
        padding: EdgeInsets.all(screenwidth/26),
        children: <Widget> [Container(padding: EdgeInsets.all(screenheight/128.5),height: screenheight/4.3,width: screenwidth/1.09,
          child: Stack(
            children:<Widget> [Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage( fit: BoxFit.fill,image:AssetImage('assets/welcome6.jpg'))),
            ),
           ],
          ),
        ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/12.1),child:Text("Pain Relivers And Fever Reducers",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/48),)),height: screenwidth/2.35,width: screenwidth/2.35,
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/fever2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),

              ),

              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Antacids And Stomach Protection",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/38.9),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/stomach.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Anti-Allergics And Cold",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/cold.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/10,screenwidth/13.3,screenwidth/13.3),child: Text("Lipid Reducers",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/lipids.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/6,screenwidth/13.3,screenwidth/13.3),child: Text("Muscle Relaxants",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/64.25),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/muscle.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/10,screenwidth/13.3,screenwidth/13.3),child: Text("Hormonal Drugs",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/hormones.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Vitamins And Nutritional Supplements",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/45.89),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/vitamins.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Hygiene And Self-Care",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/shampoos.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                      Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/7,screenwidth/13.3,screenwidth/13.3),child: Text("Antibiotics",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/42.8),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/bacteria.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/7,screenwidth/13.3,screenwidth/13.3),child: Text("Antidepressants",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/58.4),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/depression.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Creams And Ointments",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/creams.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),


            ],
          )
        ],
      ),*/
      body:Center(
        child: FutureBuilder<categoriess>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator(
              color: Color.fromRGBO(13,142,171, 1),
            );
          },
        ),
      ) ,
    );
  }
}
