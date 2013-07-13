//
//  TrackListItemView.m
//  VCode&VData
//
//  Created by Pengyu Ren on 9/15/12.
//
//

#import "TrackListItemView.h"
#import "CodingDocument.h"

@implementation TrackListItemView

-(id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        // Initialization code here.
    }
    return self;
}

-(void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
	//gray background
    [[NSColor colorWithDeviceWhite:0.95 alpha:1] set];
    [NSBezierPath fillRect:[self bounds]];
    [self syncSubViews];
}

-(BOOL)isFilpped
{
    return YES;
}

-(TrackItemIndexView*)viewForEventTrack:(EventTrack *)track{
    
	//this really shouldn't go here, but must, because it dies in sync subviews
	[self setFrameSize:NSMakeSize([self frame].size.width,[[myTrackGroup Childrens] count]*(24 + 1))];
    
	if([[self subviews] count]){
        
		for(int i=0;i<[[self subviews] count]; i++){
			TrackItemIndexView *theView = [[self subviews] objectAtIndex:i];
			if([theView eventTrack]==track){
				return theView;
			}
		}
	}//Else
	return nil;
}

- (void)syncSubViews{
    NSArray *eventTracks = [myTrackGroup Childrens];
	int trackQty = [eventTracks count];
	for(int i=0;i<trackQty;i++){
		EventTrack *theTrack = [eventTracks objectAtIndex:i];
		TrackItemIndexView *theView = [self viewForEventTrack:theTrack];
		if(theView==nil){
			theView = [[TrackItemIndexView alloc] initWithFrame:NSMakeRect(0.0,(float)((24 + 1)*(i)),([self frame].size.width),24.0)];
			[theView setDoc:doc];
			[theView setEventTrack:theTrack];
			[self addSubview:theView];
		}
		[theView setButtonTag:(i+1)];
	}
    
	for(int i=0;i<[[self subviews] count];i++){
		TrackItemIndexView *theView = [[self subviews] objectAtIndex:i];
		EventTrack *theTrack = [theView eventTrack];
		if([eventTracks containsObject:theTrack]==NO){
			[theView removeFromSuperview];
		}
	}
    
	
	for(int i=0;i<trackQty;i++){
		EventTrack *theTrack = [eventTracks objectAtIndex:i];
		TrackItemIndexView *theView = [self viewForEventTrack:theTrack];
		[theView setFrameOrigin:NSMakePoint(0.0,(float)((24 + 1)*(i)))];
	}
	
	//set my size
}


-(void)setMyTrackGroup:(EventTrackGroups *)TrackGroup
{
    myTrackGroup=TrackGroup;
}
-(EventTrackGroups *)myTrackGroup
{
    return myTrackGroup;
}

@end
