#import <Foundation/Foundation.h>

@interface CJItem : NSObject

@property (strong, nonatomic) NSURL *href;
@property (strong, nonatomic) NSArray* links;
@property (strong, nonatomic) NSArray* data;

+ (CJItem *)itemForDictionary:(NSDictionary *) dict;
+ (NSArray *)itemsForDictionary:(NSDictionary *) dict;

@end
