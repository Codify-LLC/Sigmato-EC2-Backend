import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:freedom/components/applicant_details_widget.dart';
import 'package:freedom/components/see_next_steps_widget.dart';
import 'package:freedom/flutter_flow/flutter_flow_theme.dart';
import 'package:freedom/index.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MyApplicationSummary extends StatefulWidget {
  MyApplicationSummary({Key? key}) : super(key: key);

  @override
  State<MyApplicationSummary> createState() => _MyApplicationSummaryState();
}

class _MyApplicationSummaryState extends State<MyApplicationSummary> {
  bool isValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF13BBE6),
                    FlutterFlowTheme.of(context).primaryColor
                  ],
                  stops: [0, 1],
                  begin: AlignmentDirectional(1, 0),
                  end: AlignmentDirectional(-1, 0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                          'My Application Summary',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Seoge UI',
                                    color: Colors.white,
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
              child: Container(
                height: 124,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFF979797),
                    width: 0.25,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 21,
                            child: Image.asset("assets/images/Untitled-22.png"),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "About Carole",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      color: Color(0xFF263238),
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "80%",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      color: Color(0xFF263238),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/images/i.png",
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(14, 14, 14, 0),
                      child: Text(
                        "Information about yourself, including where you live, your employment and income history, your expenses, and any debts you may have.",
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Segoe UI',
                              color: Color(0xFF979797),
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        fillColor: Color(0xffE5F4FF),
                        progressColor: Color(0xff13BBE6),
                        percent: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: DottedLine(
                dashColor: Color(0xff263238).withOpacity(0.6),
                dashGapLength: 5,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
              child: Container(
                height: 124,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xFF979797),
                    width: 0.25,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/myappsum.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "About your property",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      color: Color(0xFF263238),
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "100%",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Segoe UI',
                                      color: Color(0xFF979797),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 9,
                                      useGoogleFonts: false,
                                    ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Image.asset(
                            "assets/images/verified.png",
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "The property you’re remortgaging and any other properties you own.",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            color: Color(0xFF979797),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            useGoogleFonts: false,
                          ),
                    ),
                    Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      child: LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        fillColor: Color(0xffE5F4FF),
                        progressColor: Color(0xff13BBE6),
                        percent: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 125,
                color: Color(0xFFEEF7FE),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        // WidgetSpan(
                        //   child: Checkbox(
                        //     visualDensity:
                        //         VisualDensity(vertical: -4, horizontal: -4),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(
                        //         5,
                        //       ),
                        //     ),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         isValue = value!;
                        //       });
                        //     },
                        //     value: isValue,
                        //     activeColor: Color(0xFF00ADB5),
                        //   ),
                        // ),
                        WidgetSpan(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isValue = !isValue;
                              });
                            },
                            child: isValue == true
                                ? Image.asset(
                                    "assets/images/verified-square.png",
                                    height: 20,
                                    width: 20,
                                  )
                                : Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.black),
                                    ),
                                  ),
                          ),
                        ),
                        TextSpan(
                          text:
                              "  I confirm that all applicants have given me permission to give ",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xFF263238),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    useGoogleFonts: false,
                                  ),
                        ),
                        WidgetSpan(
                          child: Image.asset(
                            "assets/images/LOGO.png",
                            height: 18,
                            width: 18,
                          ),
                        ),
                        TextSpan(
                          text:
                              " Freedom Circle their information and to process this application. As far as I know, all of the information is correct.",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Segoe UI',
                                    color: Color(0xFF263238),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    useGoogleFonts: false,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () async {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => ApplicantDetailsWidget(
                  //               heading: "Applicant 1 Details",
                  //             )));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SummaryWidget()));
                  await showDialog(
                    context: context,
                    builder: (_) {
                      return SeeNextStepsWidget();
                    },
                  );
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4B65B2),
                        Color(0xFF13BBE6),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Get Recommendation",
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Segoe UI',
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
