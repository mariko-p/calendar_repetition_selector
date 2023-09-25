import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'radio_button_model.dart';
export 'radio_button_model.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    Key? key,
    required this.isDisabled,
  }) : super(key: key);

  final bool? isDisabled;

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  late RadioButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RadioButtonModel());
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
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (!widget.isDisabled!)
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Color(0xFF7E8CA2),
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFF68768D),
                width: 1.0,
              ),
            ),
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        if (widget.isDisabled ?? true)
          Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0xFFBDC4D0),
                width: 1.0,
              ),
            ),
            alignment: AlignmentDirectional(0.00, 0.00),
          ),
      ],
    );
  }
}
