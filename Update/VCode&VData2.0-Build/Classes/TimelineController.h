//
//  TimelineController.h
//  VCode
//
//  Created by Joey Hagedorn on 9/30/07.
//  Updated and modified by Joshua Hailpern & Zhongnan Du on 12/7/2011
//  Copyright 2008 University of Illinois & Joey Hagedorn. All rights reserved.
//	This software is licensed under a BSD license. Please refer to the included
//  license file for more details.

//This really serves as the Track controller as well.



#import <Cocoa/Cocoa.h>
#import "TimelineView.h"
#import "TrackListView.h"

#import "EventTrackGroups.h"


@interface TimelineController : NSObject {
	IBOutlet TimelineView * timelineView;
	IBOutlet id doc; //CodingDocument
	IBOutlet NSOutlineView *indexTable;
	IBOutlet TrackListView *indexCustomView;
	
	NSArray *defaultColors;

    NSButton *addFolder;
}

- (IBAction)addFolder:(id)sender;
- (IBAction)removeFolder:(id)sender;

- (IBAction) addTrack:(id)sender;
- (IBAction) removeTrack:(id)sender;

- (IBAction) toggleRange:(id)sender;

- (void) scrollToNow;
- (void) sizeToMovie;
- (void) updateTimeline;
- (void) updateTimelineAndSync;


@end
