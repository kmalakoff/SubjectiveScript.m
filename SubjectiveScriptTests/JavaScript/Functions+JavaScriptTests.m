//
//  Functions+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "Functions+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation Functions_JavaScriptTests

- (void)test_call
{
  O* obj = OKV({@"mirror", ^(NSS* string){return string.add(@" mirror"); }});
  equal(@"mirror".call(obj, @"hello", nil), @"hello mirror", @"call a function");
}

- (void)test_apply
{
  O* obj = OKV({@"mirror", ^(NSS* string){return string.add(@" mirror"); }});
  equal(@"mirror".apply(obj, AO(@"hello")), @"hello mirror", @"apply a function");
}

@end
