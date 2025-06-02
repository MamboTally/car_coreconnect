import 'package:car_coreconnect/core/theme/dimens.dart';
import 'package:car_coreconnect/core/widgets/app_space.dart';
import 'package:car_coreconnect/features/home_feature/presentation/widgets/banner_slider_widget.dart';
import 'package:car_coreconnect/features/home_feature/presentation/widgets/home_screen_cars_list.dart';
import 'package:car_coreconnect/features/home_feature/presentation/widgets/top_brands_widget.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: Dimens.largePadding,
        children: <Widget>[
          BannerSliderWidget(),
          TopBrandsWidget(),
          HomeScreenCarsList(),
          AppVSpace(),
        ],
      ),
    );
  }
}