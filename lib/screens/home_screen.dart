import 'package:flutter/material.dart';
import 'package:newstter/data/news_repository.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 30),
        child: Container(
          color: Colors.red,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                new Expanded(child: new Container()),
                TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.book),
                      text: 'News',
                    ),
                    Tab(
                      icon: Icon(Icons.cast),
                      text: 'Recommendations',
                    ),
                    Tab(
                      icon: Icon(Icons.work),
                      text: 'Jobs',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        // backgroundColor: Colors.red,
        // bottom:
      );

  Widget _buildBody() => TabBarView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(
                        'https://cdn-images-1.medium.com/max/1600/1*6xT0ZOACZCdy_61tTJ3r1Q.png',
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'TAG',
                          textAlign: TextAlign.left,
                          // style: TextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Lorem ipsum set dolor amet '),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[Text("Recommendations Page")],
          ),
          Column(
            children: <Widget>[Text("Jobs Page")],
          ),
        ],
      );
}
