library heap_test;

import 'package:unittest/unittest.dart';
//import 'package:unittest/html_config.dart';
import 'package:wam/wam.dart';

void main() {
  
//  useHtmlConfiguration();
  group('HeapCells', () {
    test('VariableCell', () {
      var vc = new VariableCell(11);
      expect(vc.address, equals(11));
      vc.address = 13;
      expect(vc.address, equals(13));
    });
    
    test('StructureCell', () {
      var sc = new StructureCell(11);
      expect(sc.address, equals(11));
      sc.address = 13;
      expect(sc.address, equals(13));
    });
    
    test('FunctorCell', () {
      var fc = new FunctorCell(3);
      expect(fc.arity, equals(3));
      expect(() {fc.arity = 2;}, throwsNoSuchMethodError);
    });    
  });
  
  group('Heap', () {
    test('Empty', () {
      var heap = new Heap();
      expect(heap.head, isZero);
    });
    
    test('Add', () {
      var heap = new Heap();
      var vc = new VariableCell(heap.head);
      heap.add(vc);
      expect(heap.head, equals(1));
      expect(heap.get(1), equals(vc));
    });

    test('Add2', () {
      var heap = new Heap();
      var sc = new StructureCell(heap.head+1);
      var fc = new FunctorCell(1);
      var vc = new VariableCell(heap.head+2);
      heap.add(sc);
      heap.add(fc);
      heap.add(vc);
      expect(heap.head, equals(3));
      expect(heap.get(1), equals(sc));
      expect(heap.get(2), equals(fc));
      expect(heap.get(3), equals(vc));
    });
    
    test('Error', () {
      var heap = new Heap();
      var vc = new VariableCell(heap.head);
      heap.add(vc);
      expect(() {heap.get(2);}, throwsA(new isInstanceOf('String')));
    });
  });
  
  group('Registers', () {
    test('Empty', () {
      var regs = new Registers();
      expect(regs.setNext(null), isZero);
    });
    
    test('SetNext', () {
      var regs = new Registers();
      var vc1 = new VariableCell(3);
      var vc2 = new VariableCell(4);
      var r1 = regs.setNext(vc1);
      var r2 = regs.setNext(vc2);
      expect(r1, equals(0));
      expect(r2, equals(1));
      expect(regs.get(r1), equals(vc1));
      expect(regs.get(r2), equals(vc2));
    });
    
    test('Set_Get', () {
      var regs = new Registers();
      var vc1 = new VariableCell(3);
      var vc2 = new VariableCell(4);
      var r1 = regs.setNext(vc1);
      var r2 = regs.setNext(vc2);
      expect(regs.get(r1), equals(vc1));
      expect(regs.get(r2), equals(vc2));

      regs.set(r1, vc2);
      regs.set(r2, vc1);
      expect(regs.get(r1), equals(vc2));
      expect(regs.get(r2), equals(vc1));
      
    });
    
    test('Error', () {
      var regs = new Registers();
      expect(() {regs.get(0);}, throwsA(new isInstanceOf('String')));
      regs.setNext(new VariableCell(3));
      expect(() {regs.get(0);}, returnsNormally);
      expect(() {regs.get(1);}, throwsA(new isInstanceOf('String')));
    });
  });
}
