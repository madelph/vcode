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

//#import "myRecentList.h"
#import <WebKit/WebKit.h>
//NSString * const BNRCheck = @"checkStatusForMainMenu";

@implementation AppDelegate

@synthesize launchWindow;
@synthesize windows = _windows;
@synthesize packagesData;
//@synthesize recent_list;
//@synthesize myRecentFile;
@synthesize showingCheckBox;
@synthesize tableView;

+(void)initialize
{
    NSMutableDictionary *defaultsValue = [NSMutableDictionary dictionary];
    NSData *BoolAsData = [NSKeyedArchiver archivedDataWithRootObject: [NSNumber numberWithBool:YES]];
    [defaultsValue setObject:BoolAsData forKey:@"checkStatusForMainMenu"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsValue];
    NSLog(@"initializedddddd");
}

+(NSNumber *)checkState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData * result = [defaults objectForKey:@"checkStatusForMainMenu"];
   // NSLog(@"checkState value %@", [[NSKeyedUnarchiver unarchiveObjectWithData:result] boolValue]);
    return [NSKeyedUnarchiver unarchiveObjectWithData:result];
}

+(void)setStateToYes
{
    NSData *BoolAsData = [NSKeyedArchiver archivedDataWithRootObject: [NSNumber numberWithBool:YES]];
    [[NSUserDefaults standardUserDefaults] setObject:BoolAsData forKey:@"checkStatusForMainMenu"];
    NSLog(@"I've changed the state to YES");
}

+(void)setStateToNo
{
    NSData *BoolAsData = [NSKeyedArchiver archivedDataWithRootObject: [NSNumber numberWithBool:NO]];
    [[NSUserDefaults standardUserDefaults] setObject:BoolAsData forKey:@"checkStatusForMainMenu"];
    NSLog(@"I've changed to state to NO");
}

- (void)applicationWillFinishLaunching:(NSNotification *)aNotification {
    NSLog(@" start !!!I also want to check state NOW !!! %d",[[AppDelegate checkState] boolValue]);

    if([[AppDelegate checkState] boolValue]==NO) {
        NSLog(@"lalalalallalalalal I NEED TO find THIS I am 1");
        [launchWindow orderOut:self];
    }
    else {
        NSLog(@"lalalalallalalalal I NEED TO find THIS I am 2");
        [launchWindow orderFront:self];
        //[launchWindow setHidesOnDeactivate:NO];
    }
}


-(id)init
{
    self= [super init];
    if (self) {
        NSLog(@"init");
        _tableColumnWidth=[[tableView tableColumnWithIdentifier:@"Recents"] width];
        packagesData = [[NSMutableArray alloc] init];
        
        //    myRecentFile = [[NSMutableArray alloc] init];
        id dc = [NSDocumentController sharedDocumentController];
        NSUInteger temp=[[dc recentDocumentURLs] count];
        //    NSLog(@"%@", temp);
       // NSLog(@"%@", [[dc recentDocumentURLs] objectAtIndex:0]);
        for(int i=0;i<temp;i++) {
            NSString *paths=[[dc recentDocumentURLs] objectAtIndex:i];
            NSString *name=[paths lastPathComponent];
            ////     [myRecentFile addObject:paths];
            packages *pack = [[packages alloc] init];
            pack.name=name;
            pack.url=paths;
            NSLog(@"%@", pack.name);
            NSLog(@"%@", paths);
            ////         [recent_list addObject:pack];
            [packagesData addObject:[self prettyNameWithObject: pack]];
            ////         [pack release];
            
        }
        [tableView setBackgroundColor:[NSColor clearColor]];
        [tableView reloadData];
        // tableview.delegate=self
        newRequest=[[myWebview alloc] init];
        //state = [AppDelegate checkState];
        

    }
    return self;
}

-(void) dealloc
{
    [self setPackagesData:nil];
//    [self myRecentFile:nil];
    if(newRequest!=nil) {
    [newRequest release];
    }
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
     newRequest=[[myWebview alloc] init];
 //    NSNib *nib = [[NSNib alloc] initWithNibNamed:@"webview" bundle:nil];
   // [newRequest goToURLFromExternal:@"www.google.com"];
 //   [newRequest setMainFrameURL: (NSString *)@"http://www.google.com"];
    [NSBundle loadNibNamed:@"webview" owner:newRequest];
    //[nib instantiateNibWithOwner:self topLevelObjects:newRequest];
 //   [nib awakeFromNib];
//    [nib release];
 //   [Vview takeStringURLFrom:@"http://www.google.com"];
 //   [newRequest release];
}

- (IBAction)showWindow:(id)sender {
    NSLog(@"hello, there!!");
    //[launchWindow setTitle:@"Launch Panel"];
    if(![launchWindow isVisible]) {
 //       [launchWindow setCanHide:NO];
        [launchWindow orderFront:self];
        NSLog(@"state=1");
        [AppDelegate setStateToYes];
    }
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
//        [recent_list addObject:pack];
        [pack release];
        [panel runModalForDirectory:localPath file:filename];
        //[internalArray addObject:localPath];
    }
}

- (IBAction)setState:(id)sender {
    NSInteger state = [showingCheckBox state];
    NSLog(@"checkBox state %d", state);
    if (state==1) {
        NSLog(@"state=1");
        [AppDelegate setStateToYes];
    }
    else {
        NSLog(@"state=0");
        [AppDelegate setStateToNo];
    }
}

