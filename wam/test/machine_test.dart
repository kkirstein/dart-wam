library machine_test;

import 'package:unittest/unittest.dart';
//import 'package:unittest/html_config.dart';
import 'package:wam/wam.dart';

void main() {
  
//  useHtmlConfiguration();
  group('CompileQueries', () {
    test('PutStructure', () {
      var m0 = new Machine();
      m0.putStructure('h', 2, 3);
      
//      print(m0.showHeap());
      var exp_heap = 
          "0:\t<STR,0>\n"
          "1:\th/2";
      expect(m0.showHeap(), equals(exp_heap));
      
//      print(m0.showRegisters());
      var exp_regs = 
          "X0:\tnull\n"
          "X1:\tnull\n"
          "X2:\tnull\n"
          "X3:\t<STR,0>";
      expect(m0.showRegisters(), equals(exp_regs));
    });
    
    test('SetVariable', () {
      var m0 = new Machine();
      m0.setVariable(2);
      
//      print(m0.showHeap());
      var exp_heap = 
          "0:\t<REF,0>";
      expect(m0.showHeap(), equals(exp_heap));
      
//      print(m0.showRegisters());
      var exp_regs = 
          "X0:\tnull\n"
          "X1:\tnull\n"
          "X2:\t<REF,0>";
      expect(m0.showRegisters(), equals(exp_regs));
    });
    
    test('SetValue', () {
      var m0 = new Machine();
      m0.setVariable(5);

//      print(m0.showHeap());
      var exp_heap = 
          "0:\t<REF,0>";
      expect(m0.showHeap(), equals(exp_heap));
      
//      print(m0.showRegisters());
      var exp_regs = 
          "X0:\tnull\n"
          "X1:\tnull\n"
          "X2:\tnull\n"
          "X3:\tnull\n"
          "X4:\tnull\n"
          "X5:\t<REF,0>";
      expect(m0.showRegisters(), equals(exp_regs));
    });
  });
  
}
