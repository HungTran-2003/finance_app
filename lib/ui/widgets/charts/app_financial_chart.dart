import 'dart:math';

import 'package:finance_app/common/app_colors.dart';
import 'package:finance_app/common/app_svgs.dart';
import 'package:finance_app/common/app_text_styles.dart';
import 'package:finance_app/ui/widgets/app_buttons/app_icon_button.dart';
import 'package:flutter/material.dart';

class AppFinancialChart extends StatelessWidget {
  final String title;
  final List<double> incomes;
  final List<double> expenses;
  final List<String> label;

  const AppFinancialChart({
    super.key,
    required this.title,
    required this.incomes,
    required this.expenses,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final double maxIncome = incomes.isEmpty ? 0 : incomes.reduce(max);
    final double maxExpense = expenses.isEmpty ? 0 : expenses.reduce(max);
    final double maxValue = max(maxIncome, maxExpense);

    return Container(
      height: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.subTitle),
              _buildButtonRight(),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: _BarChartPainter(
                incomes: incomes,
                expenses: expenses,
                xLabels: label,
                maxValue: maxValue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonRight() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIconButton(
          asset: AppSVGs.search,
          size: 16,
          bgColor: AppColors.primary,
          onPressed: () => print("click search"),
        ),
        const SizedBox(width: 4),
        AppIconButton(
          asset: AppSVGs.calendar,
          size: 16,
          bgColor: AppColors.primary,
          onPressed: () => print("click calendar"),
        ),
      ],
    );
  }
}

class _BarChartPainter extends CustomPainter {
  final List<double> incomes;
  final List<double> expenses;
  final List<String> xLabels;
  final double maxValue;

  late final _YAxisConfig yAxisConfig;

  final double yLabelAreaWidth = 30.0;
  final double xLabelAreaHeight = 30.0;

  _BarChartPainter({
    required this.incomes,
    required this.expenses,
    required this.xLabels,
    required this.maxValue,
  }) {
    yAxisConfig = _YAxisConfig.calculate(maxValue);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (incomes.isEmpty || expenses.isEmpty) return;

    final double chartHeight = size.height - xLabelAreaHeight;
    final double chartWidth = size.width - yLabelAreaWidth;

    _drawGridAndYLabels(canvas, size, chartHeight, chartWidth);
    _drawBarsAndXLabels(canvas, size, chartHeight, chartWidth);
  }

  void _drawGridAndYLabels(Canvas canvas, Size size, double chartHeight, double chartWidth) {
    final gridPaint = Paint()
      ..color = AppColors.btLightBlue
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final yStep = chartHeight / yAxisConfig.labels.length;

    for (int i = 0; i <= yAxisConfig.labels.length; i++) {
      double y = yStep * i;

      if (i < yAxisConfig.labels.length) {
        _drawDashedLine(canvas, Offset(yLabelAreaWidth, y), Offset(size.width, y), gridPaint);
      } else {
        canvas.drawLine(
          Offset(yLabelAreaWidth, y), Offset(size.width, y),
          Paint()..color = Colors.black87..strokeWidth = 1.5,
        );
      }

      if (i < yAxisConfig.labels.length) {
        final label = yAxisConfig.labels[i];
        _drawText(canvas, label, Offset(0, y - 8),
            style: AppTextStyles.subText.copyWith(color: AppColors.btLightBlue));
      }
    }
  }

  void _drawBarsAndXLabels(Canvas canvas, Size size, double chartHeight, double chartWidth) {
    final barWidth = 6.0;
    final barSpacing = 4.0;
    final xStep = chartWidth / xLabels.length;

    final barPaintInCome = Paint()..color = AppColors.primary;
    final barPaintExpense = Paint()..color = AppColors.oceanBlue;

    for (int i = 0; i < xLabels.length; i++) {
      double anchorX = yLabelAreaWidth + (i * xStep) + (xStep / 2);

      _drawText(canvas, xLabels[i], Offset(0, 0), alignCenter: true, centerAnchor: Offset(anchorX, chartHeight + 10));

      double x1 = anchorX - barWidth - (barSpacing / 2);
      double x2 = anchorX + (barSpacing / 2);

      double h1 = (incomes[i] / yAxisConfig.maxChartValue) * chartHeight;
      double h2 = (expenses[i] / yAxisConfig.maxChartValue) * chartHeight;

      h1 = h1.isNegative ? 0 : h1;
      h2 = h2.isNegative ? 0 : h2;

      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x1, chartHeight - h1, barWidth, h1), const Radius.circular(4)),
        barPaintInCome,
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x2, chartHeight - h2, barWidth, h2), const Radius.circular(4)),
        barPaintExpense,
      );
    }
  }

  void _drawDashedLine(Canvas canvas, Offset p1, Offset p2, Paint paint) {
    var max = (p2.dx - p1.dx).abs();
    var dashWidth = 4.0;
    var dashSpace = 4.0;
    double currentX = 0;
    while (currentX < max) {
      canvas.drawLine(Offset(p1.dx + currentX, p1.dy), Offset(p1.dx + currentX + dashWidth, p1.dy), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  void _drawText(
      Canvas canvas,
      String text,
      Offset offset, {
        TextStyle? style = AppTextStyles.subText,
        bool alignCenter = false,
        Offset? centerAnchor,
      }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    if (alignCenter && centerAnchor != null) {
      final newOffset = Offset(centerAnchor.dx - textPainter.width / 2, centerAnchor.dy);
      textPainter.paint(canvas, newOffset);
    } else {
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


class _YAxisConfig {
  final double maxChartValue;
  final List<String> labels;

  _YAxisConfig({required this.maxChartValue, required this.labels});

  static _YAxisConfig calculate(double maxValue) {
    if (maxValue <= 0) {
      return _YAxisConfig(maxChartValue: 1000, labels: ['1k', '750', '500', '250']);
    }

    final double stepValue = _calculateNiceStep(maxValue / 4);
    final double maxChartValue = stepValue * 4;

    final labels = List.generate(4, (index) {
      final value = maxChartValue - (stepValue * index);
      return _formatCompact(value);
    });

    return _YAxisConfig(maxChartValue: maxChartValue, labels: labels);
  }

  static double _calculateNiceStep(double roughStep) {
    final int exponent = (log(roughStep) / log(10)).floor();
    final double base = pow(10, exponent).toDouble();
    final List<double> niceSteps = [1 * base, 1.5 * base, 2 * base, 2.5 * base, 5 * base, 10 * base];

    return niceSteps.firstWhere((s) => s >= roughStep, orElse: () => 10 * base);
  }

  static String _formatCompact(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}k';
    return value.toStringAsFixed(0);
  }
}
