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
@synthesize url;

-(id)init
{
    [super init];
    name=nil;
    url=nil;
    return self;
}

-(void) dealloc {
    [name release];
    [url release];
    name=nil;
    url=nil;
    [super dealloc];
    
}
@end
