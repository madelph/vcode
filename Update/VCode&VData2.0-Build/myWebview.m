//
//  myWebview.m
//  VCode&VData
//
//  Created by Pengyu Ren on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myWebview.h"
#import <WebKit/WebKit.h>

@implementation myWebview
@synthesize myWebView;

- (id) init {
 //   [super init];
  //  [self goToURLFromExternal:@"www.google.com"];
    [myWebview setMainFrameURL: @"http://www.apple.com"];
 //   return nil;   
}

-(void) dealloc
{
    [super dealloc];
}

- (void)goToURLFromExternal:(NSString *)urlToGo {
    NSLog(@"%@", urlToGo);
    
    NSURL *newURL = [[NSURL alloc] initWithString:urlToGo];
    NSLog(@"%@", newURL);
    
    NSURLRequest *newRequest = [[NSURLRequest alloc] initWithURL:newURL];
    NSLog(@"%@", newRequest);
    
    [myWebview setMainFrameURL: @"http://www.apple.com"];
}


@end
