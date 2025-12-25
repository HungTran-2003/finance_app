import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/ui/pages/analysis/analysis_page.dart';
import 'package:finance_app/ui/pages/category/category_page.dart';
import 'package:finance_app/ui/pages/home/home_page.dart';
import 'package:finance_app/ui/pages/profile/profile_page.dart';
import 'package:finance_app/ui/pages/transactions/transaction_page.dart';
import 'package:flutter/material.dart';

enum MainTab {
  home,
  analysis,
  transactions,
  categories,
  profile,
}


extension MainTabExtension on MainTab {
  Widget get page {
    switch (this) {
      case MainTab.home:
        return const HomePage();
      case MainTab.analysis:
        return const AnalysisPage();
      case MainTab.transactions:
        return const TransactionPage();
      case MainTab.categories:
        return const CategoryPage();
      case MainTab.profile:
        return const ProfilePage();
    }
  }

  String get asset {
    switch (this) {
      case MainTab.home:
        return AppSVGs.home;
      case MainTab.analysis:
        return AppSVGs.analysis;
      case MainTab.transactions:
        return AppSVGs.transaction;
      case MainTab.categories:
        return AppSVGs.category;
      case MainTab.profile:
        return AppSVGs.profile;
    }
  }

  String get name {
    switch (this) {
      case MainTab.home:
        return 'home';
      case MainTab.analysis:
        return 'analysis';
      case MainTab.transactions:
        return 'transactions';
      case MainTab.categories:
        return 'categories';
      case MainTab.profile:
        return 'profile';
    }
  }
}