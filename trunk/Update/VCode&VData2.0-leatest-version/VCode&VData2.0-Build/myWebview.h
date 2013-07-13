//
//  myWebview.h
//  VCode&VData
//
//  Created by Pengyu Ren on 4/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WebView;

@interface myWebview : NSObject {
    
    IBOutlet WebView *myWebView;
}
@property (nonatomic, retain) WebView *myWebView;

- (void)goToURLFromExternal:(NSString *)urlToGo;

@end
