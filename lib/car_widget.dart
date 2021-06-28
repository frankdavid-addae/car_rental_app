import 'package:flutter/material.dart';
import 'package:dummy_car_rental_ui/data.dart';
import 'package:dummy_car_rental_ui/constants.dart';

Widget buildCar(Car car, index, double mediaQueryHeight) {
  return Container(
    decoration: BoxDecoration(
      color: kFogGreyColor,
      borderRadius: BorderRadius.all(
        Radius.circular(15.0 * kMultiplier * mediaQueryHeight)
      ),
    ),
    padding: EdgeInsets.all(16.0 * kMultiplier * mediaQueryHeight),
    margin: EdgeInsets.only(
      // ignore: unnecessary_null_comparison
      right: index != null ? 16.0 * kMultiplier * mediaQueryHeight : 0.0,
      left: index == 0 ? 16.0 * kMultiplier * mediaQueryHeight : 0.0
    ),
    width: 220.0 * kMultiplier * mediaQueryHeight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15.0 * kMultiplier * mediaQueryHeight,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0 * kMultiplier * mediaQueryHeight,
                vertical: 4.0 * kMultiplier * mediaQueryHeight,
              ),
              child: Text(
                car.condition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0 * kMultiplier * mediaQueryHeight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8.0 * kMultiplier * mediaQueryHeight,
        ),
        Container(
          height: 120.0 * kMultiplier * mediaQueryHeight,
          child: Center(
            child: Image.asset(
              car.images[0],
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        SizedBox(
          height: 24.0 * kMultiplier * mediaQueryHeight,
        ),
        Text(
          car.model,
          style: TextStyle(
            fontSize: 18.0 * kMultiplier * mediaQueryHeight,
          ),
        ),
        SizedBox(
          height: 8.0 * kMultiplier * mediaQueryHeight,
        ),
        Text(
          car.brand,
          style: TextStyle(
            fontSize: 22.0 * kMultiplier * mediaQueryHeight,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
        Text(
          'per ' + 
          (
            car.condition == 'Daily' ? 'day'
            : car.condition == 'Weekly' ? 'week'
            : 'month'
          ),
          style: TextStyle(
            fontSize: 14.0 * kMultiplier * mediaQueryHeight,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}