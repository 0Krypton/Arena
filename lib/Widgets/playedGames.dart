import 'package:flutter/material.dart';

import '../Model/ProfileScreenClasses/gamesPlaying.dart';

class PlayedGamesContainer extends StatelessWidget {
  PlayedGamesContainer({
    @required this.heightGameContainer,
    @required this.widthGameContainer,
    @required this.listGamesPlayed,
  });

  final heightGameContainer;
  final widthGameContainer;

  final List<GameItemData> listGamesPlayed;

  @override
  Widget build(BuildContext context) {
    final paddingHorizontal = 20 * 2.0; //for each side 15

    final double widthOfContainers = widthGameContainer - paddingHorizontal;

    List<Widget> listGames = [];

    return Container(
      width: widthGameContainer,
      // height: 500,
      // color: Colors.yellow,
      child: Stack(
        children: List.generate(
          listGamesPlayed.length,
          (index) {
            if (listGamesPlayed.isEmpty || listGamesPlayed == null) {
              return SizedBox(width: 0, height: 0);
            } else if (index % 2 == 0) {
              listGames.add(
                _buildLeftContainer(
                  index,
                  widthOfContainers / 2,
                  paddingHorizontal / 2,
                ),
              );
            } else {
              listGames.add(
                _buildRightContainer(
                  index,
                  widthOfContainers / 2,
                  paddingHorizontal / 2,
                ),
              );
            }
            return listGames[index];
          },
        ),
      ),
    );
  }

  Widget _buildLeftContainer(int index, width, padding) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 100,
        width: width - padding,
        margin: EdgeInsetsDirectional.only(
          start: padding,
          top: index == 0 ? 0 : ((index) * 60.0),
        ),
        decoration: BoxDecoration(
          color: listGamesPlayed[index].color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: listGamesPlayed[index].color,
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            listGamesPlayed[index].imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildRightContainer(int index, width, padding) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 100,
        width: width - padding,
        margin: EdgeInsetsDirectional.only(
          end: padding,
          top: index == 1 ? 0 : ((index - 1) * 60.0),
        ),
        decoration: BoxDecoration(
          color: listGamesPlayed[index].color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: listGamesPlayed[index].color,
              blurRadius: 20,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            listGamesPlayed[index].imageUrl,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
