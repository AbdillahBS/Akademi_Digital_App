import 'package:flutter/material.dart';
import 'package:imk_app/model/grid1.dart';
import 'package:imk_app/model/grid2.dart';
import 'package:imk_app/theme/apps_color.dart';
import 'package:imk_app/views/Course.dart';
import 'package:imk_app/views/category.dart';
import 'package:imk_app/views/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _searchController;
  List<CustomGridItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items; // Mengisi daftar awal
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems = items
          .where((item) => item.course.toLowerCase().contains(query))
          .toList();
    });
  }

  void _navigateToSearchResultsPage(List<CustomGridItem> searchResults) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultsPage(searchResults: searchResults),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text(
                        "Welcome back",
                        style: TextStyle(
                          color: AppColors.textLight,
                        ),
                      ),
                      Text(
                        "Gen-Z",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(Icons.notifications_sharp),
              ],
            ),
          ),
          SizedBox(height: 20),
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "What course you're looking for?",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onSubmitted: (value) {
                      // Panggil fungsi pencarian dan navigasi ke halaman hasil pencarian
                      _navigateToSearchResultsPage(filteredItems);
                    },
                  ),
                ),
                Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Continue Learning",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseDetailPage(course: items[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.all(20),
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
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Text(
                                  items[index].progressTitle,
                                  style: TextStyle(color: AppColors.textLight),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 14),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: items[index].progress,
                              strokeWidth: 5.0,
                              backgroundColor: Colors.grey.shade400,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                items[index].progress == 1.0
                                    ? Colors.green
                                    : Colors.orange,
                              ),
                            ),
                            Text(
                              items[index].progressText,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: items[index].progress == 1.0
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
          SizedBox(height: 30),
          Text(
            "Categories",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            height: 35,
            child: ListView.builder(
              itemCount: category.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailPage(
                          category: categories[index],
                          items: items,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 120,
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
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        category[index].title,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Featured Course",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
              // padding: EdgeInsets.all(20),
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CourseDetailPage(course: items[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: 230,
                      margin: EdgeInsets.all(18),
                      padding: EdgeInsets.all(15),
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
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            items[index].image,
                            fit: BoxFit.cover,
                            height: 150,
                          ),
                          SizedBox(height: 10),
                          Text(
                            items[index].course,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Text(
                              items[index].subtitle,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
        ],
      ),
    );
  }
}
