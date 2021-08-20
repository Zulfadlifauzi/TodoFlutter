import 'package:flutter/material.dart';
import 'package:todolist/database_helper.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/widgets.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 6.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Image(
                            image: AssetImage('images/back_arrow_icon.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onSubmitted: (value) async {
                            if (value != '') {
                              DatabaseHelper _dbHelper = DatabaseHelper();
                              Task _newTask = Task(title: value);
                              await _dbHelper.insertTask(_newTask);

                              print('New task has been created');
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter Todo Title',
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF211551)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Enter description for the task..',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 24.0)),
                  ),
                ),
                TodoWidget(
                  text: 'Create your first Task',
                  isDone: false,
                ),
                TodoWidget(
                  text: 'Create your first todo as well',
                  isDone: false,
                ),
                TodoWidget(
                  isDone: false,
                ),
                TodoWidget(
                  isDone: true,
                ),
              ],
            ),
            Positioned(
              bottom: 24.0,
              right: 24.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskPage()));
                },
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xFFFE2577),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Image(
                    image: AssetImage('images/delete_icon.png'),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
