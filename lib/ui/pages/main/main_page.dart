import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/models/enum/main_tab.dart';
import 'package:finance_app/ui/pages/main/main_cubit.dart';
import 'package:finance_app/ui/pages/main/main_navigator.dart';
import 'package:finance_app/ui/pages/main/widgets/tab_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return MainCubit(navigator: MainNavigator(context: context));
      },
      child: MainChildPage(),
    );
  }
}

class MainChildPage extends StatefulWidget {
  const MainChildPage({super.key});

  @override
  State<MainChildPage> createState() => _MainChildPageState();
}

class _MainChildPageState extends State<MainChildPage> {
  final List<Widget> pageList = MainTab.values.map((e) => e.page).toList();
  final PageController pageController = PageController();

  late MainCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyPage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBodyPage() {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      // onPageChanged: (index) {
      //   _cubit.switchTap(index);
      //   log("page$index");
      // },
      children: pageList,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BlocConsumer<MainCubit, MainState>(
      bloc: _cubit,
      listenWhen: (prev, current) {
        return prev.selectedIndex != current.selectedIndex;
      },
      listener: (context, state) {
        log("selectedIndex: ${state.selectedIndex}");
        pageController.jumpToPage(state.selectedIndex);
      },
      buildWhen: (prev, current) {
        return prev.selectedIndex != current.selectedIndex;
      },
      builder: (context, state) {
        return Container(
          height: 108.0,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(70.0),
              topRight: Radius.circular(70.0),
            ),
          ),
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(MainTab.values.length, (index) {
              return InkWell(
                onTap: () {
                 _cubit.switchTap(index);
                 log("tap$index");
                },
                borderRadius: BorderRadius.circular(22),
                child: TabIcons(
                  asset: MainTab.values[index].asset,
                  isSelected: state.selectedIndex == index,
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
