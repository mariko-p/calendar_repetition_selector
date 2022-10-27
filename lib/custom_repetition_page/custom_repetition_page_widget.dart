import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/frequency_cupertino_picker_widget.dart';
import '../components/interval_cupertino_picker_widget.dart';
import '../custom_code/actions/update_r_rule.dart';
import '../flutter_flow/custom_functions.dart';
import '../components/week_day_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRepetitionPageWidget extends StatefulWidget {
  const CustomRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionPageWidgetState createState() =>
      _CustomRepetitionPageWidgetState();
}

class _CustomRepetitionPageWidgetState
    extends State<CustomRepetitionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var currentFrequency = generateFrequency()[0];
  var currentIntervals = generateInterval("DAILY");
  var weekDays = getWeekDayList();

  var currentIntervalIndex = 0;
  var freqController = ExpandableController();
  var intController = ExpandableController();
  var humanReadableText = FFAppState().cInitialCustomRRuleText;
  void onFreqExpandedChanged() {
    if (freqController.expanded) {
      if (intController.expanded) {
        // Collapse interval cupertino picker.
        intController.expanded = false;
      }
    }
  }

  void onIntExpandedChanged() {
    if (intController.expanded) {
      if (freqController.expanded) {
        // Collapse frequency cupertino picker.
        freqController.expanded = false;
      }
    }
  }

  @override
  void initState() {
    FFAppState().vCurrentRRule = FFAppState().cInitialCustomRRule;

    freqController.addListener(onFreqExpandedChanged);
    intController.addListener(onIntExpandedChanged);
    super.initState();
  }

  @override
  void dispose() {
    freqController.removeListener(onFreqExpandedChanged);
    intController.removeListener(onIntExpandedChanged);
    super.dispose();
  }

  Future updateRepetitionLabel() async {
    //var translation = await getActivityRepetitionAsText();
    var translation = FFAppState().vCurrentRRule;
    setState(() {
      humanReadableText = translation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottomSheetNavBarWidget(),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 24, 15, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            color: FlutterFlowTheme.of(context).itemBackground,
                          ),
                          child: ExpandableNotifier(
                            controller: freqController,
                            child: ExpandablePanel(
                              header: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    child: Material(
                                      color: FlutterFlowTheme.of(context)
                                          .itemBackground,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(0),
                                          topLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () => {freqController.toggle()},
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(5),
                                            topRight: Radius.circular(5)),
                                        child: Container(
                                          width: double.infinity,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            //color: FlutterFlowTheme.of(context)
                                            //.itemBackground,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(0),
                                              bottomRight: Radius.circular(0),
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            ),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .itemBackground,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 7.5, 0, 7.5),
                                                child: Text(
                                                  'Frequency',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily: 'Rubik',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 20, 0),
                                                    child: Text(
                                                      currentFrequency.text
                                                              ?.toLowerCase() ??
                                                          "",
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily: 'Rubik',
                                                            color: Color(
                                                                0xFF7E8CA2),
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 0.5,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFBFCFF),
                                      ),
                                      child: FrequencyCupertinoPickerWidget(
                                          onItemChanged: (index) async {
                                        setState(() {
                                          currentFrequency = generateFrequency()
                                              .toList()[index];
                                          currentIntervals = generateInterval(
                                              currentFrequency.value);
                                          var freq = currentFrequency.value;
                                          var interval = currentIntervals[
                                                  currentIntervalIndex]
                                              .value;
                                          updateRRule(freq, interval);
                                        });
                                        await updateRepetitionLabel();
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).itemBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          child: ExpandableNotifier(
                            controller: intController,
                            child: ExpandablePanel(
                              header: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .itemBackground,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                        topLeft: Radius.circular(0),
                                        topRight: Radius.circular(0),
                                      ),
                                    ),
                                    child: Material(
                                      color: FlutterFlowTheme.of(context)
                                          .itemBackground,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: InkWell(
                                        onTap: () => {intController.toggle()},
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0)),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 7.5, 0, 7.5),
                                              child: Text(
                                                'With the interval',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: Text(
                                                    currentIntervals[
                                                                currentIntervalIndex]
                                                            .text ??
                                                        "",
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          color:
                                                              Color(0xFF7E8CA2),
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              collapsed: Container(),
                              expanded: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 20, 0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .itemBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(0),
                                        ),
                                      ),
                                      child: IntervalCupertinoPickerWidget(
                                          items: currentIntervals,
                                          onItemChanged: (index) async {
                                            setState(() {
                                              currentIntervalIndex = index;
                                              var freq = currentFrequency.value;
                                              var interval = currentIntervals[
                                                      currentIntervalIndex]
                                                  .value;
                                              updateRRule(freq, interval);
                                            });
                                            await updateRepetitionLabel();
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                              theme: ExpandableThemeData(
                                tapHeaderToExpand: true,
                                tapBodyToExpand: false,
                                tapBodyToCollapse: false,
                                headerAlignment:
                                    ExpandablePanelHeaderAlignment.center,
                                hasIcon: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(35, 5, 15, 0),
                          child: Text(
                            humanReadableText,
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF7E8CA2),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: WeekDayCheckerWidget(
                          weekDays: weekDays,
                          selectionChanged: ((items) async {
                            this.weekDays = items ?? this.weekDays;

                            var freq = currentFrequency.value;
                            var interval =
                                currentIntervals[currentIntervalIndex].value;
                            var selectedWeekDays = items
                                ?.where(((e) => e.isChecked == true))
                                .toList();
                            List<String> byDays = List.empty(growable: true);
                            selectedWeekDays?.forEach((element) =>
                                byDays.add(mapWeekDayToByDay(element.text)));

                            updateRRule(freq, interval, byDay: byDays);
                            await updateRepetitionLabel();
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
