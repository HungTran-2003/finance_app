import 'dart:async';
import 'dart:developer';

import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:flutter/material.dart';

class AppLoadingOverPlay extends StatefulWidget {
  final String label;
  final LoadStatus state;
  const AppLoadingOverPlay({
    super.key,
    required this.label,
    required this.state,
  });

  @override
  State<AppLoadingOverPlay> createState() => _AppLoadingOverPlayState();
}

class _AppLoadingOverPlayState extends State<AppLoadingOverPlay> {
  int _dotCount = 1;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void didUpdateWidget(AppLoadingOverPlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Xử lý logic khi trạng thái thay đổi từ bên ngoài
    if (widget.state == LoadStatus.loading && _timer == null) {
      _startTimer();
    } else if (widget.state != LoadStatus.loading) {
      _stopTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        _dotCount = (_dotCount % 3) + 1;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
    log("dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            alignment: Alignment.center,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _buildContent(),
            ),
          ),
          const SizedBox(height: 30),
          Text(widget.label, style: AppTextStyles.whiteS20SemiBold, textAlign: TextAlign.center,),
        ],
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.state) {
      case LoadStatus.success:
        return Icon(Icons.check, key: const ValueKey('success'), size: 45, color: Colors.white,);
      case LoadStatus.failure:
        return Icon(Icons.close, key: const ValueKey('error'), size: 45, color: Colors.white,);
      case LoadStatus.loading:
        return Row(
          key: const ValueKey('loading'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(1),
            const SizedBox(width: 9),
            _buildDot(2),
            const SizedBox(width: 9),
            _buildDot(3),
          ],
        );
      default:
        return Container();
    }
  }

  Widget _buildDot(int index) {
    bool isVisible = index <= _dotCount;
    return Container(
      width: 13,
      height: 13,
      decoration: BoxDecoration(
        color: isVisible ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
    );
  }
}
