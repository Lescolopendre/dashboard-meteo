/*import 'package:flutter/material.dart';
import 'package:air_quality/air_quality.dart';

class airQuality extends StatelessWidget {
  String _key = '9e538456b2b85c92647d8b65090e29f957638c77';
  final AirQuality _airQuality;
  final List<AirQualityData> _data;

const airQuality({super.key,
  required this._airQuality
});
  @override

  Future download() async {
    _data = [];

    }

    /// Via city name (Munich)
    AirQualityData feedFromCity = await _airQuality.feedFromCity('munich');


    /// Via Geo Location (Berlin)
    AirQualityData feedFromGeoLocation =
    await _airQuality.feedFromGeoLocation(52.6794, 12.5346);

    // Update screen state
    setState(() {
      _data.add(feedFromCity);
    });

  Widget contentFinishedDownload() {
    return Center(
      child: ListView.separated(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_data[index].toString()),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(25),
        child: Column(children: [
          Text(
            'Fetching Air Quality...',
            style: TextStyle(fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
        ]));
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Press the button to download the Air Quality',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title!),
      ),
      body: showContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: download,
        tooltip: 'Download',
        child: Icon(Icons.cloud_download),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  }*/

