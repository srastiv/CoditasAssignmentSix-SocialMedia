import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:social_media_app/network_model/network_model_class.dart';

Future<List<UserNetworkHelper>> getUserData() async {
  try {
    var response = await http.get(
      Uri.parse("https://randomuser.me/api/?results=20"),
    );
    if (response.statusCode == 200) {
      print(
        'STATUS CODE: ${response.statusCode.toString()} ',
      );
      String data = response.body;
      //print(data);
      List jsonData = jsonDecode(data)["results"];
      //print(jsonData);
      var result = jsonData
          .map(
            (e) => UserNetworkHelper.fromJson(e),
          )
          .toList();
      //print(result);
      return result;
    } else {
      return [];
    }
  } catch (error) {
    print('THERE IS AN ERROR: $error');
  }
  return [];
}
