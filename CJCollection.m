#import "CJCollection.h"
#import "CJLink.h"
#import "CJItem.h"
#import "CJQuery.h"

@implementation CJCollection

+ (CJCollection *) collectionForNSData:(NSData *)data error:(NSError **)error {
    if (data == nil) {
        if (error != NULL) {
            NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
            [errorDetail setValue:@"Can't convert nil data to collection" forKey:NSLocalizedDescriptionKey];
            *error = [NSError errorWithDomain:@"CollectionJSON" code:100 userInfo:errorDetail];
        }
        return nil;
    }
    
    NSError* internalError = nil;

    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:data
                          options:kNilOptions
                          error:&internalError];

    if (!json) {
        if (error != NULL) {
            NSMutableDictionary *errorDetail = [NSMutableDictionary dictionary];
            [errorDetail setValue:@"Error converting to JSON" forKey:NSLocalizedDescriptionKey];
            *error = [NSError errorWithDomain:@"CollectionJSON" code:200 userInfo:[internalError userInfo]];
        }
        return nil;
    }
    
    CJCollection *collection = [[CJCollection alloc] init];
    
    NSDictionary *dict = [json objectForKey:@"collection"];
    
    collection.version = [dict objectForKey:@"version"];
    collection.href = [NSURL URLWithString:[dict objectForKey:@"href"]];
    collection.links = [CJLink linksForDictionary:dict];
    collection.items = [CJItem itemsForDictionary:dict];
    collection.queries = [CJQuery queriesForDictionary:dict];
    
    return collection;
}

@end
