import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import '../landmarks/landmark_detail.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.landmark,
  }) : super(key: key);

  final Landmark landmark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.asset('assets/images/${landmark.imageName}.jpg',width: 155, height: 155,fit: BoxFit.fitWidth,),
              borderRadius: BorderRadius.circular(8),
            ),
            SizedBox(height: 5,),
            Text(landmark.name, style: TextStyle(fontSize: 12),),
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(LandmarkDetail.routerName, arguments: {'title': 'featured', 'landmark': landmark});
        },
      ),
    );
  }
}