part of wam;


abstract class HeapCell {
  
}


class VariableCell extends HeapCell {
  
  // public properties
  static const String ID = 'REF';
  int address;
}

class StructureCell extends HeapCell {
  
  // public properties
  static const String ID = 'STR';
  int address;
}

class FunctorCell extends HeapCell {
  
  // public properties
  String get ID => _ID + arity.toString();
  int arity;
  
  // private properties
  static const String _ID = 'f/';
}