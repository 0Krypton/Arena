//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//importing dart files
import 'dart:math' as math;

//importing providers
import '../../Controllers/Proivders/ExploreScreenState/exploreScreenProvider.dart';

//importing Screen
import '../ExploreScreen/searchScreen.dart';

//import model class
import '../../Model/ExploreScreenClasses/regionsModel.dart';
import './toursList.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({this.height, this.width});

  final height;
  final width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildServers(),
            _buildGamesAvailable(),
            ToursList(
              height: height - (85 + 28 + 55),
              width: width,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Explore',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(SearchScreen.comeToPage());
            },
            child: Transform.rotate(
              angle: -math.pi / 2,
              child: SvgPicture.asset(
                'assets/BottomNavigationBarIcons/search.svg',
                height: 25,
                width: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServers() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Consumer<ExploreScreenProvider>(
          builder: (context, exProvider, child) {
            List<Map<String, dynamic>> listRegionServers =
                exProvider.regionServers;

            return Row(
              children: List.generate(
                listRegionServers.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      Provider.of<ExploreScreenProvider>(context, listen: false)
                          .changeRegionOrder(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: listRegionServers[index]['isSelected']
                              ? listRegionServers[index]['color']
                              : Colors.grey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        listRegionServers[index]['name'],
                        style: TextStyle(
                          fontFamily: 'Reglo',
                          color: listRegionServers[index]['isSelected']
                              ? listRegionServers[index]['color']
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGamesAvailable() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
        child: Consumer<ExploreScreenProvider>(
          builder: (context, exProvider, child) {
            List<Map<String, dynamic>> listGamesAvailable =
                exProvider.availableGames;

            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                listGamesAvailable.length,
                (index) => GestureDetector(
                  onTap: () {
                    exProvider.changeGameOrder(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(10),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(20),
                      color: listGamesAvailable[index]['isSelected']
                          ? listGamesAvailable[index]['color']
                          : Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: listGamesAvailable[index]['isSelected']
                              ? listGamesAvailable[index]['shadow-begin']
                              : Colors.grey[400],
                          offset: Offset(2, 2),
                          blurRadius: 10,
                        ),
                        BoxShadow(
                          color: listGamesAvailable[index]['isSelected']
                              ? listGamesAvailable[index]['shadow-end']
                              : Colors.grey[400],
                          offset: Offset(-2, -2),
                          blurRadius: 10,
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          listGamesAvailable[index]['isSelected']
                              ? listGamesAvailable[index]['color-begin']
                              : Colors.grey[400],
                          listGamesAvailable[index]['isSelected']
                              ? listGamesAvailable[index]['color-end']
                              : Colors.grey[600]
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Image.asset(
                      listGamesAvailable[index]['image-url'],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
