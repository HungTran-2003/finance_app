import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/ui/pages/analysis/analysis_page.dart';
import 'package:finance_app/ui/pages/category/category_page.dart';
import 'package:finance_app/ui/pages/home/home_page.dart';
import 'package:finance_app/ui/pages/main/widgets/tab_icons.dart';
import 'package:finance_app/ui/pages/profile/profile_page.dart';
import 'package:finance_app/ui/pages/transactions/transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  String get title {
    switch (this) {
      case MainTab.home:
        return 'Home';
      case MainTab.analysis:
        return 'Analysis';
      case MainTab.transactions:
        return 'Transactions';
      case MainTab.categories:
        return 'Categories';
      case MainTab.profile:
        return 'Profile';
    }
  }
}