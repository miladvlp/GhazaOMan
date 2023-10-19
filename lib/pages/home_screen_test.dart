// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:ghazaoman/components/appbar.dart';
// import 'package:ghazaoman/components/drawer.dart';
// import 'package:ghazaoman/style/app_colors.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<dynamic> foodsData = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     if (!mounted) {
//       return;
//     }
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://raw.githubusercontent.com/hamzehazizzadeh/rezim_scraping/main/all.json'),
//         headers: {
//           "Content-Type": "application/x-www-form-urlencoded",
//         },
//       );

//       if (mounted && response.statusCode == 200) {
//         List<dynamic> jsonData = jsonDecode(response.body);
//         setState(() {
//           foodsData = jsonData;
//         });
//       } else {}
//     } on Exception {
//       log("Error Fetch Data");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: MyAppbar(title: "غذا و من", leading: const Menue()),
//         drawer: MyDrawer(),
//         body: ListView.builder(
//           itemCount: foodsData.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               title: Text(foodsData[index]["foods"]["category"].toString()),
//               onTap: () {
//                 // اطلاعات بیشتری را نمایش دهید یا به صفحه مخصوص به هر غذا منتقل شوید
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class Menue extends StatelessWidget {
//   const Menue({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           Scaffold.of(context).openDrawer();
//         },
//         icon: const Icon(
//           Icons.menu_rounded,
//           color: AppColors.white,
//         ));
//   }
// }








// // import 'dart:convert';
// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('لیست غذاهای دسته‌بندی "پلوها و چلوها"'),
// //         ),
// //         body: FoodList(),
// //       ),
// //     );
// //   }
// // }

// // class FoodList extends StatefulWidget {
// //   @override
// //   _FoodListState createState() => _FoodListState();
// // }

// // class _FoodListState extends State<FoodList> {
// //   List<Map<String, dynamic>> categoryData = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchDataFromJson();
// //   }

// //   void fetchDataFromJson() async {
// //     final url = Uri.parse(
// //         'https://raw.githubusercontent.com/hamzehazizzadeh/rezim_scraping/main/all.json');

// //     final response = await http.get(url);

// //     if (response.statusCode == 200) {
// //       final data = json.decode(response.body);
// //       final category = "پلوها و چلوها";

// //       for (var item in data) {
// //         if (item['subCategories'] != null) {
// //           for (var subCategory in item['subCategories']) {
// //             if (subCategory['foods'] != null) {
// //               for (var food in subCategory['foods']) {
// //                 if (food['category'] == category) {
// //                   categoryData.add({
// //                     'دسته‌بندی': food['category'],
// //                     'عنوان غذا': food['title'],
// //                     'تصویر': food['banner'],
// //                   });
// //                 }
// //               }
// //             }
// //           }
// //         }
// //       }

// //       // بروزرسانی ویجت با اطلاعات جدید
// //       setState(() {});
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return ListView.builder(
// //       itemCount: categoryData.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(categoryData[index]['عنوان غذا']),
// //           subtitle: Text(categoryData[index]['دسته‌بندی']),
// //           leading: Image.network(categoryData[index]['تصویر']),
// //         );
// //       },
// //     );
// //   }
// // }
