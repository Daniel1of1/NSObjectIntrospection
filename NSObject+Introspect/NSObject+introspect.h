//
//  NSObject+introspect.h
//  CJFoundation
//
//  Created by confidence on 13/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DHCIntrospect)

-(NSDictionary *)propertiesDict __attribute((deprecated("use dhc_propertiesDict")));
-(NSDictionary *)dhc_propertiesDict;

-(NSDictionary *)iVarsDict __attribute((deprecated("use dhc_iVarsDict")));
-(NSDictionary *)dhc_iVarsDict;

-(NSDictionary *)methodsDict __attribute((deprecated("use dhc_methodsDict")));
-(NSDictionary *)dhc_methodsDict;

-(NSDictionary *)objectIntrospectDictionary __attribute((deprecated("use dhc_objectIntrospectDictionary")));
-(NSDictionary *)dhc_objectIntrospectDictionary;

@end