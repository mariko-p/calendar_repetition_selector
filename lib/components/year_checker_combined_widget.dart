import '../components/month_checker_widget.dart';
import '../components/year_by_set_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YearCheckerCombinedWidget extends StatefulWidget {
  const YearCheckerCombinedWidget({Key? key}) : super(key: key);

  @override
  _YearCheckerCombinedWidgetState createState() =>
      _YearCheckerCombinedWidgetState();
}

class _YearCheckerCombinedWidgetState extends State<YearCheckerCombinedWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 15),
          child: MonthCheckerWidget(
            months: functions.getMonthsList().toList(),
          ),
        ),
        YearBySetCheckerWidget(),
      ],
    );
  }
}
