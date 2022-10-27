import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
      Location location = Location();
      location.getCurrentLocation();
      print(location.latitude);
      print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
