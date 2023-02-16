import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'month_checker_model.dart';
export 'month_checker_model.dart';

class MonthCheckerWidget extends StatefulWidget {
  const MonthCheckerWidget({
    Key? key,
    this.months,
  }) : super(key: key);

  final List<MonthStruct>? months;

  @override
  _MonthCheckerWidgetState createState() => _MonthCheckerWidgetState();
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                              height: 36,
                              constraints: BoxConstraints(
                                maxWidth: 100,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF9980DD),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    firstRowMonthItem.text,
                                    'jan.',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.5,
                                      ),
                                )),
                              ),
                            ),
                          if (firstRowMonthItem.isChecked == false)
                            Container(
                              height: 36,
                              constraints: BoxConstraints(
                                maxWidth: 100,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).itemBackground,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: SelectionArea(
                                    child: Text(
                                  valueOrDefault<String>(
                                    firstRowMonthItem.text,
                                    'jan.',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Rubik',
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        lineHeight: 1.5,
                                      ),
                                )),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Container(
                              width: 0.5,
                              height: 36,
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
              height: 1,
              decoration: BoxDecoration(
                color: Color(0xFF7E8CA2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
