import '../components/month_checker_widget.dart';
import '../components/year_by_set_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'year_checker_combined_model.dart';
export 'year_checker_combined_model.dart';

class YearCheckerCombinedWidget extends StatefulWidget {
  const YearCheckerCombinedWidget({Key? key}) : super(key: key);

  @override
  _YearCheckerCombinedWidgetState createState() =>
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
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 40, 15, 15),
          child: wrapWithModel(
            model: _model.monthCheckerModel,
            updateCallback: () => setState(() {}),
            child: MonthCheckerWidget(
              months: functions.getMonthsList().toList(),
            ),
          ),
        ),
        wrapWithModel(
          model: _model.yearBySetCheckerModel,
          updateCallback: () => setState(() {}),
          child: YearBySetCheckerWidget(),
        ),
      ],
    );
  }
}
