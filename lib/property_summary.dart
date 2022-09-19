import 'package:flutter/material.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';

class PropertySummary extends StatefulWidget {
  PropertySummary({Key? key}) : super(key: key);

  @override
  State<PropertySummary> createState() => _PropertySummaryState();
}

class _PropertySummaryState extends State<PropertySummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 281,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Group_230.png',
                    ).image,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                  child: Text(
                    'Occupation Details',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          color: Colors.white,
                          fontSize: 24,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
