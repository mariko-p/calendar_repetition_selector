import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_checker_model.dart';
export 'month_checker_model.dart';

class MonthCheckerWidget extends StatefulWidget {
  const MonthCheckerWidget({
    super.key,
    this.months,
  });

  final List<MonthStruct>? months;

  @override
  State<MonthCheckerWidget> createState() => _MonthCheckerWidgetState();
}

class _MonthCheckerWidgetState extends State<MonthCheckerWidget> {
  late MonthCheckerModel _model;

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Builder(
            builder: (context) {
              final firstRowMonth = functions.getMonthsList().toList();
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    List.generate(firstRowMonth.length, (firstRowMonthIndex) {
                  final firstRowMonthItem = firstRowMonth[firstRowMonthIndex];
                  return Expanded(
                    child: Stack(
                      children: [
                        if (firstRowMonthItem.isChecked == true)
                          Container(
                            height: 36.0,
                            constraints: BoxConstraints(
                              maxWidth: 100.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF9980DD),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  firstRowMonthItem.text,
                                  'jan.',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                              )),
                            ),
                          ),
                        if (firstRowMonthItem.isChecked == false)
                          Container(
                            height: 36.0,
                            constraints: BoxConstraints(
                              maxWidth: 100.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: SelectionArea(
                                  child: Text(
                                valueOrDefault<String>(
                                  firstRowMonthItem.text,
                                  'jan.',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      lineHeight: 1.5,
                                    ),
                              )),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(1.0, 0.0),
                          child: Container(
                            width: 0.5,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            },
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).lineColor,
            ),
          ),
        ],
      ),
    );
  }
}
