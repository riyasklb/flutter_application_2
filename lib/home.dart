import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int crossAxisCount = 1;

  void increment() {
    setState(() {
      crossAxisCount++;
    });
  }

  void decrement() {
    setState(() {
      if (crossAxisCount > 1) {
        crossAxisCount--;
      }
    });
  }

  Widget _buildBody() {
    if (crossAxisCount > 1) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: crossAxisCount,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Center(
                    child: Text(
                  'Item $index',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
              ),
            ),
          );
        },
      );
    } else {
      return ListView.separated(
          itemCount: 50,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Container(
                child: Center(
                    child: Text(
                  'Item $index',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                )),
                decoration: BoxDecoration(
                    color: Color(Random().nextInt(0xffffffff)).withAlpha(0xff),
                    borderRadius: BorderRadius.circular(16)),
                height: 70,
                // color: Colors.black,
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 20));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
        actions: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: decrement,
          ),
          Center(child: Text('$crossAxisCount')),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: increment,
          ),
        ],
      ),
      body: _buildBody(),
    );
  }
}
