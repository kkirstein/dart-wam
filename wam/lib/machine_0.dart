part of wam;


class Machine {
  
  // private properties
  Heap _heap;
  Registers _regs;
  
  // constructor
  Machine() {
    _heap = new Heap();
    _regs = new Registers();
  }
  
  // public methods
  void putStructure(String functorId, int arity, int regIndex) {
    var sc = new StructureCell(_heap.head);
    _heap.add(sc);
    _heap.add(new FunctorCell(functorId, arity));
    _regs.set(regIndex, sc);
//    _regs.set(regIndex, functorId);
  }
  
  void setVariable(int regIndex) {
    var vc = new VariableCell(_heap.head);
    _heap.add(vc);
    _regs.set(regIndex, vc);
  }
  
  void setValue(int regIndex) {
    var item = _regs.get(regIndex);
    _heap.add(item);
  }
  
  // public debugging methods
  String showHeap() {
    return _heap.toString();
  }
  
  String showRegisters() {
    return _regs.toString();
  }
  
}