//
//  OptionsViewController.h
//  CustumImageDrawings
//
//  Created by Hadi Hatunoglu on 24/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^BlockSendingToolType)(int k);

@protocol sliderProtocol <NSObject>
@required
-(void)sliderValue:(int)sliderVal;
-(void)toolSelected:(NSInteger)buttonTag;


@end
@interface OptionsViewController : UIViewController
{
    id<sliderProtocol> __unsafe_unretained delegate1;
}

@property(unsafe_unretained) id<sliderProtocol> delegate1;
-(IBAction)btnClicked:(UIButton*)sender;

-(void)selectedToolInPopOverUsingBlock:(BlockSendingToolType)BlockTag;
@end
