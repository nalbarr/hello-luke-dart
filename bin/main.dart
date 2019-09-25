import 'dart:math' as math;
import 'package:hello_luke_dart/foo.dart' as foo;


main(List<String> arguments) {
  // NA. Java like semicolons required for line termination
  foo.bar();

  // 1D as array, list or linear algebra vector of scalars
  iterateScalars1DWithIndexes();

  // 1D as array, list or linear algebra vector of scalars
  iterateScalars1DWithCollections();

  // 1D as array, list or linear algebra vector of <Object>
  iterateObjects1DWithIndexes();

  // 1D as collection of interfacess
  iterateInterfaces1DWithCollections();

  // 1D as collection of interfaces with type casting
  iterateInterface1DWithSpecificTypeCasts();

  // 1D as different collection types for different operations (e.g., get)
  collectionsComplexity();  
}

// NA. NOTE: Dart does not support native array of scalars (primitive types) only object lists, etc.
iterateScalars1DWithIndexes() {
  print("*** iterateScalars1DWithIndexes");
  //var ints[5];
  for (int i = 0; i < 5; i++) {
    print("i: " + i.toString());
  }
  print("");
}

iterateScalars1DWithCollections() {
  print("*** iterateScalars1DWithCollections");
  List ints = [1, 2, 3, 4, 5];
  for (final x in ints) {
    print("x: " + x.toString());   
  }

  print("");
}

class Square {
  String _name;
  double _side;
  Square(String name, double side) {
    _name = name;
    _side = side;
  }
  double getArea() {
    return _side * _side;
  }
  // NA. String formatting via interpolation.
  String toString() {
    return "name: $_name; side: $_side";
  }
}
iterateObjects1DWithIndexes() {
  print("*** iterateObjects1DWithIndexes");

  // NAA. No new keyword need to instantiate objects
  List squares = [Square("square1", 1), Square("square2", 2)];
  for (final s in squares) {
    print("s: " + s._name);
  }

  print("");
}

abstract class Shape {
  String getName();
  double getArea();
}
class Rectangle implements Shape {
  String _name;
  double _base;
  double _side;
  Rectangle(String name, double base, double side) {
    _name = name;
    _base = base;
    _side = side;
  }
  String getName () {
    return _name;
  }
  double getArea() {
    return _base * _side;
  }
}
class Triangle implements Shape {
  String _name;
  double _base;
  double _side;
  Triangle(String name, double base, double side) {
    _name = name;
    _base = base;
    _side = side;
  }
  String getName() {
    return _name;
  }
  double getArea() {
    return 0.5 * _base * _side;
  }
  String extensionMethod() {
    return "extension.";
  }
}

iterateInterfaces1DWithCollections() {
  print("*** itersateInterfaces1DWithCollections");

  // NAA. No new keyword need to instantiate objects
  List shapes = [Rectangle("rectangle1", 1, 1), Triangle("triangle2", 2, 2)];
  for (Shape s in shapes) {
    print("s.type: " + s.runtimeType.toString() +
      "; s.name: " + s.getName() + 
      "; s.area: " + s.getArea().toString());
  }

  print("");
}

iterateInterface1DWithSpecificTypeCasts() {
  print("*** iterateInterface1DWithSpecificTypeCasts");

  List shapes = [Triangle("triangle2", 2, 2)];
  for (Shape s in shapes) {
    var t = s as Triangle;
    
    print("t.type: " + t.runtimeType.toString() +
      "; t.name: " + t.getName() + 
      "; t.area: " + t.getArea().toString() +
      "; t.extensionMethod: " + t.extensionMethod());
  }

  print("");
}

collectionsComplexity() {
  print("*** collectionsComplexity");

	// CONCEPTS:
	// - NOTE: populating each collection with 10 million integers and attempting to get an integer stored at a random index.
	// - Why does calling get(<index>) result in different duration times to complete (performance)?
	// - Hpw would this influence your design of a program?

  int MAX_SIZE = 10000000;
  var ints = List<int>.generate(MAX_SIZE, (i) => i + 1);

  for (int i in ints) {
      i = math.Random().nextInt(MAX_SIZE);
  }

  var start = DateTime.now();

  var index = math.Random().nextInt(MAX_SIZE);
  var someInt = ints[index];

  var stop = DateTime.now();
  var duration = stop.difference(start);
  
  print("ints[" + index.toString() + "]: " +
    someInt.toString() + " " +
    "took " + duration.toString() + " milliseconds.");
  print("");
}