//
//  DGActivityIndicatorAnimationAudioEqualizer.m
//  DGActivityIndicatorExample
//
//  Created by Lung on 20/7/2017.
//  Copyright © 2017 Danil Gontovnik. All rights reserved.
//

#import "DGActivityIndicatorAnimationAudioEqualizer.h"
#import "DGActivityIndicatorShape.h"

@implementation DGActivityIndicatorAnimationAudioEqualizer

- (void)setupAnimationInLayer:(CALayer *)layer withSize:(CGSize)size tintColor:(UIColor *)tintColor {
    NSInteger lines = 3;
    NSInteger spacing = 1;
    CGFloat lineWidth = (size.width - (spacing*(lines-1))) / lines;
    CGFloat lineHeight = size.height;
    CGFloat x = (layer.bounds.size.width - lines*lineWidth - (lines-1)*spacing) / 2;
    CGFloat y = (layer.bounds.size.height - lineHeight) / 2;
    NSArray *duration = @[@(4.3), @(2.5), @(1.7), @(3.1)];
    NSArray *values = @[@(0), @(0.7), @(0.4), @(0.05), @(0.95), @(0.3), @(0.9), @(0.4), @(0.15), @(0.18), @(0.75), @(0.01)];
    
    // Draw lines
    for (int i = 0; i < lines; i++) {
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = @"path";
        animation.additive = YES;
//        animation.values = @[];
        
        NSMutableArray *v = [NSMutableArray array];
        for (int j = 0; j < values.count; j++) {
            CGFloat heightFactor = [values[j] floatValue];
            CGFloat height = lineHeight * heightFactor;
            CGPoint point = CGPointMake(0, lineHeight - height);
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(point.x, point.y, lineWidth, height)];
            [v addObject:(id)path.CGPath];
        }
        animation.values = v;
        animation.duration = [duration[i] floatValue];
        animation.repeatCount = MAXFLOAT;
        animation.removedOnCompletion = NO;
        
        DGActivityIndicatorShape *line = [DGActivityIndicatorShape layerWithType:DGActivityIndicatorShapeTypeLine Size:CGSizeMake(lineWidth, lineHeight) color:tintColor];
        CGRect frame = CGRectMake(x + (lineWidth + spacing) * i, y, lineWidth, lineHeight);
        line.frame = frame;
        [line addAnimation:animation forKey:@"animation"];
        [layer addSublayer:line];
    }
}

@end
