#import "CJCollection.h"
#import "CJLink.h"
#import "CJItem.h"

@implementation CJCollection

@synthesize links;
@synthesize items;
@synthesize version;
@synthesize href;

+ (CJCollection *) collectionForNSData:(NSData *)data {
    NSError* error;
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&error];

    NSLog(@"JSON: %@", json);
    
    CJCollection *collection = [[CJCollection alloc] init];
    
    NSDictionary *dict = [json objectForKey:@"collection"];
    
    collection.version = [dict objectForKey:@"version"];
    collection.href = [NSURL URLWithString:[dict objectForKey:@"href"]];
    collection.links = [CJLink linksForDictionary:dict];
    collection.items = [CJItem itemsForDictionary:dict];
    
    return collection;
}

@end
