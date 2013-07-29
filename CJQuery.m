// Copyright 2013 Chris Searle

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at

//    http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

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
