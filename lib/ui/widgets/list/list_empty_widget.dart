import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListEmptyWidget extends StatelessWidget {
  final String? text;
  final String? iconPath;

  const ListEmptyWidget({super.key,
    this.text,
    this.iconPath = AppSVGs.wallet,
  });


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8.0,
        children: [
          SvgPicture.asset(iconPath!, width: 40, fit: BoxFit.fitWidth,),

          Text(text ?? S.of(context).empty_transaction, style: AppTextStyles.blackGreenS15Medium,),
        ],
      ),
    );
  }
}
