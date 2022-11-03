import 'package:expandable/expandable.dart';

import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/frequency_expander_widget.dart';
import '../custom_code/actions/update_r_rule.dart';
import '../flutter_flow/custom_functions.dart';
import '../components/interval_expander_widget.dart';
import '../components/month_day_checker_combined_widget.dart';
import '../components/week_day_checker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
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
                      if (isCustomMonthlyVisible)
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                          child: MonthDayCheckerCombinedWidget(
                            monthController: monthController,
                            monthDaySelectionChanged: (checkedItems) async {
                              var freq = currentFrequency.value;
                              var interval = currentInterval.value;
                              var byMonthDays = checkedItems?.map((e) => e.index! + 1).toList();

                              updateRRule(freq, interval, byMonthDay: byMonthDays);
                              setState(() {
                                // updateRepetitionLabel();
                              });
                            },
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
