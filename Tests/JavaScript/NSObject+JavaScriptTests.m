//
//  NSObject+JavaScriptTests.m
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
  equal(Date.newYMD_JS(2012, 7, 31).toString(), @"2012-08-31T00:00:00.000Z", @"Date to string");
}

@end
