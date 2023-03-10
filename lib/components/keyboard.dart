import 'package:flutter/foundation.dart';
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
Map<String ,int> weights = {
  '0':0,'1':0,'2':0,'3':0,'4':0,'5':0,'6':0,'7':0,'8':0,'9':0,
  '00':4, //numbers
  '+':1,'-':1, //+ -
  '*':2,'/':2, //* /
  '=':3,'CLEAR':3, //= clear
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
              computation(Values.input);
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

  computation(String input){
    double op1=0;
    double op2=0;
    int computeType=0;
    input.runes.forEach((ch) {
      if(weights[String.fromCharCode(ch)]==0){
        if(computeType!=0){
          op2=op2*10+double.parse(String.fromCharCode(ch));
        }
        else{
          op1=op1*10+double.parse(String.fromCharCode(ch));
        }
      }//numbers
      else if(weights[String.fromCharCode(ch)]==1 || weights[String.fromCharCode(ch)]==2){
        if(String.fromCharCode(ch)=='+'){
          computeType=1;
        }
        else if(String.fromCharCode(ch)=='-'){
          computeType=2;
        }
        else if(String.fromCharCode(ch)=='*'){
          computeType=3;
        }
        else if(String.fromCharCode(ch)=='/'){
          computeType=4;
        }
      }//add and sub
    });
    double out=0.0;
    if (computeType==1){
      out=op1+op2;
    }
    else if (computeType==2){
      out=op1-op2;
    }
    else if (computeType==3){
      out=op1*op2;
    }
    if (computeType==4){
      out=op1/op2;
    }
    setState(() {
      Values.output=out.toString();
    });
  }
}

