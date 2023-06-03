import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

const String title = 'PageView';
const pageCounts = 4;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final PageController _pageController = PageController();

  MyHomePage({super.key}) {
    _initPageController();
  }

  void _initPageController() {
    int currentPage = 0;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentPage++;

      if (currentPage > pageCounts - 1) {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.linear,
      );
    });
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(title),
      ),
      body: PageView.builder(
        controller: widget._pageController,
        itemCount: pageCounts,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: index % 2 == 0 ? Colors.green : Colors.blue,
            child: Text(
              index.toString(),
              style: const TextStyle(
                fontSize: 60,
              ),
            ),
          );
        },
      ),
    );
  }
}

/*        scrollDirection: Axis.vertical,
         children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
        ], */