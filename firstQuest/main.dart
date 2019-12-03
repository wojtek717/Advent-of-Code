import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() async {
  final file = new File('input.txt');
  Stream<List<int>> inputStream = file.openRead();

  int mass;
  int fuelformodule = 0;
  int fuel = 0;

  var lines = inputStream
      .transform(utf8.decoder)       // Decode bytes to UTF-8.
      .transform(new LineSplitter());// Convert stream to individual lines.

  await for(var line in lines){
    mass = int.parse(line);

    do{
      fuelformodule = (mass/3).toInt() - 2;

      if(fuelformodule > 0){
        fuel += fuelformodule;
        mass = fuelformodule;
      }
    }while(fuelformodule > 0);
  }

  print(fuel);



}
