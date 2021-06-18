import 'package:dictionary_2/Widgets/home.dart' as Home;
import 'package:dictionary_2/Widgets/favorites.dart' as Fav ;
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:dictionary_2/pages/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  DbHelp dbHelp;

  String type_dict = 'English - Vietnamese';
  String table = 'av';
  bool is_av = true;


  @override
  void initState() {
    // TODO: implement initState
    tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Dictionary'),
        actions: [
          FlatButton(
            child: Text(
                type_dict,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: (){
              is_av = !is_av;
              setState(() {
                type_dict = is_av ? 'English - Vietnamese' : 'Vietnamese - English';
                table = is_av ? 'av' : 'va';
                print(table);
              });
            },
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Home',),
            Tab(text: 'Fav',)
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Home.Home(table: table,),
          Fav.Favorites(table: table,),
        ],
      ),
    );
  }
}
