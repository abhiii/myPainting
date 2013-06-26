//
//  DrawingClass.m
//  CustumImageDrawings
//
//  Created by Hadi Hatunoglu on 12/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "DrawingClass.h"

@implementation DrawingClass

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing using beizer path
    
//    UIBezierPath *bpath=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) byRoundingCorners:UIRectCornerAllCorners  cornerRadii:CGSizeMake(30, 30)];
//    
//    [[UIColor greenColor]setFill];
//    [bpath fill];
    
    
    
    //drawing in  an imageview
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), YES, 0);
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 100, 100, 100));
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor]CGColor]);
    CGContextFillPath(ctx);
    UIImage *imagee=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    
    
}

//drawing using QuartzCore Framework

/*-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 150, 50, 50));
    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor]CGColor]);
    CGContextFillPath(ctx);
    
}*/







@end
