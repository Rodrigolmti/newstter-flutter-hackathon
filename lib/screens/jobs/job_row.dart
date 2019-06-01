import 'package:flutter/material.dart';
import 'package:newstter/Models/Jobs/Job.dart';
import 'package:newstter/Theme.dart' as Theme;
import 'package:newstter/screens/detail_screen.dart';

class JobRow extends StatelessWidget {
  final Job job;

  JobRow(this.job);

  @override
  Widget build(BuildContext context) {
    final jobCard = new Card(
        // margin: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: new Container(
            margin: const EdgeInsets.only(top: 16.0, left: 16.0),
            constraints: new BoxConstraints.expand(),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(job.title, style: Theme.TextStyles.jobTitle),
                ])));

    return new Container(
      child: new FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(job.title, job.url),
            ),
          );
        },
        child: new Stack(
          children: <Widget>[jobCard],
        ),
      ),
    );
  }
}
