import 'package:flutter/material.dart';
import 'package:moniepoints_challenge/core/config/constants.dart';
import 'package:moniepoints_challenge/core/config/theme.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({
    super.key,
    required this.title,
    required this.count,
    required this.isCircle,
    this.color,
    this.textColor,
  });

  final String title;
  final int count;
  final Color? color;
  final Color? textColor;
  final bool isCircle;

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animateCount;

  bool _animateSize = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animateCount = StepTween(
      begin: 0,
      end: widget.count,
    ).animate(_animationController);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      if (mounted) {
        setState(() {
          _animateSize = true;
        });
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 500),
      scale: _animateSize ? 1 : 0,
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: widget.isCircle? BoxShape.circle : BoxShape.rectangle,
          color: widget.isCircle? context.appColors.primary: context.appColors.secondary ,
          borderRadius: widget.isCircle? null : BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  color: widget.isCircle? context.appColors.secondary: context.appColors.onPrimary ,
                ),
              ),
              const SizedBox(height: 24),
              AnimatedBuilder(
                  animation: _animateCount,
                  builder: (context, child) {
                    return FittedBox(
                      child: Text(
                        '${_animateCount.value}',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: widget.isCircle? context.appColors.secondary: context.appColors.onPrimary ,
                        ),
                      ),
                    );
                  }),
              Text(
                'offers',
                style: TextStyle(
                  color: widget.isCircle? context.appColors.secondary: context.appColors.onPrimary ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
