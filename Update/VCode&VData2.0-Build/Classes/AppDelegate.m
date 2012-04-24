//
//  AppDelegate.m
//  VCode
//
//  Created by Joey Hagedorn on 3/27/08.
//  Updated and modified by Joshua Hailpern & Zhongnan Du on 12/7/2011
//  Copyright 2008 University of Illinois & Joey Hagedorn. All rights reserved.
//	This software is licensed under a BSD license. Please refer to the included
//  license file for more details.

#import "AppDelegate.h"

#import "packages.h"
#import "MiniDoc.h"
#import "DataFileLog.h"

@implementation AppDelegate


@synthesize windows = _windows;
@synthesize tableview;
@synthesize packagesData;
@synthesize recent_list;
@synthesize myRecentFile;

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
    packagesData = [[NSMutableArray alloc] init];
    
    myRecentFile = [[NSMutableArray alloc] init];
    id dc = [NSDocumentController sharedDocumentController];
    NSUInteger temp=[[dc recentDocumentURLs] count];
//    NSLog(@"%@", temp);
    NSLog(@"%@", [[dc recentDocumentURLs] objectAtIndex:0]);
       for(int i=0;i<temp;i++) {
           NSString *paths=[[dc recentDocumentURLs] objectAtIndex:i];
           NSString *name=[paths lastPathComponent];
           [myRecentFile addObject:paths];
           packages *pack = [[packages alloc] init];
           pack.name=name;
           pack.url=paths;
//           NSLog(@"%@", pack.name);
//           NSLog(@"%@", paths);
           [recent_list addObject:pack];
           [pack release];
     }
    // tableview.delegate=self;
}

-(void) dealloc
{
    [self setPackagesData:nil];
//    [self myRecentFile:nil];
    [super dealloc];
}

- (void)application:(NSApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[[NSDocumentController sharedDocumentController] documents] count] < 1)
	{
		[[NSDocumentController sharedDocumentController] openDocument:self];
	}
}

- (IBAction)btnVData:(id)sender {
    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"MainMenuData" bundle:nil];
	NSLog(@"Vdata Launched");
	
    [nib instantiateNibWithOwner:self topLevelObjects:nil];
    [_secondWindow makeKeyAndOrderFront:nil];
    
    [nib release];
}



- (BOOL) applicationShouldOpenUntitledFile: (NSApplication *)sender {
	return NO;
}

- (IBAction)openHelpPDF:(id)sender{
	[[NSWorkspace sharedWorkspace] openFile:[[NSBundle mainBundle] pathForResource:@"VCodeVDataDocs" ofType:@"pdf"]
							withApplication:@"Preview"];	
}

- (IBAction)VGuide:(id)sender {
     NSNib *nib = [[NSNib alloc] initWithNibNamed:@"webView" bundle:nil];
    [nib instantiateNibWithOwner:self topLevelObjects:nil];
    [nib release];
}


-(IBAction)openOther:(id)sender
{
    
    
    NSOpenPanel* panel = [NSOpenPanel openPanel];
    if([panel runModal]==NSOKButton) {
        NSString *localPath=[[panel URLs] objectAtIndex:0];
        NSString *filename =[localPath lastPathComponent];
  //      NSMenuItem * doOpen=
        packages *pack = [[packages alloc] init];
        pack.name=filename;
        pack.url=localPath;
        NSLog(@"%@", pack.name);
        NSLog(@"%@", localPath);
        [recent_list addObject:pack];
        [pack release];
        [panel runModalForDirectory:localPath file:filename];
        //[internalArray addObject:localPath];
    }
}

- (IBAction)open:(id)sender {
    // [[NSApplication sharedApplication] openURL:url]; 
    NSInteger selectedRow=[tableview selectedRow];
    if(selectedRow ==1) {
        NSLog(@"lalalal");
    }
    NSString * paths=[myRecentFile objectAtIndex:selectedRow];
//    NSLog(@"%@",paths);
//    NSURL* urls = [NSURL URLWithString:paths];
//    NSLog(@"%@", paths/*[myRecentFile objectAtIndex:selectedRow]*/);
//    NSLog(@"%@", [urls path]);
    MiniDoc * newfile=[[MiniDoc alloc] init];
    [newfile setMovie:paths];
    

	return;
//    NSURL* urls = [NSURL URLWithString:paths];
 //   [[NSWorkspace sharedWorkspace] openURL:urls];//openFile:(NSString *)paths withApplication:@"Vcode&VData"];
  //  }
}

- (IBAction)cancel:(id)sender {
    close(1);
}


-(void) setPackagesData:(NSMutableArray *)array
{
    if(array == packagesData) {
        return;
    }
    [array retain];
    [packagesData release];
    packagesData = array;
}


@end
