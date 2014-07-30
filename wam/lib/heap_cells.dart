part of wam;

/**
 * abstact parent class for all heap cells
 */
abstract class HeapCell {
  
}

/**
 * heap cell to contain a variable reference
 */
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

/**
 * heap cell contain a structure reference
 */
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

/**
 * heap cell to contain a functor head (with stored arity)
 */
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