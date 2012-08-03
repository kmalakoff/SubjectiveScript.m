//
//  Object+SSTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "Object+SSTests.h"
#import "SubjectiveScript.h"
#import "QUnit.h"

@interface Test : O
  @property (assign) I valueI;
  @property (assign) UI valueUI;
  @property (assign) F valueF;
  @property (assign) D valueD;
  @property (assign) B valueB;
  @property (assign) bool valueBool;
  @property (strong) NSS* valueNSS;
  @property (strong) S* valueS;
  @property (strong) NSA* valueNSA;
  @property (strong) A* valueA;
  @property (strong) NSD* valueNSD;
  @property (strong) O* valueO;
  @property (strong) Date* valueDate;
  @property (strong, readonly) Date* valueDateRO;
@end
@implementation Test
  @dynamic valueI, valueUI, valueF, valueD, valueB, valueBool;
  @dynamic valueNSS, valueS, valueNSA, valueA, valueNSD, valueO, valueDate, valueDateRO;
  IMPLEMENT_NAMED_PROPERTIES
@end

@interface Test2 : NSD
  @property (assign) I valueI;
  @property (assign) UI valueUI;
  @property (assign) F valueF;
  @property (assign) D valueD;
  @property (assign) B valueB;
  @property (assign) bool valueBool;
  @property (strong) NSS* valueNSS;
  @property (strong) S* valueS;
  @property (strong) NSA* valueNSA;
  @property (strong) A* valueA;
  @property (strong) NSD* valueNSD;
  @property (strong) O* valueO;
  @property (strong) Date* valueDate;
@end
@implementation Test2
  @dynamic valueI, valueUI, valueF, valueD, valueB, valueBool;
  @dynamic valueNSS, valueS, valueNSA, valueA, valueNSD, valueO, valueDate;
  IMPLEMENT_NAMED_PROPERTIES
@end


@implementation Object_SSTests

- (void)test_namedProperties
{
  Test* test = Test.new;
  
  equal(test.valueI, 0, @"valueI: no value set");
  test.valueI = -1;
  equal(test.valueI, -1, @"valueI: value was set");

  equal(test.valueUI, 0, @"valueUI: no value set");
  test.valueUI = 1;
  equal(test.valueUI, 1, @"valueUI: value was set");

  equal(test.valueF, 0, @"valueF: no value set");
  test.valueF = 1.2f;
  equal(test.valueF, 1.2f, @"valueF: value was set");

  equal(test.valueD, 0, @"valueD: no value set");
  test.valueD = 3.14159;
  equal(test.valueD, 3.14159, @"valueD: value was set");

  equal(test.valueB, NO, @"valueB: no value set");
  test.valueB = YES;
  equal(test.valueB, YES, @"valueB: value was set");
  
  equal(test.valueBool, false, @"valueBool: no value set");
  test.valueBool = true;
  equal(test.valueBool, true, @"valueBool: value was set");

  equal(test.valueNSS, nil, @"valueNSS: no value set");
  test.valueNSS = @"bob";
  equal(test.valueNSS, @"bob", @"valueNSS: value was set");

  equal(test.valueS, nil, @"valueS: no value set");
  test.valueS = S.newS(@"bob");
  equal(test.valueS, @"bob", @"valueS: value was set");

  equal(test.valueNSA, nil, @"valueNSA: no value set");
  test.valueNSA = AI(1,2,3).copy;
  equal(test.valueNSA, AI(1,2,3), @"valueNSA: value was set");

  equal(test.valueA, nil, @"valueA: no value set");
  test.valueA = AI(1,2,3);
  equal(test.valueA, AI(1,2,3), @"valueA: value was set");

  equal(test.valueNSD, nil, @"valueNSD: no value set");
  test.valueNSD = OKV({@"one", N.I(1)}).copy;
  equal(test.valueNSD, OKV({@"one", N.I(1)}), @"valueNSD: value was set");

  equal(test.valueO, nil, @"valueO: no value set");
  test.valueO = OKV({@"one", N.I(1)});
  equal(test.valueO, OKV({@"one", N.I(1)}), @"valueO: value was set");

  equal(test.valueDate, nil, @"valueDate: no value set");
  test.valueDate = Date.new;
  ok(test.valueDate.instanceof(Date.class), @"valueDate: value was set");

  // VERIFY: can the read-only mismatch be triggered?
//  raises(^{ test.set(@"valueDateRO", Date.new); }, @"TypeError", @"throws an error for trying to set a read-only property");
}

