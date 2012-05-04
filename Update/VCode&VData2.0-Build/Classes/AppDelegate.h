//
//  AppDelegate.h
//  VCode
//
//  Created by Joey Hagedorn on 3/27/08.
//  Updated and modified by Joshua Hailpern & Zhongnan Du on 12/7/2011
//  Copyright 2008 University of Illinois & Joey Hagedorn. All rights reserved.
//	This software is licensed under a BSD license. Please refer to the included
//  license file for more details.

#import <Cocoa/Cocoa.h>
//#import <AppKit/AppKit.h>
#import <myWebview.h>
@interface AppDelegate : NSObject {

	
@private
	NSWindow *_windows;
    IBOutlet NSWindow *_secondWindow;
    IBOutlet NSArrayController *recent_list;
    
    IBOutlet NSTableView *tableview;
    

    
    IBOutlet NSView *myWebview;
    
    NSMutableArray *packagesData;
    
    NSMutableArray *myRecentFile;
    
    myWebview *newRequest;
    
    IBOutlet NSTextFieldCell * text;

    NSButton *VGuide;
}

@property (assign) IBOutlet NSWindow *windows;
@property (nonatomic, retain) NSTableView * tableview;
@property (nonatomic, retain) NSMutableArray * packagesData;
@property (nonatomic, retain) NSArrayController * recent_list;
@property (nonatomic, retain) NSMutableArray * myRecentFile;


- (IBAction)btnVData:(id)sender;
-(IBAction)openHelpPDF:(id)sender;
- (IBAction)VGuide:(id)sender;


- (IBAction)open:(id)sender;
- (IBAction)cancel:(id)sender;
- (IBAction)openOther:(id)sender;

-(void) setPackagesData:(NSMutableArray *)array;
@end
