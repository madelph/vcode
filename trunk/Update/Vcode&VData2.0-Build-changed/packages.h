//
//  packages.h
//  VCode
//
//  Created by Pengyu Ren on 3/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface packages : NSObject {
    NSString * name;
    NSString * url;
}
@property (readwrite, copy) NSString *name;
@property (readwrite, copy) NSString *url;
@end
