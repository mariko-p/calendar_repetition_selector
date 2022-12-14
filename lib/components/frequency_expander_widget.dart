import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:custom_recurring_selectors/custom_code/constants/calendar_constants.dart';
import 'package:custom_recurring_selectors/flutter_flow/custom_functions.dart';

import '../components/frequency_cupertino_picker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FrequencyExpanderWidget extends StatefulWidget {
  const FrequencyExpanderWidget(
      {Key? key,
      required this.freqController,
      required this.currentFrequency,
      required this.onItemChanged})
      : super(key: key);

  final Future<dynamic> Function(int index) onItemChanged;
  final ExpandableController freqController;
  final FrequencyStruct currentFrequency;

  @override
  _FrequencyExpanderWidgetState createState() =>
      _FrequencyExpanderWidgetState();
}

class _FrequencyExpanderWidgetState extends State<FrequencyExpanderWidget> {
  int initialIndex = 0;
  @override
  void initState() {
    initialIndex = generateFrequency().indexWhere(
        (element) => element.value == widget.currentFrequency.value);
        
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 24, 15, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
          color: FlutterFlowTheme.of(context).itemBackground,
        ),
        child: ExpandableNotifier(
          controller: widget.freqController,
          child: ExpandablePanel(
            header: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  child: Material(
                    color: FlutterFlowTheme.of(context).itemBackground,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                    ),
                    child: InkWell(
                      onTap: () => {widget.freqController.toggle()},
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      child: Container(
                        width: double.infinity,
                        height: 36,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 7.5, 0, 7.5),
                              child: Text(
                                'Frequency',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .override(
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
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 20, 0),
                                  child: Text(
                                    widget.currentFrequency.text
                                            ?.toLowerCase() ??
                                        "",
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
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 0.5,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).lineColor,
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
                    decoration: BoxDecoration(
                      color: Color(0xFFFBFCFF),
                    ),
                    child: FrequencyCupertinoPickerWidget(
                        initialIndex: this.initialIndex,
                        onItemChanged: (index) async {
                          widget.onItemChanged(index);
                        }),
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
