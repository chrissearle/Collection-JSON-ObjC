## Collection-JSON-ObjC

Collection+JSON wrapper for Objective-C

Very simple wrapper right now - only supporting read and only supporting items and links.

Requires iOS5.

Create a callback - grabbing a URL:

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:url];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    
In the handler:

    - (void)fetchedData:(NSData *)responseData {
        CJCollection *collection = [CJCollection collectionForNSData:responseData];
    
        // Now have collection.items and collection.links available etc
        ...
    }


### Usage

Simplest is probably git-submodule this project into your app.