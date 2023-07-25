import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'main.dart';
class addamed extends StatefulWidget {
  const addamed({Key? key}) : super(key: key);

  @override
  State<addamed> createState() => _addamedState();
}

class _addamedState extends State<addamed> {
  Future addmed(String name,String barcode, String wholesale,String sellingPrice,String dosageForm,String Strength,String activeIngredient,String about, String manufaturedid,String quantity,String category,String exp_date,File _file) async{

    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': Token
    };
    var request = http.MultipartRequest('POST', Uri.parse('$url/api/user/asSupplier/medicine/add'));
    request.fields.addAll({
      'name': name,
      'barcode': barcode,
      'wholesale': wholesale,
      'sellingPrice': sellingPrice,
      'dosageForm': dosageForm,
      'strength': Strength,
      'ActiveIngredient': activeIngredient,
      'about': about,
      'category_id': category,
      'manufacture_id': manufaturedid,
      'quantity': quantity,
      'exp_date': exp_date,
    });
    request.files.add(await http.MultipartFile.fromPath('image', _file.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('the new medicine has been added')));
      print('success');
      print(await response.stream.bytesToString());
    }
    else {
      print('failed');
      print(response.reasonPhrase);
    }

  }
  bool isimage=false;
  late File _file= File('C:\Users\USER\StudioProjects\pharmacy_11-master\assets\empty.jpg');
  var formkey = GlobalKey<FormState>();
  var name=TextEditingController();
  var barcode=TextEditingController();
  var wholesale=TextEditingController();
  var sellingPrice=TextEditingController();
  var dosageForm=TextEditingController();
  var strength=TextEditingController();
  var activeingredient=TextEditingController();
  var about=TextEditingController();
  var manufactureid=TextEditingController();
  var quantity=TextEditingController();
  var exp_date=TextEditingController();
  var selectedcategory;
  var category=TextEditingController();
  List categories=["Pain Relivers And Fever Reducers","Antiacids And Stomach Protection","Anti-Allergics And Cold","Lipid Reducers","Muscle Relaxants","Hormonal Drugs","Vitamins And Nutritional Supplements","Hygiene And Self-Care","Antibiotics","Antidepressants","Creams And Ointments",];
  Future pickergallery() async {
    final myfile= await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _file= File(myfile!.path);
      isimage=true;
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Color.fromRGBO(13,142,171, 1),
        title: Text('New Medicine',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Container(padding: EdgeInsets.all(screenheight/60),child: ListView(
          children: [Column(children: [ Container(height: screenwidth/5,width: screenwidth/5,color: Colors.grey,child: isimage==false? Center(child: Text('No Picture',style: TextStyle(color: Colors.white),)) :Image.file(_file),),RawMaterialButton(onPressed: pickergallery,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,fillColor:Color.fromRGBO(13,142,171, 1) ,child: Text("Add Picture",style:TextStyle(fontFamily: 'kalam',color: Colors.white),))
          ],), Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: name,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.abc,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Name'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the name of the medicine' .tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: barcode,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.bar_chart_sharp,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Barcode'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the Barcode'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: wholesale,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.money,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Whole Sale'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the whole sale'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: sellingPrice,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.money,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Selling price'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the price'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: dosageForm,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.medical_information,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Dosage form'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the dosage form'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: strength,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.medication_liquid,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Dosage'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the dosage'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: activeingredient,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.medication_rounded,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Active ingredient'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the active ingredient'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: about,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.search,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Details'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the details'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: manufactureid,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.numbers,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Manufacture ID'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the manufacture ID'.tr;
                }
                return null;
              } ,
            ),
          ),Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: quantity,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.margin_outlined,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Quantity'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the quantity'.tr;
                }
                return null;
              } ,
            ),

          ),
        Container(margin: EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField(
              dropdownColor: Color.fromRGBO(201, 201, 201, 1),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.black87,width:1),borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width:1))
              ),
              hint:  Row(
                  children:<Widget> [SizedBox(width:10),Icon(Icons.category,
                    color:Color.fromRGBO(13,142,171, 1) ,),SizedBox(width: 10,),Text("Category".tr,  style:TextStyle(fontFamily: 'Kalam') )]),
              isExpanded:true,
              /*underline: Divider(color: Color.fromRGBO(90, 130, 95, 100),thickness: 2,),*/
              items: categories.map((e) => DropdownMenuItem(child: Row(
                children: [SizedBox(width: 10,),Icon(Icons.category,
                  color: Color.fromRGBO(13,142,171, 1),),SizedBox(width:10),
                  Text("$e".tr,style:TextStyle(fontFamily: 'Kalam')),
                ],
              ), value: e)).toList(), onChanged: (val){
              setState(() {
                selectedcategory=val;
                if(selectedcategory=="Pain Relivers And Fever Reducers"){
                  category.text='1';
                }
                else if(selectedcategory=="Antiacids And Stomach Protection"){
                  category.text='2';
                }
                else if(selectedcategory=="Anti-Allergics And Cold"){
                  category.text='3';
                }
                else if(selectedcategory=="Lipid Reducers"){
                  category.text='4';
                }
                else if(selectedcategory=="Muscle Relaxants"){
                  category.text='5';
                }
                else if(selectedcategory=="Hormonal Drugs"){
                  category.text='6';
                }
                else if(selectedcategory=="Vitamins And Nutritional Supplements"){
                  category.text='7';
                }
                else if(selectedcategory=="Hygiene And Self-Care"){
                  category.text='8';
                }
                else if(selectedcategory=="Antibiotics"){
                  category.text='9';
                }
                else if(selectedcategory=="Antidepressants"){
                  category.text='10';
                }
                else if(selectedcategory=="Creams And Ointments"){
                  category.text='11';
                }
                print("category id is ${category.text}");

              });
            },
              value: selectedcategory,
              validator: (value) => value == null ? 'Please choose the category'.tr : null)),
            Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: exp_date,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.date_range,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Expiration date'.tr,
                  hintStyle: TextStyle(fontFamily: 'Kalam')

              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please enter the expiration date'.tr;
                }
                return null;
              } ,
            ),
          ),
          SizedBox(height: screenheight/138,),Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(13,142,171, 1),
                ),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      addmed(name.text,barcode.text,wholesale.text,sellingPrice.text,dosageForm.text,strength.text,activeingredient.text,about.text,manufactureid.text,quantity.text,category.text,exp_date.text,_file!);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add,
                        color: Colors.white,),
                      Text(' Add Medicine'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),),
                    ],
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
