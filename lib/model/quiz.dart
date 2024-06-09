class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

String getVideoIdForModule(int index) {
  // You can map module indices to video IDs here
  switch (index) {
    case 0:
      return 'aQbZdee5PXI';
    case 1:
      return 'Z5lLg3wGalo'; // Replace with actual video IDs
    case 2:
      return 'UYp32dGr5X8'; // Replace with actual video IDs
    // Add more cases for other modules
    default:
      return 'aQbZdee5PXI';
  }
}
