import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeekDayCheckerWidget extends StatefulWidget {
  const WeekDayCheckerWidget({
    Key? key,
    this.weekDays,
  }) : super(key: key);

  final List<WeekDayStruct>? weekDays;

  @override
  _WeekDayCheckerWidgetState createState() => _WeekDayCheckerWidgetState();
}

class _WeekDayCheckerWidgetState extends State<WeekDayCheckerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).itemBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) {
                final weekDays =
                    (widget.weekDays?.toList() ?? []).take(7).toList();
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: weekDays.length,
                  itemBuilder: (context, weekDaysIndex) {
                    final weekDaysItem = weekDays[weekDaysIndex];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() => FFAppState().vTmp = false);
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 7.5, 0, 7.5),
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
                              if (weekDaysItem.isChecked ?? true)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10.5, 12, 10.5),
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
                        Container(
                          width: double.infinity,
                          height: 0.5,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
