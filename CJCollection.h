#import <Foundation/Foundation.h>

@interface CJCollection : NSObject

@property (strong, nonatomic) NSArray* links;
@property (strong, nonatomic) NSArray* items;
@property (strong, nonatomic) NSURL* href;
@property (strong, nonatomic) NSString* version;

+ (CJCollection *)collectionForNSData:(NSData *)data error:(NSError **)error;

@end
