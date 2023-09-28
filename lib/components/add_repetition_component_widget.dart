import 'dart:ffi';

import '/components/frequency_expander_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/interval_expander_widget.dart';
import '/components/month_day_checker_combined_widget.dart';
import '/components/radio_button_widget.dart';
import '/components/repetition_label_widget.dart';
import '/components/week_day_checker_widget.dart';
import '/components/year_checker_combined_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_repetition_component_model.dart';
export 'add_repetition_component_model.dart';

//LOCAL_START
import '../custom_code/actions/update_r_rule.dart';
import '../backend/schema/structs/repetition_struct.dart';
import '../main.dart';
import 'dart:io';
import '../custom_code/constants/calendar_constants.dart';
import '../flutter_flow/custom_functions.dart';
import 'package:expandable/expandable.dart';
import 'package:collection/collection.dart';
import '../backend/schema/structs/month_struct.dart';
import '../backend/schema/structs/month_day_struct.dart';
import '../backend/schema/structs/week_day_struct.dart';
import 'package:rrule/rrule.dart';

import '../backend/schema/structs/index.dart';
import 'package:custom_recurring_selectors/custom_code/actions/index.dart';
//LOCAL_END

class AddRepetitionComponentWidget extends StatefulWidget {
  AddRepetitionComponentWidget(
      {Key? key,
      this.rrule,
      this.onRRuleChanged,
      this.onHumanReadableTextChanged,
      this.onSaveTapFromAddPage,
      this.onCancelTapFromAddPage,
      this.onSaveTapFromCustomPage})
      : super(key: key);

  // Initial rrule value.
  String? rrule;

  // Called on every change, from main screen, or from custom repetition screen.
  // Do not save rrule to database if save is not called.
  Future<dynamic> Function(String? rrule)? onRRuleChanged;

  // Called on every change, from main screen, or from custom repetition screen.
  // Do not save rrule to database if save is not called.
  // Written in human readable format.
  Future<dynamic> Function(String? rrule)? onHumanReadableTextChanged;

  // Called on save from main screen.
  Future<dynamic> Function(String? rrule, bool repeatOnDone, bool doNotShowInOverdue)? onSaveTapFromAddPage;

  // Called on cancel from main screen.
  Future<dynamic> Function()? onCancelTapFromAddPage;

  // Called on save from custom repetition screen.
  Future<dynamic> Function(String? rrule)? onSaveTapFromCustomPage;

  @override
  _AddRepetitionComponentWidgetState createState() =>
      _AddRepetitionComponentWidgetState();
}

