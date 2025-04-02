import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';

class Network {
  // configure your backend here: IP/URL:port
  // do not specify the protocol
  static String backend = "127.0.0.1:5002";

  // configure https (requires reverse proxy for backend)
  // set to false for local running backend
  static bool https = false;

  static Future<(int, String)> postInitialPolicy(Policy policy) async {
    Map<String, dynamic> policyMap = policy.toJson();
    String policyJson = jsonEncode(policyMap);
    var url = https
        ? Uri.https(backend, "/gdprComplianceJSON")
        : Uri.http(backend, "/gdprComplianceJSON");
    try {
      http.Response response = await http.post(url, body: policyJson);
      return (response.statusCode, response.body);
    } catch (e) {
      return (500, "");
    }
  }

  static Future<(int, String)> postPolicy(Policy policy) async {
    Map<String, dynamic> policyMap = policy.toJson();
    String policyJson = jsonEncode(policyMap);
    var url = https
        ? Uri.https(backend, "/compatibility")
        : Uri.http(backend, "/compatibility");
    try {
      http.Response response = await http.post(url, body: policyJson);
      return (response.statusCode, response.body);
    } catch (e) {
      return (500, "");
    }
  }
}
