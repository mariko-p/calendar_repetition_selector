import '/components/frequency_expander/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar/header_centered_nav_bar_widget.dart';
import '/components/interval_expander/interval_expander_widget.dart';
import '/components/month_day_checker_combined/month_day_checker_combined_widget.dart';
import '/components/repetition_label/repetition_label_widget.dart';
import '/components/week_day_checker/week_day_checker_widget.dart';
import '/components/year_checker_combined/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_repetition_component_model.dart';
export 'custom_repetition_component_model.dart';

//LOCAL_START
import 'package:expandable/expandable.dart';
import 'package:rrule/rrule.dart';
import 'package:collection/collection.dart';
import '../../backend/schema/structs/month_day_struct.dart';
import '../../backend/schema/structs/month_struct.dart';
import '../../backend/schema/structs/week_day_struct.dart';
import '../../custom_code/actions/update_r_rule.dart';
import '../../custom_code/constants/calendar_constants.dart';
import '../../flutter_flow/custom_functions.dart';
//LOCAL_END

class CustomRepetitionComponentWidget extends StatefulWidget {
  CustomRepetitionComponentWidget({
    super.key,
    required this.rrule,
    required this.onRRuleChanged,
    required this.onHumanReadableTextChanged,
    required this.onSaveTap,
  });

  String? rrule;
  final Future<dynamic> Function(String? rrule) onRRuleChanged;
  final Future<dynamic> Function(String? rrule)? onHumanReadableTextChanged;
  final Future<dynamic> Function(String? rrule) onSaveTap;

  @override
  State<CustomRepetitionComponentWidget> createState() =>
      _CustomRepetitionComponentWidgetState();
}

