//
//  EventFolder.h
//  VCode&VData
//
//  Created by Pengyu Ren on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "EventTrack.h"
@interface EventTrackGroups : NSObject {
//    EventFolder * parent;
    NSString * folderName;
    NSMutableArray * Childrens;
}
@property (retain) NSString *folderName;
@property (retain) NSMutableArray *Childrens;

-(void) addChildren: (EventTrack *) tracks;
-(NSInteger)numberOfChildren;
-(EventTrack *) childAtIndex: (NSUInteger) n;


/*
- (NSString *) name;

- (void) setname: (NSString *) newname;

*/
@end
