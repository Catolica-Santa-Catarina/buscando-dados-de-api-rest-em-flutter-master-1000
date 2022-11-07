import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '520d22fc8fe657078523a94c02959426';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
    late double latitude;
    late double longitude;

    @override
    void initState() {
       super.initState();
       getLocation();
    }

    void pushToLocationScreen(dynamic weatherData) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(localWeatherData: weatherData);
      }));
    }

    void getData() async {
      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/'
          'data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      this.pushToLocationScreen();
    }

    Future<void> getLocation() async {
      var location = Location();
      location.getCurrentLocation();

      latitude = location.latitude;
      longitude = location.longitude;

      getData();
    }

    @override
    Widget build(BuildContext context) {
      getData();
      return const Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      );
    }

}
