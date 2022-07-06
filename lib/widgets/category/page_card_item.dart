import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';

class PageCardItem extends StatelessWidget {
  const PageCardItem({
    Key? key,
    required this.landmark,
  }) : super(key: key);

  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
        children:[
          Image.asset('assets/images/${landmark.imageName}_feature.jpg',fit: BoxFit.fill,),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              children: [
                Text(landmark.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                Text(landmark.park, style: TextStyle(color: Colors.white),)
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          )
        ]
    );
  }
}