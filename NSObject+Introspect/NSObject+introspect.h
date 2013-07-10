//
//  NSObject+introspect.h
//  CJFoundation
//
//  Created by confidence on 13/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DHCIntrospect)

-(NSDictionary *)propertiesDict __attribute((deprecated("use dhcPropertiesDict")));
-(NSDictionary *)dhc_propertiesDict;

-(NSDictionary *)iVarsDict __attribute((deprecated("use dhcIVarsDict")));
-(NSDictionary *)dhc_iVarsDict;

-(NSDictionary *)methodsDict __attribute((deprecated("use dhcMethodsDict")));
-(NSDictionary *)dhc_methodsDict;

-(NSDictionary *)objectIntrospectDictionary __attribute((deprecated("use dhcObjectIntrospectDictionary")));
-(NSDictionary *)dhc_objectIntrospectDictionary;

@end