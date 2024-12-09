import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';

import 'offer_card.dart';

class HomeSliver extends StatefulWidget {
  const HomeSliver({super.key});

  @override
  State<HomeSliver> createState() => _HomeSliverState();
}

class _HomeSliverState extends State<HomeSliver> {
  bool _animateLocation = false;
  bool _animateAvatar = false;
  bool _animateName = false;
  bool _animateLine1 = false;
  bool _animateLine2 = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
      if (mounted) {
        setState(() {
          _animateAvatar = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 600));
      if (mounted) {
        setState(() {
          _animateLocation = true;
        });
      }
    });

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 800));
        if (mounted) {
          setState(() {
            _animateName = true;
          });
        }
        await Future.delayed(const Duration(milliseconds: 1000));
        if (mounted) {
          setState(() {
            _animateLine1 = true;
          });
        }
        await Future.delayed(const Duration(milliseconds: 200));
        if (mounted) {
          setState(() {
            _animateLine2 = true;
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
      child: Column(
        children: [
          SafeArea(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _animateLocation ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                         color: context.appColors.secondary,
                         borderRadius: BorderRadius.circular(8),

                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: context.appColors.onPrimary,
                        ),
                        Text(
                          'Saint Petersburg',
                          style: TextStyle(
                              color: context.appColors.onPrimary, fontSize: 16),
                        ),
                      ],
                    ),
                  )),
              AnimatedScale(
                duration: const Duration(milliseconds: 500),
                scale: _animateAvatar ? 1 : 0,
                child: Container(
                  height: 48,
                  width: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops:  [0.1, 0.6],
                      colors: [
                        Colors.red,
                        Colors.blue,
                      ],
                    ),
                  ),
                  child: Image.asset('assets/image/four.jpg'),
                ),
              ),
            ],
          )),
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _animateName ? 1 : 0,
              child: const  Text(
                'Hi, Marina',
                style: TextStyle(
                  color: Colors.cyan,
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _animateLine1 ? Offset.zero : const Offset(0, 1),
                child: const Text(
                  "let's select your",
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 500),
                offset: _animateLine2 ? Offset.zero : const Offset(0, 1),
                child: const Text(
                  'perfect place',
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 36),
          const Row(
            children: [
               Expanded(
                child: OfferCard(
                  title: 'BUY',
                  count: 1034, 
                  isCircle: true,
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                child: OfferCard(
                  title: 'RENT',
                  count: 2212,
                  isCircle: false,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}