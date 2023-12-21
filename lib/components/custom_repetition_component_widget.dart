import '/components/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/interval_expander_widget.dart';
import '/components/month_day_checker_combined_widget.dart';
import '/components/repetition_label_widget.dart';
import '/components/week_day_checker_widget.dart';
import '/components/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_repetition_component_model.dart';
export 'custom_repetition_component_model.dart';

class CustomRepetitionComponentWidget extends StatefulWidget {
  const CustomRepetitionComponentWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionComponentWidgetState createState() =>
      _CustomRepetitionComponentWidgetState();
}

class _CustomRepetitionComponentWidgetState
    extends State<CustomRepetitionComponentWidget> {
  late CustomRepetitionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomRepetitionComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.headerCenteredNavBarModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderCenteredNavBarWidget(
                    title: FFLocalizations.of(context).getVariableText(
                      enText: 'Custom repetition',
                      svText: 'Anpassad upprepning',
                    ),
                    isSaveVisible: true,
                    isSaveEnabled: true,
                    onSaveTap: () async {},
                  ),
                ),
                wrapWithModel(
                  model: _model.intervalExpanderModel,
                  updateCallback: () => setState(() {}),
                  child: IntervalExpanderWidget(),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: wrapWithModel(
                    model: _model.repetitionLabelModel,
                    updateCallback: () => setState(() {}),
                    child: RepetitionLabelWidget(
                      humanReadableText: 'The activity will repeat daily',
                    ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: wrapWithModel(
                      model: _model.weekDayCheckerModel,
                      updateCallback: () => setState(() {}),
                      child: WeekDayCheckerWidget(
                        weekDays: functions.getWeekDayList(),
                      ),
                    ),
                  ),
                wrapWithModel(
                  model: _model.frequencyExpanderModel,
                  updateCallback: () => setState(() {}),
                  child: FrequencyExpanderWidget(),
                ),
                if (FFAppState().vTmp)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: wrapWithModel(
                      model: _model.monthDayCheckerCombinedModel,
                      updateCallback: () => setState(() {}),
                      child: MonthDayCheckerCombinedWidget(),
                    ),
                  ),
                wrapWithModel(
                  model: _model.yearCheckerCombinedModel,
                  updateCallback: () => setState(() {}),
                  child: YearCheckerCombinedWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
