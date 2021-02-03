//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//importing model classes
import '../../Model/ExploreScreenClasses/tournoumentDetail.dart';

//importing Widgets
import '../../Widgets/homeScreen/homeScreenTourWidget.dart';

class GetReadyTournoumentsList extends StatefulWidget {
  GetReadyTournoumentsList({
    @required this.height,
    @required this.width,
    this.marginLeft,
  });

  final height, width;

  final double marginLeft;

  @override
  _GetReadyTournoumentsListState createState() =>
      _GetReadyTournoumentsListState(heightOfTheContainer: (height / 3) + 15);
}

class _GetReadyTournoumentsListState extends State<GetReadyTournoumentsList> {
  _GetReadyTournoumentsListState({this.heightOfTheContainer});

  final double heightOfTheContainer;
  double indexTopAnimatedContainer = 0;

  ScrollController _listController = ScrollController();

  @override
  void initState() {
    super.initState();

    _listController.addListener(() {
      double value =
          (_listController.offset / (heightOfTheContainer + (35.0 + 15)));

      setState(() {
        indexTopAnimatedContainer = value;
        // print(
        //     'indexTopAnimatedContainer : ${indexTopAnimatedContainer} \nvalue : ${value}');
      });
      // print(_listController.offset);
    });
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: EdgeInsets.only(left: widget.marginLeft),
      child: ListView.builder(
        controller: _listController,
        physics: BouncingScrollPhysics(),
        itemCount: getReadyTournouments.length,
        itemBuilder: (context, index) {
          double opacity = 1;

          if (indexTopAnimatedContainer > 0.0) {
            opacity = (index + 1) + 0.0 - indexTopAnimatedContainer;

            if (opacity < 0) {
              opacity = 0;
            } else if (opacity > 1) {
              opacity = 1;
            }
          }
          return Opacity(
            opacity: opacity,
            child: BuildHomeTourContainer(
              tour: getReadyTournouments[index],
              heightOfContainer: heightOfTheContainer,
              widthOfMotherContainer: widget.width - ((widget.marginLeft - 25)),
              widthOfChildContainer:
                  widget.width - ((widget.marginLeft) + (25.0) + (25) + (5)),
            ),
          );
        },
      ),
    );
  }
}
