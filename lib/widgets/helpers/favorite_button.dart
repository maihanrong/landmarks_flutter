import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:landmarks_flutter/viewmodel/landmark_viewmodel.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatefulWidget {
  Landmark landmark;
  FavoriteButton({required this.landmark});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: widget.landmark.isFavorite ? Icon(Icons.star, color: Colors.yellow,): Icon(Icons.star_border, color: Colors.grey,),
      onTap: (){
        setState(() {
          widget.landmark.isFavorite = !widget.landmark.isFavorite;
          List<Landmark> landmarks = Provider.of<LandmarkViewModel>(context, listen: false).landmarks;
          for (Landmark landmark in landmarks) {
            if (landmark.id == widget.landmark.id) {
              landmark.isFavorite = widget.landmark.isFavorite;
              Provider.of<LandmarkViewModel>(context, listen: false).landmarks = landmarks;
              break;
            }
          }
        });
      },
    );
  }
}