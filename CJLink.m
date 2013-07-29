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

#import "CJLink.h"

@implementation CJLink

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
