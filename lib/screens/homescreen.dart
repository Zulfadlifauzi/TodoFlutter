import 'package:flutter/material.dart';
import 'package:todolist/database_helper.dart';
import 'package:todolist/screens/taskpage.dart';
import 'package:todolist/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseHelper _dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        color: Color(0xFFF6F6F6),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 32.0, bottom: 20.0),
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                Expanded(
                    child: FutureBuilder(
                  future: _dbHelper.getTasks(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return TaskCardWidget();
                      },
                    );
                  },
                ))
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskPage()));
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF7349FE), Color(0xFF643FDB)],
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0)),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image(
                    image: AssetImage('images/add_icon.png'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
