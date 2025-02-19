import 'package:flutter/material.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';

class Product {
  String name;
  int price;
  int discount;
  String Image;
  double width;
  double height;

  Product(
      {required this.name,
      required this.price,
      required this.discount,
      required this.Image,
      required this.width,
      required this.height});

  int get discountedPrice => price - ((price * discount) ~/ 100);

  static List<Product> getProduct() {
    List<Product> products = [];

    products.add(Product(
        name: 'Cozy Plush Bed for Pet',
        price: 457750,
        discount: 50,
        Image: TImages.sofaHewan,
        width: 160,
        height: 130));
    products.add(Product(
        name: 'Double Automatic Feeders',
        price: 278780,
        discount: 20,
        Image: TImages.doubleAutoFeeder,
        width: 155,
        height: 135));
    products.add(Product(
        name: 'Whiskas Purrfectly Chicken',
        price: 278780,
        discount: 20,
        Image: TImages.whiskas,
        width: 130,
        height: 130));
    products.add(Product(
        name: 'Pet Nail Clipper Scissors',
        price: 125200,
        discount: 40,
        Image: TImages.petNailClipper,
        width: 130,
        height: 130));
    products.add(Product(
        name: 'Whiskas KatzenMilch 6 Pcs',
        price: 255000,
        discount: 40,
        Image: TImages.catMilk,
        width: 165,
        height: 110));
    products.add(Product(
        name: 'Calming Home Spray',
        price: 125400,
        discount: 30,
        Image: TImages.homeSpray,
        width: 135,
        height: 135));
    products.add(Product(
        name: 'Midwest Ultra-Soft Bed',
        price: 352400,
        discount: 15,
        Image: TImages.ultraSoftBed,
        width: 160,
        height: 145));
    products.add(Product(
        name: 'New Pikachu Airism for Pet',
        price: 420480,
        discount: 64,
        Image: TImages.pikachuJacket,
        width: 145,
        height: 145));

    return products;
  }
}
