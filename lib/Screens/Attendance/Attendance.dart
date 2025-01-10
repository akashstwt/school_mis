import 'package:flutter/material.dart';
import 'package:school_mis/Screens/Attendance/OverallAttendance.dart';
import 'package:school_mis/Screens/Attendance/TodayAttendance.dart';
import 'package:school_mis/Widgets/AppBar.dart';
import 'package:school_mis/Widgets/MainDrawer.dart';
import 'package:school_mis/Widgets/UserDetailCard.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AttendanceState createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: CommonAppBar(
        title: "Attendance",
        menuenabled: true,
        notificationenabled: true,
        ontap: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: const Drawer(
            elevation: 0,
            child: MainDrawer(),
          ),
      body: SingleChildScrollView(
              child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const UserDetailCard(),
              DefaultTabController(
                length: 2, // length of tabs
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Container(
                        child: const TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black26,
                          indicatorColor: Colors.black,
                          tabs: [
                            Tab(text: 'Today'),
                            Tab(text: 'Overall'),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.68, //height of TabBarView
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: const TabBarView(
                        children: <Widget>[
                          TodayAttendance(),
                          OverallAttendance(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      ),
      
    );
  }
}
