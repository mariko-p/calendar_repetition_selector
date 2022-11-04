import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:custom_recurring_selectors/custom_code/actions/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../components/month_day_by_set_checker_widget.dart';
import '../components/month_day_checker_widget.dart';
import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDayCheckerCombinedWidget extends StatefulWidget {
  const MonthDayCheckerCombinedWidget({Key? key, this.monthController, required this.monthDaySelectionChanged})
      : super(key: key);

  final ExpandableController? monthController;
  final Future<dynamic> Function(List<MonthDayStruct>? checkedItems) monthDaySelectionChanged;
  //final Future<dynamic> Function(List<MonthDayStruct>? checkedItems) monthDaySelectionChanged;

  @override
  _MonthDayCheckerCombinedWidgetState createState() =>
      _MonthDayCheckerCombinedWidgetState();
}

class _MonthDayCheckerCombinedWidgetState
    extends State<MonthDayCheckerCombinedWidget> {
      
  var isMonthDayCheckerViewVisible = false;
  var isOnTheMonthViewVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        width: double.infinity,
        child: ExpandableNotifier(
          controller: widget.monthController,
          child: ExpandablePanel(
            header: Container(
              decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).itemBackground,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMonthDayCheckerViewVisible =
                            !isMonthDayCheckerViewVisible;
                        isOnTheMonthViewVisible = false;
                      });
                      if (isMonthDayCheckerViewVisible ||
                          isOnTheMonthViewVisible) {
                        widget.monthController?.expanded = true;
                      } else {
                        widget.monthController?.expanded = false;
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).itemBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7.5, 0, 7.5),
                            child: Text(
                              'Every',
                              style:
                                  FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 1.5,
                                      ),
                            ),
                          ),
                          if (isMonthDayCheckerViewVisible)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10.5, 12, 10.5),
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
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Container(
                      width: double.infinity,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        isMonthDayCheckerViewVisible = false;
                        isOnTheMonthViewVisible = !isOnTheMonthViewVisible;
                      });
                      if (isMonthDayCheckerViewVisible ||
                          isOnTheMonthViewVisible) {
                        widget.monthController?.expanded = true;
                      } else {
                        widget.monthController?.expanded = false;
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).itemBackground,
                        borderRadius: !widget.monthController!.expanded
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7.5, 0, 7.5),
                            child: Text(
                              'of the month...',
                              style:
                                  FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 1.5,
                                      ),
                            ),
                          ),
                          if (isOnTheMonthViewVisible)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10.5, 12, 10.5),
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
                    ),
                  ),
                  if (widget.monthController!.expanded)
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Container(
                        width: double.infinity,
                        height: 0.5,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).lineColor,
                        ),
                      ))
                ],
              ),
            ),
            collapsed: Container(),
            expanded: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).itemBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).itemBackground,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (isMonthDayCheckerViewVisible) 
                  MonthDayCheckerWidget(selectionChanged: (checkedItems) async {
                    widget.monthDaySelectionChanged(checkedItems);
                  },),
                  if (isOnTheMonthViewVisible) MonthDayBySetCheckerWidget(),
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
