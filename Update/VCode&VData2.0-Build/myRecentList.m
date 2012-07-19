//
//  myRecentList.m
//  VCode&VData
//
//  Created by Pengyu Ren on 6/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "myRecentList.h"

@implementation myRecentList


+(void)initialize
{
    NSMutableDictionary *defaultsValue = [NSMutableDictionary dictionary];
    NSData *BoolAsData = [NSKeyedArchiver archivedDataWithRootObject: [NSNumber numberWithBool:YES]];
    [defaultsValue setObject:BoolAsData forKey:@"checkStatusForMainMenu"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultsValue];
}

-(NSNumber *)checkState
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData * result = [defaults objectForKey:@"checkStatusForMainMenu"];
    //    NSLog(@"checkState value %@", [[NSKeyedUnarchiver unarchiveObjectWithData:result] boolValue]);
    return [NSKeyedUnarchiver unarchiveObjectWithData:result];
}
@end
