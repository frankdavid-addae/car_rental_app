import 'package:flutter/material.dart';
import 'package:dummy_car_rental_ui/car_widget.dart';
import 'package:dummy_car_rental_ui/data.dart';
import 'package:dummy_car_rental_ui/constants.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({ Key? key }) : super(key: key);

  @override
  _AvailableCarsState createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedFilter = filters[0];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            16.0 * kMultiplier * mediaQueryHeight
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 45.0 * kMultiplier * mediaQueryHeight,
                  height: 45.0 * kMultiplier * mediaQueryHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0 * kMultiplier * mediaQueryHeight),
                    ),
                    border: Border.all(
                      width: 1.0,
                      color: kCloudyGreyColor,
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.black,
                    size: 28.0 * kMultiplier * mediaQueryHeight,
                  ),
                ),
              ),
              SizedBox(
                height: 16.0 * kMultiplier * mediaQueryHeight,
              ),
              Text(
                'Available Cars (' + getCarList().length.toString() + ')',
                style: TextStyle(
                  fontSize: 36.0 * kMultiplier * mediaQueryHeight,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16.0 * kMultiplier * mediaQueryHeight,
              ),
              Expanded(
                child: GridView.count(
                  physics: BouncingScrollPhysics(),
                  childAspectRatio: 1 / 1.55,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  crossAxisCount: 2,
                  children: getCarList().map((item) {
                    return buildCar(item, null, mediaQueryHeight);
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.0 * kMultiplier * mediaQueryHeight,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            buildFilterIcon(mediaQueryHeight),
            Row(
              children: buildFilters(mediaQueryHeight),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget buildFilterIcon(double mediaQueryHeight) {
    return Container(
      height: 50.0 * kMultiplier * mediaQueryHeight,
      width: 50.0 * kMultiplier * mediaQueryHeight,
      margin: EdgeInsets.symmetric(
        horizontal: 16.0 * kMultiplier * mediaQueryHeight,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0 * kMultiplier * mediaQueryHeight),
        ),
      ),
      child: Center(
        child: Icon(
          Icons.filter_list,
          color: Colors.white,
          size: 24.0 * kMultiplier * mediaQueryHeight,
        ),
      ),
    );
  }

  List<Widget> buildFilters(double mediaQueryHeight) {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i], mediaQueryHeight));
    }
    return list;
  }

  Widget buildFilter(Filter filter, double mediaQueryHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          right: 16.0 * kMultiplier * mediaQueryHeight,
        ),
        child: Text(
          filter.name,
          style: TextStyle(
            color: selectedFilter == filter
            ? kPrimaryColor : Colors.grey[300],
            fontSize: 16.0 * kMultiplier * mediaQueryHeight,
            fontWeight: selectedFilter == filter
            ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

}