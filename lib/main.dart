import 'package:candlestickapp/models/stockinfo.dart';
import 'package:candlestickapp/services/stockprice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_candlesticks/flutter_candlesticks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(Launch());

class Launch extends StatefulWidget {
  @override
  _LaunchState createState() => _LaunchState();
}

class _LaunchState extends State<Launch> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            elevation: 5.0,
          title: Text(
          "CandleSticks",
            style: TextStyle(
               color: Colors.white
              ),
            ),
          ),
        body: MyApp(),
        backgroundColor: Colors.grey[300],
        ),
      );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// class _MyAppState extends State<MyApp> {

//     List sampleData = [
//       {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
//       {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
//       {"open":65.0, "high":130.0, "low":60.0, "close":90, "volumeto":7000.0},
//       {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
//       {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
//     ];

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//             child: Container(
//               color: Colors.lightBlueAccent[800],
//               child: OHLCVGraph(data: sampleData, enableGridLines: true, volumeProp: 0.2),
//                 constraints: BoxConstraints(
//                 maxHeight: 300.0,
//                 maxWidth: 350.0,
//                 minWidth: 150.0,
//                 minHeight: 150.0
//         ),
//         ),
//     );
//   }
// }

class _MyAppState extends State<MyApp> {

    // List sampleData = [
    //   {"open":50.0, "high":100.0, "low":40.0, "close":80, "volumeto":5000.0},
    //   {"open":80.0, "high":90.0, "low":55.0, "close":65, "volumeto":4000.0},
    //   {"open":65.0, "high":130.0, "low":60.0, "close":90, "volumeto":7000.0},
    //   {"open":90.0, "high":95.0, "low":85.0, "close":80, "volumeto":2000.0},
    //   {"open":80.0, "high":85.0, "low":40.0, "close":50, "volumeto":3000.0},
    // ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
      stream: new CandleStickService().timedCounter(Duration(
        seconds: 5
      ),100),
      builder: (context,snap){
        if(snap.hasData){
          List stockData = snap.data;
           return Center(
            child: Container(
              // color: Colors.white,
              child: OHLCVGraph(
                data: stockData, enableGridLines: true, volumeProp: 0.2,gridLineAmount: 10,),
                constraints: BoxConstraints(
                maxHeight: 300.0,
                maxWidth: 350.0,
                minWidth: 150.0,
                minHeight: 150.0
        ),
        ),
    );
        }
        else{
          return Container(
      color: Colors.brown[100],
      child: Center(
        child:SpinKitCubeGrid(
          color: Colors.grey,
          size: 50.0,
        ) ,
      )
    );
        }
      },
    );
  }
}