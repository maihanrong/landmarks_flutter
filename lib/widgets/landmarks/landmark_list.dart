import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:landmarks_flutter/shared/constants.dart';
import 'package:landmarks_flutter/viewmodel/landmark_viewmodel.dart';
import 'package:landmarks_flutter/widgets/landmarks/landmark_cell.dart';
import 'package:landmarks_flutter/widgets/landmarks/landmark_detail.dart';
import 'package:provider/provider.dart';

class LandmarkList extends StatefulWidget {
  const LandmarkList({Key? key}) : super(key: key);
  static const String routerName = '/list';

  @override
  State<LandmarkList> createState() => _LandmarkListState();
}

class _LandmarkListState extends State<LandmarkList> {
  bool _showFavoritesOnly = false;
  late List<Landmark> _landmarks;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
        child: SafeArea(
          top: false,
          child: Consumer<LandmarkViewModel>(
            builder: (ctx, landmarkVM, child){
              _landmarks = _showFavoritesOnly ? landmarkVM.favoriteLandmarks: landmarkVM.landmarks;
              return CustomScrollView(
                slivers: [
                  _buildNavigationBar(),
                  _buildHeader(),
                  _buildList(context)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationBar() {
    return const CupertinoSliverNavigationBar(
      largeTitle: Text('Landmarks'),
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: DefaultIndent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Favorites only', style: TextStyle(fontSize: 17.0),),
                  CupertinoSwitch(value: _showFavoritesOnly, onChanged: (state){
                    setState(() {
                      _showFavoritesOnly = state;
                    });
                  })
                ],
              ),
            ),
            const Divider(height: 1, indent: DefaultIndent,)
          ],
        )
    );
  }

  Widget _buildList(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (ctx, index) {
                return LandmarkCell(
                  landmark: _landmarks[index],
                  tapAction: (){
                    Navigator.of(context).pushNamed(LandmarkDetail.routerName, arguments: {'title': 'landmarks', 'landmark': _landmarks[index]});
                  },
                );
              },
          childCount: _landmarks.length
      ),
    );
  }
}
