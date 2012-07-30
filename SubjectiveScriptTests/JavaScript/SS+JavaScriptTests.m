//
//  SS+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "SS+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation SS_JavaScriptTests

- (void)test_JSON_stringify
{
  equal(SS.stringify(AO(N.I(1), N.F(2.0), N.F(3.1), @"hello", nil, O.new)), @"[1,2,3.1,\"hello\",null,{}]", @"SS.stringify is like JSON.stringify");

  equal(SS.stringify(Date.newYMD_JS(2012, 7, 31)), @"2012-08-30T15:00:00.000Z", @"Date stringified");

  equal(SS.stringify(AI(1,2,3)), @"[1,2,3]", @"primitive array stringify");
  equal(SS.stringify(OKV({@"key1", @"value1"})), @"{\"key1\":\"value1\"}", @"object stringify");
  equal(SS.stringify(AO(AI(1,2,3),N.F(4.5),OKV({@"five", @"5"}))), @"[[1,2,3],4.5,{\"five\":\"5\"}]", @"array stringify");
}

- (void)test_parseInt
{
  equal(SS.parseInt(@"123"), N.I(123), @"SS.parseInt works");
  equal(SS.parseInt(@"1.23"), nil, @"SS.parseInt works");
}

- (void)test_typeof
{
  equal(SS.typeof_(N.I(1)), @"number", @"typeof number");
  equal(SS.typeof_(N.B(true)), @"boolean", @"typeof boolean");
  equal(SS.typeof_(@"string"), @"string", @"typeof constant string");
  equal(SS.typeof_(NSS.new), @"string", @"typeof NSString is string");
  equal(SS.typeof_(S.new), @"string", @"typeof NSMutableString is string");
  equal(SS.typeof_(NSA.new), @"object", @"typeof NSArray is object");
  equal(SS.typeof_(A.new), @"object", @"typeof NSMutableArray is object");
  equal(SS.typeof_(NSD.new), @"object", @"typeof NSDictionary is object");
  equal(SS.typeof_(O.new), @"object", @"typeof NSMutableDictionary is object");
  equal(SS.typeof_(Date.new), @"object", @"typeof NSDate is object");
}

- (void)test_timeout
{
  asyncTest(^{
    __block BOOL called1 = false;
    SSTimeout* timeout1 = SS.setTimeout(^{ called1 = true; }, NSEC_PER_SEC*1);
    SS.clearTimeout(timeout1);

    __block BOOL called2 = false;
    SS.setTimeout(^{ called2 = true; start(); }, NSEC_PER_SEC*2);
  });
}

@end