- (IBAction)open:(id)sender {
    // [[NSApplication sharedApplication] openURL:url]; 
    NSInteger selectedRow=[tableView selectedRow];
    if(selectedRow <0) {
        NSLog(@"lalalal");
    }
    NSLog(@"the selectedRow in recentList %d", selectedRow);
//    NSFileWrapper * data = [NSFileWrapper initSimbolicLinkWithDestinationURL:@"file://localhost/Users/renpengyu/Desktop/asfsfd.cod"];
 //   NSString * paths=[packagesData objectAtIndex:selectedRow];
//    NSLog(@"%@",paths);
    //NSURL* urls = [NSURL URLWithString:paths];
//    NSLog(@"%@", paths/*[myRecentFile objectAtIndex:selectedRow]*/);
//    NSLog(@"%@", [urls path])
//    BOOL *result=readFromURL:(NSURL *)urls ofType:(NSString *)@"cod" error:(NSError **) outError;
    

//	return;
//    NSURL* urls = [NSURL URLWithString:paths];
    [[NSWorkspace sharedWorkspace] openFile:@"file://localhost/Users/renpengyu/Desktop/asfsfd.cod"];//openFile:(NSString *)paths withApplication:@"Vcode&VData"];
  //  }
}

- (IBAction)cancel:(id)sender {
    [launchWindow orderOut:self];
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
//tableview datasource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableview {
    NSLog(@"LAAAAA %d", [packagesData count]);
    return (NSInteger)[packagesData count];
}

- (id)tableView:(NSTableView *)tv objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
//    id result=nil;
//    NSLog(@"fuckkckckkc");
/*   if ([[tableColumn identifier] compare:@"Urls"]==NSOrderedSame){
        NSLog(@"url printed %@",[[packagesData objectAtIndex:row] url]);
        return [[packagesData objectAtIndex:row] url];

    }
 */
    if([[tableColumn identifier] compare:@"Recents"]==NSOrderedSame) {
//        NSLog(@"name printed");
//        NSLog(@"%@",[self prettyNameWithObject:packagesData atIndex:row]);
        return [packagesData objectAtIndex:row];// name];//[self prettyNameWithObject:packagesData atIndex:row];
    }
    return nil;
}

- (NSAttributedString *) prettyNameWithObject:(id)Object atIndex:(NSInteger) index
{
    NSTextAttachment *attachment;
    attachment = [[[NSTextAttachment alloc] init] autorelease];
    NSCell *cell = [attachment attachmentCell];
    NSURL * myurl1=[[NSURL alloc] initWithString:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VCode1.png"];
//    NSURL * myurl2= [[NSURL alloc] initWithString:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VData2.png"];
    NSImage *icon1 =[[NSImage alloc] initByReferencingURL:myurl1]; // or wherever you are getting your image
//    NSImage *icon2 = [[NSImage alloc] initByReferencingURL:myurl2];

    [cell setImage: icon1];

    
    
    NSAttributedString *attrname;
    NSString *name = [[Object objectAtIndex:index] name];
    attrname = [[NSAttributedString alloc] initWithString: name];
    
    NSMutableAttributedString *prettyName;
    prettyName = (id)[NSMutableAttributedString attributedStringWithAttachment:
                      attachment]; // cast to quiet compiler warning
    [prettyName appendAttributedString: attrname];
    
    return (prettyName);
    
} // prettyName

- (NSAttributedString *)prettyNameWithObject:(id)Object
{
    NSTextAttachment *attachment;
    attachment = [[[NSTextAttachment alloc] init] autorelease];
    NSCell *cell = [attachment attachmentCell];
 //   NSURL * myurl1=[[NSURL alloc] initWithString:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VCode1.png"];
    //    NSURL * myurl2= [[NSURL alloc] initWithString:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VData2.png"];
    NSImage *icon1 =[[NSImage imageNamed:@"VCode1.png"] autorelease]; // or wherever you are getting your image
    //    NSImage *icon2 = [[NSImage alloc] initByReferencingURL:myurl2];
    NSSize mysize;
    mysize.height = 40;
    mysize.width = 35;
    [icon1 setSize:mysize];

    [cell setImage: icon1];
    
    NSAttributedString *attrname;
    NSString *name= [Object name];
    attrname=[[NSAttributedString alloc] initWithString:name];
    NSMutableAttributedString *prettyName;
    prettyName = (id)[NSMutableAttributedString attributedStringWithAttachment:
                      attachment]; // cast to quiet compiler warning
    [prettyName appendAttributedString: attrname];
    
    return (prettyName);
    
}

/*
- (void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex {
    
}
*/ 
//tableview delegate
/*
- (void)tableViewColumnDidResize:(NSNotification *)notification {
        [tableView noteHeightOfRowsWithIndexesChanged:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, tableView.numberOfRows)]]; 
}
*/
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    NSLog(@"I am going to change the height of the row");
    if (row>=0) {
        return 50;
    }
    return 0;
}

/*
- (NSCell *)tableView:(NSTableView *)tableView dataCellForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
//    NSURL * myurl1=[[NSURL alloc] initWithString:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VCode1.png"];
    NSImage *icon1 =[[[NSImage alloc] initWithContentsOfFile:@"/Users/renpengyu/Desktop/Vcode/trunk/Update/Vcode&Vdata/VCode1.png"] autorelease];
    NSSize mysize;
    mysize.height = 30;
    mysize.width = 20;
    [icon1 setSize:mysize];
    if ([[tableColumn identifier] compare:@"Recents"]==NSOrderedSame) {
        NSLog(@"I am here!!");
        NSCell *pcell = [[NSCell alloc] initImageCell:icon1];
        return pcell;
    }
    NSLog(@"I am out!!!");
    return nil;
}
*/
@end
