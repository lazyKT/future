import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:future/screens/components/charts/base_line_chart.dart';
import 'package:future/shared/chart_utils/base_chart_boundary.dart';
import 'package:future/shared/chart_utils/line_chart_boundary.dart';
import 'package:future/shared/chart_utils/utils.dart';
import 'package:future/shared/chart_utils/x_axis_date_title_renderer.dart';
import 'package:future/shared/chart_utils/y_axis_number_title_renderer.dart';

import '../../../dto/budgetTransaction.dart';

class BudgetLineChart extends BaseLineChart {
  final List<BudgetTransaction> transactions;

  const BudgetLineChart(this.transactions, {
    super.key,
    super.titlesOnXAxis = 5,
    super.titlesOnYAxis = 8
  });

  @override
  BaseChartBoundary calculateBoundary() {
    LineChartBoundary<BudgetTransaction> boundary = LineChartBoundary<BudgetTransaction>(
      transactions,
      (transaction) => transaction.transactionAmount
    );
    boundary.init();
    return boundary;
  }

  @override
  AxisTitles createBottomAxisTitle(BaseChartBoundary boundary) {
    var xAxisRenderer = XAxisDateTitleRenderer(transactions.first.transactionTime);
    return ChartUtils.createAxisTitle(30, boundary.maxX/ (titlesOnXAxis - 1), xAxisRenderer.render);
  }

  @override
  AxisTitles createLeftAxisTitle(BaseChartBoundary boundary) {
    var yAxisRenderer = YAxisNumberTitleRenderer();
    return ChartUtils.createAxisTitle(55, boundary.maxY/titlesOnXAxis, yAxisRenderer.render);
  }


  @override
  List<LineChartBarData> createLineBarsData() {
    const List<Color> gradientColors = [
      Color(0xff00BCD4),
      Color(0xff673AB7)
    ];

    LinearGradient gradient = LinearGradient(
      colors: gradientColors.map((color) => color.withOpacity(0.5)).toList()
    );

    List<FlSpot> data = BudgetTransaction
      .toLineChartData(transactions, (transaction) => transaction.transactionAmount, 1);

    return [
      LineChartBarData(
        spots: data,
        isCurved: true,
        gradient: const LinearGradient(
          colors: gradientColors
        ),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: gradient
        )
      )
    ];
  }
}