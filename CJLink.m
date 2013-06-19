#import "CJLink.h"

@implementation CJLink

@synthesize href;
@synthesize prompt;
@synthesize rel;
@synthesize otherFields;

+ (CJLink *)linkForDictionary:(NSDictionary *) dict {
    CJLink *link = [[CJLink alloc] init];
    
    link.href = [NSURL URLWithString:[dict objectForKey:@"href"]];
    link.prompt = [dict objectForKey:@"prompt"];
    link.rel = [dict objectForKey:@"rel"];
    
    NSMutableDictionary *fields = [[NSMutableDictionary alloc] initWithDictionary:dict];
    
    [fields removeObjectsForKeys:@[@"href", @"prompt", @"rel"]];

    link.otherFields = [NSDictionary dictionaryWithDictionary:fields];
    
    return link;
}

+ (NSArray *)linksForDictionary:(NSDictionary *) dict {
    NSMutableArray *links = [[NSMutableArray alloc] init];

    [[dict objectForKey:@"links"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [links addObject:[CJLink linkForDictionary:((NSDictionary *) obj)]];
    }];

    return [NSArray arrayWithArray:links];
}

@end
