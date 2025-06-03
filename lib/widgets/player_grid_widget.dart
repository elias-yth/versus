import 'package:flutter/material.dart';
import 'package:versus/models/player.dart';
import 'package:versus/widgets/player_icon_widget.dart';

class PlayerGrid extends StatelessWidget {
  final List<Player> players;
  final void Function(Player player) onPressed;
  final void Function(Player player)? onLongPress;
  final VoidCallback? onAddPressed;
  final String addLabel;
  final double height;
  final double width;
  final int crossAxisCount;

  const PlayerGrid({
    super.key,
    required this.players,
    required this.onPressed,
    this.onLongPress,
    this.onAddPressed,
    this.addLabel = '+',
    this.height = 400,
    this.width = 350,
    this.crossAxisCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    final hasAddButton = onAddPressed != null;

    return SizedBox(
      height: height,
      width: width,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: players.length + (hasAddButton ? 1 : 0),
        itemBuilder: (context, index) {
          if (hasAddButton && index == 0) {
            return PlayerIcon(display: addLabel, onPressed: onAddPressed!);
          }

          final playerIndex = hasAddButton ? index - 1 : index;
          final player = players[playerIndex];

          return PlayerIcon(
            display: player.name,
            onPressed: () => onPressed(player),
            onLongPress: () => onLongPress!(player),
          );
        },
      ),
    );
  }
}
