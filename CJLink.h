#import <Foundation/Foundation.h>

@interface CJLink : NSObject

@property (strong, nonatomic) NSURL *href;
@property (strong, nonatomic) NSString *prompt;
@property (strong, nonatomic) NSString *rel;

+ (CJLink *)linkForDictionary:(NSDictionary *) dict;
+ (NSArray *)linksForDictionary:(NSDictionary *) dict;

@end
