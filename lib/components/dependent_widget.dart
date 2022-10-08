// import 'package:flutter/material.dart';
// import 'package:freedom/flutter_flow/flutter_flow_theme.dart';

// import '../flutter_flow/flutter_flow_drop_down.dart';

// class DependentWidget extends StatefulWidget {
//   @override
//   State<DependentWidget> createState() => _DependentWidgetState();
// }

// class _DependentWidgetState extends State<DependentWidget> {
//   String? relationship;
//   TextEditingController age = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//           child: Container(
//             width: 42,
//             height: 70,
//             decoration: BoxDecoration(
//               color: Color(0xFFEEF7FE),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(10),
//                 bottomRight: Radius.circular(0),
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(0),
//               ),
//             ),
//             child: Align(
//               alignment: AlignmentDirectional(0, 0),
//               child: Text(
//                 '1',
//                 style: FlutterFlowTheme.of(context).bodyText1,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//           child: Container(
//             height: 70,
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//               border: Border.all(
//                 color: Color(0xFF979797),
//                 width: 0.25,
//               ),
//             ),
//             child: FlutterFlowDropDown(
//               options: ['Husband', 'Wife', 'Child', 'Father', 'Mother'],
//               onChanged: (val) => setState(() => relationship = val),
//               width: 180,
//               height: 50,
//               textStyle: FlutterFlowTheme.of(context).bodyText1.override(
//                     fontFamily: 'Segoe UI',
//                     color: Color(0xFF263238),
//                     fontSize: 16,
//                     fontWeight: FontWeight.normal,
//                     useGoogleFonts: false,
//                   ),
//               hintText: 'Select Relationship',
//               icon: Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Color(0xFF4B65B2),
//                 size: 20,
//               ),
//               fillColor: Colors.white,
//               elevation: 2,
//               borderColor: Colors.transparent,
//               borderWidth: 0,
//               borderRadius: 0,
//               margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
//               hidesUnderline: true,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
//           child: Container(
//             width: 100,
//             height: 70,
//             decoration: BoxDecoration(
//               color: FlutterFlowTheme.of(context).secondaryBackground,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(0),
//                 bottomRight: Radius.circular(10),
//                 topLeft: Radius.circular(0),
//                 topRight: Radius.circular(10),
//               ),
//               border: Border.all(
//                 color: Color(0xFF979797),
//                 width: 0.25,
//               ),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: FlutterFlowTheme.of(context).secondaryBackground,
//                     ),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
//                       child: TextFormField(
//                         controller: age,
//                         autofocus: true,
//                         obscureText: false,
//                         decoration: InputDecoration(
//                           hintText: 'Enter',
//                           enabledBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                           focusedBorder: UnderlineInputBorder(
//                             borderSide: BorderSide(
//                               color: Color(0x00000000),
//                               width: 1,
//                             ),
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(4.0),
//                               topRight: Radius.circular(4.0),
//                             ),
//                           ),
//                         ),
//                         style: FlutterFlowTheme.of(context).bodyText1.override(
//                               fontFamily: 'Segoe UI',
//                               color: Color(0xFF263238),
//                               fontSize: 16,
//                               fontWeight: FontWeight.normal,
//                               useGoogleFonts: false,
//                             ),
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