- (void)test_namedPropertiesByDictionaryInitializer
{
  Test* test = OTKV(Test,
    {@"valueI", N.I(-1)},
    {@"valueUI", N.I(1)},
    {@"valueF", N.F(1.2f)},
    {@"valueD", N.D(3.14159)},
    {@"valueB", N.B(YES)},
    {@"valueBool", N.B(true)},
    {@"valueNSS", @"bob"},
    {@"valueS", S.newS(@"bob")},
    {@"valueNSA", AI(1,2,3)},
    {@"valueA", AI(1,2,3)},
    {@"valueNSD", OKV({@"one", N.I(1)})},
    {@"valueO", OKV({@"one", N.I(1)})},
    {@"valueDate", Date.new}
  );
  
  equal(test.valueI, -1, @"valueI: value was set");
  equal(test.valueUI, 1, @"valueUI: value was set");
  equal(test.valueF, 1.2f, @"valueF: value was set");
  equal(test.valueD, 3.14159, @"valueD: value was set");
  equal(test.valueB, YES, @"valueB: value was set");
  equal(test.valueBool, true, @"valueBool: value was set");
  equal(test.valueNSS, @"bob", @"valueNSS: value was set");
  equal(test.valueS, @"bob", @"valueS: value was set");
  equal(test.valueNSA, AI(1,2,3), @"valueNSA: value was set");
  equal(test.valueA, AI(1,2,3), @"valueA: value was set");
  equal(test.valueNSD, OKV({@"one", N.I(1)}), @"valueNSD: value was set");
  equal(test.valueO, OKV({@"one", N.I(1)}), @"valueO: value was set");
  ok(test.valueDate.instanceof(Date.class), @"valueDate: value was set");
}

- (void)test_namedPropertiesByDictionarySetter
{
  Test* test = Test.new;
  test.setO(OKV(
    {@"valueI", N.I(-1)},
    {@"valueUI", N.I(1)},
    {@"valueF", N.F(1.2f)},
    {@"valueD", N.D(3.14159)},
    {@"valueB", N.B(YES)},
    {@"valueBool", N.B(true)},
    {@"valueNSS", @"bob"},
    {@"valueS", S.newS(@"bob")},
    {@"valueNSA", AI(1,2,3)},
    {@"valueA", AI(1,2,3)},
    {@"valueNSD", OKV({@"one", N.I(1)})},
    {@"valueO", OKV({@"one", N.I(1)})},
    {@"valueDate", Date.new}
  ));
  
  equal(test.valueI, -1, @"valueI: value was set");
  equal(test.valueUI, 1, @"valueUI: value was set");
  equal(test.valueF, 1.2f, @"valueF: value was set");
  equal(test.valueD, 3.14159, @"valueD: value was set");
  equal(test.valueB, YES, @"valueB: value was set");
  equal(test.valueBool, true, @"valueBool: value was set");
  equal(test.valueNSS, @"bob", @"valueNSS: value was set");
  equal(test.valueS, @"bob", @"valueS: value was set");
  equal(test.valueNSA, AI(1,2,3), @"valueNSA: value was set");
  equal(test.valueA, AI(1,2,3), @"valueA: value was set");
  equal(test.valueNSD, OKV({@"one", N.I(1)}), @"valueNSD: value was set");
  equal(test.valueO, OKV({@"one", N.I(1)}), @"valueO: value was set");
  ok(test.valueDate.instanceof(Date.class), @"valueDate: value was set");
}

- (void)test_namedPropertiesByDictionaryInitializer_OnNSDictionary
{
  Test2 *test = OTKV(Test2,
    {@"valueI", N.I(-1)},
    {@"valueUI", N.I(1)},
    {@"valueF", N.F(1.2f)},
    {@"valueD", N.D(3.14159)},
    {@"valueB", N.B(YES)},
    {@"valueBool", N.B(true)},
    {@"valueNSS", @"bob"},
    {@"valueS", S.newS(@"bob")},
    {@"valueNSA", AI(1,2,3)},
    {@"valueA", AI(1,2,3)},
    {@"valueNSD", OKV({@"one", N.I(1)})},
    {@"valueO", OKV({@"one", N.I(1)})},
    {@"valueDate", Date.new}
  );

  // INVESTIGATE: this triggers but it pauses the tests because it is not caught properly
//  raises(^{ test.valueI = -2; }, @"TypeError", @"throws an error for trying to set a property on an NSDictionary");

  equal(test.valueI, -1, @"valueI: value was set");
  equal(test.valueUI, 1, @"valueUI: value was set");
  equal(test.valueF, 1.2f, @"valueF: value was set");
  equal(test.valueD, 3.14159, @"valueD: value was set");
  equal(test.valueB, YES, @"valueB: value was set");
  equal(test.valueBool, true, @"valueBool: value was set");
  equal(test.valueNSS, @"bob", @"valueNSS: value was set");
  equal(test.valueS, @"bob", @"valueS: value was set");
  equal(test.valueNSA, AI(1,2,3), @"valueNSA: value was set");
  equal(test.valueA, AI(1,2,3), @"valueA: value was set");
  equal(test.valueNSD, OKV({@"one", N.I(1)}), @"valueNSD: value was set");
  equal(test.valueO, OKV({@"one", N.I(1)}), @"valueO: value was set");
  ok(test.valueDate.instanceof(Date.class), @"valueDate: value was set");
}

@end
