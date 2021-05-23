import 'package:dictionary_2/Widgets/home.dart' as Home;
import 'package:dictionary_2/Widgets/favorites.dart' as Fav ;
import 'package:dictionary_2/database/dbhelp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> with SingleTickerProviderStateMixin {

  TabController tabController;

  DbHelp dbHelp;


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
          Home.Home(),
          Fav.Favorites(),
        ],
      ),
    );
  }
}
