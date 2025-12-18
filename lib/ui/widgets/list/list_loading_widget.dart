import 'package:finance_app/ui/widgets/loading/app_loading_indicator.dart';
import 'package:flutter/material.dart';

class ListLoadingWidget extends StatelessWidget {
  const ListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppLoadingIndicator(),
    );
  }
}
