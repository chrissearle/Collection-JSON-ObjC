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

#import <Foundation/Foundation.h>

@interface CJCollection : NSObject

@property (strong, nonatomic) NSArray* links;
@property (strong, nonatomic) NSArray* items;
@property (strong, nonatomic) NSArray *queries;
@property (strong, nonatomic) NSURL* href;
@property (strong, nonatomic) NSString* version;

+ (CJCollection *)collectionForNSData:(NSData *)data error:(NSError **)error;

@end
