import '../components/bottom_sheet_nav_bar_widget.dart';
import '../components/custom_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRepetitionComponentWidget extends StatefulWidget {
  const AddRepetitionComponentWidget({Key? key}) : super(key: key);

  @override
  _AddRepetitionComponentWidgetState createState() =>
      _AddRepetitionComponentWidgetState();
}

class _AddRepetitionComponentWidgetState
    extends State<AddRepetitionComponentWidget> {
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
              final weekDays = functions
                  .getPredefinedRepetitionList()
                  .toList()
                  .take(7)
                  .toList();
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
                            if (weekDaysItem.isSelected ?? true)
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
                      if (weekDaysIndex != 5)
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
              setState(() => FFAppState().vTmp = false);
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 7.5, 20, 7.5),
                    child: Text(
                      'Custom',
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
                        onTap: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.09,
                                  child: CustomRepetitionComponentWidget(),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Stack(
                            children: [
                              if (FFAppState().vTmp)
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 1.5, 0),
                                    child: Icon(
                                      FFIcons.kangleFullRight,
                                      color: Color(0xFF7E8CA2),
                                      size: 12,
                                    ),
                                  ),
                                ),
                              if (FFAppState().vTmp)
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
      ],
    );
  }
}
