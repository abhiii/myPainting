//
//  OptionsViewController.m
//  CustumImageDrawings
//
//  Created by Hadi Hatunoglu on 24/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()
{
    UISlider *slider;
}
@end

@implementation OptionsViewController
@synthesize delegate1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    slider=[[UISlider alloc]initWithFrame:CGRectMake(10, 50, 150, 50)];
    slider.minimumValue=1.0;
    slider.maximumValue=15;
    [slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)methodCalled
{
    
    NSLog(@"method called");
}

-(int)sliderChanged
{
    
    int sliderValue=(int)ceilf(slider.value);
    NSLog(@"sliderValue is %d",sliderValue);
    [self.delegate1 sliderValue:sliderValue];
   // BlockTag(sliderValue);

    return sliderValue;
    
}

-(void)selectedToolInPopOverUsingBlock:(BlockSendingToolType)BlockTag
{
       
    BlockTag(0);
    
}

-(IBAction)btnClicked:(UIButton*)sender
{

    [self.delegate1 toolSelected:sender.tag];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
