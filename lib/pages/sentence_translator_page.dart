import 'package:dictionary_2/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';




class SentenceTranslator extends StatefulWidget {
  //const SentenceTranslator({Key? key}) : super(key: key);

  @override
  _SentenceTranslatorState createState() => _SentenceTranslatorState();
}

class _SentenceTranslatorState extends State<SentenceTranslator> {
  static String value = '' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your paragraph in English',
                ),
                onChanged: (text) {
                  value = text;
                  //translate();
                },
                onSubmitted: (text) async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage(),
                  )
                  );
                  value = text;
                  translate();
                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    translate();
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TranslatorResult()
                        )
                    );*/
                  },
                  child: Text('Submit'),
              )
            ],
            ),
        ),
      ),
    );
  }

  // Hàm dịch
  Future <void> translate() async {
    final translator = GoogleTranslator();
    final input = value;
    var translation = await translator.translate(input, from :'en' , to: 'vi');
    String translate_result = translation.toString();


    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(result: translate_result,),
          ));
    }

}



// Màn hình in kết quả dịch
class ResultScreen extends StatelessWidget {
  final String result;
  //const ResultScreen({Key? key}) : super(key: key);
  ResultScreen({Key key, @required this.result}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Translate Result')),
      body: Center(
        child: Text(
          result,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}








