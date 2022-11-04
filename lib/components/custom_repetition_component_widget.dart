import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/frequency_expander_widget.dart';
import '../components/interval_expander_widget.dart';
import '../components/month_day_checker_combined_widget.dart';
import '../components/repetition_label_widget.dart';
import '../components/week_day_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRepetitionComponentWidget extends StatefulWidget {
  const CustomRepetitionComponentWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionComponentWidgetState createState() =>
      _CustomRepetitionComponentWidgetState();
}

class _CustomRepetitionComponentWidgetState
    extends State<CustomRepetitionComponentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: AlignmentDirectional(0, -1),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomSheetNavBarWidget(),
                FrequencyExpanderWidget(),
                IntervalExpanderWidget(),
                Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: RepetitionLabelWidget(
                    humanReadableText: 'The activity will repeat daily',
                  ),
                ),
                if (FFAppState().vTmp)
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    child: WeekDayCheckerWidget(
                      weekDays: functions.getWeekDayList().toList(),
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: MonthDayCheckerCombinedWidget(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
