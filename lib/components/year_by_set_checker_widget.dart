import '../backend/schema/structs/by_day_struct.dart';
import '../backend/schema/structs/by_set_position_struct.dart';
import '../components/month_day_by_set_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class YearBySetCheckerWidget extends StatefulWidget {
  const YearBySetCheckerWidget({Key? key,
    required this.bySetPos,
    required this.byDay,
    required this.bySetPosChanged,
    required this.byDayChanged,
    required this.isWeekDaysSelectionChanged,
  }) : super(key: key);

  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;

  final Future<dynamic> Function(bool isWeekDaysActive) isWeekDaysSelectionChanged;
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
      isWeekDaysChecked = !isWeekDaysChecked;
    });
    widget.isWeekDaysSelectionChanged(isWeekDaysChecked);
  }

  @override
  void initState() {
    controller.addListener(onExpanded);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: ExpandableNotifier(
            controller: controller,
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
                      height: 36,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).itemBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).itemBackground,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 7.5, 0, 7.5),
                            child: Text(
                              'Weekdays',
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
                    MonthDayBySetCheckerWidget(
                      bySetPos: widget.bySetPos,
                      byDay: widget.byDay,
                      bySetPosChanged: ((bySetPos) => widget.bySetPosChanged(bySetPos)), 
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
