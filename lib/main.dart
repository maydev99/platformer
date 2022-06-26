
import 'package:Platformer/game_main.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setPortrait();
  Wakelock.enable();
  await GetStorage.init();
  GameMain gameMain = GameMain();
  runApp(GameWidget(game: gameMain));

 /* runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => GameDataProvider())],
    child: const Splash(),
  ));*/
}