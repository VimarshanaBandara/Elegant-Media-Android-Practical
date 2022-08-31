import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myproject/constansts/color_const.dart';
import 'package:myproject/models/post_model.dart';

//details page
class MapScreen extends StatefulWidget {
  final Post model;

  const MapScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  late CameraPosition _kGooglePlex;
  @override
  void initState() {
    _kGooglePlex = CameraPosition(
      target: LatLng(double.parse(widget.model.latitude), -122.085749655962),
      zoom: 14.4746,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: kdefualtfontcolor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            "Map",
            style: TextStyle(
                color: kdefualtfontcolor.withOpacity(0.8),
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.w700),
          ),
        ),
        elevation: 0,
        backgroundColor: kprimaryColor,
      ),
      body: SingleChildScrollView(
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
