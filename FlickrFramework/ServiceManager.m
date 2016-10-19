//
//  ServiceManager.m
//  FlickrFramework
//
//  Created by Cristina on 19/10/16.
//  Copyright © 2016 Cristina. All rights reserved.
//

#import "ServiceManager.h"
#import "FlickrAPIKey.h"

#define BASE_URL @"https://api.flickr.com/services/rest/"

@implementation ServiceManager

+ (NSDictionary *)executeFlickrFetch:(NSString *)query
{
    query = [NSString stringWithFormat:@"%@&format=json&nojsoncallback=1&api_key=%@", query, FlickrAPIKey];
    NSData *jsonData = [[NSString stringWithContentsOfURL:[NSURL URLWithString:query] encoding:NSUTF8StringEncoding error:nil] dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *results = jsonData ? [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error] : nil;
    if (error) NSLog(@"[%@ %@] JSON error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), error.localizedDescription);
    return results;
}

+ (NSArray *)getRecentPhotosInPage:(int)page andNumber:(int)number {
    NSString *request = [NSString stringWithFormat:@"%@?method=flickr.photos.getRecent&per_page=%i&page=%i&extras=description,owner_name,date_upload,original_format", BASE_URL, number, page];
    return [[self executeFlickrFetch:request] valueForKeyPath:@"photos.photo"];
}

@end
