import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:pharmacy_1/login.dart';
import 'package:pharmacy_1/providerstorage.dart';
import 'package:pharmacy_1/show_medicine.dart';
import 'package:pharmacy_1/supplyinfo.dart';
import 'local/local_controller.dart';
import 'local/local.dart';
import 'package:provider/provider.dart';
String Token='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMWVkMjI2ZGI2ZTNkZjkyYmZiYzVmODU5YmU2YjRmMWEyMTZmNThkOWYzZWYwZjgxMDA3ZmI1NWNkZTg1NzU0NWRlOGU4MTM5ZmU4ZjAxMjIiLCJpYXQiOjE2ODgwNTkxODYuNjQ4NzQ4LCJuYmYiOjE2ODgwNTkxODYuNjQ4NzUsImV4cCI6MTcxOTY4MTU4Ni42NDI5NzEsInN1YiI6IjEwMiIsInNjb3BlcyI6WyJ1c2VyIl19.hXganLGcSvwrJYHOqq-1CeFcd0UwgvcsTuzODCsh8HTbuTh1usaz4u3u2VDvRBxBFtnH9IkCW1csuukE1V2SEiTusYS6Lp4ZsUhIKcT6TIGLelXX3NGSNBUM3ILr0eBhq5ImDJz8VksgmVNl5HDkonE7QSSMpZJWHOE2Obay-IoIOtLnnemZmReiHlQHxGEqvOGIXP6YyONuN8iWUncLD_2oIBq6H_arpecfvQx9KVd7cIJ12wkpT1DJPcJYzqdoNjrrUJ6M4S3IBTh8xN4r6MODrNw8DxVUxfbjpByVDUF-gDBwnPuTsk6r0q4EW8DaFI0CBUt2rwOscYBLcwyK2Y4EELNXqnY2Jo4ldIJPIErVrvZW8Iczhl9XlLN69gDd8kCnz0221L34ksWvHUJ3LKkKxzjDC4f30x2u5B9DZSZQXVYNmmhGwfonomp7QYQ_YUB4wlTzL-u8SBrgzi9oitW_J24VrhBf1q4og_X2qon4TCffbNC0LryaPDD0DI08AVTiroy2KK6kUR6cnUc-BVaiQdJOKH2Gri55Nuv1SeQ63RM4B7s2Rxg7acTtkI1_kzyp0ZIbjtg72U-nXX8BlYIjVdTjJ918_A2fnldVlAI4YPLZm6M7k66wQeFDZfjZXR2pXWEthLlHSN7j-o3wgf6BPGqOsfk85r88fG-lMPs';
String url='http://192.168.1.107:8000';
int pagenumber=1;
int issup=2;
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Get.put(mylocalcontroller());
    return ChangeNotifierProvider(create: (context){
      return cart();
    },
    child: GetMaterialApp(
        debugShowCheckedModeBanner: false ,
        home:  login(),
      locale: Get.deviceLocale,
      translations : Mylocal(),
    ),
    );

  }

}
