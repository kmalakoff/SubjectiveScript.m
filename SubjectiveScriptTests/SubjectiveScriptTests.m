//
//  SubjectiveScriptTests.m
//  SubjectiveScriptTests
//
//  Created by Kevin Malakoff on 7/17/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "SubjectiveScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation SubjectiveScriptTests

- (void)testArray
{
  A* people = AO(OKV({@"name", @"curly"}, {@"age", N.I(50)}), OKV({@"name", @"moe"}, {@"age", N.I(30)}));
  equal(people.count, 2, @"right number of people");
}

@end
