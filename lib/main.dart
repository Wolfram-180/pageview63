import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const String title = 'PageView';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: index % 2 == 0 ? Colors.yellow : Colors.blue,
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