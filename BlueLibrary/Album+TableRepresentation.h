//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by Abhishek Khedekar on 22/09/17.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

- (NSDictionary*)tr_tableRepresentation;

@end
