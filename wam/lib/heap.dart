part of wam;

/**
 * global storage space for WAM, organized as growable heap
 */
class Heap {
  
  // public properties
  int get head => _head;
  
  // private properties
  List<HeapCell> _data;
  int _head;
  
  // constructor
  Heap() {
    _data = new List();
    _head = 0;
  }
  
  // public methods
  void add(HeapCell item) {
    _data.add(item);
    _head++;
  }
  
  HeapCell show(int address) {
    if (address > _head) {
      throw "Trying to address unsed heap address";
    } else {
      return _data[address-1];
    }
  }
}