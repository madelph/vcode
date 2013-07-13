//
//  TrackItemIndexFolderView.m
//  VCode&VData
//
//  Created by Pengyu Ren on 8/23/12.
//
//

#import "TrackItemIndexFolderView.h"
#import "CodingDocument.h"

@implementation TrackItemIndexFolderView


- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //Initialization folder here
        [NSButton setCellClass:[NSButtonCell class]];
        expandingButton = [[NSButton alloc] init];
        [expandingButton setImage:[NSImage imageNamed:@"Add.tiff"]];
        [expandingButton setBezelStyle:NSRoundedBezelStyle];
        [[expandingButton cell] setControlSize:NSSmallControlSize];
        [expandingButton setFrame:NSMakeRect(0.0, 0.0, 32.0, 23.0)];
        [self addSubview:expandingButton];
        
        folderName = [[NSTextView alloc] init];
        [folderName setFrame:NSMakeRect(32.0, 4.0, 140.0, 23.0)];
        [folderName setFont:[NSFont systemFontOfSize:0.0]];
        [folderName setTextColor:[NSColor colorWithDeviceWhite:.75 alpha:1]];
        [folderName setEditable:NO];
        [folderName setDrawsBackground:NO];
        [folderName setSelectable:NO];
        [folderName setVerticallyResizable:YES];
        
        NSTextContainer *folderTextContainer = [folderName textContainer];
        [folderTextContainer setContainerSize:NSMakeSize(FLT_MAX, FLT_MAX)];
        [folderTextContainer setWidthTracksTextView:NO];
        [folderName setTextContainer:folderTextContainer];
        
        [self addSubview:folderName];
        
        myTrackGroups = nil;
        
        
        
        states=false;
        childrenNumber= [[myTrackGroups Childrens] count];

    }
    return self;
}

- (void) dealloc {
    if (myTrackGroups) {
        [myTrackGroups release];
    }
    [expandingButton release];
    [folderName release];
    [super dealloc];
}

- (void)drawRect:(NSRect)rect {
    //Drawing Code here.
    [folderName setString:[myTrackGroups folderName]];
    
    NSRect bounds = [self bounds];
    [[NSColor grayColor] set];
    [NSBezierPath fillRect:bounds];
    NSLog(@"How many times do I have appeared on console!!!!");
//    [self syncSubViews];
    //if (states==true) {
    if (myTrackListItemview!=NULL) {
        [myTrackListItemview setNeedsDisplay:YES];
    }

    //}
    
}

- (BOOL)isFlipped{
	return YES;
}

-(void)updateMyselfView
{
    int totalnumber=0;
    totalnumber = [[myTrackGroups Childrens] count]+1;
    if (totalnumber!=[self frame].size.height) {
        [self setFrameSize:NSMakeSize([self frame].size.width, (24+1)*totalnumber)];
        [myTrackListItemview setNeedsDisplay:YES];
        //[self setNeedsDisplay:YES];
    }
    
}

-(EventTrackGroups *)eventTrackGroup{
    return myTrackGroups;
}

-(void)setEventTrackGroups:(EventTrackGroups *)theEventTrackGroup{
    if (myTrackGroups==nil) {
        myTrackGroups=theEventTrackGroup;
        myTrackListItemview = [[TrackListItemView alloc] initWithFrame:NSMakeRect(0.0, 24, [self frame].size.width, 25)];
        [myTrackListItemview setMyTrackGroup:myTrackGroups];
        [self addSubview:myTrackListItemview];
    }
    myTrackGroups=theEventTrackGroup;
}

@end
