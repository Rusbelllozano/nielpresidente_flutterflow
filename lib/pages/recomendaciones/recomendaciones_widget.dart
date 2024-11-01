import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recomendaciones_model.dart';
export 'recomendaciones_model.dart';

class RecomendacionesWidget extends StatefulWidget {
  const RecomendacionesWidget({super.key});

  @override
  State<RecomendacionesWidget> createState() => _RecomendacionesWidgetState();
}

class _RecomendacionesWidgetState extends State<RecomendacionesWidget> {
  late RecomendacionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecomendacionesModel());

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
            context.safePop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24.0,
          ),
        ),
        title: Text(
          'Recomendaciones',
          style: FlutterFlowTheme.of(context).bodySmall.override(
                fontFamily: 'Poppins',
                fontSize: 18.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 40.0),
          child: StreamBuilder<List<RecommendationsRecord>>(
            stream: queryRecommendationsRecord(),
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
              List<RecommendationsRecord> columnRecommendationsRecordList =
                  snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(
                      columnRecommendationsRecordList.length, (columnIndex) {
                    final columnRecommendationsRecord =
                        columnRecommendationsRecordList[columnIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Recomendacion',
                          queryParameters: {
                            'recommendation': serializeParam(
                              columnRecommendationsRecord.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: double.infinity,
                          height: 140.0,
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
                                  columnRecommendationsRecord.thumbnail,
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
                                height: double.infinity,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        columnRecommendationsRecord.title,
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
