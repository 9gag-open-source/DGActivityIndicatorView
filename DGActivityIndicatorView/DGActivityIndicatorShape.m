//
//  DGActivityIndicatorShape.m
//  DGActivityIndicatorExample
//
//  Created by Lung on 20/7/2017.
//  Copyright © 2017 Danil Gontovnik. All rights reserved.
//

#import "DGActivityIndicatorShape.h"

@implementation DGActivityIndicatorShape

+ (id)layerWithType:(DGActivityIndicatorShapeType)type Size:(CGSize)size color:(UIColor *)color {
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
//    CGFloat lineWidth = 2;
    switch (type) {
        case DGActivityIndicatorShapeTypeLine:
        {
            path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:size.width/2];
            layer.fillColor = color.CGColor;
        }
            break;
        default:
            break;
    }
    layer.backgroundColor = nil;
    layer.path = path.CGPath;
    layer.frame = CGRectMake(0, 0, size.width, size.height);
    return layer;
}

@end
