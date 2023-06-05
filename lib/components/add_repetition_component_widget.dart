import '../backend/schema/structs/repetition_struct.dart';
import '../main.dart';
import '/components/custom_repetition_component_widget.dart';
import '/components/header_centered_nav_bar_widget.dart';
import '/components/repetition_label_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_centered_nav_bar_widget.dart';
import 'add_repetition_component_model.dart';
export 'add_repetition_component_model.dart';

//LOCAL_START
import 'dart:io';
import '../custom_code/constants/calendar_constants.dart';
import '../flutter_flow/custom_functions.dart';
import 'package:collection/collection.dart';
//LOCAL_END

class AddRepetitionComponentWidget extends StatefulWidget {
  AddRepetitionComponentWidget(
      {Key? key,
      this.rrule,
      this.onRRuleChanged,
      this.onSaveTapFromAddPage,
      this.onCancelTapFromAddPage,
      this.onSaveTapFromCustomPage})
      : super(key: key);

  // Initial rrule value.
  String? rrule;

  // Called on every change, from main screen, or from custom repetition screen.
  // Do not save rrule to database if save is not called.
  Future<dynamic> Function(String? rrule)? onRRuleChanged;

  // Called on save from main screen.
  Future<dynamic> Function(String? rrule)? onSaveTapFromAddPage;

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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddRepetitionComponentModel());
    repetitions = [];
    FFAppState().vCurrentRRule = widget.rrule ?? "";
    initSelectedItem();
    updateRepetitionText();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        repetitions = functions.getPredefinedRepetitionList(context).toList();
        FFAppState().vCurrentRRule = widget.rrule ?? "";
        initSelectedItem();
        updateRepetitionText();
      });
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
      setState(() {
        _model.repetitionLabelText = humanReadableText;
      });
    });
  }

  BorderRadius? getSpecificBorderRadius(int itemIndex) {
    if (itemIndex == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      );
    }
    if (itemIndex == 5) {
      return BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(5),
      );
    }
    return null;
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void dispose() {
    _model.dispose();

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
            isSaveVisible: true,
            onSaveTap: () async {
              //LOCAL_START
              print("RRULE SAVED FROM ADD: ${FFAppState().vCurrentRRule}");
              widget.onSaveTapFromAddPage?.call(FFAppState().vCurrentRRule);
              if (MyApp.isExitAppOnBackON == true) {
                exit(0);
              } else {
                // Pop from outside of the package.
                // Otherwise, empty stack will be shown.
                // Navigator.pop(context);
              }
              //LOCAL_END
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
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 10.0),
          child: Builder(
            builder: (context) {
              repetitions.forEachIndexed((index, element) {
                if (index == selectedIndex) {
                  repetitions[index] =
                      element.rebuild(isSelected: true);
                } else {
                  repetitions[index] =
                      element.rebuild(isSelected: false);
                }
              });
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: repetitions.length,
                itemBuilder: (context, itemIndex) {
                  final weekDaysItem = repetitions[itemIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      //LOCAL_START
                      Material(
                        color: FlutterFlowTheme.of(context).itemBackground,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: getSpecificBorderRadius(itemIndex) ??
                                BorderRadius.zero),
                        child: InkWell(
                          // splashColor: Colors.transparent,
                          // focusColor: Colors.transparent,
                          // hoverColor: Colors.transparent,
                          // highlightColor: Colors.transparent,
                          borderRadius: getSpecificBorderRadius(itemIndex),
                          onTap: () async {
                            setState(() {
                              selectedIndex = itemIndex;
                              applyRRule(selectedIndex);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: getSpecificBorderRadius(itemIndex),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 7.5, 20.0, 7.5),
                                  child: Text(
                                    valueOrDefault<String>(
                                      weekDaysItem.text,
                                      'Monday',
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
                                if (weekDaysItem.isSelected == true)
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
                      //LOCAL_END
                      if (itemIndex != 5)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              21.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
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
        //LOCAL_START
        if (_model.repetitionLabelText.length > 0 && selectedIndex != 6)
          //LOCAL_END
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
            child: wrapWithModel(
              model: _model.repetitionLabelModel1,
              updateCallback: () => setState(() {}),
              child: RepetitionLabelWidget(
                //LOCAL_START
                humanReadableText: _model.repetitionLabelText,
                //LOCAL_END
              ),
            ),
          ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 10.0),
          //LOCAL_START
          child: Material(
            color: FlutterFlowTheme.of(context).itemBackground,
            elevation: 0,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              // splashColor: Colors.transparent,
              // focusColor: Colors.transparent,
              // hoverColor: Colors.transparent,
              // highlightColor: Colors.transparent,
              onTap: () async {
                //selectedIndex = 6;
                //Navigator.pop(context);
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (bottomSheetContext) {
                    return Padding(
                      // padding: MediaQuery.of(bottomSheetContext).viewInsets,
                      // Add padding from user app.
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          color: Colors.white,
                        ),
                        child: CustomRepetitionComponentWidget(
                          rrule: widget.rrule,
                          onRRuleChanged: (rrule) async {
                            // print("RRULE changed: $rrule");
                            // print("RRULE initial value: ${widget.rrule}");
                            // FFAppState().vCurrentRRule = rrule ?? "";
                            widget.onRRuleChanged?.call(rrule);
                          },
                          onSaveTap: (rrule) async {
                            print("RRULE SAVED FROM CUSTOM: $rrule");
                            FFAppState().vCurrentRRule = rrule ?? "";
                            setState(() {
                              widget.rrule = rrule ?? widget.rrule;
                              initSelectedItem();
                            });
                            widget.onSaveTapFromCustomPage?.call(rrule);
                            updateRepetitionText();
                          },
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {
                      //print ("RRULE: on back: ${FFAppState().vCurrentRRule}");
                    }));
              },
              borderRadius: BorderRadius.circular(5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 7.5, 20.0, 7.5),
                        child: Text(
                          //LOCAL_START
                          FFLocalizations.of(context).getText("pwpi343g"),
                          //LOCAL_END,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Rubik',
                                    fontWeight: FontWeight.w300,
                                    lineHeight: 1.5,
                                  ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                          child: InkWell(
                            onTap: () async {},
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Stack(
                                children: [
                                  if (selectedIndex != 6)
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Icon(
                                          FFIcons.kangleFullRight,
                                          color: Color(0xFF7E8CA2),
                                          size: 8,
                                        ),
                                      ),
                                    ),
                                  if (selectedIndex == 6)
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Icon(
                                        FFIcons.kcheckbox,
                                        color: Color(0xFF9980DD),
                                        size: 15,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          //LOCAL_END
        ),
        //LOCAL_START
        if (_model.repetitionLabelText.length > 0 && selectedIndex == 6)
          //LOCAL_END
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
            child: wrapWithModel(
              model: _model.repetitionLabelModel2,
              updateCallback: () => setState(() {}),
              child: RepetitionLabelWidget(
                //LOCAL_START
                humanReadableText: _model.repetitionLabelText,
                //LOCAL_END
              ),
            ),
          ),
      ],
    );
  }
}
