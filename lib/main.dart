import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'WidgetsPractice',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  FirstPageState createState() => FirstPageState();
}

class FirstPageState extends State<MainPage> {
  bool isTask1 = true;

  void changePage() {
    setState(() {
      isTask1 = !isTask1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Practice'),
      ),
      body: isTask1 ? const Task1Page() : Task2Page(changePage),
      floatingActionButton: FloatingActionButton(
        onPressed: changePage,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }
}

class Task1Page extends StatelessWidget {
  const Task1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Task1('Hello everyone, It is my Greetings');
    // return const Task1('Hello again, It is the second time I am saying Greetings');
  }
}

class Task2Page extends StatelessWidget {
  final VoidCallback toggleTask;

  const Task2Page(this.toggleTask, {super.key});

  @override
  Widget build(BuildContext context) {
    return Task2(toggleTask: toggleTask);
  }
}

class Task1 extends StatelessWidget {
  final String greeting;

  const Task1(this.greeting, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetsPractice',
      home: Scaffold(
        backgroundColor: Colors.black26,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Stateless Widget',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Center(
          child: Text(
            greeting,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Task2 extends StatefulWidget {
  const Task2({super.key, required VoidCallback toggleTask});

  @override
  Task2State createState() => Task2State();
}

class Task2State extends State<Task2> {
  int count = 1, a = 1;

  void changeNum() {
    setState(() {
      int b;
      b = a;
      a = count;
      count += b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WidgetsPractice',
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Stateful Widget'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'The Current Fibonacci Number is :',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$count',
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: changeNum,
                    tooltip: 'Press to see the next number',
                    backgroundColor: Colors.black54,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.skip_next),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
