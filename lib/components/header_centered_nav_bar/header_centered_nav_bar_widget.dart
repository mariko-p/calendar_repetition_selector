import '../../flutter_flow/custom_functions.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'header_centered_nav_bar_model.dart';
export 'header_centered_nav_bar_model.dart';

class HeaderCenteredNavBarWidget extends StatefulWidget {
  const HeaderCenteredNavBarWidget({
    super.key,
    this.title,
    this.isSaveVisible,
    this.isSaveEnabled,
    this.onSaveTap,
    this.onCancelTap,
    /*L*/
  });

  final String? title;
  final bool? isSaveVisible;
  final bool? isSaveEnabled;
  final Future Function()? onSaveTap;
  final Future Function()? onCancelTap;

  @override
  State<HeaderCenteredNavBarWidget> createState() =>
      _HeaderCenteredNavBarWidgetState();
}

class _HeaderCenteredNavBarWidgetState
    extends State<HeaderCenteredNavBarWidget> {
  late HeaderCenteredNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeaderCenteredNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isWeb)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 11.0, 0.0, 0.0),
              child: Container(
                width: 45.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Color(0xFFE8EBF2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          Container(
            height: 37.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      // Dismiss bottom sheet
                      // Needs to be propagated to distinguish between cancel and exit app.
                      await widget.onCancelTap?.call();
                      // Navigator.pop(context);
                    },
                    text: FFLocalizations.of(context).getText(
                      'usujndrb' /* Cancel */,
                    ),
                    options: FFButtonOptions(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.transparent,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Rubik',
                                color: FlutterFlowTheme.of(context)
                                    .bottomSheetActionButtons,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w300,
                                lineHeight: 1.5,
                              ),
                      elevation: 0.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    widget!.title!,
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Rubik',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                if (widget!.isSaveVisible ?? true)
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (widget!.isSaveVisible! && widget!.isSaveEnabled!) {
                          // onSave
                          await widget.onSaveTap?.call();
                          // dismiss dialog
                          // Navigator.pop(context);
                        }
                      },
                      text: FFLocalizations.of(context).getText(
                        't7ggjw9g' /* Save */,
                      ),
                      options: FFButtonOptions(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.transparent,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Rubik',
                                  //LOCAL_START
                                  color: (widget.isSaveEnabled == true)
                                      ? FlutterFlowTheme.of(context)
                                          .bottomSheetActionButtons
                                      : combineColors(FFAppState().cDisabledButtonColors),
                                  //LOCAL_END
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.5,
                                ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