class _AddRepetitionComponentWidgetState
    extends State<AddRepetitionComponentWidget> {
  late int selectedIndex;
  late List<RepetitionStruct> repetitions;
  late AddRepetitionComponentModel _model;

  //LOCAL_START
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
  var isCustomYearlyVisible = false;

  var isEveryViewVisible = false;
  var isOfTheMonthViewVisible = false;

  // NOTE this is current solution, because of this 100 FF dropdown component is rebuilding to many times
  final endRepetitionsAfterDropdownOptions = List.generate(100, (i) => "${i + 1}");

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
  //LOCAL_END

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddRepetitionComponentModel());
    repetitions = [];
    FFAppState().vCurrentRRule = widget.rrule ?? "";
    initSelectedItem();
    updateRepetitionText();

    // NOTE(): selectedIndex is 5 if custom is selected
    _model.isCustomSelected = selectedIndex == 5;

    if (widget.rrule?.isNotEmpty == true) {
      FFAppState().vCurrentRRule = widget.rrule!;
    } else {
      FFAppState().vCurrentRRule = FFAppState().cInitialCustomRRule;
    }

    _model.selectedEndDate = functions.getUntilFromRRule(FFAppState().vCurrentRRule) ?? dateTimeNowWithoutTime();

    print(FFAppState().vCurrentRRule);
    print(_model.selectedEndDate);

    final until = functions.getUntilFromRRule(FFAppState().vCurrentRRule);
    final count = functions.getCountFromRRule(FFAppState().vCurrentRRule);

    if (until != null) {
      _model.endRepetitionOnEnabled = true;
      _model.endRepetitionAfterEnabled = false;
      _model.repeatForeverEnabled = false;

      updateEndRepetionOnDropdownValue(context);
    } else if (count != null) {
        _model.endRepetitionOnEnabled = false;
        _model.endRepetitionAfterEnabled = true;
        _model.repeatForeverEnabled = false;

        _model.dropDownValue2 = count.toString();
    } else {
      _model.endRepetitionOnEnabled = false;
      _model.endRepetitionAfterEnabled = false;
      _model.repeatForeverEnabled = true;
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
      setState(() {
        repetitions = functions.getPredefinedRepetitionList(context).toList();
        FFAppState().vCurrentRRule = widget.rrule ?? "";
        initSelectedItem();
        updateRepetitionText();

        currentFrequency = generateFrequency(context)[0];
        weekDays = getWeekDayList(context);
        months = getMonthsList(context);

        updateEndRepetionOnDropdownValue(context);
        _model.dropDownValue2 = count.toString();
      });

      _model.checkboxValue1 = FFAppState().vRepeatOnDone;
      _model.checkboxValue3 = FFAppState().vDoNotShowInOverdue;

      autoSelectRRule();
      initHumanReadableText();
      setState(() {});
    });
  }

  void initSelectedItem() {
    selectedIndex = -1;
    removePossibleLastSemicolon();

    if (widget.rrule?.isEmpty == true ||
        widget.rrule == null ||
        widget.rrule == recurrenceNever()) {
      selectedIndex = 0;
    } else {
      if (widget.rrule == repetitionEveryDay()) {
        selectedIndex = 1;
      }
      if (widget.rrule == repetitionEveryWeek()) {
        selectedIndex = 2;
      }
      if (widget.rrule == repetitionEverySecondWeek()) {
        selectedIndex = 3;
      }
      if (widget.rrule == repetitionEveryMonth()) {
        selectedIndex = 4;
      }
      if (widget.rrule == repetitionEveryYear()) {
        selectedIndex = 5;
      }

      if (selectedIndex == -1) {
        // Custom selection.
        if (widget.rrule?.startsWith("RRULE:") == true) {
          selectedIndex = 6;
        }
      }
    }

    // NOTE(): Until Never is back
    selectedIndex = selectedIndex - 1;
  }

  /// RRULE rules.
  /// RRULE:FREQ=DAILY and RRULE:FREQ=DAILY; have the same effect.
  void removePossibleLastSemicolon() {
    // Remove last possible ';' from rrule.
    if (widget.rrule?.endsWith(";") == true) {
      widget.rrule =
          widget?.rrule?.substring(0, (widget?.rrule?.length ?? 1) - 1);
    }
  }

  void applyRRule(index) {
    if (index == 6) {
      FFAppState().vCurrentRRule = widget.rrule ?? "";
      // Custom selection - do nothing.
      // Call when the data changes in custom_repetition_component_widget.dart.
    } else if (index >= 0 && index <= 5) {
      FFAppState().vCurrentRRule = repetitions[index].rrule!;
      widget.onRRuleChanged?.call(FFAppState().vCurrentRRule);
    }
    updateRepetitionText();
  }

  void updateRepetitionText() {
    Future.delayed(Duration.zero, () async {
      var rrule = FFAppState().vCurrentRRule;
      var humanReadableText =
          await functions.getActivityRepetitionAnyAsText(context, rrule);

      widget.onHumanReadableTextChanged?.call(humanReadableText);

      setState(() {
        _model.repetitionLabelText = humanReadableText;
      });
    });
  }

  void initHumanReadableText() {
    setState(() => {
          humanReadableText = FFLocalizations.of(context).getText(
            'daxykqq2' /* The activity will repeat every day */,
          )
        });
  }

  void autoSelectRRule() {
    var rruleObj = RecurrenceRule.fromString(FFAppState().vCurrentRRule);
    var freq = getFrequencyOrDefault(rruleObj);
    var interval = getIntervalOrDefault(rruleObj);

    print("FREQ: $freq");
    print("INTERVAL: $interval");
    currentFrequency = generateFrequency(context)
        .firstWhere((element) => element.value == freq);
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
  }

  void autoSelectMonthlyView() {
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
  }

  void autoSelectYearlyView() {
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
  }

  void _autoSelectBySetPosAndByDay() {
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
  }

  Future updateRepetitionLabel() async {
    var translation = await getActivityRepetitionCustomAsText(context);

    //ONLY FOR TEST.
    // var translation = FFAppState().vCurrentRRule;
    setState(() {
      humanReadableText = translation;
      _model.repetitionLabelText = humanReadableText;
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
      isCustomYearlyVisible = true;
    }
  }

  unsetOpenViewVisibilities() {
    isCustomWeeklyVisible = false;
    isCustomMonthlyVisible = false;
    isCustomYearlyVisible = false;
  }

  void invokeRRuleOnChanged() {
    var rrule = FFAppState().vCurrentRRule;
    widget.onRRuleChanged?.call(rrule);
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

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        wrapWithModel(
          model: _model.headerCenteredNavBarModel,
          updateCallback: () => setState(() {}),
          child: HeaderCenteredNavBarWidget(
            title: FFLocalizations.of(context).getVariableText(
              enText: 'Add repetition',
              svText: 'Lägg till upprepning',
            ),
            isSaveEnabled: true,
            //LOCAL_START
            isSaveVisible: true,
            onSaveTap: () async {
              print("RRULE SAVED FROM ADD: ${FFAppState().vCurrentRRule}");
              widget.onSaveTapFromAddPage?.call(FFAppState().vCurrentRRule, FFAppState().vRepeatOnDone, FFAppState().vDoNotShowInOverdue);
              if (MyApp.isExitAppOnBackON == true) {
                exit(0);
              } else {
                // Pop from outside of the package.
                // Otherwise, empty stack will be shown.
                // Navigator.pop(context);
              }
            },
            onCancelTap: () async {
              print("RRULE CANCEL FROM ADD: ${FFAppState().vCurrentRRule}");
              widget.onCancelTapFromAddPage?.call();
              if (MyApp.isExitAppOnBackON == true) {
                exit(0);
              } else {
                // Pop from outside of the package.
                // Otherwise, empty stack will be shown.
                // Navigator.pop(context);
              }
            },
            //LOCAL_END
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 18.0, 15.0, 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            '34ooc256' /* Suggestions */,
                          ),
                          style: GoogleFonts.getFont(
                            'Rubik',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 14.0,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Builder(
                        builder: (context) {
                          //LOCAL_START
                          repetitions.forEachIndexed((index, element) {
                            if (index == selectedIndex) {
                              repetitions[index] =
                                  element.rebuild(isSelected: true);
                            } else {
                              repetitions[index] =
                                  element.rebuild(isSelected: false);
                            }
                          });
                          //LOCAL_END
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            //LOCAL_START
                            physics: NeverScrollableScrollPhysics(),
                            //LOCAL_END
                            scrollDirection: Axis.vertical,
                            //LOCAL_START
                            itemCount: repetitions.length,
                            //LOCAL_END
                            itemBuilder: (context, weekDaysIndex) {
                              final weekDaysItem = repetitions[weekDaysIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      //LOCAL_START
                                      setState(() {
                                        selectedIndex = weekDaysIndex;
                                        applyRRule(selectedIndex);

                                        _model.isCustomSelected = false;
                                      });
                                      //LOCAL_END
                                    },
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 14.5, 11.0, 14.5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 18.0, 0.0),
                                            child: Icon(
                                              IconData(weekDaysItem.iconCodePoint, fontFamily: 'MarikoIconsV4'),
                                              color: weekDaysItem.isSelected
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryColor
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 18.0,
                                            ),
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              weekDaysItem.text,
                                              'Monday',
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Rubik',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight:
                                                  weekDaysItem.isSelected
                                                      ? FontWeight.normal
                                                      : FontWeight.w300,
                                              fontSize: 14.0,
                                              height: 1.5,
                                            ),
                                          ),
                                          if (weekDaysItem.isSelected)
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    1.00, 0.00),
                                                child: Icon(
                                                  FFIcons.kcheckbox,
                                                  color: Colors.black,
                                                  size: 16,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (weekDaysIndex != 5)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18.0, 0.0, 0.0, 0.0),
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
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().update(() {
                            FFAppState().vTmp = false;
                          });

                          if (_model.isCustomSelected) {
                            // Set Custom Selected to False
                            setState(() {
                              _model.isCustomSelected = false;
                              selectedIndex = -1;
                            });
                          } else {
                            // Set Custom Selected to True
                            setState(() {
                              _model.isCustomSelected = true;
                              selectedIndex = -1;
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              18.0, 14.5, 10.0, 14.5),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 18.0, 0.0),
                                child: Icon(
                                  FFIcons.krecurring,
                                  color: _model.isCustomSelected
                                      ? FlutterFlowTheme.of(context)
                                          .primaryColor
                                      : FlutterFlowTheme.of(context)
                                          .primaryText,
                                  size: 18.0,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'pwpi343g' /* Custom */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: _model.isCustomSelected
                                        ? FontWeight.normal
                                        : FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                              if (_model.isCustomSelected)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Icon(
                                      FFIcons.kcheckbox,
                                      color: Colors.black,
                                      size: 16.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_model.isCustomSelected)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF3EFFF),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                            if (isCustomWeeklyVisible)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  child: WeekDayCheckerWidget(
                                    weekDays: weekDays,
                                    selectionChanged: ((items) async {
                                      await updateWeeklyRRule();
                                    }),
                                  ),
                                  model: _model.weekDayCheckerModel,
                                  updateCallback: () => setState(() {}),
                                ),
                              ),
                            if (isCustomMonthlyVisible)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
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
                                      await updateMonthlyMonthDayByDayPosRRule();
                                    },
                                    byDayChanged: (byDay) async {
                                      this.byDay = byDay!;
                                      await updateMonthlyMonthDayByDayPosRRule();
                                    },
                                    monthlyTypeChanged: (type) =>
                                        monthlyTypeChanged(type),
                                  ),
                                  model: _model.monthDayCheckerCombinedModel,
                                  updateCallback: () => setState(() {}),
                                ),
                              ),
                            if (isCustomYearlyVisible)
                              wrapWithModel(
                                child: YearCheckerCombinedWidget(
                                  months: this.months,
                                  monthSelectionChanged: () async {
                                    await updateYearlyRRule();
                                  },
                                  isWeekDaysChecked: isWeekDaysChecked,
                                  isWeekDaysSelectionChanged:
                                      (isWeekDaysActive) async {
                                    this.isWeekDaysChecked = isWeekDaysActive;
                                    await updateYearlyRRule();
                                  },
                                  byDay: this.byDay,
                                  bySetPos: this.bySetPos,
                                  byDayChanged: (byDay) async {
                                    this.byDay = byDay;
                                    await updateYearlyRRule();
                                  },
                                  bySetPosChanged: (bySetPos) async {
                                    this.bySetPos = bySetPos;
                                    await updateYearlyRRule();
                                  },
                                ),
                                model: _model.yearCheckerCombinedModel,
                                updateCallback: () => setState(() {}),
                              ),
                          ],
                        ),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 14.5, 10.0, 14.5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'kkyhmr7g' /* Repeat forever */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: _model.repeatForeverEnabled
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0xff7d8ba1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // Repeat forever True
                                        setState(() {
                                          _model.repeatForeverEnabled = true;
                                          _model.endRepetitionOnEnabled = false;
                                          _model.endRepetitionAfterEnabled =
                                              false;
                                        });
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel1,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.repeatForeverEnabled,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 14.5, 10.0, 14.5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '9ed6988p' /* End repetition On */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: _model.endRepetitionOnEnabled
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0xff7d8ba1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        if (MyApp.onEndRepetitionOnClicked != null) {
                                          final selectedDay = await MyApp.onEndRepetitionOnClicked!.call(_model.selectedEndDate);
                                          updateRRuleWithUntil(FFAppState().vCurrentRRule, selectedDay);
                                          _model.selectedEndDate = selectedDay;
                                          updateEndRepetionOnDropdownValue(context);
                                        }
                                      },
                                      child: FlutterFlowDropDown<String>(
                                        controller:
                                            _model.dropDownValueController1 ??=
                                                FormFieldController<String>(null),
                                        options: _model.dropDownValue1Options.toList(),
                                        onChanged: (val) => setState(
                                            () => _model.dropDownValue1 = val),
                                        width: 120.0,
                                        height: 28.0,
                                        textStyle: GoogleFonts.getFont(
                                          'Rubik',
                                          color: _model.endRepetitionOnEnabled
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : Color(0xff7d8ba1),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14.0,
                                        ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'ymue1mm8' /* Today */,
                                        ),
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: _model.endRepetitionOnEnabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : Color(0xff7d8ba1),
                                          size: 20.0,
                                        ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        elevation: 0.0,
                                        borderColor: _model.endRepetitionOnEnabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : Color(0xff7d8ba1),
                                        borderWidth: 0.5,
                                        borderRadius: 5.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            11.0, 0.0, 6.0, 0.0),
                                        hidesUnderline: true,
                                        disabled: true,
                                        isSearchable: false,
                                        isMultiSelect: false,
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // End repetition On True
                                        setState(() {
                                          _model.endRepetitionOnEnabled = true;
                                          _model.repeatForeverEnabled = false;
                                          _model.endRepetitionAfterEnabled =
                                              false;
                                        });
                                        updateRRuleWithUntil(FFAppState().vCurrentRRule, _model.selectedEndDate);
                                        updateEndRepetionOnDropdownValue(context);
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel2,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.endRepetitionOnEnabled,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 14.5, 10.0, 14.5),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '6ts3zr1x' /* End repetition After */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: _model.endRepetitionAfterEnabled
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : Color(0xff7d8ba1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                      options: endRepetitionsAfterDropdownOptions,
                                      onChanged: (val) {
                                        setState(
                                            () => _model.dropDownValue2 = val);
                                        updateRRuleWithCount(FFAppState().vCurrentRRule, int.parse(val!));
                                      },
                                      width: 80.0,
                                      height: 28.0,
                                      textStyle: GoogleFonts.getFont(
                                        'Rubik',
                                        color: _model.endRepetitionAfterEnabled
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : Color(0xff7d8ba1),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14.0,
                                      ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        '920vxph3' /* 1 */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: _model.endRepetitionAfterEnabled
                                            ? FlutterFlowTheme.of(context)
                                                .secondaryText
                                            : Color(0xff7d8ba1),
                                        size: 20.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor:
                                          _model.endRepetitionAfterEnabled
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : Color(0xff7d8ba1),
                                      borderWidth: 0.5,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 6.0, 0.0),
                                      hidesUnderline: true,
                                      disabled:
                                          !_model.endRepetitionAfterEnabled,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        // End repetition After True
                                        setState(() {
                                          _model.endRepetitionAfterEnabled =
                                              true;
                                          _model.repeatForeverEnabled = false;
                                          _model.endRepetitionOnEnabled = false;
                                        });
                                        updateRRuleWithCount(FFAppState().vCurrentRRule, int.parse(_model.dropDownValue2 ?? "1"));
                                      },
                                      child: wrapWithModel(
                                        model: _model.radioButtonModel3,
                                        updateCallback: () => setState(() {}),
                                        child: RadioButtonWidget(
                                          isDisabled:
                                              !_model.endRepetitionAfterEnabled,
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 20.0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 10, 10.0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '44hbrowg' /* Repeat on Done */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue1 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() {
                                        _model.checkboxValue1 = newValue!;
                                        FFAppState().vRepeatOnDone = newValue!;
                                      });
                                    },
                                    activeColor: Colors.transparent,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 0.5,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).lineColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 10, 10.0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'r0cj7rtk' /* Skip weekends */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue2 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.checkboxValue2 = newValue!);
                                    },
                                    activeColor: Colors.transparent,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF3EFFF),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                18.0, 10, 10.0, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'g1o6r2kx' /* Do not show in Overdue activit... */,
                                  ),
                                  style: GoogleFonts.getFont(
                                    'Rubik',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.0,
                                    height: 1.5,
                                  ),
                                ),
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Checkbox(
                                    value: _model.checkboxValue3 ??= false,
                                    onChanged: (newValue) async {
                                      setState(() {
                                        _model.checkboxValue3 = newValue!;
                                        FFAppState().vDoNotShowInOverdue = newValue!;
                                      });
                                    },
                                    activeColor: Colors.transparent,
                                    checkColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (_model.repetitionLabelText != "" ||
                                _model.endRepetitionOnEnabled ||
                                _model.endRepetitionAfterEnabled ||
                                _model.checkboxValue2 == true ||
                                _model.checkboxValue3 == true
                            )
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'bwo20d1o' /* Summary: */,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 14.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.repetitionLabelText != "")
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: wrapWithModel(
                                  model: _model.repetitionLabelModel,
                                  updateCallback: () => setState(() {}),
                                  child: RepetitionLabelWidget(
                                    humanReadableText: _model.checkboxValue1 ==
                                            true
                                        ? "${_model.repetitionLabelText} ${FFLocalizations.of(context).getVariableText(
                                            enText: 'after it’s done',
                                            svText: 'efter det är gjort',
                                          )}"
                                        : _model.repetitionLabelText,
                                  ),
                                ),
                              ),
                            if (_model.endRepetitionOnEnabled)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getVariableText(
                                          enText: 'The activity will stop repeating after ${formatSelectedDay()} ${isSelectedDayToday() ? "(Today)" : ""}',
                                          svText: 'Aktiviteten kommer att sluta upprepas efter ${formatSelectedDay()} ${isSelectedDayToday() ? "(Idag)" : ""}',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 12.0,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.endRepetitionAfterEnabled)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getVariableText(
                                        enText: 'The activity will stop repeating after ${_model.dropDownValue2 ?? 1} repetitions',
                                        svText: 'Aktiviteten kommer att sluta upprepas efter ${_model.dropDownValue2 ?? 1} repetitioner',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.checkboxValue2 == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'xc5c3na3' /* The activity will skip repetit... */,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (_model.checkboxValue3 == true)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        '5rwscio8' /* The activity won't show in ove... */,
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Rubik',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void updateEndRepetionOnDropdownValue(BuildContext context) {
     final formatedSelectedDay =
        isSelectedDayToday()
            ? FFLocalizations.of(context)
                .getVariableText(
                enText: 'Today',
                svText: 'Idag',
              )
            : formatSelectedDay();

    _model.dropDownValue1Options.clear();
    _model.dropDownValue1Options.add(
        formatedSelectedDay);
    _model.dropDownValue1 =
        formatedSelectedDay;
    _model.dropDownValueController1
            ?.value =
        formatedSelectedDay;
  }

  String formatSelectedDay() => DateFormat('d MMM y', getLocale().languageCode).format(_model.selectedEndDate ?? DateTime.now()).toLowerCase();

  bool isSelectedDayToday() => _model.selectedEndDate == null || _model.selectedEndDate == dateTimeNowWithoutTime();

  DateTime dateTimeNowWithoutTime() => DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
}
