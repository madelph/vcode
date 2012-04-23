//
//  EventFolder.m
//  VCode&VData
//
//  Created by Pengyu Ren on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventTrackGroups.h"

@implementation EventTrackGroups
@synthesize folderName;
@synthesize Childrens;

- (id) init {
    folderName =[[NSString alloc] init];
    Childrens=[[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc 
{
    [folderName release];
    [Childrens release];
    return [super dealloc];
}

-(void) addChildren: (EventTrack *) eventtracks
{
    [Childrens addObject:eventtracks];
}

-(NSInteger)numberOfChildren
{
    return [Childrens count];
}

-(EventTrack *) childAtIndex: (NSUInteger) n
{
    return [Childrens objectAtIndex:n];
}


@end
