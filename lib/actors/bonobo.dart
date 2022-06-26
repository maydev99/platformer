

import 'dart:ui';

import 'package:Platformer/game_main.dart';
import 'package:flame/components.dart';
import 'package:vibration/vibration.dart';

enum BonoboState {
  walking,
}

class Bonobo extends SpriteAnimationGroupComponent with HasGameRef<GameMain> {
  static Vector2 gravity = Vector2(0, 600);
  Vector2 velocity = Vector2.zero();
  double ground = 0.0;


  static final _animationMap = {
    BonoboState.walking: SpriteAnimationData.sequenced(amount: 3, stepTime: 0.1 , texturePosition: Vector2((6) * 180,0), textureSize: Vector2(180,180)),

  };

  Bonobo(Image image) : super.fromFrameData(image, _animationMap);

  @override
  Future<void>? onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    size = Vector2((70), 70);
    position = Vector2(35, gameRef.size.y / 2);

  }

  @override
  void onMount() {
    super.onMount();
    ground = gameRef.size.y - 35;
    position.y = ground;
  }

  @override
  void update(double dt) {
    position += velocity * dt - gravity * dt * dt / 2;
    velocity += gravity * dt;

    if(position.y >= ground) {

      if(velocity.y > 300) {
        print(velocity.y);
        Vibration.vibrate();
      }
      velocity = Vector2(0, 0);
      position.y = ground;

    }

    //print(gameRef.size.x);

    if(position.x > gameRef.size.x - 35) {
      //print('right boundry');
      //position.x = 35;  //Screen Wrap
      position.x = gameRef.size.x - 35;
      velocity = Vector2(0, velocity.y);
    }
    if(position.x  <  35 ) {
      //position.x = gameRef.screenSizeX - 35; //Screen Wrap
      position.x = 35;
      velocity = Vector2(0, velocity.y);
    }



    super.update(dt);


    current = BonoboState.walking;
  }


  void jumpRight() {
    velocity += Vector2(40, -200);
  }

  void jumpLeft() {
    velocity += Vector2(-40, -200);
  }

}