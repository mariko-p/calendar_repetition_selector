
import 'package:expandable/expandable.dart';

import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/frequency_expander_widget.dart';
import '../custom_code/actions/update_r_rule.dart';
import '../flutter_flow/custom_functions.dart';
import '../components/interval_expander_widget.dart';
import '../components/week_day_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomRepetitionPageWidget extends StatefulWidget {
  const CustomRepetitionPageWidget({Key? key}) : super(key: key);

  @override
  _CustomRepetitionPageWidgetState createState() =>
      _CustomRepetitionPageWidgetState();
}

class _CustomRepetitionPageWidgetState
    extends State<CustomRepetitionPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var currentFrequency;
  var currentInterval;
  var currentIntervals;

  var currentIntervalIndex = 0;
  var weekDays = getWeekDayList();

  var freqController = ExpandableController();
  var intController = ExpandableController();
  var monthController = ExpandableController();

  var humanReadableText = FFAppState().cInitialCustomRRuleText;
  var isCustomWeeklyVisible = false;
  var isCustomMonthlyVisible = false;
  var isCustomYearylVisible = false;

  var isEveryViewVisible = false;
  var isOfTheMonthViewVisible = false;

  void onFreqExpandedChanged() {
    if (freqController.expanded) {
      // Collapse other expanders.
      intController.expanded = false;
      monthController.expanded = false;
    }
  }

  void onIntExpandedChanged() {
    if (intController.expanded) {
      // Collapse other expanders.
      freqController.expanded = false;
      monthController.expanded = false;
    }
  }

  void onMonthExpandedChanged() {
    if (monthController.expanded) {
      // Collapse other expanders.
      freqController.expanded = false;
      intController.expanded = false;
    }
  }

  @override
  void initState() {
    FFAppState().vCurrentRRule = FFAppState().cInitialCustomRRule;
    currentIntervals = generateInterval("DAILY");
    currentInterval = currentIntervals[0];
    currentFrequency = generateFrequency()[0];

    freqController.addListener(onFreqExpandedChanged);
    intController.addListener(onIntExpandedChanged);
    monthController.addListener(onMonthExpandedChanged);

    super.initState();
  }

  @override
  void dispose() {
    freqController.removeListener(onFreqExpandedChanged);
    intController.removeListener(onIntExpandedChanged);
    monthController.removeListener(onMonthExpandedChanged);

    super.dispose();
  }

  Future updateRepetitionLabel() async {
    var translation = await getActivityRepetitionAsText();
    //var translation = FFAppState().vCurrentRRule;
    setState(() {
      humanReadableText = translation;
    });
  }

  Future frequencyItemChanged(int index) async {
    setState(() {
      currentFrequency = generateFrequency().toList()[index];
      currentIntervals = generateInterval(currentFrequency.value);
      currentInterval = currentIntervals[currentIntervalIndex];

      var freq = currentFrequency.value;
      var interval = currentInterval.value;

      updateRRule(freq, interval);
      updateCustomViewVisibility(currentFrequency.value ?? "");
    });
    await updateRepetitionLabel();
  }

  Future intervalItemChanged(int index) async {
    setState(() {
      // current interval index must be saved!
      currentIntervalIndex = index;
      currentInterval = currentIntervals[index];

      var freq = currentFrequency.value;
      var interval = currentInterval[currentIntervalIndex].value;
      updateRRule(freq, interval);
    });
    await updateRepetitionLabel();
  }

  updateCustomViewVisibility(String freq) {
    unsetCustomViewVisbilities();

    if (freq == "DAILY") {
      // No action.
    } else if (freq == "WEEKLY") {
      isCustomWeeklyVisible = true;
    } else if (freq == "MONTHLY") {
      isCustomMonthlyVisible = true;
    } else if (freq == "YEARLY") {
      isCustomYearylVisible = true;
    }
  }

  unsetCustomViewVisbilities() {
    isCustomWeeklyVisible = false;
    isCustomMonthlyVisible = false;
    isCustomYearylVisible = false;
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
                      FrequencyExpanderWidget(
                          freqController: freqController,
                          currentFrequency: currentFrequency,
                          onItemChanged: (index) async {
                            await frequencyItemChanged(index);
                          }),
                      IntervalExpanderWidget(
                          intController: intController,
                          currentIntervals: currentIntervals,
                          currentIntervalIndex: currentIntervalIndex,
                          onItemChanged: (index) async {
                            await intervalItemChanged(index);
                          }),
                      Align(
                        alignment: AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(35, 5, 15, 0),
                          child: Text(
                            humanReadableText,
                            textAlign: TextAlign.start,
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
                      if (isCustomWeeklyVisible)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
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
                      //if (isCustomMonthlyVisible)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: Container(
                          width: double.infinity,
                          child: Container(
                            width: double.infinity,
                            child: ExpandableNotifier(
                              controller: monthController,
                              child: ExpandablePanel(
                                header: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          isEveryViewVisible =
                                              !isEveryViewVisible;
                                          isOfTheMonthViewVisible = false;
                                        });
                                        if (isEveryViewVisible ||
                                            isOfTheMonthViewVisible) {
                                          monthController.expanded = true;
                                        } else {
                                          monthController.expanded = false;
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .itemBackground,
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 7.5, 0, 7.5),
                                              child: Text(
                                                'Every',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            if (isEveryViewVisible)
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0, 10.5,
                                                                12, 10.5),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 0.5,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          isEveryViewVisible = false;
                                          isOfTheMonthViewVisible =
                                              !isOfTheMonthViewVisible;
                                        });
                                        if (isEveryViewVisible ||
                                            isOfTheMonthViewVisible) {
                                          monthController.expanded = true;
                                        } else {
                                          monthController.expanded = false;
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .itemBackground,
                                          borderRadius: !monthController
                                                  .expanded
                                              ? BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                )
                                              : BorderRadius.all(Radius.zero),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 7.5, 0, 7.5),
                                              child: Text(
                                                'of the month...',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Rubik',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          lineHeight: 1.5,
                                                        ),
                                              ),
                                            ),
                                            if (isOfTheMonthViewVisible)
                                              Expanded(
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0, 10.5,
                                                                12, 10.5),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
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
                                expanded: Container(
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
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .itemBackground,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 10, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 8, 0, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .itemBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final weekItem = functions
                                                      .getMonthDayList()
                                                      .sublist(0, 7)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: weekItem.length,
                                                    itemBuilder: (context,
                                                        firstWeekIndex) {
                                                      final monthDay =
                                                          weekItem[
                                                              firstWeekIndex];
                                                      return Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF9980DD),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              monthDay.text,
                                                              '1',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .itemBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final firstWeek = functions
                                                      .getMonthDayList()
                                                      .sublist(8, 14)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: firstWeek.length,
                                                    itemBuilder: (context,
                                                        firstWeekIndex) {
                                                      final weekItem =
                                                          firstWeek[
                                                              firstWeekIndex];
                                                      return Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              weekItem.text
                                                                  .toString(),
                                                              '1',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .itemBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final weekItem = functions
                                                      .getMonthDayList()
                                                      .sublist(15, 21)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: weekItem.length,
                                                    itemBuilder: (context,
                                                        firstWeekIndex) {
                                                      final monthDay =
                                                          weekItem[
                                                              firstWeekIndex];
                                                      return Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              monthDay.text
                                                                  .toString(),
                                                              '1',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .itemBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final firstWeek = functions
                                                      .getMonthDayList()
                                                      .sublist(15, 21)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: firstWeek.length,
                                                    itemBuilder: (context,
                                                        firstWeekIndex) {
                                                      final firstWeekItem =
                                                          firstWeek[
                                                              firstWeekIndex];
                                                      return Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              firstWeekItem
                                                                  .text,
                                                              '1',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 8),
                                            child: Container(
                                              width: double.infinity,
                                              height: 32,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .itemBackground,
                                              ),
                                              child: Builder(
                                                builder: (context) {
                                                  final monthDays = functions
                                                      .getMonthDayList()
                                                      .sublist(22, 28)
                                                      .toList();
                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: monthDays.length,
                                                    itemBuilder: (context,
                                                        firstWeekIndex) {
                                                      final weekItem =
                                                          monthDays[
                                                              firstWeekIndex];
                                                      return Container(
                                                        width: 32,
                                                        height: 32,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0, 0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            weekItem.text
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Rubik',
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          )),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
