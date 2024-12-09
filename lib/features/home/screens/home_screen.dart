import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';
import 'package:moniepoints_challenge/features/home/widget/home_sliver.dart';
import 'package:moniepoints_challenge/features/home/widget/offer_card.dart';

import '../widget/listing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white.withOpacity(0.1), context.appColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 0.9])),
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext headerContext, bool boolean) {
            return [
              const SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 460,
                flexibleSpace: FlexibleSpaceBar(
                  background: HomeSliver(),
                ),
              )
            ];
          },
          body: const Listings()),
    );
  }
}


