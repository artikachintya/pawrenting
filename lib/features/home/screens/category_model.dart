import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategoryModel> getcategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
        name: 'Cat Food',
        iconPath: TImages.catFood,
        boxColor: Color(0xffFFFFFF).withOpacity(0.3)));
    categories.add(CategoryModel(
        name: 'Dog Food',
        iconPath: TImages.dogFood,
        boxColor: Color(0xffFFFFFF).withOpacity(0.3)));
    categories.add(CategoryModel(
        name: 'Vitamin & Supplement',
        iconPath: TImages.vitamin,
        boxColor: Color(0xffFFFFFF).withOpacity(0.3)));
    categories.add(CategoryModel(
        name: 'Cat Food',
        iconPath: TImages.catFood,
        boxColor: Color(0xffFFFFFF).withOpacity(0.3)));
    categories.add(CategoryModel(
        name: 'Dog Food',
        iconPath: TImages.dogFood,
        boxColor: Color(0xffFFFFFF).withOpacity(0.3)));

    return categories;
  }
}
