import 'package:flutter/material.dart';
import 'package:freedom/app_state.dart';
import 'package:freedom/components/form_2/add_property.dart';
import 'package:freedom/flutter_flow/flutter_flow_drop_down.dart';
import 'package:freedom/flutter_flow/flutter_flow_icon_button.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';

class CurrentPropertyDetails extends StatefulWidget {
  final String address;
  final String postcode;
  CurrentPropertyDetails(
      {Key? key, required this.address, required this.postcode})
      : super(key: key);

  @override
  State<CurrentPropertyDetails> createState() => _CurrentPropertyDetailsState();
}

class _CurrentPropertyDetailsState extends State<CurrentPropertyDetails> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  String? dropDownValue1;
  String? dropDownValue2;
  String? dropDownValue3;

  @override
  void initState() {
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4B65B2), Color(0xFF13BBE6)],
            stops: [0, 1],
            begin: AlignmentDirectional(-1, 0),
            end: AlignmentDirectional(1, 0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () async {
                      Navigator.pop(context, false);
                    },
                  ),
                  Text(
                    "Current Property Details",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Segoe UI',
                          color: Colors.white,
                          fontSize: 16,
                          useGoogleFonts: false,
                        ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              color: Color(0xFFEEF7FE),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Image.asset(
                                          "assets/images/building3.png",
                                          height: 19,
                                          width: 19,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  Address",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Seoge UI',
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: false,
                                            ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  widget.address,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        color: Color(0xff979797),
                                        fontFamily: 'Seoge UI',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.postcode,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        color: Color(0xff979797),
                                        fontFamily: 'Seoge UI',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Number of bedrooms',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        TextFormField(
                          controller: textController1,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '-',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF979797),
                                width: 0.25,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF979797),
                                width: 0.25,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Garage',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        FlutterFlowDropDown(
                          options: [
                            'Single',
                            'Double',
                            'Off road parking',
                            'Drive way'
                          ],
                          onChanged: (val) =>
                              setState(() => dropDownValue2 = val),
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '-',
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF4B65B2),
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 0,
                          borderColor: Color(0xFF979797),
                          borderWidth: 0.25,
                          borderRadius: 10,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Type of property',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        FlutterFlowDropDown(
                          options: [
                            'Detached',
                            'Semi detached',
                            'Terraced',
                            'Bunglow',
                            'Maisonette',
                            'Flat'
                          ],
                          onChanged: (val) =>
                              setState(() => dropDownValue3 = val),
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: 50,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    color: Color(0xFF263238),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    useGoogleFonts: false,
                                  ),
                          hintText: '-',
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF4B65B2),
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFF979797),
                          borderWidth: 0.25,
                          borderRadius: 10,
                          margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                          hidesUnderline: true,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Built year of the property',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        TextFormField(
                          controller: textController2,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '-',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF979797),
                                width: 0.25,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF979797),
                                width: 0.25,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Container(
                                      width: 26,
                                      height: 26,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/Untitled-4.png',
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Freedom Circle',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Seoge UI',
                                          fontSize: 16,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       0, 0, 20, 0),
                                  //   child:
                                  //   FlutterFlowIconButton(
                                  //     borderColor: Colors.transparent,
                                  //     borderRadius: 30,
                                  //     borderWidth: 1,
                                  //     buttonSize: 40,
                                  //     fillColor: Color(0xFFEEF7FE),
                                  //     icon: Icon(
                                  //       Icons.chevron_left,
                                  //       color: FlutterFlowTheme.of(context)
                                  //           .primaryText,
                                  //       size: 22,
                                  //     ),
                                  //     onPressed: () {
                                  //       print('IconButton pressed ...');
                                  //     },
                                  //   ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      // setState(() {
                                      //   FFAppState().addproperty = true;
                                      // });
                                      Navigator.pop(context, true);

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (_) =>
                                      //             DocumentuploadWidget()));
                                    },
                                    child: Container(
                                      width: 42,
                                      height: 42,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/Untitled-6.png',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
  }
}
