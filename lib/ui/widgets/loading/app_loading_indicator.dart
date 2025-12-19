import 'dart:async';

import 'package:finance_app/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatefulWidget {
  final String? label;
  final double? size;
  final TextStyle? textStyle;

  const AppLoadingIndicator({
    super.key,
    this.label,
    this.size = 50.0,
    this.textStyle,
  });

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator> {
  int _dotCount = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount % 3) + 1;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 4),
      ),
      alignment: Alignment.center,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.size! / 5),
      child: Row(
        key: const ValueKey('loading'),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDot(1),
          _buildDot(2),
          _buildDot(3),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    bool isVisible = index <= _dotCount;
    return Container(
      width: widget.size! / 8 ,
      height: widget.size! / 8,
      decoration: BoxDecoration(
        color: isVisible ? AppColors.primary : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}