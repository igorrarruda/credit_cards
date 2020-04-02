import 'package:credit_card/controllers/my_app_controller.dart';
import 'package:credit_card/framework/flip_card.dart';
import 'package:credit_card/widgets/back_card.dart';
import 'package:credit_card/widgets/front_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class ItemPage extends StatelessWidget {
  final int index;
  final String numberCard;
  final String name;
  final String backgroundImage;
  final Color color;
  final String operatorImage;

  final MultiTrackTween multiTrackTween = MultiTrackTween(
    [
      Track('rotate').add(
        Duration(milliseconds: 300),
        Tween(begin: 0.0, end: -0.5),
      ),
      Track('scale').add(
        Duration(milliseconds: 300),
        Tween(begin: 1.0, end: 0.5),
      ),
      Track('opacity').add(
        Duration(milliseconds: 300),
        Tween(begin: 1.0, end: 0.0),
      ),
    ],
  );

  final MultiTrackTween animacaoCard = MultiTrackTween(
    [
      Track('rotate').add(
        Duration(milliseconds: 300),
        Tween(begin: 0.0, end: 1.57),
      ),
      Track('top').add(
        Duration(milliseconds: 300),
        Tween(begin: 0.0, end: -100.0),
        curve: Curves.easeInCubic,
      ),
      Track('top_inverse').add(
        Duration(milliseconds: 300),
        Tween(begin: 0.0, end: 460.0),
        curve: Curves.easeInCubic,
      ),
      Track('scale').add(
        Duration(milliseconds: 300),
        Tween(begin: 1.0, end: 0.7),
        curve: Curves.easeInCubic,
      ),
      Track('scale_zero').add(
        Duration(milliseconds: 800),
        Tween(begin: 1.0, end: 0.8),
        curve: Curves.easeInCubic,
      ),
    ],
  );

  ItemPage({
    Key key,
    this.index,
    this.numberCard,
    this.name,
    this.backgroundImage,
    this.color,
    this.operatorImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex =
        Provider.of<MyAppController>(context, listen: false).currentIndex;
    bool isFlipped =
        Provider.of<MyAppController>(context, listen: false).isFlipped;

    return GestureDetector(
      onTap: () {
        if (currentIndex == -1) {
          Provider.of<MyAppController>(context, listen: false)
              .setCurrentIndex(index);
        } else {
          Provider.of<MyAppController>(context, listen: false)
              .setIsFlipped(!isFlipped);
        }
      },
      child: Consumer<MyAppController>(
        child: FlippableBox(
          front: FrontCard(
            backgroundImage: backgroundImage,
            operatorImage: operatorImage,
            color: color,
          ),
          back: BackCard(color: color),
          isFlipped: isFlipped,
        ),
        builder:
            (BuildContext context, MyAppController notifier, Widget child) {
          int pageIndex =
              Provider.of<MyAppController>(context, listen: false).index;
          int currentIndex =
              Provider.of<MyAppController>(context, listen: false).currentIndex;
          bool hideCard =
              currentIndex != -1 ? index == currentIndex ? false : true : false;

          double progress =
              notifier.sheetState != null ? notifier.sheetState.progress : 0.0;
          double extent =
              notifier.sheetState != null ? notifier.sheetState.extent : 0.0;

          if (currentIndex != -1) {
            Provider.of<MyAppController>(context, listen: false).showSheet();
          } else {
            Provider.of<MyAppController>(context, listen: false).hideSheet();
          }

          return AnimatedOpacity(
            duration: Duration(milliseconds: !hideCard ? 500 : 10),
            opacity: hideCard ? 0 : 1,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ControlledAnimation(
                  tween: animacaoCard,
                  duration: animacaoCard.duration,
                  playback: currentIndex != -1
                      ? Playback.PLAY_FORWARD
                      : Playback.PLAY_REVERSE,
                  builder: (context, animation) {
                    double top = extent > 0.6
                        ? (MediaQuery.of(context).size.height * 0.25) -
                            animation['top_inverse'] +
                            (progress * 310)
                        : (MediaQuery.of(context).size.height * 0.25) +
                            animation['top'] -
                            (progress * 310);
                    return Positioned(
                      top: top,
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: MediaQuery.of(context).size.width - 140,
                      child: Transform.rotate(
                        angle: animation['rotate'],
                        child: Transform.scale(
                          scale: extent > 0.6
                              ? animation['scale_zero'] - (progress * 0.5)
                              : animation['scale'],
                          child: ControlledAnimation(
                            tween: multiTrackTween,
                            duration: multiTrackTween.duration,
                            playback: pageIndex > index
                                ? Playback.PLAY_FORWARD
                                : Playback.PLAY_REVERSE,
                            builder: (context, animation) {
                              return Transform.rotate(
                                angle: animation['rotate'],
                                child: Transform.scale(
                                  scale: animation['scale'],
                                  child: AnimatedOpacity(
                                    duration: Duration(milliseconds: 300),
                                    opacity:
                                        hideCard ? 0 : animation['opacity'],
                                    child: child,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
