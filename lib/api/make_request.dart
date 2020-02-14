import 'dart:convert';
import 'dart:math';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'errors.dart';
import 'dart:io' show SocketException, HttpException;
import 'package:http/http.dart' as http;

class MakeRequest {
  static String ipServer = DotEnv().env['IP_SERVER'];
  static String url = "http://$ipServer/api/";

  static Map<String, String> header = {
    'Accept': 'application/json',
    'X-Shop-Identifier': DotEnv().env['API_KEY'],
    'Content-Type': 'application/json',
  };

  static get(String endpoint) async {
    try {
      http.Response response = await http.get(url + endpoint, headers: header);
      final responseJson = await jsonDecode(response.body);
      return responseJson;
    } on SocketException {
      throw NoInternetException(
        "Nessuna connesione internet.\nAssicurati di avere il wifi o la connessione dati attiva",
      );
    } on HttpException {
      print("FROM HTTP EXCEPTION");
      throw NoServiceFoundException("Si è verificato un errore. Riprova");
    } on FormatException {
      print("FROM FORMAT EXCEPTION");
      throw InvalidFormatException(
        "C'è un errore nei dati.",
      );
    } catch (e) {
      print(e);
      throw UnknownException("Si è verificato un errore. Riprova");
    }
  }
}
