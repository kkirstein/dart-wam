part of wam;


abstract class HeapCell {
  
}


class VariableCell extends HeapCell {
  
  // public properties
  static const String ID = 'REF';
  int address;
  
  // constructor
  VariableCell(this.address) { }
  
  // public methods
  String toString() {
    return "<$ID, $address>";
  }
}

class StructureCell extends HeapCell {
  
  // public properties
  static const String ID = 'STR';
  int address;

  // constructor
  StructureCell(this.address) { }
  
  // public methods
  String toString() {
    return "<$ID, $address>";
  }
}

class FunctorCell extends HeapCell {
  
  // public properties
  String get ID => _ID + arity.toString();
  final int arity;
  
  // private properties
  static const String _ID = 'f/';
  
  // constructor
  FunctorCell(this.arity) { }
  
  // public methods
  String toString() {
    return "$_ID/$arity";
  }
}