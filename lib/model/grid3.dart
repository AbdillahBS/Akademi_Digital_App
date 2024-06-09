class Course {
  final String title;
  final String subtitle;
  final String image;

  Course({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}

final List<Course> c = [
  Course(
    title: 'Complete Basic Digital Marketing',
    subtitle: '11 modules',
    image: 'assets/images/image1.png',
  ),
  Course(
    title: 'Complete Basic Programming',
    subtitle: '4 modules - 4h 12m',
    image: 'assets/images/image1.png',
  ),
  Course(
    title: 'Complete Advanced AI Concepts',
    subtitle: '6 modules - 8h 30m',
    image: 'assets/images/image1.png',
  ),
];
