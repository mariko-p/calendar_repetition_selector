import 'package:custom_recurring_selectors/flutter_flow/custom_functions.dart';

import '../components/add_repetition_component_widget.dart';
import '../components/custom_repetition_component_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    // SchedulerBinding.instance.addPostFrameCallback((_) async {
    //   await showModalBottomSheet(
    //     isScrollControlled: true,
    //     backgroundColor: Colors.transparent,
    //     context: context,
    //     builder: (context) {
    //       return Padding(
    //         padding: MediaQuery.of(context).viewInsets,
    //         child: Container(
    //           height: double.infinity,
    //           child: CustomRepetitionComponentWidget(),
    //         ),
    //       );
    //     },
    //   ).then((value) => setState(() {}));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(40, 40, 40, 40),
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // TEST: Show the custom repetition selector.
                        // var rrule = "";
                        var rrule = 'RRULE:FREQ=DAILY;INTERVAL=4;';
                        // var rrule = 'RRULE:FREQ=WEEKLY;INTERVAL=4;';
                        // var rrule = 'RRULE:FREQ=WEEKLY;INTERVAL=4;BYDAY=MO,WE,FR,SA,SU;';
                        // var rrule = 'RRULE:FREQ=DAILY;INTERVAL=4;BYMONTHDAY=10,15,20;';
                        // var rrule = 'RRULE:FREQ=MONTHLY;INTERVAL=2;BYMONTHDAY=10,15,20;';
                        // var rrule = 'RRULE:FREQ=MONTHLY;INTERVAL=2;BYDAY=SA,SU;BYSETPOS=5';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYMONTH=3,5,6;';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYDAY=SA,SU;BYSETPOS=5';
                        // var rrule = 'RRULE:FREQ=YEARLY;INTERVAL=5;BYDAY=SA,SU;BYSETPOS=5;BYMONTH=10';
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.95,
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
                        ).then((value) => setState(() {}));
                      },
                      text: 'Open',
                      options: FFButtonOptions(
                        width: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Rubik',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
