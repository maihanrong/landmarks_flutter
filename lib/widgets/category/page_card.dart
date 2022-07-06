import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:landmarks_flutter/model/landmark.dart';
import 'package:landmarks_flutter/shared/constants.dart';
import 'page_card_item.dart';

class PageCard extends StatelessWidget {
  List<Landmark> featuredLandmarks;
  PageCard(this.featuredLandmarks);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenWidth,
      height: 250,
      child: Swiper(
        itemCount: featuredLandmarks.length,
        itemBuilder: (ctx, index) {
          return PageCardItem(landmark: featuredLandmarks[index]);
        },
        pagination: const SwiperPagination(
            alignment: Alignment.bottomRight,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54,
                activeColor: Colors.white
            )
        ),
        autoplay: true,
      ),
    );
  }
}