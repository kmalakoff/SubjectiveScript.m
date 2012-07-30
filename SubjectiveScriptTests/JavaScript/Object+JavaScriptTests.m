//
//  Object+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "Object+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation Object_JavaScriptTests

- (void)test_hasOwnProperty
{
  ok(OKV({@"int", N.I(1)}, {@"float", N.F(2.0)}).hasOwnProperty(@"int"), @"has an int");
}

- (void)test_delete
{
  ok(!OKV({@"int", N.I(1)}, {@"float", N.F(2.0)}).delete_(@"int").hasOwnProperty(@"int"), @"doesn't have an int");
}

- (void)test_in
{
  ok(@"int".in(OKV({@"int", N.I(1)}, {@"float", N.F(2.0)})), @"has an int")
}

@end
