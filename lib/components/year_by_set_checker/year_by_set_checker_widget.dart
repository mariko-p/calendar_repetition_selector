import '../../backend/schema/structs/by_day_struct.dart';
import '../../backend/schema/structs/by_set_position_struct.dart';
import '/components/month_day_by_set_checker/month_day_by_set_checker_widget.dart';
import 'package:flutter/scheduler.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'year_by_set_checker_model.dart';
export 'year_by_set_checker_model.dart';

class YearBySetCheckerWidget extends StatefulWidget {
  const YearBySetCheckerWidget({
    super.key,
    required this.bySetPos,
    required this.byDay,
    required this.bySetPosChanged,
    required this.byDayChanged,
    required this.isWeekDaysChecked,
    required this.isWeekDaysSelectionChanged,
  });

  final BySetPositionStruct bySetPos;
  final ByDayStruct byDay;

  final bool isWeekDaysChecked;
  final Future<dynamic> Function(bool isWeekDaysActive)
      isWeekDaysSelectionChanged;
  final Future<dynamic> Function(BySetPositionStruct? bySetPos) bySetPosChanged;
  final Future<dynamic> Function(ByDayStruct? byDay) byDayChanged;

  @override
  State<YearBySetCheckerWidget> createState() => _YearBySetCheckerWidgetState();
}

class _YearBySetCheckerWidgetState extends State<YearBySetCheckerWidget> {
  var isWeekDaysChecked = false;
  var controller = ExpandableController();
  late YearBySetCheckerModel _model;

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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YearBySetCheckerModel());
    this.isWeekDaysChecked = widget.isWeekDaysChecked;
    controller.addListener(onExpanded);

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      controller.expanded = isWeekDaysChecked;
    });
  }

  @override
  void dispose() {
    controller.removeListener(onExpanded);
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
      child: Container(
        width: double.infinity,
        child: ExpandableNotifier(
          controller: controller,
          // controller: _model.expandableController,
          child: ExpandablePanel(
            header: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
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
                                  .bodyMedium
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    child: MonthDayBySetCheckerWidget(
                      bySetPos: widget.bySetPos,
                      byDay: widget.byDay,
                      bySetPosChanged: ((bySetPos) =>
                          widget.bySetPosChanged(bySetPos)),
                      byDayChanged: ((byDay) => widget.byDayChanged(byDay)),
                    ),
                    model: _model.monthDayBySetCheckerModel,
                    updateCallback: () => safeSetState(() {}),
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
