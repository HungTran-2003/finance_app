import 'dart:developer';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/ui/pages/home/home_cubit.dart';
import 'package:finance_app/ui/pages/home/home_navigator.dart';
import 'package:finance_app/ui/pages/home/widgets/finalcial_overview/financial_overview_card.dart';
import 'package:finance_app/ui/pages/home/widgets/header_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) {
        return HomeCubit(navigator: HomeNavigator(context: context));
      },
      child: const HomeChildPage(),
    );
  }
}

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomeChildPageState();
}

class _HomeChildPageState extends State<HomeChildPage> {
  late HomeCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<HomeCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBodyPage());
  }

  Widget _buildBodyPage() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppDimens.marginNormal),
            child: Column(
              children: [
                HeaderPage(
                  userName: "Welcome Ngu Code",
                  greeting: "Good Morning",
                  onPress: () {
                    _cubit.test();
                  },
                ),
      
                const SizedBox(height: 40.0),
      
                BlocSelector<HomeCubit, HomeState, double?>(
                  selector: (state) => state.testPro,
                  builder: (context, value) {
                    return FinancialOverviewCard(
                      totalBalance: 7783,
                      totalExpense: 1187.40,
                      budgetLimit: 20000,
                      percentage: value,
                    );
                  },
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppDimens.cornerRadius),
                  topRight: Radius.circular(AppDimens.cornerRadius),
                ),
                color: AppColors.background
              ),
              margin: const EdgeInsets.all(0),
              child: Center(child: Text("heee")),
            ),
          )
        ],
      ),
    );
  }
}
