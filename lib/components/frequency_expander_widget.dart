import '../components/frequency_cupertino_picker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FrequencyExpanderWidget extends StatefulWidget {
  const FrequencyExpanderWidget({Key? key}) : super(key: key);

  @override
  _FrequencyExpanderWidgetState createState() =>
      _FrequencyExpanderWidgetState();
}

class _FrequencyExpanderWidgetState extends State<FrequencyExpanderWidget> {
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 24, 15, 0),
      child: Container(
        width: double.infinity,
        color: FlutterFlowTheme.of(context).itemBackground,
        child: ExpandableNotifier(
          initialExpanded: false,
          child: ExpandablePanel(
            header: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 36,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).itemBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).itemBackground,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 7.5, 0, 7.5),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xmgwzs7h' /* Frequency */,
                            ),
                            style: FlutterFlowTheme.of(context).title1.override(
                                  fontFamily: 'Rubik',
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'r3anp0or' /* every day */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Rubik',
                                      color: Color(0xFF7E8CA2),
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: Color(0xFFE8EBF2),
                    ),
                  ),
                ),
              ],
            ),
            collapsed: Container(),
            expanded: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Container(
                    width: double.infinity,
                    height: 0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FrequencyCupertinoPickerWidget(),
                  ),
                ),
              ],
            ),
            theme: ExpandableThemeData(
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              hasIcon: false,
            ),
          ),
        ),
      ),
    );
  }
}
