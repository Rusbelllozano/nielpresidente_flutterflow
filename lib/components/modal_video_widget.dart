import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'modal_video_model.dart';
export 'modal_video_model.dart';

class ModalVideoWidget extends StatefulWidget {
  const ModalVideoWidget({
    super.key,
    required this.videoSource,
  });

  final String? videoSource;

  @override
  State<ModalVideoWidget> createState() => _ModalVideoWidgetState();
}

class _ModalVideoWidgetState extends State<ModalVideoWidget> {
  late ModalVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: FlutterFlowVideoPlayer(
        path: widget!.videoSource!,
        videoType: VideoType.network,
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: MediaQuery.sizeOf(context).height * 1.0,
        autoPlay: false,
        looping: true,
        showControls: true,
        allowFullScreen: true,
        allowPlaybackSpeedMenu: false,
      ),
    );
  }
}
