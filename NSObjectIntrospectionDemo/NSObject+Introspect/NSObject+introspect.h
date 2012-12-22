//
//  NSObject+introspect.h
//  CJFoundation
//
//  Created by confidence on 13/12/2012.
//  Copyright (c) 2012 confidence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (introspect)

-(NSDictionary*)propertiesDict;

-(NSDictionary *)iVarsDict;

-(NSDictionary *)methodsDict;

-(NSDictionary *)objectIntrospectDictionary;

@end
