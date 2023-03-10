import 'package:flutter/material.dart';
import 'values.dart';

List<String> keys = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '00',
  '+',
  '-',
  '*',
  '/',
  '=',
  'CLEAR',
];
Map<int ,int> weights = {
  0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,
  10:4, //numbers
  11:1,12:1, //+ -
  13:2,14:2, //* /
  15:3,16:3, //= clear
};

class KeyCard extends StatefulWidget {
  const KeyCard({super.key, required this.word,required this.rebuildFunc});

  final Function rebuildFunc;

  final int word;

  @override
  State<KeyCard> createState() => _KeyCardState();
}

class _KeyCardState extends State<KeyCard> {
  @override
  Widget build(BuildContext context) {
    print('keycard state build');
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            //print('press word');
            if(widget.word == 16){ //clear
              Values.input = 'INPUT';
              Values.output = 'OUTPUT';
            }
            else if(widget.word == 15 && Values.input != 'INPUT'){ //compute
              Values.output = Values.input;
            }
            else if(Values.input=='INPUT' && widget.word!=15){ //first
              Values.input=keys[widget.word];
            }
            else if(Values.input=='INPUT'&&widget.word==15){}
            else{
              Values.input=Values.input+keys[widget.word];
            }
            print(Values.input);
          });
          return widget.rebuildFunc();
        },
        child: Text(keys[widget.word],style: const TextStyle(fontSize: 20),),
      ),
    );
  }
}

