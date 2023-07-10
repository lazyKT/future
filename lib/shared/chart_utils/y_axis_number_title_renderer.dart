import 'package:future/shared/chart_utils/side_title_renderer.dart';
import 'package:intl/intl.dart';

class YAxisNumberTitleRenderer extends SideTitleRenderer {
  @override
  String convert(double value) {
    return getShortForm(value);
  }

  String getShortForm(var number) {
    var f = NumberFormat.compact(locale: "en_US");
    return f.format(number);
  }
}