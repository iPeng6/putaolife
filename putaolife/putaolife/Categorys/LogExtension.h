#import <Foundation/Foundation.h>

@interface NSArray (Log)

@end

@interface NSDictionary (Log)

@end

@implementation NSArray (Log)

- (NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString* strM = [NSMutableString stringWithString:@"(\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL* stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@")"];
    
    return strM;
}

@end

@implementation NSDictionary (Log)

- (NSString*)descriptionWithLocale:(id)locale
{
    NSMutableString* strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop) {
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    return strM;
}

@end