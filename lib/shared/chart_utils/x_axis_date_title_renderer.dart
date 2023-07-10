import 'package:future/shared/chart_utils/side_title_renderer.dart';
import 'package:intl/intl.dart';

class XAxisDateTitleRenderer extends SideTitleRenderer {
  final DateTime dateTime;

  XAxisDateTitleRenderer(this.dateTime);

  @override
  String convert(double value) {
    var current = dateTime.add(Duration(days: value.round()));
    var month = current.month;

    return DateFormat('yyyy-MM-dd').format(DateTime(0, month));
  }
}