part of wam;

/**
 * a register bank for temporary data of the WAM
 */
class Registers {
  
  // public properties
  
  // private properties
  int _next;
  List<dynamic> _regs;
  
  // constructor
  Registers() {
    _next = 0;
    _regs = new List();
  }
  
  // public methods
  void set(int index, dynamic item) {
    if (index >= _regs.length) {
      // TODO: allocate additional registers
      var newRegs = index-(_regs.length-1);
      _regs.addAll(new List(newRegs));
      _regs[index] = item;
    } else {
      _regs[index] = item;
    }
  }
  
//  int setNext(dynamic item) {
//    _regs.add(item);
//    return _next++;
//  }
  
  dynamic get(index) {
    if (index < _regs.length) {
      return _regs[index];
    } else {
      throw "Trying to address unsed register";
    }
  }
  
  String toString() {
    var count = 0;
    var result = _regs.map((e) => ('X${count++}:\t' + e.toString())).join('\n');

    return result;
  }

}
