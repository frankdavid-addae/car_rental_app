import 'package:dummy_car_rental_ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:dummy_car_rental_ui/data.dart';

Widget buildDealer(Dealer dealer, int index, double mediaQueryHeight) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15.0 * kMultiplier * mediaQueryHeight),
      ),
    ),
    padding: EdgeInsets.all(16.0 * kMultiplier * mediaQueryHeight),
    margin: EdgeInsets.only(
      right: 16.0 * kMultiplier * mediaQueryHeight,
      left: index == 0 ? 16.0 * kMultiplier * mediaQueryHeight : 0.0
    ),
    width: 150.0 * kMultiplier * mediaQueryHeight,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        Container(
          height: 60.0 * kMultiplier * mediaQueryHeight,
          width: 60.0 * kMultiplier * mediaQueryHeight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(dealer.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0 * kMultiplier * mediaQueryHeight),
            ),
          ),
        ),

        SizedBox(
          height: 16.0 * kMultiplier * mediaQueryHeight,
        ),

        Text(
          dealer.name,
          style: TextStyle(
            fontSize: 20.0 * kMultiplier * mediaQueryHeight,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),

        Text(
          dealer.offers.toString() + ' offers',
          style: TextStyle(
            fontSize: 14.0 * kMultiplier * mediaQueryHeight,
            color: Colors.grey,
          ),
        ),

      ],
    ),
  );
}