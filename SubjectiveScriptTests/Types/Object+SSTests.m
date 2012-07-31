//
//  Object+SSTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
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
@end
@implementation Test : O
  @dynamic valueI, valueUI, valueF, valueD, valueB, valueBool;
  @dynamic valueNSS, valueS, valueNSA, valueA, valueNSD, valueO, valueDate;
@end

@implementation Object_SSTests

- (void)test_namedProperties
{
  Test* test = Test.new;
  
  equal(test.valueI, 0, @"valueI: no value set");
  test.valueI = 1;
  equal(test.valueI, 1, @"valueI: value was set");

  equal(test.valueUI, 0, @"valueUI: no value set");
  test.valueUI = 1;
  equal(test.valueUI, 1, @"valueUI: value was set");

  equal(test.valueF, 0, @"valueF: no value set");
  test.valueF = 1;
  equal(test.valueF, 1, @"valueF: value was set");

  equal(test.valueD, 0, @"valueD: no value set");
  test.valueD = 1;
  equal(test.valueD, 1, @"valueD: value was set");

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
}

@end
