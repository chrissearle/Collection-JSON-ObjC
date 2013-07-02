#import "CJQuery.h"

@implementation CJQuery

+ (CJQuery *)queryForDictionary:(NSDictionary *) dict {
    CJQuery *query = [[CJQuery alloc] init];
    
    query.href = [NSURL URLWithString:[dict objectForKey:@"href"]];
    query.prompt = [dict objectForKey:@"prompt"];
    query.rel = [dict objectForKey:@"rel"];
    
    NSMutableDictionary *fields = [[NSMutableDictionary alloc] initWithDictionary:dict];
    
    [fields removeObjectsForKeys:@[@"href", @"prompt", @"rel"]];
    
    query.otherFields = [NSDictionary dictionaryWithDictionary:fields];
    
    return query;
}

+ (NSArray *)queriesForDictionary:(NSDictionary *) dict {
    NSMutableArray *queries = [[NSMutableArray alloc] init];
    
    [[dict objectForKey:@"queries"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [queries addObject:[CJQuery queryForDictionary:((NSDictionary *) obj)]];
    }];
    
    return [NSArray arrayWithArray:queries];
}

@end
