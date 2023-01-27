import 'package:flutter/scheduler.dart';

import '../backend/schema/structs/by_day_struct.dart';
import '../backend/schema/structs/by_set_position_struct.dart';
import '../components/month_day_by_set_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YearBySetCheckerWidget extends StatefulWidget {
  const YearBySetCheckerWidget({
    Key? key,
    required this.bySetPos,
    required this.byDay,
    required this.bySetPosChanged,
    required this.byDayChanged,
    required this.isWeekDaysChecked,
    required this.isWeekDaysSelectionChanged,
  }) : super(key: key);

  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;

  final bool isWeekDaysChecked;
  final Future<dynamic> Function(bool isWeekDaysActive)
      isWeekDaysSelectionChanged;
  final Future<dynamic> Function(BySetPositionStruct? bySetPos) bySetPosChanged;
  final Future<dynamic> Function(ByDayStruct? byDay) byDayChanged;

  @override
  _YearBySetCheckerWidgetState createState() => _YearBySetCheckerWidgetState();
}

class _YearBySetCheckerWidgetState extends State<YearBySetCheckerWidget> {
  var isWeekDaysChecked = false;
  var controller = ExpandableController();

  void onExpanded() {
    setState(() {
      //isWeekDaysChecked = !isWeekDaysChecked; // this is not working in every case.
      if (controller.expanded) {
        isWeekDaysChecked = true;
      } else {
        isWeekDaysChecked = false;
      }
    });
    widget.isWeekDaysSelectionChanged(isWeekDaysChecked);
  }

  @override
  void initState() {
    this.isWeekDaysChecked = widget.isWeekDaysChecked;
    controller.addListener(onExpanded);
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      controller.expanded = isWeekDaysChecked;
    });
  }

  @override
  void dispose() {
    controller.removeListener(onExpanded);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: ExpandableNotifier(
            controller: controller,
            child: ExpandablePanel(
              header: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).itemBackground,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Material(
                      color: FlutterFlowTheme.of(context).itemBackground,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: InkWell(
                        onTap: (() {
                          controller.toggle();
                        }),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).itemBackground,
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
                                    'cl0eiplq' /* Weekdays */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        fontWeight: FontWeight.w300,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                              if (isWeekDaysChecked == true)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
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
                    ),
                    if (isWeekDaysChecked == true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
              collapsed: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
              ),
              expanded: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).itemBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    MonthDayBySetCheckerWidget(
                      bySetPos: widget.bySetPos,
                      byDay: widget.byDay,
                      bySetPosChanged: ((bySetPos) =>
                          widget.bySetPosChanged(bySetPos)),
                      byDayChanged: ((byDay) => widget.byDayChanged(byDay)),
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
      ),
    );
  }
}
