import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_model.dart';
export 'button_model.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({
    super.key,
    String? label,
    this.parameter1,
  }) : this.label = label ?? 'Continuar';

  final String label;
  final String? parameter1;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  late ButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: widget!.label,
      options: FFButtonOptions(
        width: double.infinity,
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Color(0xFFFAD61D),
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.w500,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0.0,
        ),
      ),
    );
  }
}
