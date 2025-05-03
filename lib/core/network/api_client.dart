import 'dart:convert';

import 'package:http/http.dart' as http;

import '../const/const_values.dart';

class ApiClient<T> {
  static Future<List<T>> getDataList<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    List<T> data = [];
    final response = await http.get(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      for (Map item in jsonBody) {
        data.add(fromJsonT!(item));
      }
      return data;
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> getData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
  }) async {
    final response = await http.get(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> postData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.post(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static Future<T> putData<T>({
    required String endpoint,
    T Function(dynamic data)? fromJsonT,
    required Map<String, dynamic> body,
  }) async {
    final response = await http.put(
      Uri.parse("${ConstValues.baseUrl}$endpoint"),
      body: jsonEncode(body),
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      return fromJsonT!(jsonBody);
    } else {
      throw Exception("Something went wrong");
    }
  }

  static deleteData({required String endpoint}) async {
    await http.delete(Uri.parse("${ConstValues.baseUrl}$endpoint"));
  }

  Future<List> getBanks() async {
    try {
      var response = await http.get(
        Uri.parse('${ConstValues.baseUrl}api/ar/banks'),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Extract the 'name' field for each car maker
        if (responseBody['data'] != null &&
            responseBody['data']['items'] != null) {
          List banks = responseBody['data']['items'];
          print('Banks: $banks');
          return banks;
        } else {
          throw Exception('Unexpected response format for banks');
        }
      } else {
        throw Exception('Failed to load banks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during API call: $e');
    }
  }

  Future<String?> login(String email, String password) async {
    var url = '${ConstValues.baseUrl}/api/login';
    Map<String, dynamic> requestBody = {
      'email': email,
      'phoneNumber': password,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        String newToken = responseBody["token"];
        // await prefs.setString('token', newToken);
        print('New token saved: $newToken');
        return newToken;
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during API call: $e');
    }
  }

  Future<Map<String, dynamic>?> signup({
    required String name,
    required String email,
    required String dob,
    required String number,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${ConstValues.baseUrl}/api/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          "name": name,
          "email": email,
          "birth_date": dob,
          "phone_number": number,
          "password": password,
        }),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"isSuccess": false, "message": "reset password failed"};
      }
    } catch (e) {
      return {"isSuccess": false, "message": "Error: $e"};
    }
  }

  Future<Map<String, dynamic>?> sendOTP({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse('${ConstValues.baseUrl}api/sendOTP'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({"email": email}),
      );
      print("R: ${response.body}");
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"isSuccess": false, "message": "Failed to send OTP"};
      }
    } catch (e) {
      return {"isSuccess": false, "message": "Error: $e"};
    }
  }
}
