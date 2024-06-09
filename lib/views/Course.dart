import 'package:flutter/material.dart';
import 'package:imk_app/model/grid1.dart';
import 'package:imk_app/model/quiz.dart';
import 'package:imk_app/views/modul.dart';

class CourseDetailPage extends StatelessWidget {
  final CustomGridItem course;

  CourseDetailPage({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(course.course),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              course.image,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Text(
                course.course,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Lessons",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: course.modules.length,
                itemBuilder: (context, index) {
                  final module = course.modules[index];
                  final videoId = getVideoIdForModule(
                      index); // Function to get the video ID
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ModuleDetailPage(
                            moduleTitle: module.title,
                            videoId: videoId, // Pass the video ID here
                            quizQuestion: QuizQuestion(
                              question:
                                  'What are the key metrics to measure the success of a digital campaign?',
                              options: [
                                'By randomly selecting users from various demographics',
                                'By using data analytics to understand user behavior and preferences',
                                'By focusing solely on increasing website traffic',
                              ],
                              correctAnswerIndex: 1,
                            ),
                            currentQuestionIndex: index + 1,
                            totalQuestions: course.modules.length,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            spreadRadius: 1,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            module.status,
                            style: TextStyle(
                              color: module.status == 'Completed'
                                  ? Colors.green
                                  : Colors.orange,
                            ),
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
