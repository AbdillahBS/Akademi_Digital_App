import 'package:flutter/material.dart';
import 'package:imk_app/model/grid1.dart';
import 'package:imk_app/theme/apps_color.dart';
import 'package:imk_app/views/Course.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  _MyCourseState createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  bool showCompleted = false;

  @override
  Widget build(BuildContext context) {
    final List<CustomGridItem> filteredCourses = showCompleted
        ? items.where((item) => item.progress == 1).toList()
        : items.where((item) => item.progress < 1).toList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Course",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "What course are you looking for?",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCompleted = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      color: showCompleted ? Colors.orange : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Complete',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showCompleted = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                      color: !showCompleted ? Colors.orange : Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Ongoing',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCourses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetailPage(course: filteredCourses[index]),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 4),
                            blurRadius: 10,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  filteredCourses[index].title,
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  filteredCourses[index].progressTitle,
                                  style: TextStyle(color: AppColors.textLight),
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                child: CircularProgressIndicator(
                                  value: filteredCourses[index].progress,
                                  strokeWidth: 5.0,
                                  backgroundColor: Colors.grey.shade400,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    filteredCourses[index].progress == 1.0
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              ),
                              Text(
                                filteredCourses[index].progressText,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: filteredCourses[index].progress == 1.0
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
