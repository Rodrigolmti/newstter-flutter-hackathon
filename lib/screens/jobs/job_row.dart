import 'package:flutter/material.dart';
import 'package:newstter/Models/Jobs/Job.dart';
import 'package:newstter/Theme.dart' as Theme;

class JobRow extends StatelessWidget {
  final Job job;

  JobRow(this.job);

  @override
  Widget build(BuildContext context) {
    final jobCard = new Container(
        margin: const EdgeInsets.only(left: 6.0, right: 6.0),
        decoration: new BoxDecoration(
          color: Colors.lightBlue,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(8.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0))
          ],
        ),
        child: new Container(
            margin: const EdgeInsets.only(top: 16.0, left: 16.0),
            constraints: new BoxConstraints.expand(),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(job.title, style: Theme.TextStyles.jobTitle),
                ])));

    return new Container(
      height: 40.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
        onPressed: () => _navigateTo(context, job.url),
        child: new Stack(
          children: <Widget>[jobCard],
        ),
      ),
    );
  }

  _navigateTo(context, String url) {
    //TODO: Implement open the page
    print("Open the page: $url");
  }
}
