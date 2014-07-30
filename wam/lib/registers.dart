part of wam;

/**
 * a register bank for temporary data of the WAM
 */
class Registers {
  
  // public properties
  
  // private properties
  int _next;
  List<HeapCell> _regs;
  
  // constructor
  Registers() {
    _next = 0;
    _regs = new List();
  }
  
  // public methods
  void set(int index, HeapCell item) {
    // TODO
  }
  
  void setNext(HeapCell item) {
    // TODO
  }
  
  HeapCell get(index) {
    // TODO
    return null;
  }
}