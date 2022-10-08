import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/backend/document.dart';
import 'package:image_picker/image_picker.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BritishPassportWidget extends StatefulWidget {
  const BritishPassportWidget({Key? key}) : super(key: key);

  @override
  _BritishPassportWidgetState createState() => _BritishPassportWidgetState();
}

class _BritishPassportWidgetState extends State<BritishPassportWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 197,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
            child: Text(
              'British Passport',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Seoge UI',
                    color: Color(0xFF263238),
                    fontSize: 16,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
            child: Container(
              width: 390,
              height: 96,
              decoration: BoxDecoration(
                color: Color(0xFFEEF7FE),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final ImagePicker picker = ImagePicker();
                        final image =
                            picker.pickImage(source: ImageSource.camera);
                        // FilePickerResult? file =
                        //     await FilePicker.platform.pickFiles();

                        // if (file != null) {
                        //   print(file.names);
                        // } else {
                        //   Fluttertoast.showToast(msg: "No file selected");
                        // }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Frame_(4).png',
                            width: 41,
                            height: 41,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Photo Scan',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Seoge UI',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: DottedLine(
                        direction: Axis.vertical,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();

                        if (result != null) {
                          final name = result.names[0];
                          print(result.names[0]);
                          print(result);

                          setState(() {
                            FFAppState().identityDoc.add(
                                  Document(name: name!, link: "no link"),
                                );
                          });

                          print(FFAppState().identityDoc);

                          Navigator.pop(context, true);

                          // Upload file with its filename as the key
                          final platformFile = result.files.single;
                          final path = platformFile.path!;
                          final key = platformFile.name;
                          final file = File(path);
                          // try {
                          //   final UploadFileResult result =
                          //       await Amplify.Storage.uploadFile(
                          //     local: file,
                          //     key: key,
                          //     onProgress: (progress) {
                          //       print(
                          //           'Fraction completed: ${progress.getFractionCompleted()}');
                          //     },
                          //   );
                          //   print('Successfully uploaded file: ${result.key}');
                          // } on StorageException catch (e) {
                          //   print('Error uploading file: $e');
                          // }
                        } else {
                          Fluttertoast.showToast(msg: "No file selected");
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Frame_(5).png',
                            width: 41,
                            height: 41,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            'Upload pdf/jpeg',
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Seoge UI',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  useGoogleFonts: false,
                                ),
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
    );
  }
}
