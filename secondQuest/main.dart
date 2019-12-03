import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() async {
  final file = new File('input.txt');
  Stream<List<int>> inputStream = file.openRead();

  String numb = "";
  int index = 0;
  var code = new List();

  var lines = inputStream
      .transform(utf8.decoder)       // Decode bytes to UTF-8.
      .transform(new LineSplitter());// Convert stream to individual lines.

  await for(var line in lines){
    for(var i = 0; i < line.length; i++){

      if(line[i] != ','){
        numb = numb + line[i];
      }else{
        code.add(int.parse(numb));
        numb = "";
        //print(code[index]);
        index++;
      }
    }
  }

  var opcode;
  var in1position;
  var in2position;
  var outposition;

  for(var i = 0; i < code.length; i = i + 4){
    opcode = code[i];
    in1position = code[i+1];
    in2position = code[i+2];
    outposition = code[i+3];

    if(opcode == 1){
      code[outposition] = code[in1position] + code[in2position];
    }else if(opcode == 2){
      code[outposition] = code[in1position] * code[in2position];
    }else if(opcode == 99){
      break;
    } else{
      print("unknown opcode!");
    }
  }

  for(var i = 0; i <code.length; i++){
    print(code[i]);
  }


}
