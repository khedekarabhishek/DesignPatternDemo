//
//  Album+TableRepresentation.m
//  BlueLibrary
//
//  Created by Abhishek Khedekar on 22/09/17.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)


-(NSDictionary *)tr_tableRepresentation{
    
    return @{@"titles":@[@"Artist", @"Album", @"Genre", @"Year"],
             @"values":@[self.artist,self.title,self.genre,self.year]
             };
}
@end
