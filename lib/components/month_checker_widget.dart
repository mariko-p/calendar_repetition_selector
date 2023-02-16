import '../backend/backend.dart';
import '../custom_code/constants/calendar_constants.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_checker_model.dart';
export 'month_checker_model.dart';

class MonthCheckerWidget extends StatefulWidget {
  const MonthCheckerWidget(
      {Key? key, required this.months, required this.monthSelectionChanged})
      : super(key: key);

  final List<MonthStruct> months;
  final Future<dynamic> Function() monthSelectionChanged;

  @override
  _MonthCheckerWidgetState createState() => _MonthCheckerWidgetState();
}

class _MonthCheckerWidgetState extends State<MonthCheckerWidget> {
  bool isWeekDaysActive = false;
  late MonthCheckerModel _model;

  rowBuilder(int startIndex, int endIndex) {
    return Builder(
      builder: (context) {
        final rowList = widget.months.sublist(startIndex, endIndex);

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(rowList.length, (itemIndex) {
            final item = rowList[itemIndex];
            final textValue = item.shortText;
            final monthIndex = itemIndex + startIndex;
            return Expanded(
              child: Stack(
                children: [
                  if (widget.months[monthIndex].isChecked == true)
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.months[monthIndex] = widget.months[monthIndex]
                              .rebuild((p0) => p0.isChecked = false);

                          widget.monthSelectionChanged();
                        });
                      },
                      borderRadius: getSpecificBorderRadius(item.text),
                      child: Container(
                        height: 36,
                        constraints: BoxConstraints(
                          maxWidth: 100,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF9980DD),
                          borderRadius: getSpecificBorderRadius(item.text),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            valueOrDefault<String>(
                              textValue,
                              'jan.',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  if (widget.months[monthIndex].isChecked == false)
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.months[monthIndex] = widget.months[monthIndex]
                              .rebuild((p0) => p0.isChecked = true);

                          widget.monthSelectionChanged();
                        });
                      },
                      borderRadius: getSpecificBorderRadius(item.text),
                      child: Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).itemBackground,
                          borderRadius: getSpecificBorderRadius(item.text),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            valueOrDefault<String>(
                              textValue,
                              'jan.',
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Rubik',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  if (itemIndex < (rowList.length - 1))
                    Align(
                      alignment: AlignmentDirectional(1, 0),
                      child: Container(
                        height: 36,
                        width: 0.5,
                        color: FlutterFlowTheme.of(context).lineColor,
                      ),
                    ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  BorderRadius? getSpecificBorderRadius(String? monthValue) {
    if (monthValue == Constants.JANUARY) {
      return BorderRadius.only(
        topLeft: Radius.circular(5),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      );
    }

    if (monthValue == Constants.APRIL) {
      return BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(5),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(0),
      );
    }

    if (monthValue == Constants.SEPTEMBER) {
      return BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(5),
        bottomRight: Radius.circular(0),
      );
    }

    if (monthValue == Constants.DECEMBER) {
      return BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(0),
        bottomRight: Radius.circular(5),
      );
    }

    // Default no BorderRadius
    return null;
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonthCheckerModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
        child: Column(
          children: [
            rowBuilder(0, 4),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            rowBuilder(4, 8),
            Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).lineColor,
              ),
            ),
            rowBuilder(8, 12),
          ],
        ),
      ),
    );
  }
}
