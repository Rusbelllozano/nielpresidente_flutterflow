import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'evento_participante_model.dart';
export 'evento_participante_model.dart';

class EventoParticipanteWidget extends StatefulWidget {
  const EventoParticipanteWidget({
    super.key,
    this.participant,
  });

  final DocumentReference? participant;

  @override
  State<EventoParticipanteWidget> createState() =>
      _EventoParticipanteWidgetState();
}

class _EventoParticipanteWidgetState extends State<EventoParticipanteWidget>
    with TickerProviderStateMixin {
  late EventoParticipanteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventoParticipanteModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EventParticipantsRecord>(
      stream: EventParticipantsRecord.getDocument(widget!.participant!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final eventoParticipanteEventParticipantsRecord = snapshot.data!;

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
              eventoParticipanteEventParticipantsRecord.title,
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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.network(
                                eventoParticipanteEventParticipantsRecord.media,
                                width: double.infinity,
                                height: 250.0,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    eventoParticipanteEventParticipantsRecord
                                        .title,
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 2.0, 0.0, 0.0),
                                    child: Text(
                                      eventoParticipanteEventParticipantsRecord
                                          .description,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: StreamBuilder<List<VotesRecord>>(
                                stream: queryVotesRecord(
                                  queryBuilder: (votesRecord) => votesRecord
                                      .where(
                                        'user_id',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'event_participant_id',
                                        isEqualTo:
                                            eventoParticipanteEventParticipantsRecord
                                                .reference,
                                      ),
                                  singleRecord: true,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<VotesRecord> containerVotesRecordList =
                                      snapshot.data!;
                                  final containerVotesRecord =
                                      containerVotesRecordList.isNotEmpty
                                          ? containerVotesRecordList.first
                                          : null;

                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 16.0,
                                          color: Color(0x0A000000),
                                          offset: Offset(
                                            0.0,
                                            8.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: Color(0xFFE2E2E2),
                                      ),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 20.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 15.0),
                                            child: Text(
                                              'Participante',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 15.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/Capa_1.png',
                                                width: 300.0,
                                                height: 90.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'Apóyalos con tu voto',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              if (!(containerVotesRecord !=
                                                  null)) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 15.0),
                                                  child: StreamBuilder<
                                                      List<VotesRecord>>(
                                                    stream: queryVotesRecord(
                                                      queryBuilder:
                                                          (votesRecord) =>
                                                              votesRecord
                                                                  .where(
                                                                    'event_participant_id',
                                                                    isEqualTo:
                                                                        widget!
                                                                            .participant,
                                                                  )
                                                                  .where(
                                                                    'user_id',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<VotesRecord>
                                                          ratingBarVotesRecordList =
                                                          snapshot.data!;
                                                      final ratingBarVotesRecord =
                                                          ratingBarVotesRecordList
                                                                  .isNotEmpty
                                                              ? ratingBarVotesRecordList
                                                                  .first
                                                              : null;

                                                      return RatingBar.builder(
                                                        onRatingUpdate: (newValue) =>
                                                            safeSetState(() =>
                                                                _model.ratingBarValue1 =
                                                                    newValue),
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color:
                                                              Color(0xFFEDCF15),
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        initialRating: _model
                                                                .ratingBarValue1 ??=
                                                            valueOrDefault<
                                                                double>(
                                                          ratingBarVotesRecord
                                                              ?.score
                                                              ?.toDouble(),
                                                          0.0,
                                                        ),
                                                        unratedColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        itemCount: 5,
                                                        itemSize: 40.0,
                                                        glowColor:
                                                            Color(0xFFEDCF15),
                                                      );
                                                    },
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 15.0),
                                                  child: StreamBuilder<
                                                      List<VotesRecord>>(
                                                    stream: queryVotesRecord(
                                                      queryBuilder:
                                                          (votesRecord) =>
                                                              votesRecord
                                                                  .where(
                                                                    'event_participant_id',
                                                                    isEqualTo:
                                                                        widget!
                                                                            .participant,
                                                                  )
                                                                  .where(
                                                                    'user_id',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<VotesRecord>
                                                          ratingBarVotesRecordList =
                                                          snapshot.data!;
                                                      final ratingBarVotesRecord =
                                                          ratingBarVotesRecordList
                                                                  .isNotEmpty
                                                              ? ratingBarVotesRecordList
                                                                  .first
                                                              : null;

                                                      return RatingBarIndicator(
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star_rounded,
                                                          color:
                                                              Color(0xFFEDCF15),
                                                        ),
                                                        direction:
                                                            Axis.horizontal,
                                                        rating: valueOrDefault<
                                                            double>(
                                                          ratingBarVotesRecord
                                                              ?.score
                                                              ?.toDouble(),
                                                          0.0,
                                                        ),
                                                        unratedColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent3,
                                                        itemCount: 5,
                                                        itemSize: 40.0,
                                                      );
                                                    },
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                          if (!(containerVotesRecord != null))
                                            FFButtonWidget(
                                              onPressed: () async {
                                                if (loggedIn) {
                                                  var votesRecordReference =
                                                      VotesRecord.collection
                                                          .doc();
                                                  await votesRecordReference
                                                      .set(
                                                          createVotesRecordData(
                                                    userId:
                                                        currentUserReference,
                                                    eventId:
                                                        eventoParticipanteEventParticipantsRecord
                                                            .eventId,
                                                    score: _model
                                                        .ratingBarValue1
                                                        ?.round(),
                                                    eventParticipantId:
                                                        widget!.participant,
                                                  ));
                                                  _model.voteResponse = VotesRecord
                                                      .getDocumentFromData(
                                                          createVotesRecordData(
                                                            userId:
                                                                currentUserReference,
                                                            eventId:
                                                                eventoParticipanteEventParticipantsRecord
                                                                    .eventId,
                                                            score: _model
                                                                .ratingBarValue1
                                                                ?.round(),
                                                            eventParticipantId:
                                                                widget!
                                                                    .participant,
                                                          ),
                                                          votesRecordReference);

                                                  context.pushNamed(
                                                      'EventoParticipantes');
                                                } else {
                                                  context.pushNamed('Login');
                                                }

                                                safeSetState(() {});
                                              },
                                              text: 'Votar',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        50.0, 0.0, 50.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(22.0),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation']!);
                                },
                              ),
                            ),
                            if (eventoParticipanteEventParticipantsRecord
                                        .googleMapsUrl !=
                                    null &&
                                eventoParticipanteEventParticipantsRecord
                                        .googleMapsUrl !=
                                    '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await launchURL(
                                        eventoParticipanteEventParticipantsRecord
                                            .googleMapsUrl);
                                  },
                                  text: '¿Cómo llegar?',
                                  icon: Icon(
                                    Icons.location_on_outlined,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 18.0, 0.0, 18.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Colors.transparent,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    elevation: 0.0,
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (eventoParticipanteEventParticipantsRecord
                                                .instagramUrl !=
                                            null &&
                                        eventoParticipanteEventParticipantsRecord
                                                .instagramUrl !=
                                            '')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              eventoParticipanteEventParticipantsRecord
                                                  .instagramUrl);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/uil_instagram.png',
                                                width: 25.0,
                                                height: 25.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Ir a Instagram',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (eventoParticipanteEventParticipantsRecord
                                                .facebookUrl !=
                                            null &&
                                        eventoParticipanteEventParticipantsRecord
                                                .facebookUrl !=
                                            '')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              eventoParticipanteEventParticipantsRecord
                                                  .facebookUrl);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/Group_405.png',
                                                width: 25.0,
                                                height: 25.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Ir a Facebook',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (eventoParticipanteEventParticipantsRecord
                                                .tiktokUrl !=
                                            null &&
                                        eventoParticipanteEventParticipantsRecord
                                                .tiktokUrl !=
                                            '')
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await launchURL(
                                              eventoParticipanteEventParticipantsRecord
                                                  .tiktokUrl);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: Image.asset(
                                                'assets/images/ph_tiktok-logo.png',
                                                width: 25.0,
                                                height: 25.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Ir a Tiktok',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
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
            ),
          ),
        );
      },
    );
  }
}
