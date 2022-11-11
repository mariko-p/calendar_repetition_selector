import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:expandable/expandable.dart';

import '../backend/schema/structs/month_day_struct.dart';
import '../backend/schema/structs/week_day_struct.dart';
import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/frequency_expander_widget.dart';
import '../components/interval_expander_widget.dart';
import '../components/month_day_checker_combined_widget.dart';
import '../components/repetition_label_widget.dart';
import '../components/week_day_checker_widget.dart';
import '../custom_code/actions/update_r_rule.dart';
import '../custom_code/constants/calendar_constants.dart';
import '../flutter_flow/custom_functions.dart';
import '../components/year_checker_combined_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class CustomRepetitionComponentWidget extends StatefulWidget {
  const CustomRepetitionComponentWidget({
    Key? key,
    required this.onRRuleChanged,
  }) : super(key: key);

  final Future<dynamic> Function(String? rrule) onRRuleChanged;

  @override
  _CustomRepetitionComponentWidgetState createState() =>
      _CustomRepetitionComponentWidgetState();
}

class _CustomRepetitionComponentWidgetState
    extends State<CustomRepetitionComponentWidget> {
  var currentFrequency;
  var currentInterval;
  var currentIntervals;

  var currentIntervalIndex;
  late List<WeekDayStruct> weekDays;

  late List<MonthDayStruct> monthDays;
  var bySetPos;
  var byDay;
  var monthlyType;

  late List<MonthStruct> months;
  var isWeekDaysChecked = false;

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

  // This is bad UX, automatically closes on monthly selection.
  // void onMonthExpandedChanged() {
  //   if (monthController.expanded) {
  //     // Collapse other expanders.
  //     freqController.expanded = false;
  //     intController.expanded = false;
  //   }
  // }

  @override
  void initState() {
    // ignore: todo
    // TODO: For edit mode update initial values from RRULE string, stored in db.
    FFAppState().vCurrentRRule = FFAppState().cInitialCustomRRule;
    invokeRRuleOnChanged();
    currentIntervalIndex = 0;
    currentIntervals = generateInterval("DAILY");
    currentInterval = currentIntervals[0];
    currentFrequency = generateFrequency()[0];
    weekDays = getWeekDayList();

    monthDays = getMonthDayList();
    bySetPos = getBySetPositionList()[0];
    byDay = getByDayList()[0];
    monthlyType = MonthlyViewType.MONTH_DAY_CHECKER;

    months = getMonthsList();

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

      print("TIP: ${this.monthlyType.toString()}");
      updateOpenedViewRRule();
      updateOpenViewVisibility(freq);
    });
    await updateRepetitionLabel();
  }

  Future intervalItemChanged(int index) async {
    setState(() {
      // current interval index must be saved!
      currentIntervalIndex = index;
      currentInterval = currentIntervals[index];

      updateOpenedViewRRule();
    });
    await updateRepetitionLabel();
  }

  updateOpenedViewRRule() {
    var freq = currentFrequency.value;

    if (freq == Constants.DAILY) {
      updateDailyRRule();
    } else if (freq == Constants.WEEKLY) {
      updateWeeklyRRule();
    } else if (freq == Constants.MONTHLY) {
      updateMonthlyRRule();
    } else if (freq == Constants.YEARLY) {
      updateYearlyRRule();
    }
  }

  updateOpenViewVisibility(String freq) {
    unsetOpenViewVisibilities();

    if (freq == Constants.DAILY) {
    } else if (freq == Constants.WEEKLY) {
      isCustomWeeklyVisible = true;
    } else if (freq == Constants.MONTHLY) {
      isCustomMonthlyVisible = true;
    } else if (freq == Constants.YEARLY) {
      isCustomYearylVisible = true;
    }
  }

  unsetOpenViewVisibilities() {
    isCustomWeeklyVisible = false;
    isCustomMonthlyVisible = false;
    isCustomYearylVisible = false;
  }

  void invokeRRuleOnChanged() {
    var rrule = FFAppState().vCurrentRRule;
    widget.onRRuleChanged(rrule);
  }

  Future updateDailyRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    updateRRule(freq, interval);
    invokeRRuleOnChanged();
  }

  Future updateWeeklyRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    var selectedWeekDays = this
        .weekDays
        .where(((e) => e.isChecked == true))
        .map((e) => mapWeekDayToByDay(e.text))
        .toList();

    updateRRule(freq, interval, byDay: selectedWeekDays);
    await updateRepetitionLabel();
    invokeRRuleOnChanged();
  }

  Future updateMonthlyRRule() async {
    if (monthlyType == MonthlyViewType.MONTH_DAY_CHECKER) {
      updateMonthlyMonthDayCheckerRRule();
    } else if (monthlyType == MonthlyViewType.OF_THE_MONTH_CHECKER) {
      updateMonthlyMonthDayByDayPosRRule();
    }
  }

  Future updateMonthlyMonthDayCheckerRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    var byMonthDays = this
        .monthDays
        .where((e) => e.isChecked == true)
        .map((e) => e.index! + 1)
        .toList();

    updateRRule(freq, interval, byMonthDay: byMonthDays);
    await updateRepetitionLabel();
    invokeRRuleOnChanged();
  }

  Future updateMonthlyMonthDayByDayPosRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    int position = bySetPos.value!;
    List<String>? byDays = this.byDay.value?.toList();

    updateRRule(freq, interval, bySetPos: [position], byDay: byDays);
    await updateRepetitionLabel();
    invokeRRuleOnChanged();
  }

  Future updateYearlyRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    var byMonthsList = List<int>.empty(growable: true);
    this.months.forEachIndexed((index, element) {
      if (element.isChecked == true) {
        // RRULE: Januar is 1. December is 12. etc.
        byMonthsList.add(index + 1);
      }
    });

    if (isWeekDaysChecked == false) {
      updateRRule(freq, interval, byMonth: byMonthsList);
    } else if (isWeekDaysChecked == true) {
      int position = bySetPos.value!;
      List<String>? byDays = this.byDay.value?.toList(); 
      print("UPDATE YEARLY");
      updateRRule(freq, interval, byMonth: byMonthsList, bySetPos: [position], byDay: byDays);
    }
    await updateRepetitionLabel();
    invokeRRuleOnChanged();
  }

  Future monthlyTypeChanged(MonthlyViewType type) async {
    monthlyType = type;
    if (monthlyType == MonthlyViewType.MONTH_DAY_CHECKER) {
      updateMonthlyMonthDayCheckerRRule();
    } else {
      updateMonthlyMonthDayByDayPosRRule();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  BottomSheetNavBarWidget(
                      backText: "Repetition", title: "Custom repetition"),
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
                  RepetitionLabelWidget(humanReadableText: humanReadableText),
                  
                  // Local WEEKLY.
                  if (isCustomWeeklyVisible)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: WeekDayCheckerWidget(
                          weekDays: weekDays,
                          selectionChanged: ((items) => updateWeeklyRRule())),
                    ),
                  
                  // Local MONTHLY.
                  if (isCustomMonthlyVisible)
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: MonthDayCheckerCombinedWidget(
                        monthlyType: monthlyType,
                        monthDays: monthDays,
                        bySetPos: bySetPos,
                        byDay: byDay,
                        monthController: monthController,
                        monthDaySelectionChanged: (checkedItems) =>
                            updateMonthlyMonthDayCheckerRRule(),
                        bySetPosChanged: (bySetPos) async {
                          this.bySetPos = bySetPos!;
                          updateMonthlyMonthDayByDayPosRRule();
                        },
                        byDayChanged: (byDay) async {
                          this.byDay = byDay!;
                          updateMonthlyMonthDayByDayPosRRule();
                        },
                        monthlyTypeChanged: (type) => monthlyTypeChanged(type),
                      ),
                    ),

                    // Local YEARLY.
                    if (isCustomYearylVisible)
                      YearCheckerCombinedWidget(
                        months: this.months,
                        monthSelectionChanged: () async {
                          updateYearlyRRule();
                        },
                        isWeekDaysSelectionChanged: (isWeekDaysActive) async {
                          this.isWeekDaysChecked = isWeekDaysActive;
                          updateYearlyRRule();
                        },
                        byDay: this.byDay,
                        bySetPos: this.bySetPos,
                        byDayChanged: (byDay) async {
                          this.byDay = byDay;
                          updateYearlyRRule();
                        },
                        bySetPosChanged: (bySetPos) async {
                          this.bySetPos = bySetPos;
                          updateYearlyRRule();
                        },
                      ),
                ],
              )            
            ),
          ),
        ],
      ),
    );
  }
}
