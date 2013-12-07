//
//  SS+JavaScriptTests.m
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

#import "SS+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation SS_JavaScriptTests

- (void)test_JSON_stringify
{
  equal(SS.stringify(AO(N.I(1), N.F(2.0), N.F(3.1), @"hello", nil, O.new)), @"[1,2,3.1,\"hello\",null,{}]", @"SS.stringify is like JSON.stringify");

  // TODO: handle multiple timezones
  equal(SS.stringify(Date.newYMD_JS(2012, 7, 31)), @"2012-08-31T07:00:00.000Z", @"Date stringified");

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
