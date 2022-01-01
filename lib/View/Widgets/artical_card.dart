import 'package:flutter/material.dart';

class ArticalCard extends StatelessWidget {
  final String articalImage, articalTitle, articalText;
  const ArticalCard(
      {Key? key,
      required this.articalImage,
      required this.articalText,
      required this.articalTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
       Column(
        children: [
          
          
          Image.network(articalImage,),

          
          Text(articalTitle,style: TextStyle(color: Colors.white) ,),
          SizedBox(height: 10,),
          Text(articalText, style: TextStyle(color: Colors.white)), 
          SizedBox(height: 50,)
        ],
      
    );
  }
}




    