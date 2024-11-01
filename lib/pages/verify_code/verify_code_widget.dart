import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verify_code_model.dart';
export 'verify_code_model.dart';

class VerifyCodeWidget extends StatefulWidget {
  const VerifyCodeWidget({
    super.key,
    required this.phoneNumber,
  });

  final String? phoneNumber;

  @override
  State<VerifyCodeWidget> createState() => _VerifyCodeWidgetState();
}

class _VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  late VerifyCodeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifyCodeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: true,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Confirma tu código',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Poppins',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Text(
                      'Te hemos enviado un código de 6 dígitos al el numero ${widget!.phoneNumber}',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: PinCodeTextField(
                      autoDisposeControllers: false,
                      appContext: context,
                      length: 6,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                              ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      enableActiveFill: false,
                      autoFocus: true,
                      enablePinAutofill: false,
                      errorTextSpace: 0.0,
                      showCursor: true,
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldHeight: 50.0,
                        fieldWidth: 50.0,
                        borderWidth: 1.0,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        shape: PinCodeFieldShape.box,
                        activeColor: Color(0xFFE2E2E2),
                        inactiveColor: Color(0xFFE2E2E2),
                        selectedColor: Colors.white,
                      ),
                      controller: _model.pinCodeController,
                      onChanged: (_) {},
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: _model.pinCodeControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  final smsCodeVal = _model.pinCodeController!.text;
                  if (smsCodeVal == null || smsCodeVal.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Enter SMS verification code.'),
                      ),
                    );
                    return;
                  }
                  final phoneVerifiedUser = await authManager.verifySmsCode(
                    context: context,
                    smsCode: smsCodeVal,
                  );
                  if (phoneVerifiedUser == null) {
                    return;
                  }

                  // Get User
                  _model.usuario =
                      await UsersRecord.getDocumentOnce(currentUserReference!);
                  if (_model.usuario!.hasDisplayName()) {
                    context.pushNamedAuth('Home', context.mounted);
                  } else {
                    context.pushNamedAuth('Registro', context.mounted);
                  }

                  safeSetState(() {});
                },
                text: 'Continuar',
                options: FFButtonOptions(
                  width: double.infinity,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 18.0, 0.0, 18.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
