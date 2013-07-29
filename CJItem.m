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

#import "CJItem.h"
#import "CJLink.h"

@implementation CJItem

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
