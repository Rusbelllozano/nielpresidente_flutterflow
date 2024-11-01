import '/auth/base_auth_user_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'evento_participantes_model.dart';
export 'evento_participantes_model.dart';

class EventoParticipantesWidget extends StatefulWidget {
  const EventoParticipantesWidget({super.key});

  @override
  State<EventoParticipantesWidget> createState() =>
      _EventoParticipantesWidgetState();
}

class _EventoParticipantesWidgetState extends State<EventoParticipantesWidget> {
  late EventoParticipantesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventoParticipantesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        title: Text(
          'Ni el presidente Master',
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Poppins',
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
          child: StreamBuilder<List<EventParticipantsRecord>>(
            stream: queryEventParticipantsRecord(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<EventParticipantsRecord> columnEventParticipantsRecordList =
                  snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                      columnEventParticipantsRecordList.length, (columnIndex) {
                    final columnEventParticipantsRecord =
                        columnEventParticipantsRecordList[columnIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (loggedIn) {
                          context.pushNamed(
                            'EventoParticipante',
                            queryParameters: {
                              'participant': serializeParam(
                                columnEventParticipantsRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          context.pushNamed('Login');
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: double.infinity,
                          height: 130.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 10.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 10.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Color(0xFFE2E2E2),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Image.network(
                                  columnEventParticipantsRecord.media,
                                  height: 137.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Rectangle_149.png',
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.504,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 8.0, 0.0, 8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 15.0),
                                        child: Text(
                                          columnEventParticipantsRecord.title
                                              .maybeHandleOverflow(
                                            maxChars: 40,
                                            replacement: '…',
                                          ),
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          if (loggedIn) {
                                            context.pushNamed(
                                              'EventoParticipante',
                                              queryParameters: {
                                                'participant': serializeParam(
                                                  columnEventParticipantsRecord
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType
                                                          .rightToLeft,
                                                ),
                                              },
                                            );
                                          } else {
                                            context.pushNamed('Login');
                                          }
                                        },
                                        text: 'Votar',
                                        options: FFButtonOptions(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Colors.transparent,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Poppins',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5AD128),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 30.0, 0.0),
                                  child: Container(
                                    width: 50.0,
                                    height: 3.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF5AD128),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).divide(SizedBox(height: 15.0)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
