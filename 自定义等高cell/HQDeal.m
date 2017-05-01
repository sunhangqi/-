//
//  HQDeal.m
//  自定义等高cell
//
//  Created by Macbook on 2017/4/30.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQDeal.h"

@implementation HQDeal

+ (instancetype)dealWithDict:(NSDictionary *)dict {
    HQDeal *deal = [[self alloc] init];
    [deal setValuesForKeysWithDictionary:dict];
    return deal;
}

@end
