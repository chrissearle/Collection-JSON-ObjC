#import <Foundation/Foundation.h>

@interface CJLink : NSObject

@property (strong, nonatomic) NSURL *href;
@property (strong, nonatomic) NSString *prompt;
@property (strong, nonatomic) NSString *rel;
@property (strong, nonatomic) NSDictionary *otherFields;

+ (CJLink *)linkForDictionary:(NSDictionary *) dict;
+ (NSArray *)linksForDictionary:(NSDictionary *) dict;

@end
