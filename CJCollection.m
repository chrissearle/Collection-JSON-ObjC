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
