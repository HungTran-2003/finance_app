import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_icon_button.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  final String userName;
  final String greeting;
  final VoidCallback onPress;
  const HeaderPage({
    super.key,
    required this.userName,
    required this.greeting,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).home_title_welcome(userName),
              style: AppTextStyles.blackGreenS20SemiBold,
            ),
            Text(greeting, style: AppTextStyles.blackGreenS14Regular),
          ],
        ),

        AppIconButton(
          asset: AppSVGs.notification,
          size: 24,
          onPressed: onPress,
          bgColor: Colors.white,
        ),
      ],
    );
  }
}
