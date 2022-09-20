import 'package:freedom/flutter_flow/flutter_flow_icon_button.dart';

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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
          SizedBox(
            height: 20,
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 43,
            fillColor: Colors.white,
            icon: Icon(
              Icons.close,
              color: Color(0xFF979797),
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
