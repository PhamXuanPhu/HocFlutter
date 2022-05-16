// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Coin {
  Coin({
    this.id,
    this.name,
    this.image,
    this.currentPrice,
    this.marketCapRank,
    this.priceChangePercentage24h,
  });

  Coin.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    currentPrice = double.tryParse(json['current_price'].toString());
    marketCapRank = int.tryParse(json['market_cap_rank'].toString());
    priceChangePercentage24h = double.tryParse(json['price_change_percentage_24h'].toString());
  }
  @primaryKey
  String? id;
  String? name;
  String? image;
  double? currentPrice;
  int? marketCapRank;
  double? priceChangePercentage24h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['current_price'] = currentPrice;
    map['market_cap_rank'] = marketCapRank;
    map['price_change_percentage_24h'] = priceChangePercentage24h;
    return map;
  }

}