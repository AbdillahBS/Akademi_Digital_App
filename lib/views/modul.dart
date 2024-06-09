import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:imk_app/model/quiz.dart';
import 'package:imk_app/theme/apps_color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ModuleDetailPage extends StatefulWidget {
  final String moduleTitle;
  final String videoId;
  final QuizQuestion quizQuestion;
  final int currentQuestionIndex;
  final int totalQuestions;

  ModuleDetailPage({
    required this.moduleTitle,
    required this.videoId,
    required this.quizQuestion,
    required this.currentQuestionIndex,
    required this.totalQuestions,
  });

  @override
  _ModuleDetailPageState createState() => _ModuleDetailPageState();
}

class _ModuleDetailPageState extends State<ModuleDetailPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  void checkAnswer(int selectedIndex) {
    bool isCorrect = selectedIndex == widget.quizQuestion.correctAnswerIndex;
    DialogType dialogType = isCorrect ? DialogType.success : DialogType.error;
    String feedbackMessage = isCorrect ? 'Correct!' : 'Wrong!';

    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide,
      title: feedbackMessage,
      desc: isCorrect
          ? 'Well done! You got it right.'
          : 'Oops! That\'s not correct.',
      btnOkOnPress: () {},
    )..show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moduleTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  print('Player is ready.');
                },
              ),
              SizedBox(height: 20),
              Text(
                widget.quizQuestion.question,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Question ${widget.currentQuestionIndex} of ${widget.totalQuestions}',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.quizQuestion.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => checkAnswer(index),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          String.fromCharCode(65 + index) + ".",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          widget.quizQuestion.options[index],
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
