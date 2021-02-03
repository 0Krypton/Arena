//importing packages
import 'package:flutter/material.dart';

//importing Models
import '../../Model/ShopScreenClasses/subscriptionModel.dart';

//importing dart files
import 'dart:math' as math;

class BuildSubs extends StatefulWidget {
  BuildSubs({
    this.subModel,
    this.height,
    this.width,
    this.pageIndex,
    this.index,
  });

  final SubscriptionModel subModel;
  final double height, width;

  final double pageIndex;
  final int index;

  @override
  _BuildSubsState createState() => _BuildSubsState();
}

class _BuildSubsState extends State<BuildSubs> {
  double _offset = 1.0;

  @override
  Widget build(BuildContext context) {
    // print('index ${widget.index}');

    if (widget.pageIndex >= 0.0) {
      _offset = ((widget.pageIndex - 1).abs());
      //   setState(() {
      //     _offset = ((widget.pageIndex - 1).abs());
      //   });
    }

    return FractionallySizedBox(
      heightFactor: .8,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.subModel.beginColor,
              widget.subModel.endColor,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          overflow: Overflow.visible,
          children: [
            _buildBgImage(),
            _buildImage(),
            _buildTitle(),
            _buildTiere(),
            _buildDesc(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesc() {
    return Positioned(
      left: ((widget.pageIndex - 1).abs()) * 30.0,
      bottom: (widget.height * .8) / 4,
      child: Opacity(
        opacity: _offset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            widget.subModel.discription.length,
            (disIndex) => Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  child: Image.asset(
                    widget.subModel.optImageUrl,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  widget.subModel.discription[disIndex],
                  style: TextStyle(
                    color: widget.subModel.primaryColor,
                    fontFamily: 'Reglo',
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTiere() {
    return Positioned(
      left: ((widget.pageIndex - 1).abs()) * 30.0,
      top: ((35.0) + (25)),
      child: Opacity(
        opacity: _offset,
        child: Text(
          widget.subModel.tiere,
          style: TextStyle(
            color: widget.subModel.primaryColor,
            fontFamily: 'Reglo',
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Positioned(
      left: ((widget.pageIndex - 1).abs()) * 30.0,
      top: 25,
      child: Opacity(
        opacity: _offset,
        child: Text(
          widget.subModel.title,
          style: TextStyle(
            color: widget.subModel.primaryColor,
            fontFamily: 'Reglo',
            fontSize: 35,
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Positioned(
      right: ((widget.pageIndex - 1).abs()) * 30.0,
      bottom: 25,
      child: Container(
        height: widget.height * .8,
        child: Image.asset(widget.subModel.imageUrl),
      ),
    );
  }

  Widget _buildBgImage() {
    return Positioned(
      right: 0,
      left: -((widget.pageIndex - 1).abs()) * 10.0,
      top: 0,
      bottom: 0,
      child: Image.asset(widget.subModel.bgImageUrl),
    );
  }
}
