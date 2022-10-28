import 'package:custom_recurring_selectors/backend/backend.dart';

import '../components/interval_cupertino_picker_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntervalExpanderWidget extends StatefulWidget {
  const IntervalExpanderWidget(
      {Key? key,
      required this.intController,
      required this.currentIntervals,
      required this.currentIntervalIndex,
      required this.onItemChanged})
      : super(key: key);

  final Future<dynamic> Function(int index) onItemChanged;
  final ExpandableController intController;
  final List<IntervalStruct> currentIntervals;
  final int currentIntervalIndex;

  @override
  _IntervalExpanderWidgetState createState() => _IntervalExpanderWidgetState();
}

class _IntervalExpanderWidgetState extends State<IntervalExpanderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).itemBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        child: ExpandableNotifier(
          controller: widget.intController,
          child: ExpandablePanel(
            header: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).itemBackground,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      bottomRight: Radius.circular(5),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                  ),
                  child: Material(
                    color: FlutterFlowTheme.of(context).itemBackground,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    child: InkWell(
                      onTap: () => {widget.intController.toggle()},
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 7.5, 0, 7.5),
                            child: Text(
                              'With the interval',
                              style:
                                  FlutterFlowTheme.of(context).title1.override(
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
                                  widget
                                          .currentIntervals[
                                              widget.currentIntervalIndex]
                                          .text ??
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
                        color: FlutterFlowTheme.of(context).itemBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: IntervalCupertinoPickerWidget(
                          items: widget.currentIntervals,
                          onItemChanged: (index) async {
                            widget.onItemChanged(index);
                          }),
                    )),
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
