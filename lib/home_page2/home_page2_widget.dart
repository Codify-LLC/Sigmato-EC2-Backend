import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../phone_number/phone_number_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage2Widget extends StatefulWidget {
  const HomePage2Widget({Key? key}) : super(key: key);

  @override
  _HomePage2WidgetState createState() => _HomePage2WidgetState();
}

class _HomePage2WidgetState extends State<HomePage2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/Group_25064_(2).png',
                  ).image,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0, 0.65),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PhoneNumberWidget(),
                    ),
                  );
                },
                child: Container(
                  width: 279,
                  height: 46,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Button_(2).png',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Let\'s Start',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
