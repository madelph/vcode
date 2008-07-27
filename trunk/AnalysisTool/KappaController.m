//
//  KappaController.m
//  AnalysisTool
//
//  Created by Joshua Hailpern on 7/26/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "KappaController.h"


@implementation KappaController

- (void) awakeFromNib{
	intervals = [[NSMutableArray alloc] init];
}

#pragma mark - Kappa Calculations
//returns number of events in track
- (int)occurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval{
	if(coderDoc != nil ){
		EventTrack * track = [coderDoc trackNamed:trackName];
		if(track != nil){
			NSArray * events = [track eventList];
			return [events count];
		}
	}
	return 0;
}
- (int)opportunitiesForInterval:(int)interval{
	
	return 10;
}
//returns the non events
- (int)nonOccurenceEventCountForTrackNamed:(NSString *)trackName forCoderDoc:(MiniDoc*)coderDoc withInterval:(int)interval{
	if(coderDoc != nil ){
		int occurences = [self occurenceEventCountForTrackNamed:trackName forCoderDoc:coderDoc withInterval:interval];
		int opportunities = [self opportunitiesForInterval:interval];
		return opportunities- occurences;
	}
	return 0;
}

#pragma mark - Helpers
- (void)validateIntervals{
	
	while([intervals count] < [[agreementController intersectingTrackNames] count]){
		[intervals addObject:[NSNumber numberWithInt:[[agreementController primaryCoderDoc] interval]]];
	}
	while([intervals count] < [[agreementController intersectingTrackNames] count]){
		[intervals removeLastObject];
	}
}

- (void)updateGUI{
	[self validateIntervals];
	[kappaTable reloadData];
	return;
}



#pragma mark - Table Glue Code
// just returns the item for the right row
- (id)tableView:(NSTableView *) aTableView objectValueForTableColumn:(NSTableColumn *) aTableColumn row:(int) rowIndex{ 
	
	/* -------------------------------------------------------------------------------
	 * If there is not the original movie file, return N/A, else do the following....
	 ---------------------------------------------------------------------------------*/
	
	//log or something to figure out which table column?
	NSString * thisTrackName = [[agreementController intersectingTrackNames]objectAtIndex:rowIndex];
	if([[aTableColumn identifier] compare: @"trackName"]==NSOrderedSame){
		return thisTrackName;  
	}else if([[aTableColumn identifier] compare: @"kappaInterval"]==NSOrderedSame){
		return [intervals objectAtIndex:rowIndex]; 
	}else if([[aTableColumn identifier] compare: @"kappaOp"]==NSOrderedSame){
		int occurences = [self occurenceEventCountForTrackNamed:thisTrackName forCoderDoc:[agreementController primaryCoderDoc] withInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:occurences];  
	}else if([[aTableColumn identifier] compare: @"kappaOs"]==NSOrderedSame){
		int occurences = [self occurenceEventCountForTrackNamed:thisTrackName forCoderDoc:[agreementController secondaryCoderDoc] withInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:occurences];  
	}else if([[aTableColumn identifier] compare: @"kappaNp"]==NSOrderedSame){
		int nonoccurences = [self nonOccurenceEventCountForTrackNamed:thisTrackName forCoderDoc:[agreementController primaryCoderDoc] withInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:nonoccurences];  
	}else if([[aTableColumn identifier] compare: @"kappaNs"]==NSOrderedSame){
		int nonoccurences = [self nonOccurenceEventCountForTrackNamed:thisTrackName forCoderDoc:[agreementController secondaryCoderDoc] withInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:nonoccurences];  
	}else if([[aTableColumn identifier] compare: @"kappaU"]==NSOrderedSame){
		int opportunities = [self opportunitiesForInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:opportunities];  
	}else if([[aTableColumn identifier] compare: @"kappaA"]==NSOrderedSame){
		//could filter to only marks at the correct interval...
		int occurences = [self occurenceEventCountForTrackNamed:thisTrackName forCoderDoc:[agreementController secondaryCoderDoc] withInterval:[[intervals objectAtIndex:rowIndex] intValue]];
		return [NSNumber numberWithInt:occurences];  
	}
	
	return nil;
	
}

// just returns the number of items we have.
- (int)numberOfRowsInTableView:(NSTableView *)aTableView{
	
	return [[agreementController intersectingTrackNames] count];
}


- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex{
	
	if([[aTableColumn identifier] compare: @"kappaInterval"]==NSOrderedSame){
		//Set the local value for the interval to check in.
		//NSLog(@"%@",anObject);
		[intervals replaceObjectAtIndex:rowIndex withObject: anObject];
	}
	return;
}

@end
