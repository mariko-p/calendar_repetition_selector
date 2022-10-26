import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDayCheckerWidget extends StatefulWidget {
  const WeekDayCheckerWidget({Key? key}) : super(key: key);

  @override
  _WeekDayCheckerWidgetState createState() => _WeekDayCheckerWidgetState();
}

class _WeekDayCheckerWidgetState extends State<WeekDayCheckerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).itemBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Monday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Tuesday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Wednesday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Thursday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Friday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Saturday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 7.5, 0, 7.5),
                  child: Text(
                    'Sunday',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                if (FFAppState().vTmp)
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0, 10.5, 12, 10.5),
                        child: Icon(
                          Icons.check,
                          color: Color(0xFF9980DD),
                          size: 15,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
