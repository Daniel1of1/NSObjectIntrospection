NSObjectIntrospection
=====================

A category on NSObject to allow for runtime introspection.
It allows you to generate a dictionary with key value pairs of an objects properties.

##Prerequisites
- These exensions use ARC; Hence ios4.0+

##How to install

- Drag NSObject+introspection folder into your project.  
- `#import "NSObject+introspection.h"` wherever needed.


##Usage

Since NSObject is the root class of almost any Objective-C object, it can be called by almost any class you have.

It exposes 4 methods:
```
-(NSDictionary*)propertiesDict; //returns a dictionary with key-value pairs of the objects declared properties

-(NSDictionary *)iVarsDict; //returns a dictionary with key-value pairs of the objects iVars

-(NSDictionary *)methodsDict; //returns a dictionary with key-value pairs of the objects methods
//currently the  key and value are both the method name string

-(NSDictionary *)objectIntrospectDictionary; //returns a dictionary with the above 3 dictionaries with keys "properties", "iVars" and "methods"

```

###Usage notes
- any property or iVar that is `nil` will be an `[NSNull null]` value for it's corresponding key.

##Example  
SomeObject.h
```
//SomeObject.h
#import <Foundation/Foundation.h>
#import "SomeOtherObject.h" // not described in readme

@interface SomeObject : NSObject {
  NSString *anIvarString;
}

@property (nonatomic, strong) NSString *someString;
@property (nonatomic, strong) SomeOtherObject *someOtherObject;
```

SomeObject.m
```
//SomeObject.m
#import "SomeObject.h"

@implementation SomeObject

@synthesize someString;
@synthesize someOtherObject;

-(id)init{
  self=[super init];
  
  if(self){
    anIvarString=@"some string value";
    self.someString=@"a string which is a property of our object"
    self.someOtherObject=[[SomeOtherObject alloc] init];
    }
    
  return self;
}
```

anywhere in your code
```
#import "NSObject+Introspection.h"
#import "SomeObject.h"
...
SomeObject *someObject=[[SomeObject alloc] init];

NSDictionary *propsDict=[someObject propertiesDict];

NSLog (@"%@",propsDict.description);
```

log output
```
{
    someOtherObject =  "<someOtherObject: 0x765fe50>"; //the dictionary contains the actual object instance
    someString = "a string which is a property of our object";
}
```


###todo  
- talk about removal of .cxx_desctruct method from methods dict, its a method on every nsobject called after dealloc
- add some more interesting extensions :)
