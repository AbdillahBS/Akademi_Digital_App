import 'package:flutter/material.dart';

import 'package:imk_app/model/grid1.dart';
import 'package:imk_app/views/Course.dart';

class SearchResultsPage extends StatelessWidget {
  final List<CustomGridItem> searchResults;

  const SearchResultsPage({Key? key, required this.searchResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
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
                        searchResults[index].image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    searchResults[index].course,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    searchResults[index].subtitle,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          searchResults[index].title,
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
                            value: searchResults[index].progress,
                            strokeWidth: 5.0,
                            backgroundColor: Colors.grey.shade400,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              searchResults[index].progress == 1.0
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                          ),
                          Text(
                            searchResults[index].progressText,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: searchResults[index].progress == 1.0
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
