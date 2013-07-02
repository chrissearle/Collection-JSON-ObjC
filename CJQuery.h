#import <Foundation/Foundation.h>

@interface CJQuery : NSObject

@property (strong, nonatomic) NSURL *href;
@property (strong, nonatomic) NSString *prompt;
@property (strong, nonatomic) NSString *rel;
@property (strong, nonatomic) NSDictionary *otherFields;

+ (CJQuery *)queryForDictionary:(NSDictionary *) dict;
+ (NSArray *)queriesForDictionary:(NSDictionary *) dict;

@end

