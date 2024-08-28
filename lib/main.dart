import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/search/binary_search_provider.dart';
import 'providers/search/linear_search_provider.dart';
import 'providers/sort/bubble_sort_provider.dart';
import 'providers/sort/insertion_sort_provider.dart';
import 'providers/sort/quick_sort_provider.dart';
import 'providers/sort/selection_sort_provider.dart';
import 'ux/pages/home/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Algorithms',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider<LinearSearchProvider>(
              create: (_) => LinearSearchProvider(),
            ),
            ChangeNotifierProvider<BinarySearchProvider>(
              create: (_) => BinarySearchProvider(),
            ),
            ChangeNotifierProvider<BubbleSortProvider>(
              create: (_) => BubbleSortProvider(),
            ),
            ChangeNotifierProvider<InsertionSortProvider>(
              create: (_) => InsertionSortProvider(),
            ),
            ChangeNotifierProvider<QuickSortProvider>(
              create: (_) => QuickSortProvider(),
            ),
            ChangeNotifierProvider<SelectionSortProvider>(
              create: (_) => SelectionSortProvider(),
            ),
          ],
          child: const Home(),
        ),
      ),
    );
  }
}

/*
This app showcase the Search Algorithms (Linear Search, Binary Search) and Sorting Algorithms (Selection Sort, Quick Sort, Bubble Sort, and Insertion Sort).
The app is responsive for Mobile, Web and Desktop.
*/