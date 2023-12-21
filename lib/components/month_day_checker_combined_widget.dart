import '/components/month_day_by_set_checker_widget.dart';
import '/components/month_day_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    _model.expandableController = ExpandableController(initialExpanded: false);
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: ExpandableNotifier(
          controller: _model.expandableController,
          child: ExpandablePanel(
            header: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          18.0, 14.5, 10.0, 14.5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'sphagbrb' /* Every */,
                            ),
                            style: GoogleFonts.getFont(
                              'Rubik',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              height: 1.5,
                            ),
                          ),
                          if (FFAppState().vTmp)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Icon(
                                  FFIcons.kcheckbox,
                                  color: Color(0xFF9980DD),
                                  size: 18.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
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
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          18.0, 14.5, 10.0, 14.5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'tiwqbpnm' /* of the month... */,
                            ),
                            style: GoogleFonts.getFont(
                              'Rubik',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 14.0,
                              height: 1.5,
                            ),
                          ),
                          if (FFAppState().vTmp)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Icon(
                                  FFIcons.kcheckbox,
                                  color: Color(0xFF9980DD),
                                  size: 18.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
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
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
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
