import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import '../widget/map_marker.dart';


typedef MenuItem = ({IconData icon, String title});

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _mapController = Completer<GoogleMapController>();
  String _mapStyle = '';
  bool _animateItems = false;
  bool _animatePopUp = false;

  Future<void> _loadMapStyle() async {
    final String style =
        await rootBundle.loadString('assets/files/map_style.json');
    setState(() {
      _mapStyle = style;
    });
    
  }

  
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(4.9993725449602895, 7.941187993944094),
    zoom: 16,
  );

  final Set<Marker> _markers = {};

  static List<MenuItem> menuItems = [
    ( icon: Icons.check_circle_outlined, title: 'Cosy areas'),
    ( icon: Icons.account_balance_wallet_outlined, title: 'Price'),
    ( icon: CupertinoIcons.cart, title: 'Infrastructure'),
    ( icon: Icons.layers, title: 'Without any layer'),
  ];

  

  bool changeTo = false;

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
   
  }

  Future<void> _addMarkers() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _markers.addAll({
      Marker(
        markerId: const MarkerId('marker_1'),
        position: const LatLng(4.999165275916898, 7.938216743633201), 
        icon: await const MapMarker(title: '13,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_2'),
        position: const LatLng(5.003041693148138, 7.938541510164674),
        icon: await const MapMarker(title: '10,3 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_3'),
        position: const LatLng(5.001701491619078, 7.939510256900327),
        icon: await const MapMarker(title: '11 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_4'),
        position: const LatLng(5.000870104679916, 7.943502540130288),
        icon: await const MapMarker(title: '7,8 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_5'),
        position: const LatLng(4.998397921025181, 7.943266567619433),
        icon: await const MapMarker(title: '8,5 mn P').toBitmapDescriptor(),
      ),
      Marker(
        markerId: const MarkerId('marker_6'),
        position: const LatLng(4.996025471344758, 7.941850923394112),
        icon: await const MapMarker(title: '6,95 mn P',).toBitmapDescriptor(),
      )
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            style: _mapStyle,
            markers: _markers,
           // mapType: MapType.hybrid,
            onMapCreated: (GoogleMapController controller) async {
              _mapController.complete(controller);
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                await Future.delayed(const Duration(milliseconds: 1000));
                if (mounted) {
                  setState(() {
                    _animateItems = true;
                  });
                }
              });
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                await _addMarkers();
                if (mounted) {
                  setState(() {});
                }
              });
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.appColors.secondary,
                              borderRadius: BorderRadius.circular(40)),
                          child: TextField(
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                hintText: 'Saint Petersburg',
                                hintStyle:
                                    TextStyle(color: context.appColors.tertiary),
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: context.appColors.tertiary,
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.appColors.secondary,
                            shape: BoxShape.circle),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            Icons.swap_horiz,
                            color: context.appColors.tertiary,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: AnimatedScale(
                        scale: _animateItems ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _animatePopUp = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: context.appColors.shadow,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(Icons.account_balance_wallet,
                                  color: context.appColors.secondary),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _animatePopUp = false;
                        });
                      },
                      child: AnimatedScale(
                        alignment: Alignment.bottomLeft,
                        scale: _animatePopUp ? 1 : 0,
                        duration: const Duration(milliseconds: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: context.appColors.secondary,
                              borderRadius: BorderRadius.circular(24)),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: 
                               List.generate(menuItems.length, ((index){
                              return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        menuItems[index].icon,
                                        color: index == 1
                                            ? context.appColors.primary
                                            : context.appColors.onPrimary.withOpacity(.5),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        menuItems[index].title,
                                        style: TextStyle(
                                            color: index == 1
                                                ? context.appColors.primary
                                                : context.appColors.onPrimary.withOpacity(.5)),
                                      ),
                                    ],
                                  ),
                                );
                               })),
                              
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 4),
                        AnimatedScale(
                          scale: _animateItems ? 1 : 0,
                          duration: const Duration(milliseconds: 700),
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    context.appColors.shadow,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Icon(Icons.arrow_outward,
                                  color: context.appColors.secondary),
                            ),
                          ),
                        )
                      ],
                    ),
                    AnimatedScale(
                      scale: _animateItems ? 1 : 0,
                      duration: const Duration(milliseconds: 700),
                      child: Container(
                        decoration: BoxDecoration(
                            color: context.appColors.shadow,
                            borderRadius: BorderRadius.circular(28)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 12, bottom: 12, left: 18, right: 18),
                          child: Row(
                            children: [
                              Icon(Icons.menu, color: context.appColors.secondary),
                              const SizedBox(width: 10),
                              Text(
                                'List of variants',
                                style: TextStyle(color: context.appColors.secondary),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: kBottomNavigationBarHeight * 1.4),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
