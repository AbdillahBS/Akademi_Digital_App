import 'package:imk_app/model/course.dart';
import 'package:imk_app/model/grid2.dart';

class CustomGridItem {
  final String title;
  final String image;
  final String course;
  final String subtitle;
  final double progress;
  final String progressTitle;
  final String progressText;
  final Categories category;
  final List<CourseModule> modules;

  CustomGridItem({
    required this.title,
    required this.image,
    required this.course,
    required this.subtitle,
    required this.progress,
    required this.progressTitle,
    required this.progressText,
    required this.category,
    required this.modules,
  });
}

final category1 = Categories(title: 'Coding');
final category2 = Categories(title: 'Marketing');

final List<CustomGridItem> items = [
  CustomGridItem(
    title: 'Complete Basic Strategy and Business Management',
    image: 'assets/images/image2.jpg',
    course: 'Strategy and Business Management',
    subtitle: '6 modules',
    progressTitle: '5 modules - 8h 15m',
    progress: 1,
    progressText: '100%',
    category: category2,
    modules: strategyAndBusinessManagementModules,
  ),
  CustomGridItem(
    title: 'Complete Basic Digital Marketing',
    image: 'assets/images/image1.png',
    course: 'Digital Marketing',
    subtitle: '11 modules',
    progressTitle: '11 modules - 10h 15m',
    progress: 0.95,
    progressText: '95%',
    category: category2,
    modules: digitalMarketingModules,
  ),
  CustomGridItem(
    title: 'Complete Basic Programming',
    image: 'assets/images/image4.jpg',
    course: 'Base Programming',
    subtitle: '4 modules',
    progressTitle: '4 modules - 4h 12m',
    progress: 0.75,
    progressText: '75%',
    category: category1,
    modules: programmingModules,
  ),
  CustomGridItem(
    title: 'Complete Advanced AI Concepts',
    image: 'assets/images/image3.jpg',
    course: 'Artificial Intelligence',
    subtitle: '6 modules',
    progressTitle: '6 modules - 8h 30m',
    progress: 0.60,
    progressText: '60%',
    category: category1,
    modules: aiModules,
  ),
];

final List<Categories> categories = [
  category1,
  category2,
];
