//
//  Array+JavaScriptTests.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/30/12.
//  Copyright (c) 2012 Kevin Malakoff. All rights reserved.
//

#import "Array+JavaScriptTests.h"
#import "QUnit.h"
#import "SubjectiveScript.h"

@implementation Array_JavaScriptTests

- (void)test_length
{
  equalI(AI(1,2,3).length, 3, @"length works");
}

- (void)test_hasOwnProperty
{
  ok(AI(1,2,3).hasOwnProperty(@"2"), @"hasOwnProperty by index string");
  equal(AI(1,2,3).get(@"2"), N.I(3), @"accessing by index string");
}

- (void)test_concat
{
  equal(AI(1,2,3).concat(AI(1,2,4)).join(@","), @"1,2,3,1,2,4", @"concat (and join) works");
}

- (void)test_slice
{
  equal(AO(@"Banana", @"Orange", @"Lemon", @"Apple", @"Mango").slice(-3,-1).join(@","), @"Lemon,Apple", @"slice works");
}

- (void)test_reverse
{
  equal(AI(1,2,3).reverse().join(@","), @"3,2,1", @"reverse works");
}

- (void)test_flatten
{
  equal(AO(N.I(1),AI(2,3)).flatten(true).join(@","), @"1,2,3", @"flatten works");
}

- (void)test_pop
{
  A* array = AI(1,2,3);
  equal(array.pop(), N.I(3), @"pop works");
  equal(array.join(@","), @"1,2", @"pop works");
}

- (void)test_push
{
  equal(AI(1,2,3).push(N.I(4)).push(@"out the door").join(@","), @"1,2,3,4,out the door", @"push with chaining works");
}

- (void)test_sort
{
  equal(AI(3,2,1,2).sort(nil).join(@","), @"1,2,2,3", @"sort works");
}

- (void)test_splice
{
  A* fruit = AO(@"Banana", @"Orange", @"Apple", @"Lemon");
  equal(fruit.splice(2,1, @"Kiwi", @"Mango", nil).join(@","), @"Apple", @"splice return works");
  equal(fruit.join(@","), @"Banana,Orange,Kiwi,Mango,Lemon", @"splice works");
}

- (void)test_unshift
{
  equal(AI(3,4,5).unshift(N.I(1),N.I(2),nil).join(@","), @"1,2,3,4,5", @"unshift works");
}

- (void)test_shift
{
  A* array = AI(1,2,3,4,5);
  equal(array.shift(), N.I(1), @"shift works");
  equal(array.join(@","), @"2,3,4,5", @"shift works");
}

@end
