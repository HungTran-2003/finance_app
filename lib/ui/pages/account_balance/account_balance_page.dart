import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/models/enum/categories.dart';
import 'package:finance_app/models/enum/load_status.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_cubit.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_navigator.dart';
import 'package:finance_app/ui/widgets/app_bar/app_bar.dart';
import 'package:finance_app/ui/widgets/financial_overview/financial_overview_card.dart';
import 'package:finance_app/ui/widgets/item/item_transaction.dart';
import 'package:finance_app/ui/widgets/list/list_empty_widget.dart';
import 'package:finance_app/ui/widgets/list/list_loading_widget.dart';
import 'package:finance_app/ui/widgets/transaction_toggle/transaction_type_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBalancePage extends StatelessWidget {
  const AccountBalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountBalanceCubit>(
      create: (context) {
        return AccountBalanceCubit(
          navigator: AccountBalanceNavigator(context: context),
        );
      },
      child: const AccountBalanceChildPage(),
    );
  }
}

class AccountBalanceChildPage extends StatefulWidget {
  const AccountBalanceChildPage({super.key});

  @override
  State<AccountBalanceChildPage> createState() =>
      _AccountBalanceChildPageState();
}

class _AccountBalanceChildPageState extends State<AccountBalanceChildPage> {
  late AccountBalanceCubit _cubit;

  final DraggableScrollableController _controller =
      DraggableScrollableController();

  final GlobalKey _cardKey = GlobalKey();
  double _initialSheetSize = 0.5;

  void _expandSheet() {
    _controller.animateTo(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AccountBalanceCubit>();
    _setup();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateInitialSheetSize();
    });
  }

  void _calculateInitialSheetSize() {
    final RenderBox? cardBox =
        _cardKey.currentContext?.findRenderObject() as RenderBox?;
    final screenHeight = MediaQuery.of(context).size.height;
    if (cardBox != null) {
      final cardHeight = cardBox.size.height;
      final sheetHeight =
          screenHeight - cardHeight - AppDimens.appBarHeight - 20;
      final calculatedSize = sheetHeight / screenHeight;
      setState(() {
        _initialSheetSize = calculatedSize.clamp(0.4, 0.9);
      });
    }
  }

  void _setup(){
    _cubit.fetchDate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      appBar: AppBarWidget(
        title: S.of(context).account_balance_title,
        isBack: true,
        onPressBack: () {
          _cubit.navigator.pop();
        },
        onPressAction: () {
          print("Notification");
        },
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                key: _cardKey,
                margin: const EdgeInsets.symmetric(
                  horizontal: AppDimens.marginNormal,
                ),
                child: FinancialOverviewCard(
                  totalBalance: 7783,
                  totalExpense: 1187.40,
                  budgetLimit: 20000,
                  percentage: 0.3,
                  child: Column(
                    children: [
                      const SizedBox(height: 24.0),
                      Row(
                        children: [
                          Expanded(
                            child: TransactionTypeToggle(
                              label: S.of(context).label_income,
                              value: 3000,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TransactionTypeToggle(
                              label: S.of(context).label_expense,
                              isIncome: false,
                              value: 3000,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
          _buildDraggableSheet(),
        ],
      ),
    );
  }

  Widget _buildDraggableSheet() {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: _initialSheetSize,
      minChildSize: _initialSheetSize,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppDimens.cornerRadius),
              topRight: Radius.circular(AppDimens.cornerRadius),
            ),
            color: AppColors.background,
          ),
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transactions",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: _expandSheet,
                    child: Text(
                      "See all",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: _buildListTransaction(scrollController),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListTransaction(ScrollController scrollController) {
    return BlocBuilder<AccountBalanceCubit, AccountBalanceState>(
      buildWhen: (previous, current) {
        return previous.loadStatus != current.loadStatus;
      },
      builder: (context, state) {
        if (state.loadStatus == LoadStatus.loading) {
          return const ListLoadingWidget();
        } else if (state.loadStatus == LoadStatus.failure){
          return const Text("Error");
        } else if (state.transactions.isEmpty){
          return const ListEmptyWidget();
        } return ListView.separated(
          controller: scrollController,
          itemCount: state.transactions.length,
          itemBuilder: (context, index) {
            final transactions = state.transactions;
            return ItemTransaction(
              category: transactions[index].category?? Categories.more,
              date: transactions[index].createAt ?? DateTime.now(),
              title: transactions[index].title ?? "",
              amount: transactions[index].amount ?? 0.0,
              isIncome: transactions[index].isIncome ?? false,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8.0);
          },
        );
      },
    );
  }
}
