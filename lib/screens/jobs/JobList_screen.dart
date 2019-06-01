import 'package:flutter/material.dart';
import 'package:newstter/Models/Jobs/Jobs.dart';
import 'package:newstter/screens/Jobs/JobRow.dart';
import 'package:newstter/Theme.dart' as Theme;

class JobList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Theme.Colors.jobPageBackground,
        child: new ListView.builder(
          itemExtent: 120.0,
          itemCount: JobDao.jobs.length,
          itemBuilder: (_, index) => JobRow(JobDao.jobs[index]),
        ),
      ),
    );
  }
}
