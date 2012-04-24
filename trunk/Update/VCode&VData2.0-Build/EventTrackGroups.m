//
//  EventFolder.m
//  VCode&VData
//
//  Created by Pengyu Ren on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventTrackGroups.h"

@implementation EventTrackGroups


- (id) init {
    _folderName =[[NSString alloc] initWithString:@"Untitled Folder"];
    _Childrens=[[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc 
{
    [_folderName release];
    [_Childrens release];
    return [super dealloc];
}

-(void) addChildren: (EventTrack *) eventtracks
{
    [_Childrens addObject:eventtracks];
}

-(NSInteger)numberOfChildren
{
    return [_Childrens count];
}

-(EventTrack *) childAtIndex: (NSUInteger) n
{
    return [_Childrens objectAtIndex:n];
}

- (NSString *) folderName {
    return _folderName;
}

- (NSMutableArray *) Childrens {
    return _Childrens;
}

@end
