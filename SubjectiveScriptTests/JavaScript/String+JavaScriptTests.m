//
//  String+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "String+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation String_JavaScriptTests

- (void)test_split
{
  equal(@"hello world!".split(@" "), AO(@"hello", @"world!"), @"split works");
  equal(@"hello world!".split(@""), AO(@"h", @"e", @"l", @"l", @"o", @" ", @"w", @"o", @"r", @"l", @"d", @"!"), @"empty split works");
  equal(@"hello world!".split(nil), AO(@"h", @"e", @"l", @"l", @"o", @" ", @"w", @"o", @"r", @"l", @"d", @"!"), @"empty split works");
}

- (void)test_add
{
  equal(@"hello".add(@" world!"), @"hello world!", @"add a string without changing the original string");
}

- (void)test_append
{
  S* message = S.newS(@"hello");
  message.append(@" world!");
  equal(message, @"hello world!", @"append a string to the original string");
}

@end
