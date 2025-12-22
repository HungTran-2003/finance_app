import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/models/entities/transaction.dart';
import 'package:finance_app/models/enum/categories.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/models/enum/time.dart';
import 'package:finance_app/ui/pages/home/home_cubit.dart';
import 'package:finance_app/ui/pages/home/home_navigator.dart';
import 'package:finance_app/ui/pages/home/widgets/goal_card.dart';
import 'package:finance_app/ui/pages/home/widgets/header_page.dart';
import 'package:finance_app/ui/widgets/financial_overview/financial_overview_card.dart';
import 'package:finance_app/ui/widgets/item/item_transaction.dart';
import 'package:finance_app/ui/widgets/list/list_empty_widget.dart';
import 'package:finance_app/ui/widgets/list/list_loading_widget.dart';
import 'package:finance_app/ui/widgets/menu/app_switch_menu.dart';
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

    setup();
  }

  void setup() {
    _cubit.getTransactionsWithTime();
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
                  userName: "Ngu Code",
                  greeting: "Good Morning",
                  onPress: () {
                    _cubit.test();
                  },
                ),

                const SizedBox(height: 24.0),

                BlocSelector<HomeCubit, HomeState, double?>(
                  selector: (state) => state.testPro,
                  builder: (context, value) {
                    return FinancialOverviewCard(
                      totalBalance: 7783,
                      totalExpense: 1187.40,
                      budgetLimit: 20000,
                      percentage: value,
                      onPress: () {
                        _cubit.navigator.openAccountBalancePage();
                      },
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
                color: AppColors.background,
              ),
              margin: const EdgeInsets.all(0),
              child: Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GoalCard(
                        topExpenseIconPath: AppSVGs.car,
                        topExpenseName: "Car",
                        topExpenseAmount: 1200,
                        incomeLastWeek: 4000,
                        targetProgress: 0.3,
                      ),
                      const SizedBox(height: 16.0),

                      BlocSelector<HomeCubit, HomeState, int>(
                        selector: (state) => state.page!,
                        builder: (context, value) {
                          return AppSwitchMenu(
                            itemsName: TimeFrame.values.map((e) => e.title).toList(),
                            currentIndex: value,
                            itemPress: (index) {
                              _cubit.changePage(index);
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 16.0),

                      BlocSelector<HomeCubit, HomeState, LoadStatus>(
                        selector: (state) => state.loadStatus,
                        builder: (context, value) {
                          switch (value) {
                            case LoadStatus.initial:
                              return Container();
                            case LoadStatus.loading:
                              return const ListLoadingWidget();
                            default:
                              if (_cubit.state.transactions.isEmpty) {
                                return ListEmptyWidget();
                              }
                              return _buildListTransaction(
                                _cubit.state.transactions,
                              );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTransaction(List<TransactionEntity> transactions) {
    return Column(
      children: List.generate(transactions.length, (index) {
        return ItemTransaction(
          category: transactions[index].category?? Categories.more,
          date: transactions[index].createAt ?? DateTime.now(),
          title: transactions[index].title ?? "",
          amount: transactions[index].amount ?? 0.0,
          isIncome: transactions[index].isIncome ?? false,
        );
      })
    );
  }
}
