import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_by_set_checker_model.dart';
export 'month_day_by_set_checker_model.dart';

class MonthDayBySetCheckerWidget extends StatefulWidget {
  const MonthDayBySetCheckerWidget({Key? key}) : super(key: key);

  @override
  _MonthDayBySetCheckerWidgetState createState() =>
      _MonthDayBySetCheckerWidgetState();
}

class _MonthDayBySetCheckerWidgetState
    extends State<MonthDayBySetCheckerWidget> {
  late MonthDayBySetCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayBySetCheckerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
