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
- (int)opportunitiesForInterval:(int)interval;
- (int)occurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval;
- (int)nonOccurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval;
- (int)numberOfAgreementsOfOccurencesAndNonOccurrencesForTrackNamed:(NSString *)trackName withInterval:(int)interval;
- (float)calculatePaForTrackNamed:(NSString *)trackName withInterval:(int)interval;
- (float)calculatePcForTrackNamed:(NSString *)trackName withInterval:(int)interval;
- (float)calculateKappaForTrackNamed:(NSString *)trackName withInterval:(int)interval;

- (NSString*)exportDataToCSForTrackNamed:(NSString *)trackName row:(int) rowIndex;

- (void)validateIntervals;
- (void)updateGUI;
- (NSMutableArray *)intervals;

@end
