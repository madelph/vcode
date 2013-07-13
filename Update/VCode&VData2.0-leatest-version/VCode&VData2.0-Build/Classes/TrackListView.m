//
//  TrackListView.m
//  VCode
//
//  Created by Joey Hagedorn on 9/22/07.
//  Updated and modified by Joshua Hailpern & Zhongnan Du on 12/7/2011
//  Copyright 2008 University of Illinois & Joey Hagedorn. All rights reserved.
//	This software is licensed under a BSD license. Please refer to the included
//  license file for more details.

#import "TrackListView.h"
#import "CodingDocument.h"

@implementation TrackListView

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    return self;
}


- (void)drawRect:(NSRect)rect {
    // Drawing code here.
	//gray background
    [[NSColor colorWithDeviceWhite:0.95 alpha:1] set];
    [NSBezierPath fillRect:[self bounds]];
	
	NSLog(@"abclalalallalaal");
	[self syncSubviews];
	/*
	int views = [[self subviews] count];
	for(int i=0;i<views; i++){
		[[[self subviews] objectAtIndex:i] setNeedsDisplay:YES];
	}
	 */
}


- (BOOL)isFlipped{
	return YES;
}



-(TrackItemIndexView*)viewForEventTrack:(EventTrack *)track{

	//this really shouldn't go here, but must, because it dies in sync subviews
	[self setFrameSize:NSMakeSize([self frame].size.width,[[doc eventTracks] count]*(24 + 1))];

	if([self subviews]){

		for(int i=0;i<[[self subviews] count]; i++){
			TrackItemIndexView *theView = [[self subviews] objectAtIndex:i];
			if([theView eventTrack]==track){
				return theView;
			}
		}
	}//Else
	return nil;
}

- (TrackItemIndexFolderView*)viewForEventTrackGroup:(EventTrackGroups *)trackGroup eventTrackGroups:(NSArray *)aArray{
    int total=[self totalNumbeOfItem:aArray];
    //NSLog(@"print the the total number of item %d",total);
    [self setFrameSize:NSMakeSize([self frame].size.width, total*(24+1))];
    
    if ([self subviews]) {
       // NSLog(@"!!!!!!!!!!!!!%d",[[self subviews] count]);
        for (int i=0; i<[[self subviews] count]; i++) {
            TrackItemIndexFolderView *theViewFolder = [[self subviews] objectAtIndex:i];
            if ([theViewFolder eventTrackGroup]==trackGroup ) {
                return theViewFolder;
            }
        }
    }
    return nil;
}

- (int)totalNumbeOfItem:(NSArray *)trackGroup{
    //this for calculating the total items in TrackListView and this is going to be used in above function:-).
    int total=0;
    for (int i=0; i< [trackGroup count]; i++) {
        total=total+[[trackGroup objectAtIndex:i] numberOfChildren];
    }
    total+=[trackGroup count];
    return total;
}

-(void)syncSubviews{
	NSArray *eventTracksGroup = [doc eventTrackGroups];
	int trackQty = [eventTracksGroup count];
    NSLog(@"print the trackQty %d",trackQty);
    float totalHeight=0.0;
	for(int i=0;i<trackQty;i++){
        EventTrackGroups *theTrackGroups = [eventTracksGroup objectAtIndex:i];
//		EventTrack *theTrack = [eventTracks objectAtIndex:i];
		TrackItemIndexFolderView *theView = [self viewForEventTrackGroup:theTrackGroups eventTrackGroups:eventTracksGroup];
		if(theView==nil){
            NSLog(@"Adding a new indexview I want the know the y location %f",totalHeight);
			theView = [[TrackItemIndexFolderView alloc] initWithFrame:NSMakeRect(0.0,totalHeight,([self frame].size.width),50.0)];
//			[theView setDoc:doc];
			[theView setEventTrackGroups:theTrackGroups];
			[self addSubview:theView];
            NSLog(@"I 've add it ");
		}
        [theView updateMyselfView];
        
		//[theView setFolderTag:(i+1)];
        totalHeight=totalHeight+(24+1)*([theTrackGroups numberOfChildren]+1);
	}

	for(int i=0;i<[[self subviews] count];i++){
		TrackItemIndexFolderView *theView = [[self subviews] objectAtIndex:i];
		EventTrackGroups *theTrackGroup = [theView eventTrackGroup];
		if([eventTracksGroup containsObject:theTrackGroup]==NO){
           // [theView updateMyselfView];
			[theView removeFromSuperview];
		}
	}

	totalHeight=0.0;
	for(int i=0;i<trackQty;i++){
		EventTrackGroups *theTrack = [eventTracksGroup objectAtIndex:i];
		TrackItemIndexFolderView *theView = [self viewForEventTrackGroup:theTrack eventTrackGroups:eventTracksGroup];
       // NSLog(@"Print the frame origin height at each view.%f",totalHeight);
		[theView setFrameOrigin:NSMakePoint(0.0,(float)totalHeight)];
        totalHeight=totalHeight+(24+1)*([theTrack numberOfChildren]+1);
	}
	
	//set my size

}

//-(void) updateView
@end
