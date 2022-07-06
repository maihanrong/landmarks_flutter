import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:landmarks_flutter/shared/constants.dart';
import 'category_item.dart';

class CategoryRow extends StatelessWidget {
  final String categoryTitle;
  final List<Landmark> categorys;
  CategoryRow({required this.categoryTitle, required this.categorys});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 5, 0, 12),
          child: Text(categoryTitle, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        ),
        Container(
          height: 185,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorys.length,
              itemExtent: 171,
              padding: EdgeInsets.only(left: DefaultIndent),
              itemBuilder: (ctx, index) {
                return CategoryItem(landmark: categorys[index]);
              }
          ),
        ),
        Divider(height: 1, indent: DefaultIndent,)
      ],
    );
  }
}