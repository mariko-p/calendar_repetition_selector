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
  const MonthDayCheckerCombinedWidget(
      {Key? key,
      required this.monthlyType,
      required this.monthDays,
      required this.bySetPos,
      required this.byDay,
      this.monthController,
      required this.monthDaySelectionChanged,
      required this.bySetPosChanged,
      required this.byDayChanged,
      required this.monthlyTypeChanged})
      : super(key: key);

  final MonthlyViewType monthlyType;
  final List<MonthDayStruct> monthDays;
  final ExpandableController? monthController;
  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;

  final Future<dynamic> Function(List<MonthDayStruct>? checkedItems)
      monthDaySelectionChanged;
  final Future<dynamic> Function(BySetPositionStruct? bySetPos) bySetPosChanged;
  final Future<dynamic> Function(ByDayStruct? byDay) byDayChanged;
  final Future<dynamic> Function(MonthlyViewType type) monthlyTypeChanged;

  @override
  _MonthDayCheckerCombinedWidgetState createState() =>
      _MonthDayCheckerCombinedWidgetState();
}

enum MonthlyViewType { MONTH_DAY_CHECKER, OF_THE_MONTH_CHECKER }

class _MonthDayCheckerCombinedWidgetState
    extends State<MonthDayCheckerCombinedWidget> {
  late MonthlyViewType monthlyType;

  @override
  void initState() {
    monthlyType = widget.monthlyType;

    // By design expander is always expanded.
    widget.monthController?.expanded = true;
    super.initState();
  }

  setMonthlyViewType(MonthlyViewType type) {
    monthlyType = type;
    widget.monthlyTypeChanged(type);
  }

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
                        if (MonthlyViewType.MONTH_DAY_CHECKER != monthlyType) {
                          setMonthlyViewType(MonthlyViewType.MONTH_DAY_CHECKER);
                        }
                        if (widget.monthController?.expanded == false) {
                          widget.monthController?.expanded = true;
                        }
                      });
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          if (MonthlyViewType.MONTH_DAY_CHECKER == monthlyType)
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
                        if (MonthlyViewType.OF_THE_MONTH_CHECKER !=
                            monthlyType) {
                          setMonthlyViewType(
                              MonthlyViewType.OF_THE_MONTH_CHECKER);
                        }
                        if (widget.monthController?.expanded == false) {
                          widget.monthController?.expanded = true;
                        }
                      });
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
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          if (MonthlyViewType.OF_THE_MONTH_CHECKER ==
                              monthlyType)
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
                  if (MonthlyViewType.MONTH_DAY_CHECKER == monthlyType)
                    MonthDayCheckerWidget(
                      days: widget.monthDays,
                      selectionChanged: (checkedItems) =>
                          widget.monthDaySelectionChanged(checkedItems),
                    ),
                  if (MonthlyViewType.OF_THE_MONTH_CHECKER == monthlyType)
                    MonthDayBySetCheckerWidget(
                      bySetPos: widget.bySetPos,
                      byDay: widget.byDay,
                      bySetPosChanged: (bySetPos) =>
                          widget.bySetPosChanged(bySetPos),
                      byDayChanged: (byDay) => widget.byDayChanged(byDay),
                    )
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
