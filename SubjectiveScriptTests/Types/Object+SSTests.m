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

// TODO: document this
@interface Test : O
  @property (copy) NSS* name;
  @property (copy) Date* createdAt;
@end
@implementation Test : O
  @dynamic name, createdAt;
@end

@implementation Object_SSTests

- (void)test_OBJECT
{
  Test* test = Test.new;
  
  test.name = @"bob";
  test.createdAt = Date.new;
  
  equal(test.name, @"bob", @"bob's my name and don't wear it out");
  ok(test.createdAt.instanceof(Date.class), @"it's a date!");
}

@end
