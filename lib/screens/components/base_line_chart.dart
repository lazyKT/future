import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:future/shared/chart_utils/base_chart_boundary.dart';
import 'package:future/shared/chart_utils/utils.dart';

abstract class BaseLineChart<T> extends StatelessWidget {

  final int titlesOnXAxis;
  final int titlesOnYAxis;
  final Color borderColor;

  const BaseLineChart({
    super.key,
    this.titlesOnXAxis = 3,
    this.titlesOnYAxis = 3,
    this.borderColor = const Color(0xff37434d)
  });

  @override
  Widget build (BuildContext context) {
    return LineChart(
      mainData()
    );
  }

  AxisTitles createBottomAxisTitle(BaseChartBoundary boundary);

  AxisTitles createLeftAxisTitle(BaseChartBoundary boundary);

  BaseChartBoundary calculateBoundary();

  List<LineChartBarData> createLineBarsData();

  LineChartData mainData() {
    var boundary = calculateBoundary();

    return LineChartData(
      gridData: ChartUtils.noGridData,
      titlesData: FlTitlesData(
        show: true,
        rightTitles: ChartUtils.noTitles,
        topTitles: ChartUtils.noTitles,
        bottomTitles: createBottomAxisTitle(boundary),
        leftTitles: createLeftAxisTitle(boundary)
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: borderColor),
      ),
      minX: boundary.minX,
      minY: boundary.minY,
      maxX: boundary.maxX,
      maxY: boundary.maxY,
      lineBarsData: createLineBarsData()
    );
  }
}