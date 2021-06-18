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
  String translate_result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google tranlation'),
      ),
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
                onSubmitted: (text){
                  value = text;
                  translate();
                  setState(() {

                  });
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
                    setState(() {

                    });
                  },
                  child: Text('Translate'),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey,),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Text(
                    translate_result,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
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
    var translation = await translator.translate(input, from: 'en', to: 'vi');
    translate_result = translation.toString();
    setState(() {

    });
  }
}



// Màn hình in kết quả dịch
// class ResultScreen extends StatelessWidget {
//   final String result;
//   //const ResultScreen({Key? key}) : super(key: key);
//   ResultScreen({Key key, @required this.result}) : super(key: key);
//   @override
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Translate Result')),
//       body: Center(
//         child: Text(
//           result,
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
