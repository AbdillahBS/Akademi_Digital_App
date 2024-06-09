import 'package:flutter/material.dart';
import 'package:imk_app/model/grid1.dart';
import 'package:imk_app/model/grid2.dart';
import 'package:imk_app/views/Course.dart';

class CategoryDetailPage extends StatelessWidget {
  final Categories category;
  final List<CustomGridItem> items;

  CategoryDetailPage({required this.category, required this.items});

  @override
  Widget build(BuildContext context) {
    final filteredItems =
        items.where((item) => item.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(category.title),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: filteredItems.length,
        itemBuilder: (context, index) {
          final item = filteredItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDetailPage(course: items[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        item.image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.course,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    item.subtitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          item.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: item.progress,
                            strokeWidth: 5.0,
                            backgroundColor: Colors.grey.shade400,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              item.progress == 1.0
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                          Text(
                            item.progressText,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: item.progress == 1.0
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
