import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recetas_video_model.dart';
export 'recetas_video_model.dart';

class RecetasVideoWidget extends StatefulWidget {
  const RecetasVideoWidget({
    super.key,
    required this.id,
  });

  final String? id;

  @override
  State<RecetasVideoWidget> createState() => _RecetasVideoWidgetState();
}

class _RecetasVideoWidgetState extends State<RecetasVideoWidget> {
  late RecetasVideoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecetasVideoModel());

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
          'Recetas',
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
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 40.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterFlowVideoPlayer(
                  path: widget!.id!,
                  videoType: VideoType.network,
                  width: double.infinity,
                  height: double.infinity,
                  autoPlay: false,
                  looping: true,
                  showControls: true,
                  allowFullScreen: true,
                  allowPlaybackSpeedMenu: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
