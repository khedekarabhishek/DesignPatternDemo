//
//  PersistencyManager.m
//  BlueLibrary
//
//  Created by Abhishek Khedekar on 22/09/17.
//  Copyright © 2017 Eli Ganem. All rights reserved.
//

#import "PersistencyManager.h"

@implementation PersistencyManager

-(id)init{
    
    self = [super init];
    if (self) {
        
        NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"]];
        
        albums = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        
        if (albums == nil) {
            
            albums = [NSMutableArray arrayWithArray:
                      @[[[Album alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverUrl:@"https://pbs.twimg.com/profile_images/264246547/realmario.png" year:@"1992"],
                        [[Album alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverUrl:@"https://lumiere-a.akamaihd.net/v1/images/usa_avengers_chi_captainamerica_n_af12951d.png?region=0%2C0%2C300%2C300" year:@"2003"],
                        [[Album alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverUrl:@"http://i.huffpost.com/gen/934126/images/o-THE-AVENGERS-HULK-facebook.jpg" year:@"1999"],
                        [[Album alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverUrl:@"https://wallpapercave.com/wp/isKx9Y1.jpg" year:@"2000"],
                        [[Album alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverUrl:@"http://www.pngall.com/wp-content/uploads/2016/04/Avengers-PNG.png" year:@"2000"]]];

            [self saveAlbums];
        }
    }
    return self;
}

-(NSArray *)getAlbums{
    return albums;
}

-(void)addAlbum:(Album *)album atIndex:(int)index{
    
    if (albums.count >= index)
        [albums insertObject:album atIndex:index];
    else
        [albums addObject:album];
}

-(void)deleteAlbumAtIndex:(int)index{
    [albums removeObjectAtIndex:index];

}


- (void)saveImage:(UIImage*)image filename:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:filename atomically:YES];
}

- (UIImage*)getImage:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    return [UIImage imageWithData:data];
}


- (void)saveAlbums
{
    NSString *filename = [NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:albums];
    [data writeToFile:filename atomically:YES];
}


@end
