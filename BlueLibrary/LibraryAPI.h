//
//  LibraryAPI.h
//  BlueLibrary
//
//  Created by Abhishek Khedekar on 22/09/17.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI : NSObject

+(LibraryAPI *)sharedInstance;

- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;


@end
