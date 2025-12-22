import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_dimens.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_cubit.dart';
import 'package:finance_app/ui/pages/account_balance/account_balance_navigator.dart';
import 'package:finance_app/ui/widgets/app_bar/app_bar.dart';
import 'package:finance_app/ui/widgets/financial_overview/financial_overview_card.dart';
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

  void _expandSheet() {
    // Hàm này sẽ được gọi khi bấm "See all"
    // animateTo: 1.0 nghĩa là trồi lên full màn hình (hoặc maxChildSize)
    _controller.animateTo(
      0.9, // Chiều cao mong muốn (90% màn hình)
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _cubit = context.read<AccountBalanceCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ],
          ),
          _buildListTransaction(),
        ],
      ),
    );
  }

  Widget _buildListTransaction() {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 0.5,
      minChildSize: 0.5,
      maxChildSize: 0.8,
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // NÚT SEE ALL
                  GestureDetector(
                    onTap: _expandSheet, // Gọi hàm mở rộng sheet
                    child: Text(
                      "See all",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Transaction $index"),
                      subtitle: Text("Description"),
                      trailing: Text("-\$100.00"),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
