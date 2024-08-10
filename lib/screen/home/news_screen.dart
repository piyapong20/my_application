import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_application/config/app.dart';
import 'package:my_application/model/category_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<CategoryModel> categories = [];

  void fetchCategories() async {
    final response = await http.get(Uri.parse('$API_URL/api/category.json'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        for (var category in data) {
          categories.add(CategoryModel.fromJson(category));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                categories[index].categoryNameTh,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(categories[index].categorySlugTh),
            ),
          );
        },
      ),
    );
  }
}
