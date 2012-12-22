//
//  NSObject+IntrospectTests.h
//  NSObjectIntrospectionDemo
//
//  Created by confidence on 22/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DemoObject.h"
#import "DemoLeafObject.h"
#import "NSObject+introspect.h"

@interface NSObject_IntrospectTests : SenTestCase

@property(nonatomic, strong) DemoObject *demoObj;
@property(nonatomic, strong) DemoLeafObject *demoLeafObj;

@end
