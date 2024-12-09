import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';

class SlidingAddress extends StatefulWidget {
  const SlidingAddress({super.key, required this.address, required this.alignment});
  final String address;
  final Alignment alignment;
  @override
  State<SlidingAddress> createState() => _SlidingAddressState();
}

class _SlidingAddressState extends State<SlidingAddress> {
  bool _animateButton = false;
  bool _animateAddress = false;

@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final delay = Random().nextInt(1000) + 3700;
      await Future.delayed(Duration(milliseconds: delay));
      if (mounted) {
        setState(() {
          _animateButton = true;
        });
      }
      await Future.delayed(const Duration(milliseconds: 400));
      if (mounted) {
        setState(() {
          _animateAddress = true;
        });
      }
    });
}
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: 45,
        width: _animateButton ? constraints.maxWidth : 40,
        decoration: const  BoxDecoration(
            borderRadius:  BorderRadius.all(Radius.circular(30)),
            color: Colors.white70),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
            child: LayoutBuilder(builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    alignment: widget.alignment,
                    child: AnimatedOpacity(
                      opacity: _animateAddress ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(widget.address),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    right: _animateButton ? 0 : constraints.maxWidth - 40,
                    duration: const Duration(milliseconds: 400),
                    child: Container(
                      padding: const EdgeInsets.only(right: 1, top: 2),
                      child:  CircleAvatar(
                        radius: 21,
                        backgroundColor: context.appColors.secondary,
                        child: Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: context.appColors.onPrimary,
                          size: 16,
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}