import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:landmarks_flutter/model/landmark.dart';

class ModelData {
  static Future<List<Landmark>> getLandmarkData() async {
    return loadData<List<Landmark>>('assets/json/landmarkData.json', (list) {
      List<Landmark> resultList = [];
      for(var json in list) {
        resultList.add(Landmark.fromJson(json));
      }
      return resultList;
    });
  }

  static Future<T> loadData<T>(String path, T Function(dynamic) builder) async {
    final jsonString = await rootBundle.loadString(path);
    final result = json.decode(jsonString);
    return builder(result);
  }
}
