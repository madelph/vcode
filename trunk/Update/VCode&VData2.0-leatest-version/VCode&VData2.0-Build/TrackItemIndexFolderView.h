//
//  TrackItemIndexFolderView.h
//  VCode&VData
//
//  Created by Pengyu Ren on 8/23/12.
//
//

#import <Cocoa/Cocoa.h>
#import "EventTrackGroups.h"
#import "TrackListItemView.h"
#import "EventTrack.h"
@interface TrackItemIndexFolderView : NSView{
//    int folderTag;
    NSButton *expandingButton;
    NSTextView *folderName;
    EventTrackGroups *myTrackGroups;
    TrackListItemView *myTrackListItemview;
    bool states;
    int childrenNumber;
}

-(EventTrackGroups *)eventTrackGroup;
//-(void)setFolderTag:(int)tag;
-(void)setEventTrackGroups:(EventTrackGroups *)theEventTrackGroup;

-(void)syncSubViews;
-(void)updateMyselfView;
@end
