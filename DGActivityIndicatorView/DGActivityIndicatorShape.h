//
//  DGActivityIndicatorShape.h
//  DGActivityIndicatorExample
//
//  Created by Lung on 20/7/2017.
//  Copyright © 2017 Danil Gontovnik. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, DGActivityIndicatorShapeType) { // check  https://github.com/ninjaprox/NVActivityIndicatorView for more implementation 
    DGActivityIndicatorShapeTypeLine,
};

@interface DGActivityIndicatorShape : CALayer
+ (id)layerWithType:(DGActivityIndicatorShapeType)type Size:(CGSize)size color:(UIColor *)color;
@end
