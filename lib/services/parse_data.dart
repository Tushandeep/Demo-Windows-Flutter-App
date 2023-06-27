import 'dart:convert';

import 'package:first_app/models/country.dart';
import 'package:first_app/models/photo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<List<Photo>> fetchPhotos(BuildContext context) async {
  final String fileData =
      await DefaultAssetBundle.of(context).loadString('assets/data1.json');

  return await compute<String, List<Photo>>(parsePhotos, fileData);
}

List<Photo> parsePhotos(String data) {
  final List<dynamic> parsedData = json.decode(data) as List<dynamic>;

  return parsedData.map<Photo>((d) {
    return Photo.fromMap(d);
  }).toList();
}

Future<List<Country>> fetchCountries(BuildContext context) async {
  final String fileData =
      await DefaultAssetBundle.of(context).loadString("assets/data.json");

  return await compute<String, List<Country>>(
    parseCountries,
    fileData,
  );
}

List<Country> parseCountries(String data) {
  final List<dynamic> parsedData = json.decode(data) as List<dynamic>;

  return parsedData
      .map<Country>(
        (d) => Country.fromMap(d),
      )
      .toList();
}

// void writeFile() async {
//   final http.Response response = await http.get(
//     Uri.parse(
//         "https://raw.githubusercontent.com/lutangar/cities.json/master/cities.json"),
//     headers: {
//       "Content-Type": "application/json",
//     },
//   );

//   print(response.body.substring(0, 100));

//   final Directory directory = await getApplicationDocumentsDirectory();
//   print(directory.path);

//   File file = File("${directory.path}/data.json");
//   file
//     ..createSync(recursive: true)
//     ..writeAsStringSync(response.body);
// }
