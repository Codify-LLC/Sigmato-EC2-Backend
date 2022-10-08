import 'package:flutter/material.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';

import '../../app_state.dart';
import '../current_property_details.dart';

class AddProperty extends StatefulWidget {
  final String address;
  final String postcode;
  final String mortBalance;
  final String remMort;
  final String propValue;
  final String mortLender;
  AddProperty(
      {Key? key,
      required this.address,
      required this.postcode,
      required this.mortBalance,
      required this.remMort,
      required this.propValue,
      required this.mortLender})
      : super(key: key);

  @override
  State<AddProperty> createState() => _AddPropertyState();
}

class _AddPropertyState extends State<AddProperty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              color: Color(0xFF000000).withOpacity(0.05),
              offset: Offset(0, 4),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEF7FE),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      "assets/images/building3.png",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    FFAppState().addproperty ? "Property Name" : 'Add property',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Segoe UI',
                          color: Color(0xFF4B65B2),
                          useGoogleFonts: false,
                        ),
                  ),
                  Spacer(),
                  FFAppState().addproperty
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Image.asset(
                                "assets/images/edit.png",
                                height: 18,
                                width: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                              // onTap: () async {
                              //   FFAppState()
                              //       .creditCardList
                              //       .removeAt(
                              //           index);
                              //   await Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder:
                              //               (_) =>
                              //                   Reload()));
                              // },
                              child: Image.asset(
                                "assets/images/delete.png",
                                height: 18,
                                width: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        )
                      : InkWell(
                          onTap: () async {
                            final value = await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              barrierColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              context: context,
                              builder: (context) {
                                return Padding(
                                  padding: MediaQuery.of(context).viewInsets,
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * 1,
                                    child: CurrentPropertyDetails(
                                      address: widget.address,
                                      postcode: widget.postcode,
                                    ),
                                  ),
                                );
                              },
                            );

                            setState(() {
                              FFAppState().addproperty = value;
                            });
                          },
                          child: Container(
                            width: 26.67,
                            height: 26.67,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF4B65B2), Color(0xFF13BBE6)],
                                stops: [0, 1],
                                begin: AlignmentDirectional(-1, 0),
                                end: AlignmentDirectional(1, 0),
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 18,
                            ),
                          ),
                        ),
                ],
              ),
              if (FFAppState().addproperty)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(
                                      "assets/images/mortbalance.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Mortagage Balance",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          color: Color(0xff979797),
                                          fontFamily: 'Seoge UI',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "95,550",
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                        //
                        //
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(
                                      "assets/images/remmort.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Remaining term of Mortagage",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          color: Color(0xff979797),
                                          fontFamily: 'Seoge UI',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "9 months",
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    //
                    //
                    //
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(
                                      "assets/images/propvalue.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Property Value (Approx.)",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          color: Color(0xff979797),
                                          fontFamily: 'Seoge UI',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "95,550",
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        ),
                        //
                        //
                        //
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Image.asset(
                                      "assets/images/mortlender.png",
                                      height: 19,
                                      width: 19,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "  Mortagage Lender                     ",
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          color: Color(0xff979797),
                                          fontFamily: 'Seoge UI',
                                          fontSize: 10,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Brit Insurance Bank",
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
