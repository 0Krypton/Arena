//importing packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//importing controllers
import '../../Controllers/Proivders/StoreScreenState/storeScreenProvider.dart';

//importing widgets
import '../../Widgets/storeScreen/subscriptionWidget.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({this.height, this.width});

  final height;
  final width;

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  PageController _pageController;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      // print('1 - _pageController.page ${1 - _pageController.page}');
      setState(() {
        _pageOffset = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      color: Colors.white,
      child: Column(
        children: [
          _buildTitle(),
          SizedBox(height: 10),
          _buildSubs(height: widget.height * .45, width: widget.width),
        ],
      ),
    );
  }

  Widget _buildSubs({height, width}) {
    return Consumer<ShopScreenProvider>(
      builder: (context, provider, child) {
        return Container(
          width: width,
          height: height,
          alignment: Alignment.bottomCenter,
          child: PageView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: provider.subs.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              // print('index: $index');
              // print('pageOffset: $_pageOffset');
              return BuildSubs(
                subModel: provider.subs[index],
                height: height,
                pageIndex: _pageOffset - (index).toDouble(),
                index: index,
                // pageIndex: _pageOffset + (index).toDouble(),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildTitle() {
    return Container(
      height: 50,
      width: widget.width,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Store',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
