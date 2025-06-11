import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../controllers/counter_controller.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  CounterController counterController = CounterController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '${counterController.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterController.increment();
              setState(() {});
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterController.reset();
              setState(() {});
            },
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_zero),
          ),
          FloatingActionButton(
            onPressed: () {
              counterController.decrement();
              setState(() {});
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      )
    );
  }
}
