import 'package:flutter/material.dart';
class rating_box extends StatefulWidget {
  const rating_box({Key? key}) : super(key: key);

  @override
  State<rating_box> createState() => _rating_boxState();
}

class _rating_boxState extends State<rating_box> {
  int rating=0;
  void setratingasone(){
    setState(() {
      rating=1;
    });
  }
  void setratingastwo(){
    setState(() {
      rating=2;
    });
  }
  void setratingasthree(){
    setState(() {
      rating=3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double size=20;
    print(rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
            rating>=1?
                Icon(Icons.star,size: size,):
                Icon(Icons.star_border,size: size,)
            ),
            color: Color.fromRGBO(90, 130, 95, 100),
            onPressed: setratingasone,
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                rating>=2?
                Icon(Icons.star,size: size,):
                Icon(Icons.star_border,size: size,)
            ),
            color: Color.fromRGBO(90, 130, 95, 100),
            onPressed: setratingastwo,
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
                rating>=3?
                Icon(Icons.star,size: size,):
                Icon(Icons.star_border,size: size,)
            ),
            color: Color.fromRGBO(90, 130, 95, 100),
            onPressed: setratingasthree,
            iconSize: size,
          ),
        ),

      ],
    );
  }
}
