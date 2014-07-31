part of wam;

/**
 * global storage space for WAM, organized as growable heap
 */
class Heap {
  
  // public properties
  int get head => _next;
  
  // private properties
  List<HeapCell> _data;
  int _next;
  
  // constructor
  Heap() {
    _data = new List();
    _next = 0;
  }
  
  // public methods
  void add(HeapCell item) {
    _data.add(item);
    _next++;
  }
  
  HeapCell get(int address) {
    if (address <= _next) {
      return _data[address-1];
    } else {
      throw "Trying to address unsed heap address";
    }
  }
}