import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/viewmodel/landmark_viewmodel.dart';
import 'package:provider/provider.dart';
import 'category_row.dart';
import 'page_card.dart';

class CategoryHome extends StatelessWidget {
  const CategoryHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
          child: SafeArea(
            top: false,
            child: Consumer<LandmarkViewModel>(
              builder: (ctx, landmarkVM, child) {
                if (landmarkVM.landmarks.isEmpty) {
                  return Container();
                }
                return CustomScrollView(
                  slivers: [
                    _buildNavigationBar(),
                    _buildPageCard(landmarkVM),
                    _buildCategoryList(landmarkVM)
                  ],
                );
              },
            ),
          )
      ),
    );
  }

  Widget _buildNavigationBar() {
    return const CupertinoSliverNavigationBar(
      largeTitle: Text('Featured'),
    );
  }

  Widget _buildPageCard(LandmarkViewModel landmarkVM) {
    return SliverToBoxAdapter(
        child: PageCard(landmarkVM.featuredLandmarks)
    );
  }

  Widget _buildCategoryList(LandmarkViewModel landmarkVM) {
    List<String> categoryTitles = landmarkVM.categoryLandmarks.keys.toList();
    categoryTitles.sort();
    return SliverList(
        delegate: SliverChildBuilderDelegate((ctx, inedx){
          return CategoryRow(
              categoryTitle: categoryTitles[inedx],
              categorys: landmarkVM.categoryLandmarks[categoryTitles[inedx]]!
          );
        },
            childCount: categoryTitles.length
        )
    );
  }
}