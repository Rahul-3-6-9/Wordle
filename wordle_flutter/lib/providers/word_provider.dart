import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wordle_flutter/constants/flag.dart';


class WordFetcher {
  final String apiUrl = 'https://api.apispreadsheets.com/data/5AGhzCgCOhCLCltG/'; // API URL

  Future<List<String>> fetchWords() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); // Log the response data to verify structure

      // Extract the words
    for (var item in data['data']) {
      words.add(item['WORDS']);
    }
    print(words);
    return words;
      } else {
        throw Exception('No words found in the data');
      }
    } 
  }

