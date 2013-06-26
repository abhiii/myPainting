//
//  ViewController.m
//  CustumImageDrawings
//
//  Created by Hadi Hatunoglu on 12/06/13.
//  Copyright (c) 2013 Hadi Hatunoglu. All rights reserved.
//

#import "ViewController.h"
#import "FPPopoverController.h"
@interface ViewController ()
{
    UIImageView *canvas;
    CGPoint beganPoints;
   // CGContextRef ctx;
    NSInteger rubber;
    UISlider *slider;
    int lineWidth;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lineWidth=4;
    toolSelected=pen;
   
    [self toolBarItems];
    optionsObj=[[OptionsViewController alloc]initWithNibName:@"OptionsViewController" bundle:nil];
    optionsObj.delegate1=self;
    //adding slider for the view
      toolbar.barStyle=UIBarStyleBlackOpaque;
    [self.view addSubview:toolbar];
    
    
    if ([UIScreen mainScreen].bounds.size.height==1024) {
        canvas=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 768,900)];

    }
    else
    {
        canvas=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];

        
    }
      
    //ctx=UIGraphicsGetCurrentContext();
    [canvas setUserInteractionEnabled:YES];
    //canvas.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpeg"]];
    [self.view addSubview:canvas];
    
    
   // [self createNewCanvas];

	// Do any additional setup after loading the view, typically from a nib.
}


-(void)createNewCanvas
{
    UIGraphicsBeginImageContext(canvas.frame.size);
   
}

-(CGContextRef)setContext
{
    CGContextRef ctx = NULL;
    return ctx;
}

