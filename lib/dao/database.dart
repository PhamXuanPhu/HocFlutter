import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../models/coin.dart';
import 'coindao.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Coin])
abstract class AppDatabase extends FloorDatabase {
  CoinDao get coinDao;
}