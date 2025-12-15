import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppTextSpan extends StatelessWidget {
  final String rawText;
  final TextStyle defaultStyle;
  final List<TextStyle> styles;
  final List<String> texts;
  final List<VoidCallback>? onPress;

  const AppTextSpan({
    super.key,
    required this.rawText,
    required this.styles,
    required this.texts,
    this.onPress = const [],
    required this.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(style: defaultStyle, children: _buildChildTextSpan()),
    );
  }

  List<TextSpan> _buildChildTextSpan() {
    if (texts.isEmpty) return [];
    if (styles.length != texts.length) return [];

    final List<TextSpan> spans = [];
    final RegExp exp = RegExp(r'<(\w+)>');
    int index = 0;
    rawText.splitMapJoin(
      exp,
      onMatch: (_) {
        if (index < texts.length) {
          spans.add(
              TextSpan(
                text: texts[index],
                style: styles[index],
                recognizer: TapGestureRecognizer()..onTap = index < onPress!.length ? onPress![index] : null,
              ));
        index++;
        }
        return "";
      },
      onNonMatch: (text) {
        spans.add(TextSpan(text: text));
        return "";
      },
    );
    return spans;
  }
}
