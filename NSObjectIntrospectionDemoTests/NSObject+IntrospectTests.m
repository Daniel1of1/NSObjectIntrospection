//
//  NSObject+IntrospectTests.m
//  NSObjectIntrospectionDemo
//
//  Created by confidence on 22/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import "NSObject+IntrospectTests.h"

@implementation NSObject_IntrospectTests

@synthesize demoObj;
@synthesize demoLeafObj;

- (void)setUp
{
    [super setUp];
    
    self.demoObj=[[DemoObject alloc] init];
    self.demoLeafObj=[[DemoLeafObject alloc] init];
}

- (void)tearDown
{
    self.demoObj=nil;
    self.demoLeafObj=nil;
    
    [super tearDown];
}

-(void)testPropertiesDictReturnsCorrectDictionary{
    
    demoObj.aString=@"some string value";
    demoObj.aFloat=8;
    demoObj.aNumber=[NSNumber numberWithDouble:M_PI];
    demoObj.aLeafObject=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf1=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf2=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf3=[[DemoLeafObject alloc] init];
    demoObj.arrayOfLeaves=[NSArray arrayWithObjects:leaf1, leaf2, leaf3,@"another string value", nil];
    demoObj.dictOfLeaves=[NSDictionary dictionaryWithObjects:demoObj.arrayOfLeaves forKeys:[NSArray arrayWithObjects:@"key1",@"key2",@"key3",@"key4", nil]];
    
    NSDictionary *propsDict=[demoObj propertiesDict];

    NSDictionary *correctDictionary=@{
    @"aString" : [demoObj valueForKey:@"aString"],
    @"aNumber" : [demoObj valueForKey:@"aNumber"],
    @"aFloat" : [demoObj valueForKey:@"aFloat"],
    @"aLeafObject" : [demoObj valueForKey:@"aLeafObject"],
    @"arrayOfLeaves" : [demoObj valueForKey:@"arrayOfLeaves"],
    @"dictOfLeaves" : [demoObj valueForKey:@"dictOfLeaves"]
    };

    STAssertTrue([propsDict isEqualToDictionary:correctDictionary] , @"propertiesDict should return correct dictionary it looks like this %@\n it should be this %@",propsDict.description,correctDictionary.description);

}


-(void)testIVarsDictReturnsCorrectDictionary{
    demoObj.aString=@"some string value";
    demoObj.aFloat=8;
    demoObj.aNumber=[NSNumber numberWithDouble:M_PI];
    demoObj.aLeafObject=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf1=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf2=[[DemoLeafObject alloc] init];
    DemoLeafObject *leaf3=[[DemoLeafObject alloc] init];
    demoObj.arrayOfLeaves=[NSArray arrayWithObjects:leaf1, leaf2, leaf3,@"another string value", nil];
    demoObj.dictOfLeaves=[NSDictionary dictionaryWithObjects:demoObj.arrayOfLeaves forKeys:[NSArray arrayWithObjects:@"key1",@"key2",@"key3",@"key4", nil]];
    
    NSDictionary *iVarsDict=[demoObj iVarsDict];
    
    NSDictionary *correctDictionary=@{
    @"anIvarString" : [demoObj valueForKey:@"anIvarString"],
    @"aString" : [demoObj valueForKey:@"aString"],
    @"aNumber" : [demoObj valueForKey:@"aNumber"],
    @"aFloat" : [demoObj valueForKey:@"aFloat"],
    @"aLeafObject" : [demoObj valueForKey:@"aLeafObject"],
    @"arrayOfLeaves" : [demoObj valueForKey:@"arrayOfLeaves"],
    @"dictOfLeaves" : [demoObj valueForKey:@"dictOfLeaves"]
    };
    
    STAssertTrue([iVarsDict isEqualToDictionary:correctDictionary] , @"iVarsDict should return correct dictionary it looks like this %@\n it should be this %@",iVarsDict.description,correctDictionary.description);

}

-(void)testMethodsDictReturnsCorrectDictionary{
    
    NSDictionary *methodsDict=[demoObj methodsDict];
    
    NSDictionary *correctDictionary=@{
    //@".cxx_destruct" : @".cxx_destruct",
    @"aDeclaredMethod" : @"aDeclaredMethod",
    @"aFloat" : @"aFloat",
    @"aLeafObject" : @"aLeafObject",
    @"aNumber" : @"aNumber",
    @"aString" : @"aString",
    @"anUnDeclaredMethod" : @"anUnDeclaredMethod",
    @"arrayOfLeaves" : @"arrayOfLeaves",
    @"dictOfLeaves" : @"dictOfLeaves",
    @"init" : @"init",
    @"setAFloat:" : @"setAFloat:",
    @"setALeafObject:" : @"setALeafObject:",
    @"setANumber:" : @"setANumber:",
    @"setAString:" : @"setAString:",
    @"setArrayOfLeaves:" : @"setArrayOfLeaves:",
    @"setDictOfLeaves:" : @"setDictOfLeaves:",
    };
    
    STAssertTrue([methodsDict isEqualToDictionary:correctDictionary], @"methodsDict should return correct dictionary it looks like this %@\n it should be this %@",methodsDict.description,correctDictionary.description);
    
}

@end