class _CustomRepetitionComponentWidgetState
    extends State<CustomRepetitionComponentWidget> {
  var currentFrequency = generateFrequency()[0];
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
    super.initState();
    _model = createModel(context, () => CustomRepetitionComponentModel());


    if (widget.rrule?.isNotEmpty == true) {
      FFAppState().vCurrentRRule = widget.rrule!;
    } else {
      FFAppState().vCurrentRRule = FFAppState().cInitialCustomRRule;
    }

    currentIntervalIndex = 0;
    currentIntervals = generateInterval("DAILY");
    currentInterval = currentIntervals[0];

    // WEEKLY part
    weekDays = getWeekDayList();

    // MONTHLY part
    monthDays = getMonthDayList();
    bySetPos = getBySetPositionList()[0];
    byDay = getByDayList()[0];
    monthlyType = MonthlyViewType.MONTH_DAY_CHECKER;

    // YEARLY part
    months = getMonthsList();

    freqController.addListener(onFreqExpandedChanged);
    intController.addListener(onIntExpandedChanged);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Change to specific language.
      setState(() {
        currentFrequency = generateFrequency(context)[0];
        weekDays = getWeekDayList(context);
        months = getMonthsList(context);
      });

      autoSelectRRule();
      initHumanReadableText();
      setState(() { });
    });
  }

  late CustomRepetitionComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void dispose() {
    //LOCAL_START
    freqController.removeListener(onFreqExpandedChanged);
    intController.removeListener(onIntExpandedChanged);
    //LOCAL_END
    _model.maybeDispose();
    super.dispose();
  }

  void initHumanReadableText() {
    setState(() => {
      humanReadableText = FFLocalizations.of(context).getText(
        'daxykqq2' /* The activity will repeat every day */,
      )
    });
  }

  void autoSelectRRule() {
    try  {
      var rruleObj = RecurrenceRule.fromString(FFAppState().vCurrentRRule);
      var freq = getFrequencyOrDefault(rruleObj);
      var interval = getIntervalOrDefault(rruleObj);

      print("FREQ: $freq");
      print("INTERVAL: $interval");
      currentFrequency =
          generateFrequency(context).firstWhere((element) => element.value == freq);
      currentIntervals = generateInterval(freq);
      currentInterval =
          currentIntervals.firstWhere((element) => element.value == interval);
      currentIntervalIndex =
          currentIntervals.indexWhere((element) => element.value == interval);

      if (freq == Constants.WEEKLY) {
        autoSelectWeeklyView();
      } else if (freq == Constants.MONTHLY) {
        autoSelectMonthlyView();
      } else if (freq == Constants.YEARLY) {
        autoSelectYearlyView();
      }

      updateOpenedViewRRule();
      updateOpenViewVisibility(freq);
    } catch(_) {}
  }

  String getFrequencyOrDefault(RecurrenceRule rrule) {
    if (rrule.frequency == null) {
      return Constants.DAILY;
    } else {
      return rrule.frequency.toString();
    }
  }

  int getIntervalOrDefault(RecurrenceRule rrule) {
    var interval = rrule.interval ?? 1;
    if (interval == null || interval <= 0) {
      return 1;
    }
    if (interval > 100) {
      return 100;
    }

    return interval;
  }

  void autoSelectWeeklyView() {
    try  {
      var byDays =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).byWeekDays;
      byDays.forEach((byDay) {
        weekDays.forEachIndexed((index, weekDay) {
          if (byDay.toString() == mapWeekDayToByDay(weekDay.value)) {
            //weekDay = weekDay.rebuild((p0) => p0.isChecked = true); // This is not working.
            weekDays[index] = weekDay.rebuild(isChecked: true);
          }
        });
      });
    } catch(_) {}
  }

  void autoSelectMonthlyView() {
    try  {
      var byMonthDaysRRule =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).byMonthDays;

      // In our case be aware that byMonthDays and bySetPos are mutually exclusive.
      // In our case if byMOnthDays is not empty,
      // then monthlyType == MonthlyViewType.MONTH_DAY_CHECKER and specific view is visible,
      // otherwise monthlyType == MonthlyViewType.OF_THE_MONTH_CHECKER and specific view is visible.
      if (byMonthDaysRRule.length > 0) {
        monthlyType = MonthlyViewType.MONTH_DAY_CHECKER;
        byMonthDaysRRule.forEach((element) {
          monthDays.forEachIndexed((index, monthDay) {
            if (element == ((monthDay.index ?? 0) + 1)) {
              monthDays[index] = monthDay.rebuild(isChecked: true);
            }
          });
        });
      } else {
        monthlyType = MonthlyViewType.OF_THE_MONTH_CHECKER;
        _autoSelectBySetPosAndByDay();
      }
    } catch(_) {}
  }

  void autoSelectYearlyView() {
    try  {
      var bySetPosRRule =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).bySetPositions;
      var byMonthsRRule =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).byMonths;

      // WeekDays are checked or not checked.
      // Select months.
      byMonthsRRule.forEach((month) {
        months.forEachIndexed((index, element) {
          if (month == (index + 1)) {
            months[index] = element.rebuild(isChecked: true);
          }
        });
      });

      // In our case if bySetPos is not empty, weekdays are checked.
      if (bySetPosRRule.length > 0) {
        // print("DA");
        isWeekDaysChecked = true;
        _autoSelectBySetPosAndByDay();
      } else {
        isWeekDaysChecked = false;
      }
    } catch(_) {}
  }

  void _autoSelectBySetPosAndByDay() {
    try  {
      var bySetPosRRule =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).bySetPositions;
      var byDaysRRule =
          RecurrenceRule.fromString(FFAppState().vCurrentRRule).byWeekDays;
      // In our case should always be one in list.
      bySetPosRRule.forEach((element) {
        bySetPos = getBySetPositionList()
            .firstWhere((bySetPos) => bySetPos.value == element);
      });

      // In our case should can be more than one in list.
      List<String> byDaysRRuleStringList = List.empty(growable: true);
      byDaysRRule.forEach((byDay) {
        byDaysRRuleStringList.add(byDay.toString());
      });

      getByDayList().forEachIndexed((index, element) {
        if (ListEquality<String>()
            .equals(element.value?.toList(), byDaysRRuleStringList)) {
          byDay = getByDayList()[index];
        }
      });
    } catch(_) {}
  }

  Future updateRepetitionLabel() async {
    var translation = await getActivityRepetitionCustomAsText(context);

    //ONLY FOR TEST.
    // var translation = FFAppState().vCurrentRRule;
    setState(() {
      humanReadableText = translation;
    });
  }

  Future frequencyItemChanged(int index) async {
    setState(() {
      currentFrequency = generateFrequency(context).toList()[index];
      currentIntervals = generateInterval(currentFrequency.value);
      currentInterval = currentIntervals[currentIntervalIndex];
      var freq = currentFrequency.value;
      updateOpenedViewRRule();
      updateOpenViewVisibility(freq ?? "");
    });
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
    widget.onHumanReadableTextChanged?.call(humanReadableText);
  }

  Future updateDailyRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    updateRRule(freq, interval);
    await updateRepetitionLabel();
    invokeRRuleOnChanged();
  }

  Future updateWeeklyRRule() async {
    var freq = currentFrequency.value;
    var interval = currentInterval.value;
    var selectedWeekDays = this
        .weekDays
        .where(((e) => e.isChecked == true))
        .map((e) => mapWeekDayToByDay(e.value))
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
      updateRRule(freq, interval,
          byMonth: byMonthsList, bySetPos: [position], byDay: byDays);
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
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                wrapWithModel(
                  child: HeaderCenteredNavBarWidget(
                    title: FFLocalizations.of(context).getVariableText(
                      enText: 'Custom repetition',
                      svText: 'Anpassad upprepning',
                    ),
                    isSaveVisible: true,
                    isSaveEnabled: true,
                    onSaveTap: () async {
                      //LOCAL_START
                      await widget.onSaveTap(FFAppState().vCurrentRRule);
                      Navigator.pop(context);
                      //LOCAL_END
                    },
                    onCancelTap: () async {
                      //LOCAL_START
                      Navigator.pop(context);
                      //LOCAL_END
                    },
                  ),
                  model: _model.headerCenteredNavBarModel,
                  updateCallback: () => setState(() {}),
                ),
                wrapWithModel(
                  child: FrequencyExpanderWidget(
                      freqController: freqController,
                      currentFrequency: currentFrequency,
                      onItemChanged: (index) async {
                        await frequencyItemChanged(index);
                      }),
                  model: _model.frequencyExpanderModel,
                  updateCallback: () => setState(() {}),
                ),
                wrapWithModel(
                  child: IntervalExpanderWidget(
                      intController: intController,
                      currentIntervals: currentIntervals,
                      currentIntervalIndex: currentIntervalIndex,
                      onItemChanged: (index) async {
                        await intervalItemChanged(index);
                      }),
                  model: _model.intervalExpanderModel,
                  updateCallback: () => setState(() {}),
                ),
                wrapWithModel(
                  child: RepetitionLabelWidget(
                      humanReadableText: humanReadableText),
                  model: _model.repetitionLabelModel,
                  updateCallback: () => setState(() {}),
                ),

                // Local WEEKLY.
                if (isCustomWeeklyVisible)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: wrapWithModel(
                      child: WeekDayCheckerWidget(
                          weekDays: weekDays,
                          selectionChanged: ((items) async {
                            updateWeeklyRRule();
                          }),
                          ),
                      model: _model.weekDayCheckerModel,
                      updateCallback: () => setState(() {}),
                    ),
                  ),

                // Local MONTHLY.
                if (isCustomMonthlyVisible)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                    child: wrapWithModel(
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
                      model: _model.monthDayCheckerCombinedModel,
                      updateCallback: () => setState(() {}),
                    ),
                  ),

                // Local YEARLY.
                if (isCustomYearylVisible)
                  wrapWithModel(
                    child: YearCheckerCombinedWidget(
                      months: this.months,
                      monthSelectionChanged: () async {
                        updateYearlyRRule();
                      },
                      isWeekDaysChecked: isWeekDaysChecked,
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
                    model: _model.yearCheckerCombinedModel,
                    updateCallback: () => setState(() {}),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
