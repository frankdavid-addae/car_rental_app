import 'package:dummy_car_rental_ui/car_widget.dart';
import 'package:dummy_car_rental_ui/dealer_widget.dart';
import 'package:flutter/material.dart';
import 'package:dummy_car_rental_ui/constants.dart';
import 'package:dummy_car_rental_ui/data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dummy_car_rental_ui/available_cars.dart';

class Showroom extends StatefulWidget {
  const Showroom({ Key? key }) : super(key: key);

  @override
  _ShowroomState createState() => _ShowroomState();
}

class _ShowroomState extends State<Showroom> {
  List<NavigationItem> navigationItems = getNavigationItemList();
  late NavigationItem selectedItem;

  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kFogGreyColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text(
          'Car Rental App',
          style: GoogleFonts.mulish(
            fontSize: 28.0 * kMultiplier * mediaQueryHeight,
            fontWeight: FontWeight.bold,
            color: kLicoriceBlackColor,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 16.0 * kMultiplier * mediaQueryHeight,
            ),
            child: Icon(
              Icons.menu,
              color: kLicoriceBlackColor,
              size: 28.0 * kMultiplier * mediaQueryHeight,
            )
          )
        ]
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 10.0 * kMultiplier * mediaQueryHeight,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0 * kMultiplier * mediaQueryHeight),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    fontSize: 16.0 * kMultiplier * mediaQueryHeight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      15.0 * kMultiplier * mediaQueryHeight,
                    ),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: kCloudyGreyColor,
                  contentPadding: EdgeInsets.only(
                    left: 30.0 * kMultiplier * mediaQueryHeight,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 24.0 * kMultiplier * mediaQueryHeight,
                      left: 16.0 * kMultiplier * mediaQueryHeight,
                    ),
                    child: Icon(
                      Icons.search,
                      color: kLicoriceBlackColor,
                      size: 28.0 * kMultiplier * mediaQueryHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: kCloudyGreyColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      30.0 * kMultiplier * mediaQueryHeight
                    ),
                    topRight: Radius.circular(
                      30.0 * kMultiplier * mediaQueryHeight
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        16.0 * kMultiplier * mediaQueryHeight,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALS',
                            style: TextStyle(
                              fontSize: 22.0 * kMultiplier * mediaQueryHeight,
                              fontWeight: FontWeight.bold,
                              color: kDolphinGreyColor
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14.0 * kMultiplier * mediaQueryHeight,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor
                                ),
                              ),
                              SizedBox(width: 8.0 * kMultiplier * mediaQueryHeight),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12.0 * kMultiplier * mediaQueryHeight,
                                color: kPrimaryColor
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 280.0 * kMultiplier * mediaQueryHeight,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDeals(mediaQueryHeight),
                      ),
                    ),
                    
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => AvailableCars()
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16.0 * kMultiplier * mediaQueryHeight,
                          right: 16.0 * kMultiplier * mediaQueryHeight,
                          left: 16.0 * kMultiplier * mediaQueryHeight, 
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                15.0 * kMultiplier * mediaQueryHeight,
                              ),
                            ),
                          ),
                          padding: EdgeInsets.all(
                            24.0 * kMultiplier * mediaQueryHeight,
                          ),
                          height: 100.0 * kMultiplier * mediaQueryHeight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available Cars',
                                    style: TextStyle(
                                      fontSize: 22.0 * kMultiplier * mediaQueryHeight,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Long term and short term',
                                    style: TextStyle(
                                      fontSize: 16.0 * kMultiplier * mediaQueryHeight,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0 * kMultiplier * mediaQueryHeight)
                                  ),
                                ),
                                height: 50.0 * kMultiplier * mediaQueryHeight,
                                width: 50.0 * kMultiplier * mediaQueryHeight,
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(
                        16.0 * kMultiplier * mediaQueryHeight,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TOP DEALERS',
                            style: TextStyle(
                              fontSize: 22.0 * kMultiplier * mediaQueryHeight,
                              fontWeight: FontWeight.bold,
                              color: kDolphinGreyColor
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  fontSize: 14.0 * kMultiplier * mediaQueryHeight,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor
                                ),
                              ),
                              SizedBox(width: 8.0 * kMultiplier * mediaQueryHeight),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12.0 * kMultiplier * mediaQueryHeight,
                                color: kPrimaryColor
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 150.0 * kMultiplier * mediaQueryHeight,
                      margin: EdgeInsets.only(
                        bottom: 16.0 * kMultiplier * mediaQueryHeight,
                      ),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildDealers(mediaQueryHeight),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70.0 * kMultiplier * mediaQueryHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0 * kMultiplier * mediaQueryHeight),
            topRight: Radius.circular(30.0 * kMultiplier * mediaQueryHeight),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buildNavigationItems(mediaQueryHeight),
        ),
      ),
    );
  }

  List<Widget> buildDeals(double mediaQueryHeight) {
    List<Widget> list = [];

    for (var i = 0; i < cars.length; i++) {
      list.add(buildCar(cars[i], i, mediaQueryHeight));
    }
    return list;
  }

  List<Widget> buildDealers(double mediaQueryHeight) {
    List<Widget> list = [];

    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i, mediaQueryHeight));
    }
    return list;
  }

  List<Widget> buildNavigationItems(double mediaQueryHeight) {
    List<Widget> list = [];

    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i], mediaQueryHeight));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item, double mediaQueryHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50.0 * kMultiplier * mediaQueryHeight,
        child: Stack(
          children: [
            selectedItem == item 
            ? Center(
              child: Container(
                height: 50.0 * kMultiplier * mediaQueryHeight,
                width: 50.0 * kMultiplier * mediaQueryHeight,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColorShadow,
                ),
              ),
            )
            : Container(),
            Center(
              child: Icon(
                item.iconData,
                color: selectedItem == item ? kPrimaryColor : Colors.grey[400],
                size: 24.0 * kMultiplier * mediaQueryHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

}