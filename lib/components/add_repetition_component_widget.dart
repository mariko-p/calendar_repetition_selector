import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:custom_recurring_selectors/custom_code/actions/index.dart';

import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/custom_repetition_component_widget.dart';
import '../custom_code/constants/calendar_constants.dart';
import '../flutter_flow/custom_functions.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class AddRepetitionComponentWidget extends StatefulWidget {
  const AddRepetitionComponentWidget({Key? key, this.rrule}) : super(key: key);

  final String? rrule;

  @override
  _AddRepetitionComponentWidgetState createState() =>
      _AddRepetitionComponentWidgetState();
}

class _AddRepetitionComponentWidgetState
    extends State<AddRepetitionComponentWidget> {
  late int selectedIndex;
  late List<RepetitionStruct> repetitions;

  @override
  void initState() {
    repetitions = functions.getPredefinedRepetitionList().toList();
    initSelectedItem();
    super.initState();
  }

  void initSelectedItem() {
    selectedIndex = -1;
    if (widget.rrule?.isEmpty == true || widget.rrule == null) {
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

  void applyRRule(index) {
    if (index == 6) {
      FFAppState().vCurrentRRule = "RRULE:";
    } else if (index >= 0 && index <= 5) {
      FFAppState().vCurrentRRule = repetitions[index].rrule!;
    }
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
          child: BottomSheetNavBarWidget(
            backText: 'Date',
            title: 'Add repetition',
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 24, 15, 15),
          child: Builder(
            builder: (context) {
              repetitions.forEachIndexed((index, element) {
                if (index == selectedIndex) {
                  repetitions[index] =
                    element.rebuild((p0) => p0.isSelected = true);
                } else {
                  repetitions[index] = 
                    element.rebuild((p0) => p0.isSelected = false);
                }
              });
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: repetitions.length,
                itemBuilder: (context, itemIndex) {
                  final weekDaysItem = repetitions[itemIndex];
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            selectedIndex = itemIndex;
                            applyRRule(selectedIndex);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).itemBackground,
                            borderRadius: getSpecificBorderRadius(itemIndex),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 7.5, 20, 7.5),
                                child: Text(
                                  valueOrDefault<String>(
                                    weekDaysItem.text,
                                    'Monday',
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
                      if (itemIndex != 5)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(21, 0, 0, 0),
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
          child: InkWell(
            onTap: () async {
              selectedIndex = 6;
              //Navigator.pop(context);
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.95,
                      child: CustomRepetitionComponentWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: Container(
              decoration: BoxDecoration (
                color: FlutterFlowTheme.of(context).itemBackground,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 7.5, 20, 7.5),
                      child: Text(
                        Constants.CUSTOM,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
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
      ],
    );
  }
}
