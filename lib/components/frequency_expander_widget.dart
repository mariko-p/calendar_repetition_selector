import '../backend/schema/structs/frequency_struct.dart';
import '/components/frequency_cupertino_picker_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'frequency_expander_model.dart';
export 'frequency_expander_model.dart';

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
  late FrequencyExpanderModel _model;
  int initialIndex = 0;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FrequencyExpanderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
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
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
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
                                FFLocalizations.of(context).getText(
                                  'xmgwzs7h' /* Frequency */,
                                ),
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
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFFBFCFF),
                    ),
                    child: wrapWithModel(
                      child: FrequencyCupertinoPickerWidget(
                          initialIndex: this.initialIndex,
                          onItemChanged: (index) async {
                            widget.onItemChanged(index);
                          }),
                      model: _model.frequencyCupertinoPickerModel,
                      updateCallback: () => setState(() {}),
                    ),
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
