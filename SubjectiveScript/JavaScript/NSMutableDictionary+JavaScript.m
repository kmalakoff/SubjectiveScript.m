//
//  NSMutableDictionary+JavaScript.m
//  SubjectiveScript.m
//
//  Created by Kevin Malakoff on 7/29/12.
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

#import "NSMutableDictionary+JavaScript.h"
#import "NSString+SS.h"
#import <objc/runtime.h>

static const char* SSNamedPropertiesKey = "SSNP";

@implementation NSMutableDictionary (JavaScript)

- (O*(^)(id key))delete_
{
  return ^(id key) {
    [self removeObjectForKey:key];
    return self;
  };
}

// dynamic property lookup
+ (BOOL)resolveInstanceMethod:(SEL)selector
{
  NSS* name = [NSS stringWithUTF8String:sel_getName(selector)];
  BOOL isSetter = name.startsWith(@"set");
  
  // setter
  if (isSetter)
  {
    unichar firstLetter = [name characterAtIndex:3];
    name = [NSS stringWithFormat:@"%@%@",[[NSS stringWithCharacters:&firstLetter length:1] lowercaseString], [name substringWithRange:NSMakeRange(4, name.length-5)]];
  }

  objc_property_t propertyInfo = class_getProperty(self.class, name.UTF8String);
  if (!propertyInfo) return [super resolveInstanceMethod:selector]; // not a property

  // signature checker for getters and setters
  NSRange colonsRange = [name rangeOfString:@":"];
  if (
    name.startsWith(@"_") || // internal
    (isSetter && name.endsWith(@":") && (colonsRange.location!=name.length-1)) || // not quite a setter
    (!isSetter && (colonsRange.length!=0)) // not a getter
  ) {
    return [super resolveInstanceMethod:selector];
  }

  // find the class that declared the property
  Class owningClass = self.class;
  Class superClass = class_getSuperclass(owningClass);
  while(superClass && class_getProperty(superClass, name.UTF8String)==propertyInfo) {
    owningClass = superClass; superClass = class_getSuperclass(owningClass);
  }

  O* dynamicProperties = objc_getAssociatedObject(self, SSNamedPropertiesKey);
  if (!dynamicProperties) {
    dynamicProperties = O.new;
    objc_setAssociatedObject(self, SSNamedPropertiesKey, dynamicProperties, OBJC_ASSOCIATION_RETAIN);
  }

  // collection information about the property
  IMP implementation;
  if (isSetter)
    implementation = imp_implementationWithBlock((void*)CFBridgingRetain(^(O* obj, id value) {
      [dynamicProperties setValue:value forKey:name];
    }));
  else
    implementation = imp_implementationWithBlock((void*)CFBridgingRetain(^(O* obj) {
      return [dynamicProperties valueForKey:name];
    }));

  class_addMethod(owningClass, selector, implementation, property_getAttributes(propertyInfo));
  return YES;
}

@end
