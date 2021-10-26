import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PixaBay extends StatefulWidget {
  const PixaBay({Key? key, required this.searching}) : super(key: key);
  final String searching;

  @override
  _PixaBayState createState() => _PixaBayState();
}

class _PixaBayState extends State<PixaBay> {

  List<Picture> _list = [];
  static const baseUrl = 'https://pixabay.com/api/';
  int page = 1;
  int limit = 20;
  var key = '17828481-17c071c7f8eadf406822fada3';
  var _result = '';

  Future<List<Picture>> _fetchList() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/junsuk5/mock_json/main/conferences.json'));
    // Map<String, dynamic> jsonresponse = jsonDecode(response.body);
    // Iterable jsonResponse = jsonresponse['Picture'];
    Iterable jsonResponse = jsonDecode(response.body);
    List<Picture> list = jsonResponse.map((e) => Picture.fromJson(e)).toList();

    return list;
  }

  Future<void> init() async{
    List<Picture> picture = await _fetchList();
    setState(() {
      _list = picture;
    });
  }

  @override
  void initState() {
    super.initState();

    _fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ListView(children: [
          if (_list.isEmpty) Center(child: CircularProgressIndicator()) else
            ..._list.map((e) => Text(e.name)).toList(),
        ],
        )
    );
  }
}

class Picture {
  late String name;
  late String link;

  Picture(this.name, this.link);

  Picture.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    link = json["link"];
  }

  @override
  String toString(){
    return 'Picture{name: $name, link: $link}';
  }
}