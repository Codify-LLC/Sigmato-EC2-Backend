import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FinishedWidget extends StatefulWidget {
  const FinishedWidget({Key? key}) : super(key: key);

  @override
  _FinishedWidgetState createState() => _FinishedWidgetState();
}

class _FinishedWidgetState extends State<FinishedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 387,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        'assets/images/Untitled-14.png',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        fit: BoxFit.cover,
      ),
    );
  }
}
