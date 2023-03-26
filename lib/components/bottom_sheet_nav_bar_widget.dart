import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_sheet_nav_bar_model.dart';
export 'bottom_sheet_nav_bar_model.dart';

class BottomSheetNavBarWidget extends StatefulWidget {
  const BottomSheetNavBarWidget({
    Key? key,
    this.backText,
    this.title,
  }) : super(key: key);

  final String? backText;
  final String? title;

  @override
  _BottomSheetNavBarWidgetState createState() =>
      _BottomSheetNavBarWidgetState();
}

class _BottomSheetNavBarWidgetState extends State<BottomSheetNavBarWidget> {
  late BottomSheetNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomSheetNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
          child: Container(
            width: 45.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Color(0xFFE8EBF2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
            child: Container(
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      child: Text(
                        valueOrDefault(widget.title, ""),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Rubik',
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1,0),
                    child: Container(
                      padding: EdgeInsetsDirectional.fromSTEB(6, 0, 12, 0),
                      child: InkWell(
                        onTap: () async {
                          // BottomSheetDissmis and return vCurrentRRule.
                          Navigator.pop(context, FFAppState().vCurrentRRule);
                        },
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: Container(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Icon(
                                  FFIcons.kangleFullLeft,
                                  color: Colors.black,
                                  size: 12,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding:
                                      EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                                  child: Text(
                                    valueOrDefault(widget.backText, ""),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Rubik',
                                          color: FlutterFlowTheme.of(context)
                                          .bottomSheetActionButtons,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14
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
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}
