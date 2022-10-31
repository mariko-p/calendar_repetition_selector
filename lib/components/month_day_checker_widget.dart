import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayCheckerWidget extends StatefulWidget {
  const MonthDayCheckerWidget({Key? key}) : super(key: key);

  @override
  _MonthDayCheckerWidgetState createState() => _MonthDayCheckerWidgetState();
}

class _MonthDayCheckerWidgetState extends State<MonthDayCheckerWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return Stack(
                      children: [
                        if (weekItemItem.isChecked == true)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                        if (weekItemItem.isChecked == false)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                      ],
                    );
                  }),
                );
              },
            ),
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return Stack(
                      children: [
                        if (weekItemItem.isChecked == true)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                        if (weekItemItem.isChecked == false)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                      ],
                    );
                  }),
                );
              },
            ),
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return Stack(
                      children: [
                        if (weekItemItem.isChecked == true)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                        if (weekItemItem.isChecked == false)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                      ],
                    );
                  }),
                );
              },
            ),
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return Stack(
                      children: [
                        if (weekItemItem.isChecked == true)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                        if (weekItemItem.isChecked == false)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                      ],
                    );
                  }),
                );
              },
            ),
            Builder(
              builder: (context) {
                final weekItem = functions
                    .getMonthDayList()
                    .where((e) => e.index! >= 0)
                    .toList();
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(weekItem.length, (weekItemIndex) {
                    final weekItemItem = weekItem[weekItemIndex];
                    return Stack(
                      children: [
                        if (weekItemItem.isChecked == true)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                        if (weekItemItem.isChecked == false)
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  weekItemItem.text,
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              )),
                            ),
                          ),
                      ],
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
