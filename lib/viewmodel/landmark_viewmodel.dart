import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import "package:collection/collection.dart";
import 'package:landmarks_flutter/services/model_data.dart';

class LandmarkViewModel extends ChangeNotifier {
  List<Landmark> _landmarks = [];

  List<Landmark> get landmarks => _landmarks;
  List<Landmark> get favoriteLandmarks => landmarks.where((landmark) => landmark.isFavorite).toList();
  List<Landmark> get featuredLandmarks => landmarks.where((landmark) => landmark.isFeatured).toList();
  Map<String, List<Landmark>> get categoryLandmarks => landmarks.groupListsBy((landmark) => landmark.category);
  
  set landmarks(List<Landmark> value) {
    _landmarks = value;
    notifyListeners();
  }

  LandmarkViewModel() {
    ModelData.getLandmarkData().then((res) {
      landmarks = res;
    });
  }
}
