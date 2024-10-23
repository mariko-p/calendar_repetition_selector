import '../../backend/schema/structs/by_day_struct.dart';
import '../../backend/schema/structs/by_set_position_struct.dart';
import '../../backend/schema/structs/month_struct.dart';
import '/components/month_checker/month_checker_widget.dart';
import '/components/year_by_set_checker/year_by_set_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'year_checker_combined_model.dart';
export 'year_checker_combined_model.dart';

class YearCheckerCombinedWidget extends StatefulWidget {
  const YearCheckerCombinedWidget({
    super.key,
    required this.months,
    required this.monthSelectionChanged,
    required this.isWeekDaysChecked,
    required this.isWeekDaysSelectionChanged,
    required this.bySetPos,
    required this.byDay,
    required this.byDayChanged,
    required this.bySetPosChanged,
  });

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
  State<YearCheckerCombinedWidget> createState() =>
      _YearCheckerCombinedWidgetState();
}

class _YearCheckerCombinedWidgetState extends State<YearCheckerCombinedWidget> {
  late YearCheckerCombinedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YearCheckerCombinedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
          child: wrapWithModel(
            model: _model.monthCheckerModel,
            updateCallback: () => safeSetState(() {}),
            child: MonthCheckerWidget(
              months: widget.months,
              monthSelectionChanged: (() => widget.monthSelectionChanged()),
            ),
          ),
        ),
        wrapWithModel(
          child: YearBySetCheckerWidget(
            bySetPos: widget.bySetPos,
            byDay: widget.byDay,
            bySetPosChanged: ((bySetPos) => widget.bySetPosChanged(bySetPos)),
            byDayChanged: ((byDay) => widget.byDayChanged(byDay)),
            isWeekDaysChecked: widget.isWeekDaysChecked,
            isWeekDaysSelectionChanged: (((isWeekDaysActive) =>
                widget.isWeekDaysSelectionChanged(isWeekDaysActive))),
          ),
          model: _model.yearBySetCheckerModel,
          updateCallback: () => safeSetState(() {}),
        ),
      ],
    );
  }
}
