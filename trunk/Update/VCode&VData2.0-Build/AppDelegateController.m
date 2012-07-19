//
//  AppDelegateController.m
//  VCode&VData
//
//  Created by Pengyu Ren on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegateController.h"
NSString * const BNRCheck = @"checkStatusForMainMenu";
@interface AppDelegateController ()

@end

@implementation AppDelegateController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

/*+(void)initialize
{
    NSMutableDictionary *defaultsValue = [NSMutableDictionary dictionary];
    NSData *BoolAsData = [NSKeyedArchiver archivedDataWithRootObject: [bool YES]];
    [defaultsValue setObject:BoolAsData forKey:BNRCheck];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsValue];
}
 */
@end
