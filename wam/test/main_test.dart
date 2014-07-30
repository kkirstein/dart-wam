library wam_test;

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
      expect(heap.show(1), equals(vc));
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
      expect(heap.show(1), equals(sc));
      expect(heap.show(2), equals(fc));
      expect(heap.show(3), equals(vc));
    });
  });
}
