import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/widgets/app_bar/app_bar.dart';
import 'package:finance_app/ui/widgets/charts/app_financial_chart.dart';
import 'package:flutter/material.dart';

class QuicklyAnalysisPage extends StatelessWidget {
  const QuicklyAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<double> incomes = [1400, 2440, 01111, 400, 4300];
    final label = ["Jan", "Feb", "Mar", "Apr", "May"];
    final List<double> expenses = [150, 1200, 2150, 2010, 2510];

    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBarWidget(
        title: S.of(context).account_balance_title,
        isBack: true,
        onPressBack: () {
        },
        onPressAction: () {
          print("Notification");
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: AppFinancialChart(title: "tesst", incomes: incomes, expenses: expenses, label: label),
      ),
    );
  }
}
