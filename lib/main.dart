import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providerhttp/home_page.dart';
import 'package:providerhttp/pixabay.dart';
import 'package:provider/provider.dart';
import 'package:providerhttp/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SubwayApp',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ), //외부의 디자인 테마.
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(const PixaBay(searching: '그림',)),
        child: const MyHomePage(),
      ),
    );
  }
}

//이하 필요없음.

class Subway extends StatefulWidget {
  const Subway({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SubwayState createState() => _SubwayState();
}

class _SubwayState extends State<Subway> {
  String _message = '검색어 입력';
  int _counter = 0;
  final _picControl = TextEditingController();

  @override
  void dispose() {
    _picControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            letterSpacing: 2.0,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 30.0, 0.0, 0.0),
        // Center( //세로 축으로 가운데 위치.
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //가로축으로 가운데 위치(center).
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.fromLTRB(115.0, 0.0, 0.0, 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/light.gif'),
                  radius: 70.0,
                ),
              ),
              Text(_message,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  )),
              Divider(
                height: 30.0,
                color: Colors.grey[850],
                thickness: 0.5,
                endIndent: 30.0,
              ),

              // ButtonTheme.fromButtonThemeData(data: data, child: child),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 30.0, 15.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '사진검색',
                  ),
                  controller: _picControl,
                  keyboardType: TextInputType.text,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PixaBay(searching: _picControl.text)),
                  );
                },
                child: const Text('검색'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
