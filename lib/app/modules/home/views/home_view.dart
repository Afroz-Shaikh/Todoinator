import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoinator/app/modules/home/views/setting.dart';
import 'package:todoinator/app/modules/home/widgets/taskWidget.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todoinator/app/shared/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:todoinator/main.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String sValue = '';
  final tController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);

    //final box = base.dataStore.box;
    return ValueListenableBuilder(
      valueListenable: base.dataStore.listenToTasks(),
      builder: (context, Box<Task> box, Widget? child) {
        var tasks = box.values.toList();
        tasks.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        return SafeArea(
          child: Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
                child: Icon(FontAwesomeIcons.plus),
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: ListTile(
                            title: TextField(
                              controller: tController,
                              // controller: _controller,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.check,
                                    ),
                                    onPressed: () {
                                      sValue = tController.text;
                                      print(tController.text);

                                      showCupertinoDialog(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              content: Text(tController.text),
                                              actions: [
                                                CupertinoButton(
                                                    child: Text('ok'),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                      DatePicker.showTimePicker(
                                                          context,
                                                          showSecondsColumn:
                                                              false,
                                                          showTitleActions:
                                                              true,
                                                          // minTime: DateTime.now(),
                                                          //maxTime: DateTime(2019, 6, 7),
                                                          onConfirm: (date) {
                                                        print('confirm $date');
                                                        if (sValue.isNotEmpty) {
                                                          var task =
                                                              Task.create(
                                                                  name: sValue,
                                                                  createdAt:
                                                                      date);
                                                          base.dataStore
                                                              .addTask(
                                                                  task: task);
                                                          tController.clear();
                                                        }
                                                      },
                                                          currentTime:
                                                              DateTime.now());
                                                    })
                                              ],
                                            );
                                          });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Enter task name'),
                              onSubmitted: (value) {
                                Navigator.pop(context);
                                DatePicker.showTimePicker(context,
                                    showSecondsColumn: false,
                                    showTitleActions: true,
                                    // minTime: DateTime.now(),
                                    //maxTime: DateTime(2019, 6, 7),
                                    onConfirm: (date) {
                                  print('confirm $date');
                                  if (value.isNotEmpty) {
                                    var task = Task.create(
                                        name: value, createdAt: date);
                                    base.dataStore.addTask(task: task);
                                  }
                                }, currentTime: DateTime.now());
                              },
                              autofocus: true,
                            ),
                          ),
                        );
                      });
                }),
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7.8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/icon.png',
                            scale: 2.7,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(child: Text('Good Morning')),
                            FittedBox(
                              child: Text(
                                'Whats Going on Today ? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingPage()),
                              );
                            },
                            child: Icon(Icons.settings)),
                      ],
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 1.30,
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        var task = tasks[index];
                        return Dismissible(
                            background: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('This task was deleted',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ))
                              ],
                            ),
                            onDismissed: (direction) {
                              base.dataStore.deleteTask(task: task);
                              print('hey');
                            },
                            key: Key(task.id),
                            child: TaskWidget(task: tasks[index]));
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  // alignment: Alignment.bottomCenter,
                  child: Container(
                    // color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.08,
                    // color: Colors.red,
                    child: Center(
                      child: Text(
                        tasks.length.toString() + ' tasks remaining',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
