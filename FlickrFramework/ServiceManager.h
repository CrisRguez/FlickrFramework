//
//  ServiceManager.h
//  FlickrFramework
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceManager : NSObject

// TODO without test. Try, and get an APIKey for Flickr
+ (NSArray *)getRecentPhotosInPage:(int)page andNumber:(int)number;
// TODO create another method which returns image one by one

@end
