import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'week_day_checker_model.dart';
export 'week_day_checker_model.dart';

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
  late WeekDayCheckerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WeekDayCheckerModel());
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5.0),
      ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            18.0, 14.5, 10.0, 14.5),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().vTmp = false;
                            });
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  weekDaysItem.text,
                                  'Monday',
                                ),
                                style: GoogleFonts.getFont(
                                  'Rubik',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0,
                                  height: 1.5,
                                ),
                              ),
                              if (weekDaysItem.isChecked)
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(1.00, 0.00),
                                    child: Icon(
                                      FFIcons.kcheckbox,
                                      color: Color(0xFF9980DD),
                                      size: 18.0,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
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
        ],
      ),
    );
  }
}
