import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/data/model/grid_item_model.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/rotatable_arrow_icon.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/favourite_icon.dart';
import 'package:pro_multimedia_app/src/config/styles/app_assets.dart';

class GridItemsList {
  static final List<GridItemModel> items = [
    GridItemModel(
        height: 100,
        title: 'Zaplanuj podróż',
        backgroundColor: Colors.greenAccent,
        leftTopIcon: const Icon(Icons.flag),
        rightTopIcon: const RotatableArrowIcon(
          angle: 315,
        ),
        textColor: Colors.black),
    GridItemModel(
        title: 'Szlaki',
        backgroundColor: Colors.blue,
        leftTopIcon: const Icon(Icons.route),
        rightTopIcon: const RotatableArrowIcon(
          angle: 315,
          color: Colors.white,
        )),
    GridItemModel(
        title: 'Dłuższe godziny zwiedzania Muzeum',
        image: AppAssets.image1,
        rightTopIcon: const FavouriteIcon(isFavourite: true)),
    GridItemModel(
        title: 'Carbonerum dla licealistów',
        image: AppAssets.image2,
        rightTopIcon: const FavouriteIcon(isFavourite: true)),
    GridItemModel(
        title: 'Dłuższe godziny zwiedzania Muzeum',
        image: AppAssets.image3,
        rightTopIcon: const FavouriteIcon(isFavourite: true)),
    GridItemModel(
        title: 'Carbonerum dla licealistów',
        image: AppAssets.image4,
        rightTopIcon: const FavouriteIcon(isFavourite: false)),
    GridItemModel(
        title: 'Dłuższe godziny zwiedzania Muzeum',
        image: AppAssets.image5,
        rightTopIcon: const FavouriteIcon(isFavourite: false)),
    GridItemModel(
        title: 'Carbonerum dla licealistów',
        image: AppAssets.image6,
        rightTopIcon: const FavouriteIcon(isFavourite: false)),
    GridItemModel(
        title: 'Dłuższe godziny zwiedzania Muzeum',
        image: AppAssets.image7,
        rightTopIcon: const FavouriteIcon(isFavourite: false)),
    GridItemModel(
        title: 'Carbonerum dla licealistów',
        image: AppAssets.image8,
        rightTopIcon: const FavouriteIcon(isFavourite: false)),
  ];
}
