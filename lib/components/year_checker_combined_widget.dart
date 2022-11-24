import '../backend/schema/structs/by_day_struct.dart';
import '../backend/schema/structs/by_set_position_struct.dart';
import '../backend/schema/structs/month_struct.dart';
import '../components/month_checker_widget.dart';
import '../components/year_by_set_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearCheckerCombinedWidget extends StatefulWidget {
  const YearCheckerCombinedWidget({
    Key? key,
    required this.months,
    required this.monthSelectionChanged,
    required this.isWeekDaysChecked,
    required this.isWeekDaysSelectionChanged,
    required this.bySetPos,
    required this.byDay,
    required this.byDayChanged,
    required this.bySetPosChanged,
  }) : super(key: key);

  final List<MonthStruct> months;
  final bool isWeekDaysChecked;
  final Future<dynamic> Function() monthSelectionChanged;
  final Future<dynamic> Function(bool isWeekDaysActive)
      isWeekDaysSelectionChanged;

  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;

  final Future<dynamic> Function(BySetPositionStruct? bySetPos) bySetPosChanged;
  final Future<dynamic> Function(ByDayStruct? byDay) byDayChanged;

  @override
  _YearCheckerCombinedWidgetState createState() =>
      _YearCheckerCombinedWidgetState();
}

class _YearCheckerCombinedWidgetState extends State<YearCheckerCombinedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: MonthCheckerWidget(
            months: widget.months,
            monthSelectionChanged: (() => widget.monthSelectionChanged()),
          ),
        ),
        YearBySetCheckerWidget(
          bySetPos: widget.bySetPos,
          byDay: widget.byDay,
          bySetPosChanged: ((bySetPos) => widget.bySetPosChanged(bySetPos)),
          byDayChanged: ((byDay) => widget.byDayChanged(byDay)),
          isWeekDaysChecked: widget.isWeekDaysChecked,
          isWeekDaysSelectionChanged: (((isWeekDaysActive) =>
                widget.isWeekDaysSelectionChanged(isWeekDaysActive))),
        ),
      ],
    );
  }
}
