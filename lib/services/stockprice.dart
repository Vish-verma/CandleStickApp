
import 'dart:math';

import 'package:candlestickapp/models/stockinfo.dart';

class CandleStickService{
  List<StockInfo> sampleData = [
      new StockInfo(open: 50.0,high: 100.0,low: 40.0,volumeto: 5000.0,close: 80),
      new StockInfo(open: 80.0,high: 90.0,low: 55.0,volumeto: 4000.0,close: 65),
      new StockInfo(open: 65.0,high: 130.0,low: 60.0,volumeto: 7000.0,close: 90),
      new StockInfo(open: 90.0,high: 95.0,low: 85.0,volumeto: 2000.0,close: 80),
      new StockInfo(open: 80.0,high: 85.0,low: 40.0,volumeto: 3000.0,close: 50),
    ];
  
  Stream<List> timedCounter(Duration interval,[int maxCount]) async* {
  int i=0;
  while (true) {
    i++;
    await Future.delayed(interval);
    var rng = new Random();
    int val = 100;
    int volume=10000;
    StockInfo stockInfo = new StockInfo(
      open:  rng.nextInt(val).toDouble(),
      high: rng.nextInt(val).toDouble(),
      low: rng.nextInt(val).toDouble(),
      close: rng.nextInt(val).toDouble(),
      volumeto: rng.nextInt(volume).toDouble(),
    );
    
    if (i == maxCount) break;
    print("Hello");
    sampleData.add(stockInfo);
    yield sampleData.map((obj){
      return {"open":obj.open,"close":obj.close,"high":obj.high,"volumeto":obj.volumeto,"low":obj.low};
    }
    ).toList().getRange(sampleData.length>10?sampleData.length-10:0 , sampleData.length).toList();
  }
}

}