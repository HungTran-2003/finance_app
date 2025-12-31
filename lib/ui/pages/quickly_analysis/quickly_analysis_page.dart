import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/quickly_analysis/quickly_analysis_cubit.dart';
import 'package:finance_app/ui/pages/quickly_analysis/quickly_analysis_navigator.dart';
import 'package:finance_app/ui/widgets/app_bar/app_bar.dart';
import 'package:finance_app/ui/widgets/card/goal_card.dart';
import 'package:finance_app/ui/widgets/charts/app_financial_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalysisArgument {
  final String? topExpenseIconPath;
  final String? topExpenseName;
  final double? topExpenseAmount;
  final double? incomeLastWeek;

  AnalysisArgument({
    this.topExpenseIconPath= '',
    this.topExpenseName = '',
    this.topExpenseAmount = 0,
    this.incomeLastWeek = 0
  });
}

class QuicklyAnalysisPage extends StatelessWidget {
  final AnalysisArgument argument;

  const QuicklyAnalysisPage({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return QuicklyAnalysisCubit(navigator: QuicklyAnalysisNavigator(context: context));
      },
      child: QuicklyAnalysisChildPage(argument: argument),
    );
  }
}

class QuicklyAnalysisChildPage extends StatefulWidget {
  final AnalysisArgument argument;
  const QuicklyAnalysisChildPage({super.key, required this.argument});

  @override
  State<QuicklyAnalysisChildPage> createState() => _QuicklyAnalysisChildPageState();
}

class _QuicklyAnalysisChildPageState extends State<QuicklyAnalysisChildPage> {
  late QuicklyAnalysisCubit _cubit;

  @override
  void initState() {
    _cubit = BlocProvider.of<QuicklyAnalysisCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Quick Analysis"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50,),
          BlocBuilder<QuicklyAnalysisCubit, QuicklyAnalysisState>(
            buildWhen: (previous, current) {
              return previous.currentGoalIndex != current.currentGoalIndex;
            },
            builder: (context, state) {
              return GoalCard(
                topExpenseIconPath: widget.argument.topExpenseIconPath,
                topExpenseName: widget.argument.topExpenseName,
                topExpenseAmount: widget.argument.topExpenseAmount,
                incomeLastWeek: widget.argument.incomeLastWeek,
                iconTarget: state.savingGoals[state.currentGoalIndex!].iconPath,
                targetProgress: state.targetProgress
              );
            },
          )
        ],
      ),
    );
  }
}