CGPoint midPoint(CGPoint p1, CGPoint p2) {
    return CGPointMake((p1.x + p2.x) * 0.5, (p1.y + p2.y) * 0.5);
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch=[touches anyObject];
    CGPoint points=[touch locationInView:self.view];
    previousPoint1=[touch previousLocationInView:self.view];
    previousPoint2 = [touch previousLocationInView:self.view];
    beganPoints=[touch locationInView:self.view];

    NSLog(@"touch startef=d");
    if (toolSelected==Stamp) {
        UIImageView *imgv=[[UIImageView alloc]init];
        imgv.frame=CGRectMake(points.x, points.y, 30, 30);
        imgv.image=[UIImage imageNamed:@"images.jpeg"];
        [canvas addSubview:imgv];
        //canvas.image =[UIImage imageNamed:@"my_sign.png"];
    
    }
       
//    UITouch *touch = [touches anyObject];
//    
//    previousPoint1 = [touch previousLocationInView:self.view];
//    previousPoint2 = [touch previousLocationInView:self.view];
//    currentPoint = [touch locationInView:self.view];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch moving");
    if (toolSelected==Stamp) {
        
    }
    else
    {

    //UITouch *touch=[touches anyObject];
    UITouch *touch=[[event allTouches]anyObject];

    CGPoint touchpoints=[touch locationInView:self.view];
    NSLog(@"%f and %f ",touchpoints.x,touchpoints.y);
    
    if (touch.view==canvas) {
        
        UIGraphicsBeginImageContext(CGSizeMake(canvas.frame.size.width, canvas.frame.size.height));
    //UIGraphicsBeginImageContext(canvas.frame.size);
    [canvas.image drawInRect:CGRectMake(0, 0, canvas.frame.size.width   ,canvas.frame.size.height)];
    CGContextRef ctx=UIGraphicsGetCurrentContext();
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        CGContextSetLineCap(ctx, kCGLineCapRound);
        CGContextSetBlendMode(ctx, kCGBlendModeDarken);
        if (toolSelected==Eraser) {
            CGContextSetLineWidth(ctx, lineWidth);
            CGContextSetRGBStrokeColor(ctx, 0.25, 0.25, 0.25, 1.0);
            CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
        }
        else{
            CGContextSetLineWidth(ctx, lineWidth);

            CGContextSetStrokeColorWithColor(ctx,[UIColor purpleColor].CGColor);

        }
        
        previousPoint2 = previousPoint1;
        previousPoint1 = [touch previousLocationInView:self.view];
        currentPoint = [touch locationInView:self.view];
       // CGPoint mid1 = midPoint(previousPoint1, previousPoint2);
        CGPoint mid2 = midPoint(currentPoint, previousPoint1);
       
    CGContextMoveToPoint(ctx, beganPoints.x, beganPoints.y);
    CGContextAddLineToPoint(ctx, touchpoints.x, touchpoints.y);
        CGContextSetFlatness(ctx, 0.8);
    CGContextAddQuadCurveToPoint(ctx, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
    CGContextStrokePath(ctx);
    canvas.image=UIGraphicsGetImageFromCurrentImageContext();
        beganPoints=touchpoints;
    UIGraphicsEndImageContext();
    
//    UITouch *touch = [touches anyObject];
//    
//    previousPoint2 = previousPoint1;
//    previousPoint1 = [touch previousLocationInView:self.view];
//    currentPoint = [touch locationInView:self.view];
//    
//    
//    // calculate mid point
//    CGPoint mid1 = midPoint(previousPoint1, previousPoint2);
//    CGPoint mid2 = midPoint(currentPoint, previousPoint1);
//    
//    UIGraphicsBeginImageContext(canvas.frame.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [canvas.image drawInRect:CGRectMake(0, 0, canvas.frame.size.width, canvas.frame.size.height)];
//    
//    CGContextMoveToPoint(context, mid1.x, mid1.y);
//    // Use QuadCurve is the key
//    CGContextAddQuadCurveToPoint(context, previousPoint1.x, previousPoint1.y, mid2.x, mid2.y);
//    CGContextSetLineCap(context, kCGLineCapRound);
//    
////    if (boolEraser) {
////                  CGContextSetLineWidth(context, lineWidth);
////                  CGContextSetRGBStrokeColor(context, 0.25, 0.25, 0.25, 1.0);
////                  CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeClear);
////              }
//
//    CGContextSetLineWidth(context, lineWidth);
//    //CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
//    CGContextSetStrokeColorWithColor(context,[UIColor purpleColor].CGColor);
//
//    CGContextStrokePath(context);
//    canvas.image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    }
    }
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newCanvas:(id)sender {
    [self viewDidLoad];
    
}


#pragma mark toolBar Items
    
-(void)toolBarItems{
     toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-88, self.view.frame.size.width, 45)];
    UIBarButtonItem *eraser=[[UIBarButtonItem alloc]initWithTitle:@"options" style:UIBarButtonItemStyleBordered target:self action:@selector(eraserClicked:)];
    
    UIBarButtonItem *save=[[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleBordered target:self action:@selector(saveToPhotosAlbum)];
    [toolbar setItems:[NSArray arrayWithObjects:eraser,save, nil]];
    

    
}
-(void)saveToPhotosAlbum{
    
    UIImageWriteToSavedPhotosAlbum(canvas.image, nil, nil, nil);
}

-(void)eraserClicked:(UIButton*)tagValue{
    boolEraser=YES;

    FPPopoverController *pop=[[FPPopoverController alloc]initWithViewController:optionsObj];
    pop.contentSize=CGSizeMake(200, 300);
    [pop presentPopoverFromPoint:CGPointMake(100,800)];
    
    [optionsObj selectedToolInPopOverUsingBlock:^(int k) {
        NSLog(@"teh returned value is %d",lineWidth);
        
    }];
    

    
    
    

        
        
    
}


-(void)settingsOptionWithBlock:(ButtonTag)block
{
    
    
}

-(void)sliderValue:(int)sliderVal
{
    lineWidth=sliderVal;
}

-(void)toolSelected:(NSInteger)buttonTag
{
    toolSelected =buttonTag;
}
@end
