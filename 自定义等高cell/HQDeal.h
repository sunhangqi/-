//
//  HQDeal.h
//  自定义等高cell
//
//  Created by Macbook on 2017/4/30.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQDeal : NSObject
@property (nonatomic, strong) NSString *buyCount;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *icon;

+ (instancetype)dealWithDict:(NSDictionary *)dict;

@end
