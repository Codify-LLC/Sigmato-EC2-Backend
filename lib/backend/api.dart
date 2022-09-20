import 'package:freedom/flutter_flow/flutter_flow_util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiFunctions {
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

    return body;
  }
}
