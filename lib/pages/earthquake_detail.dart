import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:flutter_map/src/layer/marker_layer.dart' as Marker;

class EarthquakeDetail extends StatefulWidget {
  double konumBilgisi;
  double konumBilgisison;

  EarthquakeDetail(
      {Key? key, required this.konumBilgisi, required this.konumBilgisison})
      : super(key: key);

  @override
  State<EarthquakeDetail> createState() => _EarthquakeDetailState();
}

class _EarthquakeDetailState extends State<EarthquakeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Depremle İlgili Detaylar"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                center:
                    latLng.LatLng(widget.konumBilgisison, widget.konumBilgisi),
                zoom: 10,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker.Marker(
                      point: latLng.LatLng(
                          widget.konumBilgisison, widget.konumBilgisi),
                      builder: (context)=> const Icon(Icons.pin_drop, size: 50,color: Colors.black,),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
