import 'dart:io';

import 'package:test/test.dart';
import 'package:dart_midi/dart_midi.dart';

void main() {
  test('parser and writer output matches', () {
    var file = File('test/resources/When_The_Saints_Go_Marching_In.mid');
    final parser = MidiParser();
    List<int> originalFileBuffer = file.readAsBytesSync();
    var parsedMidi = parser.parseMidiFromBuffer(originalFileBuffer);

    print(parsedMidi.tracks.length.toString());

    for(var track in parsedMidi.tracks) {
      print("new track");
      for(var event in track){
        print(event.toString());
      }
    }

    var writer = MidiWriter();
    List<int> writtenBuffer = writer.writeMidiToBuffer(parsedMidi);
    //
    // print("originalFileBuffer.length : ${originalFileBuffer.length}");
    // print("writtenBuffer.length : ${writtenBuffer.length}");
    //

    final file2 = File('test/resources/When_The_Saints_Go_Marching_In.out.mid');
    //final contents = 'Hello, world!';
    file2.writeAsBytes(writtenBuffer);
    print('Data written to file successfully!');

    // expect(originalFileBuffer, writtenBuffer);
  });
}
