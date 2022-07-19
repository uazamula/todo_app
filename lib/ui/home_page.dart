import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:goals_app/controllers/task_controller.dart';
import 'package:goals_app/models/task.dart';
import 'package:goals_app/services/notification_services.dart';
import 'package:goals_app/services/theme_services.dart';
import 'package:goals_app/ui/add_task_bar.dart';
import 'package:goals_app/ui/theme.dart';
import 'package:goals_app/ui/widgets/button.dart';
import 'package:goals_app/ui/widgets/task_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions(); // comment out if needs
    setState(() {
      print('I am in initState');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(height: 10),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(child: Obx(() {
      return ListView.builder(
          itemCount: _taskController.taskList.length,
          itemBuilder: (_, index) {
            print(_taskController.taskList.length);
            Task task = _taskController.taskList[index];
            print(task.toJson());
            if (task.repeat == 'Daily' ||
                task.date ==
                    AddTaskPage.myDateFormat(
                        _selectedDate) /*DateFormat.yMd().format(_selectedDate)*/) {
              //TODO for 24:00 format (DateFormat.Hm()....)
              DateTime date = DateFormat.jm().parse(task.startTime!.toString());
              var myTime = DateFormat('HH:mm').format(date);
              var myTimeArr = myTime.toString().split(':');
              notifyHelper.scheduledNotification(
                int.parse(myTimeArr[0]),
                int.parse(myTimeArr[1]),
                task,
              );
              print(myTime);
              return
                  /*GestureDetector(
              onTap: (){
                _taskController.delete(_taskController.taskList[index]);
                _taskController.getTask();
              },
              child: Container(
                width: 100,
                height: 50,
                color: Colors.green,
                margin: EdgeInsets.only(bottom: 10),
                child: Text(_taskController.taskList[index].title!.toString()),
              ),)*/
                  AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showBottomSheet(context, task);
                          },
                          child: TaskTile(task),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          });
    }));
  }

  _showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(top: 4),
        height: task.isCompleted == 1
            ? MediaQuery.of(context).size.height * 0.24
            : MediaQuery.of(context).size.height * 0.32,
        color: Get.isDarkMode ? darkGreyClr : Colors.white,
        child: Column(
          children: [
            Container(
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300]),
            ),
            Spacer(),
            task.isCompleted == 1
                ? Container()
                : _bottomSheetButton(
                    label: 'Task Completed',
                    onTap: () {
                      _taskController.markTaskCompleteted(task.id!);
                      Get.back();
                    },
                    clr: primaryClr,
                    context: context,
                  ),
            SizedBox(height: 4),
            _bottomSheetButton(
              label: 'Delete Task',
              onTap: () {
                _taskController.delete(task);
                Get.back();
              },
              clr: Colors.red[300]!,
              context: context,
            ),
            SizedBox(height: 20),
            _bottomSheetButton(
              label: 'Close',
              onTap: () {
                Get.back();
              },
              clr: Colors.red[300]!,
              isClose: true,
              context: context,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _bottomSheetButton({
    required String label,
    required Function()? onTap,
    required Color clr,
    bool isClose = false,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        height: 55,
        width: MediaQuery.of(context).size.width * 0.9,
        //
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style:
                isClose ? titleStyle : titleStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
          });
        },
      ),
    );
  }

  _addTaskBar() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingStyle,
                ),
                Text(
                  "Today",
                  style: headingStyle,
                )
              ],
            ),
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(() => AddTaskPage());
              _taskController.getTasks();
            },
          ),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Theme"
                  : "Activated Dark Theme");
          // notifyHelper.scheduledNotification();//!!!!comment in
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          // color: context.theme.colorScheme.onPrimary,//Get.isDarkMode ? Colors.white: Colors.black,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.png"),
        )
      ],
    );
  }
}
