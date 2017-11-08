//
//  WXImgLoaderDefaultImpl.m
//  esports
//
//  Created by 尚银东 on 2017/9/30.
//  Copyright © 2017年 shangyd. All rights reserved.
//

#import "WXImgLoaderDefaultImpl.h"
#import <SDWebImage/SDWebImageManager.h>

@implementation WXImgLoaderDefaultImpl



#pragma mark WXImgLoaderProtocol
- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)userInfo completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock
{
    
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
    }];
    
}

@end
