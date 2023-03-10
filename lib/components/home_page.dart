import 'package:flutter/material.dart';
import 'keyboard.dart';
//import 'text_field.dart';
import 'values.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print('home page build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('calculator'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          DecoratedBox( /*input field*/
            decoration: BoxDecoration(
              border:Border.all(width: 5),
            ),
            child: SizedBox(
              width:400,
              height:60,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Text(Values.input,style: const TextStyle(fontSize: 20),),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DecoratedBox( /*output field*/
            decoration: BoxDecoration(
              border:Border.all(width: 5),
            ),
            child: SizedBox(
              width:400,
              height:60,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Text(Values.output,style: TextStyle(fontSize: 20),),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 4,
              children: [
                KeyCard(
                  word: 0,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 1,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 2,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 3,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 4,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 5,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 6,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 7,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 8,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 9,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 10,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 11,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 12,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 13,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 14,
                  rebuildFunc: rebuild,
                ),
                KeyCard(
                  word: 15,
                  rebuildFunc: rebuild,
                ),
              ],
            ),
          ),
          KeyCard(
            word: 16,
            rebuildFunc: rebuild,
          ),
        ],
      ),
    );
  }

  rebuild() {
    setState(() {
      Values.input = Values.input;
    });
  }
}
