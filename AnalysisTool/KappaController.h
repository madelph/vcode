//
//  KappaController.h
//  AnalysisTool
//
//  Created by Joshua Hailpern on 7/26/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AgreementController.h"


@interface KappaController : NSObject {
	IBOutlet NSTableView *kappaTable;
	IBOutlet AgreementController *agreementController;
	NSMutableArray *intervals;
}
- (int)occurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval;
- (int)nonOccurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval;
- (int)opportunitiesForInterval:(int)interval;
- (void)validateIntervals;
- (void)updateGUI;

@end
