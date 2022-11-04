import 'package:custom_recurring_selectors/backend/schema/index.dart';
import 'package:custom_recurring_selectors/custom_code/constants/calendar_constants.dart';
import 'package:expandable/expandable.dart';

import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/custom_repetition_component_widget.dart';
import '../components/frequency_expander_widget.dart';
import '../custom_code/actions/update_r_rule.dart';
import '../flutter_flow/custom_functions.dart';
import '../components/interval_expander_widget.dart';
import '../components/month_day_checker_combined_widget.dart';
import '../components/repetition_label_widget.dart';
import '../components/week_day_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CustomRepetitionPageWidget extends StatefulWidget {
  const CustomRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionPageWidgetState createState() =>
      _CustomRepetitionPageWidgetState();
}

class _CustomRepetitionPageWidgetState
    extends State<CustomRepetitionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CustomRepetitionComponentWidget(),
        ),
      ),
    );
  }
}
