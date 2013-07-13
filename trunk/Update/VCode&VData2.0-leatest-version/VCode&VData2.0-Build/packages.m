//
//  packages.m
//  VCode
//
//  Created by Pengyu Ren on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "packages.h"

@implementation packages

@synthesize name;
@synthesize myurl;

-(id)init
{
    [super init];
    name=nil;
    myurl=nil;
    return self;
}

-(void) dealloc {
    [name release];
    [myurl release];
    name=nil;
    myurl=nil;
    [super dealloc];
    
}
@end
