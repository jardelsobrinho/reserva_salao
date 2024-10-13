import 'dart:io';

String fixture(String arquivo) => File('test/fixtures/$arquivo').readAsStringSync();
