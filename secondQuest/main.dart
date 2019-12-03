import 'dart:async';
import 'dart:io';
import 'dart:convert';

int RunAlgorithm(List<dynamic> intcode ,int n, int v){
  var opcode;
  var in1position;
  var in2position;
  var outposition;

  intcode[1] = n;
  intcode[2] = v;

  for(var i = 0; i < intcode.length; i = i + 4){
    opcode = intcode[i];
    in1position = intcode[i+1];
    in2position = intcode[i+2];
    outposition = intcode[i+3];

    if(opcode == 1){
      intcode[outposition] = intcode[in1position] + intcode[in2position];
    }else if(opcode == 2){
      intcode[outposition] = intcode[in1position] * intcode[in2position];
    }else if(opcode == 99){
      break;
    } else{
      print("unknown opcode!");
    }
  }

//  for(var i = 0; i <code.length; i++){
//    print(code[i]);
//  }

  return intcode[0];
}

List<dynamic> CopyList(List<dynamic> list){
   var l = new List();

  for(var element in list){
    l.add(element);
  }

  return l;
}

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

  var codeRun;
//  codeRun = CopyList(code);
//  print(RunAlgorithm(code, 12, 2));


  int answer = 19690720;


  for(int n = 0; n < 100; n++){
   for(int v = 0; v < 100; v++){
     codeRun = CopyList(code);

     if(RunAlgorithm(codeRun, n, v) == answer){
       print('HOORAY! n=$n, v=$v');
     }
   }
  }


}
