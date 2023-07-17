import '/components/add_repetition_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

// LOCAL_START
import '../helpers/window.dart';
// LOCAL_END

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    //LOCAL_START - comment this.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   await showModalBottomSheet(
    //     isScrollControlled: true,
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (bottomSheetContext) {
    //       return Padding(
    //         padding: MediaQuery.viewInsetsOf(bottomSheetContext),
    //         child: Container(
    //           height: double.infinity,
    //           child: CustomRepetitionComponentWidget(),
    //         ),
    //       );
    //     },
    //   ).then((value) => setState(() {}));
    // });
    //LOCAL_END
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 40.0, 40.0),
                  child: Container(
                    width: 150.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // TEST: Show the custom repetition selector.
                        var rrule = "";
                        // var rrule = 'RRULE:FREQ=DAILY;INTERVAL=4;';
                        // var rrule = 'RRULE:FREQ=WEEKLY;INTERVAL=4;';
                        // var rrule = 'RRULE:FREQ=WEEKLY;INTERVAL=4;BYDAY=MO,WE,FR,SA,SU;';
                        // var rrule = 'RRULE:FREQ=DAILY;INTERVAL=4;BYMONTHDAY=10,15,20;';
                        // var rrule = 'RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTHDAY=10,15,20;';
                        // var rrule = 'RRULE:FREQ=MONTHLY;INTERVAL=2;BYDAY=SA,SU;BYSETPOS=5';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYMONTH=3,5,6;WKST=MO';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYDAY=SA,SU;BYSETPOS=5';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYDAY=SA,SU;BYSETPOS=5;BYMONTH=10';
                        FFAppState().vCurrentRRule = rrule;
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (bottomSheetContext) {
                            return Padding(
                              //LOCAL_START
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, getSafePaddingTop(), 0, 0),
                              //LOCAL_END
                              child: Container(
                                //LOCAL_START
                                // height:
                                //     MediaQuery.sizeOf(context).height * 0.95,
                                //LOCAL_END
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    color: Colors.white,
                                ),
                                child: AddRepetitionComponentWidget(rrule: rrule),
                              ),
                            );
                          },
                        ).then((value) => setState(() {
                          //print ("RRULE: on back: $value");
                        }));
                      },
                      text: FFLocalizations.of(context).getText(
                        'xwyxwy9n' /* Open */,
                      ),
                      options: FFButtonOptions(
                        width: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 20.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
