//
//  TrackListItemView.h
//  VCode&VData
//
//  Created by Pengyu Ren on 9/15/12.
//
//

#import <Cocoa/Cocoa.h>
#import "EventTrack.h"
#import "TrackItemIndexView.h"
#import "EventTrackGroups.h"
@interface TrackListItemView : NSView {
    IBOutlet id doc;
    EventTrackGroups *myTrackGroup;
    
}

-(TrackItemIndexView*)viewForEventTrack:(EventTrack *)track;
-(void)syncSubviews;

-(void)setMyTrackGroup:(EventTrackGroups *)TrackGroup;
-(EventTrackGroups *)myTrackGroup;


@end
