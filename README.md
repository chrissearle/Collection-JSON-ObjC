## Collection-JSON-ObjC

Collection+JSON parser for Objective-C

This set of classes exists to parse the JSON response to a Collection+JSON call into simple objects.

Currently supported:

* collection
* item
* link
* query

### Requirements

* ARC
* XCode 4.4 or later (auto-generation of @synthesize)

### Usage

Create a callback - grabbing a URL:

```objc
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSData* data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self fetchedData:data];
        });
    });
```

In the handler:

```objc
    - (void)fetchedData:(NSData *)responseData {
        CJCollection *collection = [CJCollection collectionForNSData:responseData];
    
        // Now have collection.items and collection.links available etc
        ...
    }
```

### Installation

Simplest is probably git-submodule this project into your app.
