//
//  NSObject+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "NSObject+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation NSObject_JavaScriptTests

- (void)test_instanceof
{
  ok(N.I(1).instanceof(N.class), @"instanceof number");
  ok(N.B(true).instanceof(N.class), @"instanceof boolean");
  ok(@"string".instanceof(NSS.class), @"instanceof constant string");
//  ok(!@"string".instanceof(S.class), @"instanceof constant string"); // TODO: figure out why
  ok((NSS.new).instanceof(NSS.class), @"instanceof NSString is string");
  ok((S.new).instanceof(S.class), @"instanceof NSMutableString is string");
  ok((S.new).instanceof(NSS.class), @"instanceof NSString is string");
  ok((NSA.new).instanceof(NSA.class), @"instanceof NSArray is object");
  ok((A.new).instanceof(A.class), @"instanceof NSMutableArray is object");
  ok((A.new).instanceof(NSA.class), @"instanceof NSArray is object");
  ok((NSD.new).instanceof(NSD.class), @"instanceof NSDictionary is object");
  ok((O.new).instanceof(O.class), @"instanceof NSMutableDictionary is object");
  ok((O.new).instanceof(NSO.class), @"instanceof NSDictionary is object");
  ok((Date.new).instanceof(Date.class), @"instanceof NSDate is object");
}

- (void)test_toString
{
  equal(N.I(1).toString(), @"1", @"number to string");
  equal(N.B(true).toString(), @"true", @"number to string");
  equal(N.B(false).toString(), @"false", @"number to string");
  equal(AI(1,2,3).toString(), @"[1,2,3]", @"primitive array to string");
  equal(OKV({@"key1", @"value1"}).toString(), @"[object Object]", @"object to string");
  equal(AO(AI(1,2,3),N.F(4.5),OKV({@"five", @"5"})).toString(), @"[[1,2,3],4.5,[object Object]]", @"array to string");
  equal(Date.newYMD_JS(2012, 7, 31).toString(), @"2012-08-30T15:00:00.000Z", @"Date to string");
}

@end
