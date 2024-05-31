import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clock_alarm/ClockView.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE,d MMM').format(now);
    var timeZone = now.timeZoneOffset.toString().split(('.')).first;
    var offsetSign = '';
    if (!timeZone.startsWith('-')) offsetSign = '+';
    return Scaffold(
        backgroundColor: Color(0xFF2D2F41),
        body: Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Clock',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 32),
              Text(
                formattedTime,
                style: TextStyle(color: Colors.white, fontSize: 64),
              ),
              Text(
                formattedDate,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              ClockView(),
              Text(
                'Timezone',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
              SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'UTC' + offsetSign + timeZone,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ],
              ),
            ],
          ),
        )));
  }
}
