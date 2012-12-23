//
//  DemoObject.h
//  NSObjectIntrospectionDemo
//
//  Created by confidence on 22/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoLeafObject.h"

@interface DemoObject : NSObject {
    NSString *anIvarString;
}

@property (nonatomic, strong) NSString *aString;
@property (nonatomic, strong) NSNumber *aNumber;
@property (nonatomic) CGFloat aFloat;
@property (nonatomic, strong) DemoLeafObject *aLeafObject;
@property (nonatomic, strong) NSArray *arrayOfLeaves;
@property (nonatomic, retain) NSDictionary *dictOfLeaves;

-(void)aDeclaredMethod;

@end
