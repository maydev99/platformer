import 'package:flame/events.dart';
import 'package:flame/game.dart';

import 'actors/bonobo.dart';

class GameMain extends FlameGame with TapDetector {
  double screenSizeX = 0.0;
  double screenSizeY = 0.0;
  //late Santa santa;
  late Bonobo bonobo;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    await images.load('bonobo_sprite.png');
    bonobo = Bonobo(images.fromCache('bonobo_sprite.png'));
    add(bonobo);
    screenSizeX = size.x - 35;

    //santa = Santa(images.fromCache('santa_walk.png'));

    //add(santa);
  }

  @override
  void onUpdate(double dt) {
    super.update(dt);
  }

  @override
  void onTapDown(TapDownInfo info) {
    //print(info.eventPosition.viewport.x);
    double tapPositionX = info.eventPosition.viewport.x;
    if(tapPositionX >  screenSizeX / 2) {
      bonobo.jumpRight();
      //print('right');
    } else {
      //print('left');
      bonobo.jumpLeft();
    }
  }
}
