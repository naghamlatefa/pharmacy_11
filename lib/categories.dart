import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

class categories extends StatefulWidget {
  const categories({Key? key}) : super(key: key);

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Categories"),
      centerTitle: true,
      backgroundColor:  Color.fromRGBO(90, 130, 95, 100),
      leading: IconButton( onPressed: (){},
          icon: Icon(Icons.view_headline_sharp)),),
      body:ListView(
        padding: EdgeInsets.all(30),
        children: <Widget> [Container(height: 300,width: 150,
          child: Stack(
            children:<Widget> [Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage( fit: BoxFit.fill,image:AssetImage('assets/welcome5.jpg'))),
            ),
           ],
          ),
        ),
          SizedBox(height: 40),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Pain Relivers And Fever Reducers",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Antacids And Stomach Protection",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 33),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Anti-Allergics And Cold",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Lipid Reducers",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Antihypertensives",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Hormonal Drugs",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Vitamins And Nutritional Supplements",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 28),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Hygiene And Self-Care",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                      Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Antibiotics",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Antidepressants",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(60),child: BorderedText(strokeWidth: 3,child: Text("Creams And Ointments",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 35),))),height: 300,width: 300,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/pills2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
