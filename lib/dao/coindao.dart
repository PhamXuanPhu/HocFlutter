import 'package:floor/floor.dart';
import '../models/coin.dart';

@dao
abstract class CoinDao {
  @Query('SELECT * FROM Coin')
  Future<List<Coin>> findAllCoins();

  @Query('SELECT * FROM Coin WHERE id = :id')
  Future<Coin?> findCoinById(String id);

  @insert
  Future<void> insertCoin(Coin coin);

  @delete
  Future<void> deleteCoin(Coin coin);
}