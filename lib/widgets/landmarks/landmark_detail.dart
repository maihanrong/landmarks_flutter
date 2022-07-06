import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:landmarks_flutter/shared/constants.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:landmarks_flutter/widgets/helpers/favorite_button.dart';

class LandmarkDetail extends StatelessWidget {
  static const String routerName = '/detail';
  final String? previousTitle;
  final Landmark landmark;
  LandmarkDetail({this.previousTitle, required this.landmark});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(landmark.name),
          previousPageTitle: previousTitle,
        ),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 150),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  _buildMap(),
                  _buildCircleImage(),
                ],
              ),
            ),
            _buildDescription()
          ],
        )
    );
  }

  Widget _buildMap() {
    return Container(
        width: ScreenWidth,
        height: 300,
        child: AMapWidget(
          apiKey: AMapApiKey(
              iosKey: 'your key'
          ),
          privacyStatement: AMapPrivacyStatement(
              hasAgree: true, hasContains: true, hasShow: true
          ),
          initialCameraPosition: CameraPosition(
              target: LatLng(landmark.coordinates.latitude, landmark.coordinates.longitude
              ),
              zoom: 8
          ),
        )
    );
  }

  Widget _buildCircleImage() {
    return Positioned(
      top: 170,
      child: Container(
        width: 260,
        height: 260,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/images/${landmark.imageName}.jpg')),
            border: Border.all(
                width: 4,
                color: Colors.white
            ),
            boxShadow:[
              BoxShadow(color: Colors.black, blurRadius: 7),
            ]
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DefaultIndent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(landmark.name, style: TextStyle(fontSize: 30),),
              SizedBox(width: 16,),
              FavoriteButton(landmark: landmark)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(landmark.park, style: TextStyle(fontSize: 14, color: Colors.black54),),
              Text(landmark.state, style: TextStyle(fontSize: 14, color: Colors.black54),)
            ],
          ),
          SizedBox(height: 8,),
          Divider(height: 1,),
          SizedBox(height: 8,),
          Text('About ${landmark.name}', style: TextStyle(fontSize: 24),),
          Text(landmark.description)
        ],
      ),
    );
  }
}
