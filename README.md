## Collection-JSON-ObjC

Collection+JSON wrapper for Objective-C

Very simple wrapper right now - only supporting read and only supporting items and links.

Requires iOS5.

Create a callback - grabbing a URL:

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        NSData* data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self fetchedData:data];
        });
    });

In the handler:

    - (void)fetchedData:(NSData *)responseData {
        CJCollection *collection = [CJCollection collectionForNSData:responseData];
    
        // Now have collection.items and collection.links available etc
        ...
    }


### Usage

Simplest is probably git-submodule this project into your app.