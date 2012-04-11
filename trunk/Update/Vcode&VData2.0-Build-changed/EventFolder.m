//
//  EventFolder.m
//  VCode&VData
//
//  Created by Pengyu Ren on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EventFolder.h"

@implementation EventFolder


- (id) init {
    folderGroupName =[[NSString alloc] init];
    Childrens=[[NSMutableArray alloc] init];
    return self;
}

- (void) dealloc 
{
    [folderGroupName release];
    [Childrens release];
    return [super dealloc];
}

-(void) addChildren: (EventTrack *) tracks
{
    [Childrens addObject:tracks];
}

-(NSInteger)numberOfChildren
{
    return [Childrens count];
}

-(EventTrack *) childAtIndex: (NSUInteger) n
{
    return [Childrens objectAtIndex:n];
}

- (NSString *) Myname
{
    return folderGroupName;
}

@end
