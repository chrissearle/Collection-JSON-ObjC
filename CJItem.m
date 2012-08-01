#import "CJItem.h"
#import "CJLink.h"

@implementation CJItem

@synthesize href;
@synthesize links;
@synthesize data;

+ (CJItem *)itemForDictionary:(NSDictionary *) dict {
    CJItem *item = [[CJItem alloc] init];
    
    item.href = [NSURL URLWithString:[dict objectForKey:@"href"]];
    item.links = [CJLink linksForDictionary:dict];
    item.data = [dict objectForKey:@"data"];
    
    return item;
}

+ (NSArray *)itemsForDictionary:(NSDictionary *) dict {
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [[dict objectForKey:@"items"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [items addObject:[CJItem itemForDictionary:((NSDictionary *) obj)]];
    }];
    
    return [NSArray arrayWithArray:items];
}


@end
