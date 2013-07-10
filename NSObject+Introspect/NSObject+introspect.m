//
//  NSObject+introspect.m
//  CJFoundation
//
//  Created by confidence on 13/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import "NSObject+introspect.h"
#import <objc/runtime.h>

@implementation NSObject (DHCIntrospect)

-(NSDictionary*)propertiesDict {
   return [self dhc_propertiesDict];
}

-(NSDictionary*) dhc_propertiesDict {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSUInteger outCount;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for(NSInteger i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propName = property_getName(property);
        NSString *propertyNameString = [NSString stringWithUTF8String:propName];
        NSValue *propertyValue = [self valueForKey:propertyNameString];
        if (propertyValue){
            [dict setValue:propertyValue forKey:propertyNameString];
        }
        else {
            [dict setObject:[NSNull null] forKey:propertyNameString];
        }
    }
    
    free(properties);
    
    return dict;
}

-(NSDictionary *)iVarsDict{
    return [self dhc_iVarsDict];
}

-(NSDictionary *)dhc_iVarsDict{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSUInteger outCount;

    Ivar* ivars = class_copyIvarList([self class], &outCount);
    for (NSInteger i = 0; i < outCount ; i++){
        Ivar ivar=ivars[i];
        const char* ivarName = ivar_getName(ivar);
        NSString *ivarNameString = [NSString stringWithUTF8String:ivarName];
        NSValue *value = [self valueForKey:ivarNameString];
        
        if (value) {
            [dict setValue:value forKey:ivarNameString];
        }
        
        else {
            [dict setValue:[NSNull null] forKey:ivarNameString];
        }
    }

    free(ivars);
    
    return dict;
}

-(NSDictionary *)methodsDict{
    return [self dhc_methodsDict];
}

-(NSDictionary *)dhc_methodsDict{    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSUInteger outCount;
    
    Method* methods = class_copyMethodList([self class], &outCount);
    
    for (NSInteger i=0; i<outCount; i++) {
        Method method = methods[i];
        SEL selector = method_getName(method);
        NSString *methodNameString = NSStringFromSelector(selector);
        
        if ([methodNameString isEqualToString:@".cxx_destruct"]) {
            continue; //all NSObjects have this method, clutters the dictionary
        }
        
        if (selector) {
            [dict setValue:methodNameString forKey:methodNameString]; //set string as value instead of selector, to retrieve use NSSelectorFromString()
        }
    }
    
    free(methods);

    return dict;
}

-(NSDictionary *)objectIntrospectDictionary{
    return [self dhc_objectIntrospectDictionary];
}

-(NSDictionary *)dhc_objectIntrospectDictionary{

    NSDictionary *dict=@{@"properties" : [self dhc_propertiesDict],
                         @"iVars" : [self dhc_iVarsDict],
                         @"methods" : [self dhc_methodsDict]
                         };
            
    return dict;
}


@end
