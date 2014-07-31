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
    if (index < _next) {
      _regs[index] = item;
    } else {
      throw "Trying to address unsed register";
    }
  }
  
  int setNext(HeapCell item) {
    _regs.add(item);
    _next++;
    
    return (_next-1); // shorter?: return _next++;
  }
  
  HeapCell get(index) {
    if (index < _next) {
      return _regs[index];
    } else {
      throw "Trying to address unsed register";
    }
  }
}