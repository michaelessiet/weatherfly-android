import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weatherfly/api/api_request.dart';
import 'package:weatherfly/pages/home.dart';
import 'package:weatherfly/state%20management/state.dart';
import 'package:location/location.dart';
import 'package:weatherfly/state%20management/state_mutation.dart';

void main() {
  runApp(VxState(
    store: StateStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GeneralContainer(),
    );
  }
}

class GeneralContainer extends StatefulWidget {
  @override
  _GeneralContainerState createState() => _GeneralContainerState();
}

class _GeneralContainerState extends State<GeneralContainer> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Location locationservice = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  getLocationData() async {
    _serviceEnabled = await locationservice.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await locationservice.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await locationservice.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await locationservice.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await locationservice.getLocation();
    CoordinateFixer(lat: _locationData.latitude, long: _locationData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [CoordinateFixer]);
    StateStore store = VxState.store;
    return Scaffold(
      appBar: null,
      body: HomePage(),
      
    );
  }
}
