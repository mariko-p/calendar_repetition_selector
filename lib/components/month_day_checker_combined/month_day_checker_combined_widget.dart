import '../../backend/schema/structs/by_day_struct.dart';
import '../../backend/schema/structs/by_set_position_struct.dart';
import '../../backend/schema/structs/month_day_struct.dart';
import '/components/month_day_by_set_checker/month_day_by_set_checker_widget.dart';
import '/components/month_day_checker/month_day_checker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_day_checker_combined_model.dart';
export 'month_day_checker_combined_model.dart';

class MonthDayCheckerCombinedWidget extends StatefulWidget {
  const MonthDayCheckerCombinedWidget(
      {super.key,
      required this.monthlyType,
      required this.monthDays,
      required this.bySetPos,
      required this.byDay,
      this.monthController,
      required this.monthDaySelectionChanged,
      required this.bySetPosChanged,
      required this.byDayChanged,
      required this.monthlyTypeChanged});

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
  State<MonthDayCheckerCombinedWidget> createState() =>
      _MonthDayCheckerCombinedWidgetState();
}

enum MonthlyViewType { MONTH_DAY_CHECKER, OF_THE_MONTH_CHECKER }

class _MonthDayCheckerCombinedWidgetState
    extends State<MonthDayCheckerCombinedWidget> {
  late MonthlyViewType monthlyType;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthDayCheckerCombinedModel());
    monthlyType = widget.monthlyType;

    // By design expander is always expanded.
    widget.monthController?.expanded = true;
  }

  setMonthlyViewType(MonthlyViewType type) {
    monthlyType = type;
    widget.monthlyTypeChanged(type);
  }

  late MonthDayCheckerCombinedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
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
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Container(
        width: double.infinity,
        child: ExpandableNotifier(
          controller: widget.monthController,
          // controller: _model.expandableController,
          child: ExpandablePanel(
            header: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (MonthlyViewType.MONTH_DAY_CHECKER !=
                            monthlyType) {
                          setMonthlyViewType(
                              MonthlyViewType.MONTH_DAY_CHECKER);
                        }
                        if (widget.monthController?.expanded == false) {
                          widget.monthController?.expanded = true;
                        }
                      });
                    },
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10, 7.5, 0, 7.5),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'sphagbrb' /* Every */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 1.5,
                                  ),
                            ),
                          ),
                          if (MonthlyViewType.MONTH_DAY_CHECKER ==
                              monthlyType)
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10.5, 12, 10.5),
                                  child: Icon(
                                    FFIcons.kcheckbox,
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
                  //LOCAL_START
                  InkWell(
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
                        borderRadius: !widget.monthController!.expanded
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              )
                            : null,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10, 7.5, 0, 7.5),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tiwqbpnm' /* of the month... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
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
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10.5, 12, 10.5),
                                  child: Icon(
                                    FFIcons.kcheckbox,
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
                  //LOCAL_END
                  if (widget.monthController!.expanded == true)
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
            expanded: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (MonthlyViewType.MONTH_DAY_CHECKER == monthlyType)
                      wrapWithModel(
                        child: MonthDayCheckerWidget(
                          days: widget.monthDays,
                          selectionChanged: (checkedItems) =>
                              widget.monthDaySelectionChanged(checkedItems),
                        ),
                        model: _model.monthDayCheckerModel,
                        updateCallback: (() => safeSetState(() {})),
                      ),
                    if (MonthlyViewType.OF_THE_MONTH_CHECKER == monthlyType)
                      wrapWithModel(
                        child: MonthDayBySetCheckerWidget(
                          bySetPos: widget.bySetPos,
                          byDay: widget.byDay,
                          bySetPosChanged: (bySetPos) =>
                              widget.bySetPosChanged(bySetPos),
                          byDayChanged: (byDay) => widget.byDayChanged(byDay),
                        ),
                        model: _model.monthDayBySetCheckerModel,
                        updateCallback: (() => safeSetState(() {})),
                      )
                  ],
                ),
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
