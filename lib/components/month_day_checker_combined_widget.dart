import '/components/month_day_by_set_checker_widget.dart';
import '/components/month_day_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_checker_combined_model.dart';
export 'month_day_checker_combined_model.dart';

class MonthDayCheckerCombinedWidget extends StatefulWidget {
  const MonthDayCheckerCombinedWidget({Key? key}) : super(key: key);

  @override
  _MonthDayCheckerCombinedWidgetState createState() =>
      _MonthDayCheckerCombinedWidgetState();
}

class _MonthDayCheckerCombinedWidgetState
    extends State<MonthDayCheckerCombinedWidget> {
  late MonthDayCheckerCombinedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayCheckerCombinedModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(),
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).itemBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).itemBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).itemBackground,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 7.5, 0.0, 7.5),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'sphagbrb' /* Every */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                        if (FFAppState().vTmp)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.5, 12.0, 10.5),
                                child: Icon(
                                  FFIcons.kcheckbox,
                                  color: Color(0xFF9980DD),
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 36.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).itemBackground,
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).itemBackground,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 7.5, 0.0, 7.5),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'tiwqbpnm' /* of the month... */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w300,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                        if (FFAppState().vTmp)
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.5, 12.0, 10.5),
                                child: Icon(
                                  FFIcons.kcheckbox,
                                  color: Color(0xFF9980DD),
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            collapsed: Container(),
            expanded: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).itemBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.0),
                  bottomRight: Radius.circular(5.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).itemBackground,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(),
                    child: wrapWithModel(
                      model: _model.monthDayCheckerModel,
                      updateCallback: () => setState(() {}),
                      child: MonthDayCheckerWidget(),
                    ),
                  ),
                  wrapWithModel(
                    model: _model.monthDayBySetCheckerModel,
                    updateCallback: () => setState(() {}),
                    child: MonthDayBySetCheckerWidget(),
                  ),
                ],
              ),
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
          ),
        ),
      ),
    );
  }
}
