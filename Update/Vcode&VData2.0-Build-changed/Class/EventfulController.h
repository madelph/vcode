//
//  EventfulController.h
//  VCode
//
//  Created by Joey Hagedorn on 9/16/07.
//  Updated and modified by Joshua Hailpern & Zhongnan Du on 12/7/2011
//  Copyright 2008 University of Illinois & Joey Hagedorn. All rights reserved.
//	This software is licensed under a BSD license. Please refer to the included
//  license file for more details.

#import <Cocoa/Cocoa.h>
#import <QTKit/QTKit.h>
#import "Event.h"
#import "EventTrack.h"
#import "TimelineController.h"
#import "TrackListView.h"
#import "EventFolder.h"

@interface EventfulController : NSObject {
	IBOutlet id doc; //type CodingDocument
	IBOutlet NSOutlineView *indexTable;
	IBOutlet TrackListView *indexCustomView;
	IBOutlet NSScrollView *indexScrollView;
	IBOutlet TimelineController *timelineController;
	
	IBOutlet NSPanel * commentSheet;
	IBOutlet NSWindow * docWindow;
	IBOutlet NSTextField * commentField;


	
	//These are used to hold data while a sheet is open.
	bool wasPlaying; //if movie was playing when we clicked add
	int trackIndex; //track that this was called on.
	Event * editingEvent;
	
	//This is for the color admin table
	int colorRow;        // the row color changes apply to
}

- (IBAction) addEventNow:(id)sender;
- (IBAction) addEventNowWithComment:(id)sender;
- (IBAction) doneCommenting:(id)sender;
- (IBAction) insertSpecialChar:(id)sender;


- (Event *) addEventToTrack:(EventTrack *)activeTrack;


- (void) destroyEvent:(Event *)evt;
- (void) editEventComment:(Event *)evt;

//silly helper stuff
-(BOOL) array:(NSArray *)array containsEventOnTrack:(EventTrack *)aTrack;


- (BOOL)outlineView: (NSOutlineView *)aOutlinView isItemExpandable:(id)item;
- (NSInteger)outlineView: (NSOutlineView *)aOutlineView numberOfChildrenOfItem:(id)item;
- (BOOL)outlineView:(NSOutlineView *)aOutlinView isGroupItem:(id)item;
//for the color admin table too

- (id)outlineView:(NSOutlineView *)aOutlineView objectValueForTableColumn:(NSTableColumn *)aTableColumn byItem:(id)item;
- (void)outlineView:(NSOutlineView *)aOutlineView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn byItem:(id)item;


@end
