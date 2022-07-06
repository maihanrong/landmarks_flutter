import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:flutter/cupertino.dart';
import 'package:landmarks_flutter/shared/constants.dart';

class LandmarkCell extends StatelessWidget {
  final Landmark landmark;
  final void Function() tapAction;

  LandmarkCell({required this.landmark, required this.tapAction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset('assets/images/${landmark.imageName}.jpg', width: 50, height: 50,),
          title: Text(landmark.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              landmark.isFavorite ? Icon(Icons.star, color: Colors.yellow,) : Container(),
              Icon(Icons.arrow_forward_ios, size: 15.0,)
            ],
          ),
          onTap: tapAction,
        ),
        Divider(
          height: 1,
          indent: DefaultIndent,
        )
      ],
    );
  }
}
