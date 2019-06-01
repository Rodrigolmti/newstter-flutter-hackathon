import 'package:flutter/material.dart';
import 'package:newstter/Models/Jobs/Job.dart';
import 'package:newstter/Theme.dart' as Theme;
import 'package:newstter/screens/detail_screen.dart';

class JobRow extends StatelessWidget {
  final Job job;

  JobRow(this.job);

  @override
  Widget build(BuildContext context) {
    final jobCard = Card(
        // margin: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Container(
            margin: const EdgeInsets.only(top: 16.0, left: 16.0),
            constraints: BoxConstraints.expand(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(job.title, style: Theme.TextStyles.jobTitle),
                ])));

    return Container(
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(job.title, job.url),
            ),
          );
        },
        child: Stack(
          children: <Widget>[jobCard],
        ),
      ),
    );
  }
}
