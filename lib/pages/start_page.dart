import 'package:dictionary_2/pages/home_page.dart';
import 'package:dictionary_2/pages/sentence_translator_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dictionary_2/main.dart';

class StartPage extends StatefulWidget {
  //const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(

        child: Center(
        child: Padding(padding: EdgeInsets.fromLTRB(0, 125, 0, 0),
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/start_image.png',
                  height: 100,
                  width: 100,
                )
              ),
              SizedBox(height: 15                                                                            ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      print("av");
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()
                          )
                      );
                    },
                    child: const Text('Tra cứu từ điển'),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      print("Google Translate");
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SentenceTranslator()
                          )
                      );
                    },
                    child: const Text('Google Translate'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
