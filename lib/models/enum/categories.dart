import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/generated/l10n.dart';

enum Categories {
  food,
  rent,
  transport,
  grocery,
  gift,
  medicine,
  entertainment,
  saving,
  more
}

extension CategoriesExt on Categories {
  String get title {
    switch(this) {
      case Categories.food:
        return S.current.category_food;
      case Categories.rent:
        return S.current.category_rent;
      case Categories.transport:
        return S.current.category_transport;
      case Categories.grocery:
        return S.current.category_grocery;
      case Categories.gift:
        return S.current.category_gift;
      case Categories.medicine:
        return S.current.category_medicine;
      case Categories.entertainment:
        return S.current.category_entertainment;
      case Categories.saving:
        return S.current.category_saving;
      case Categories.more:
        return S.current.category_more;
    }
  }

  String get iconPath {
    switch(this) {
      case Categories.food:
        return AppSVGs.food;
      case Categories.rent:
        return AppSVGs.rent;
      case Categories.transport:
        return AppSVGs.transport;
      case Categories.grocery:
        return AppSVGs.grocery;
      case Categories.gift:
        return AppSVGs.gift;
      case Categories.medicine:
        return AppSVGs.medicine;
      case Categories.entertainment:
        return AppSVGs.entertainment;
      case Categories.saving:
        return AppSVGs.saving;
      case Categories.more:
        return AppSVGs.add;
    }
  }
}