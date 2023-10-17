import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('لیست غذاهای دسته‌بندی "پلوها و چلوها"'),
        ),
        body: FoodList(),
      ),
    );
  }
}

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<Map<String, dynamic>> categoryData = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromJson();
  }

  void fetchDataFromJson() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/hamzehazizzadeh/rezim_scraping/main/all.json');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final category = "پلوها و چلوها";

      for (var item in data) {
        if (item['subCategories'] != null) {
          for (var subCategory in item['subCategories']) {
            if (subCategory['foods'] != null) {
              for (var food in subCategory['foods']) {
                if (food['category'] == category) {
                  categoryData.add({
                    'دسته‌بندی': food['category'],
                    'عنوان غذا': food['title'],
                    'تصویر': food['banner'],
                  });
                }
              }
            }
          }
        }
      }

      // بروزرسانی ویجت با اطلاعات جدید
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryData.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(categoryData[index]['عنوان غذا']),
          subtitle: Text(categoryData[index]['دسته‌بندی']),
          leading: Image.network(categoryData[index]['تصویر']),
        );
      },
    );
  }
}
