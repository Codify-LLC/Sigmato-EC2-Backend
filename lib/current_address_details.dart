import 'package:flutter/material.dart';
import 'package:freedom/flutter_flow/flutter_flow_icon_button.dart';
import 'package:freedom/form2/form2_widget.dart';
import 'package:freedom/property_details/property_details_widget.dart';
import 'package:freedom/property_summary.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';

class CurrentAddressDetails extends StatefulWidget {
  CurrentAddressDetails({Key? key}) : super(key: key);

  @override
  State<CurrentAddressDetails> createState() => _CurrentAddressDetailsState();
}

enum RepaymentType { repayment, interestOnly }

enum PlanWithProperty { sell, intentToLet, notDecided }

class _CurrentAddressDetailsState extends State<CurrentAddressDetails> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  TextEditingController? textController5;
  TextEditingController? textController6;
  TextEditingController? textController7;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  RepaymentType? _repaymentType = RepaymentType.repayment;
  PlanWithProperty? _planWithProperty = PlanWithProperty.sell;
  bool showExpectedIncome = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
    textController5 = TextEditingController();
    textController6 = TextEditingController();
    textController7 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Untitled-1.png',
                    ).image,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 30, 0, 0),
                      child: Text(
                        '1/6',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Seoge UI',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                      child: Text(
                        'Current Residence Details',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Seoge UI',
                              color: Colors.white,
                              fontSize: 24,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 30),
                      child: LinearPercentIndicator(
                        percent: 0.1,
                        width: MediaQuery.of(context).size.width * 0.9,
                        lineHeight: 9,
                        animation: true,
                        progressColor: Colors.white,
                        backgroundColor: Color(0x65EEF7FE),
                        barRadius: Radius.circular(30),
                        padding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Container(
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
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Mortgage Balance',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Remaining term of mortgage',
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Approximate Property Value',
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
                          controller: textController3,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Mortgage Lender',
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
                          controller: textController4,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                          child: Text(
                            'Mortgage account number',
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
                          controller: textController5,
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
                            'Select your repayment type',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Column(
                          children: [
                            ListTile(
                              visualDensity: VisualDensity(vertical: -4),
                              title: Text("Repaymenyt"),
                              leading: Radio(
                                  activeColor: Color(0xFF4B65B2),
                                  value: RepaymentType.repayment,
                                  groupValue: _repaymentType,
                                  onChanged: (RepaymentType? value) {
                                    setState(() {
                                      _repaymentType = value;
                                    });
                                  }),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(vertical: -4),
                              title: Text("Interest Only"),
                              leading: Radio(
                                  activeColor: Color(0xFF4B65B2),
                                  value: RepaymentType.interestOnly,
                                  groupValue: _repaymentType,
                                  onChanged: (RepaymentType? value) {
                                    setState(() {
                                      _repaymentType = value;
                                    });
                                  }),
                            )
                          ],
                        ),
                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       FFButtonWidget(
                        //         onPressed: () {
                        //           print('Button pressed ...');
                        //         },
                        //         text: 'Repayment',
                        //         options: FFButtonOptions(
                        //           width: 158,
                        //           height: 50,
                        //           color:
                        //               FlutterFlowTheme.of(context).primaryColor,
                        //           textStyle: FlutterFlowTheme.of(context)
                        //               .subtitle2
                        //               .override(
                        //                 fontFamily: 'Seoge UI',
                        //                 color: Colors.white,
                        //                 useGoogleFonts: false,
                        //               ),
                        //           borderSide: BorderSide(
                        //             color: Colors.transparent,
                        //             width: 1,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //       ),
                        //       FFButtonWidget(
                        //         onPressed: () {
                        //           print('Button pressed ...');
                        //         },
                        //         text: 'Interest only',
                        //         options: FFButtonOptions(
                        //           width: 158,
                        //           height: 50,
                        //           color: Color(0xFFEEF7FE),
                        //           textStyle: FlutterFlowTheme.of(context)
                        //               .subtitle2
                        //               .override(
                        //                 fontFamily: 'Seoge UI',
                        //                 color: Color(0xFF263238),
                        //                 useGoogleFonts: false,
                        //               ),
                        //           borderSide: BorderSide(
                        //             color: Colors.transparent,
                        //             width: 1,
                        //           ),
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'What do you plan to do with this property?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Column(
                          children: [
                            ListTile(
                              visualDensity: VisualDensity(vertical: -4),
                              title: Text("Sell"),
                              leading: Radio(
                                  activeColor: Color(0xFF4B65B2),
                                  value: PlanWithProperty.sell,
                                  groupValue: _planWithProperty,
                                  onChanged: (PlanWithProperty? value) {
                                    setState(() {
                                      _planWithProperty = value;
                                      showExpectedIncome = false;
                                    });
                                  }),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(vertical: -4),
                              title: Text("Intent To Let"),
                              leading: Radio(
                                  activeColor: Color(0xFF4B65B2),
                                  value: PlanWithProperty.intentToLet,
                                  groupValue: _planWithProperty,
                                  onChanged: (PlanWithProperty? value) {
                                    setState(() {
                                      _planWithProperty = value;
                                      showExpectedIncome = true;
                                    });
                                  }),
                            ),
                            ListTile(
                              visualDensity: VisualDensity(vertical: -4),
                              title: Text("Not decided"),
                              leading: Radio(
                                  activeColor: Color(0xFF4B65B2),
                                  value: PlanWithProperty.notDecided,
                                  groupValue: _planWithProperty,
                                  onChanged: (PlanWithProperty? value) {
                                    setState(() {
                                      _planWithProperty = value;
                                      showExpectedIncome = true;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        showExpectedIncome
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 10),
                                    child: Text(
                                      'Expected monthly rental income',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Seoge UI',
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: false,
                                          ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 36,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEF7FE),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Image.asset(
                                            'assets/images/Untitled-20.png',
                                            width: 21,
                                            height: 21,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(10),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(10),
                                          ),
                                          border: Border.all(
                                            color: Color(0xFF979797),
                                            width: 0.25,
                                          ),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          child: TextFormField(
                                            controller: textController6,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              hintText: 'Salary',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Seoge UI',
                                                        color:
                                                            Color(0xFF979797),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: false,
                                                      ),
                                              enabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.white,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Seoge UI',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Container(),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Do you want to release equity from this \nproperty?',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'Yes',
                              options: FFButtonOptions(
                                width: 158,
                                height: 50,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Colors.white,
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                              },
                              text: 'No',
                              options: FFButtonOptions(
                                width: 158,
                                height: 50,
                                color: Color(0xFFEEF7FE),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Seoge UI',
                                      color: Color(0xFF263238),
                                      useGoogleFonts: false,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                          child: Text(
                            'Amount required to release',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Seoge UI',
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 36,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEF7FE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(0),
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(0),
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Image.asset(
                                  'assets/images/Untitled-20.png',
                                  width: 21,
                                  height: 21,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(0),
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(10),
                                ),
                                border: Border.all(
                                  color: Color(0xFF979797),
                                  width: 0.25,
                                ),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.85,
                                child: TextFormField(
                                  controller: textController7,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Salary',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Seoge UI',
                                          color: Color(0xFF979797),
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: false,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Seoge UI',
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 20, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 40,
                                      fillColor: Color(0xFFEEF7FE),
                                      icon: Icon(
                                        Icons.chevron_left,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (_) =>
                                      //             PropertyDetailsWidget()));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => Form2Widget()));
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
