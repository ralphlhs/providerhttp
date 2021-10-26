import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:providerhttp/pixabay.dart';
import 'package:provider/provider.dart';
import 'package:providerhttp/home_view_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
         'Seoul Metro Guide',
          style: TextStyle(
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
              const Text('검색어 입력',
                  style: TextStyle(
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
                  controller: viewModel.picControl,
                  keyboardType: TextInputType.text,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PixaBay(searching : viewModel.picControl.text)
                    ),
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
