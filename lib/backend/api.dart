import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freedom/flutter_flow/flutter_flow_util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiFunctions {
  Future getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("user_id");

    return userid;
  }

  Future getApplicantId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getString("applicant_id");

    return id;
  }

  Future getApplicantData() async {
    final id = await getApplicantId();

    var response = await http.get(
      Uri.parse(
          "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
    );

    final body = jsonDecode(response.body);
    print(response.body);

    return body;
  }

  Future deleteApplicantDetails(String field) async {
    final id = await getApplicantId();

    var response = await http.patch(
        Uri.parse(
            "http://ec2-18-169-165-31.eu-west-2.compute.amazonaws.com:5500/applicant/${id}"),
        body: {field: "null"});

    final body = jsonDecode(response.body);
    print(body);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Field deleted successfully",
        backgroundColor: Colors.green,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Error while deleting field",
        backgroundColor: Colors.red,
      );
    }

    return body;
  }
}
