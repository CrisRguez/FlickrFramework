//
//  ServiceManager.h
//  FlickrFramework
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject

+ (NSArray *)getRecentPhotosInPage:(int)page andNumber:(int)number;

@end
