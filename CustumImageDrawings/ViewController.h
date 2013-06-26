//
//  ViewController.h
//  CustumImageDrawings
//
//  Created by Hadi Hatunoglu on 12/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawingClass.h"
#import "OptionsViewController.h"
#define pen 1
#define Eraser 2
#define Stamp 3
typedef int (^ButtonTag)(int);
@interface ViewController : UIViewController<sliderProtocol>
{
    UIToolbar *toolbar;
    NSInteger toolSelected;
    BOOL boolEraser;
    CGPoint currentPoint;
    CGPoint previousPoint1;
    CGPoint previousPoint2;
    OptionsViewController *optionsObj;
    ButtonTag ButtonBlock;
}
-(void)settingsOptionWithBlock:(ButtonTag)block;
- (IBAction)newCanvas:(id)sender;
@end
