//
//  ViewController.m
//  贝塞尔曲线
//
//  Created by ifly on 2017/3/8.
//  Copyright © 2017年 Meiyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //self.view.backgroundColor = [UIColor grayColor];
    
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(20, 20)];
    [linePath addLineToPoint:CGPointMake(160, 150)];
    [linePath addLineToPoint:CGPointMake(180, 50)];
    [linePath closePath];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.bounds = CGRectMake(0, 0, 200, 200);
    lineLayer.backgroundColor = [UIColor grayColor].CGColor;
    lineLayer.position = CGPointMake(150, 150);
    lineLayer.lineWidth = 2.0;
    lineLayer.strokeColor = [UIColor orangeColor].CGColor;
    lineLayer.path = linePath.CGPath;
    lineLayer.fillColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:lineLayer];
    
    UILabel *titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 200, 2, 2)];
    titileLabel.backgroundColor = [UIColor blackColor];
    [self.view addSubview:titileLabel];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 250, 200, 200)];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.bounds = CGRectMake(0, 250, 200, 200);
    pathLayer.position = CGPointMake(140, 400);
    pathLayer.lineWidth = 2.0;
    pathLayer.strokeColor = [UIColor redColor].CGColor;
    pathLayer.path = path.CGPath;
    pathLayer.fillColor = [UIColor lightGrayColor].CGColor;
    [self.view.layer addSublayer:pathLayer];
    
    
    //贝塞尔曲线 关键帧动画
    //画圆弧
    UIBezierPath *readPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(140, 520) radius:100 startAngle:M_PI_4 endAngle:M_PI / 4 * 7 clockwise:YES];
    CAShapeLayer *readLayer = [CAShapeLayer layer];
    readLayer.lineWidth = 2.0;
    readLayer.strokeColor = [UIColor redColor].CGColor;
    readLayer.fillColor = nil;
    readLayer.path = readPath.CGPath;
    [self.view.layer addSublayer:readLayer];

    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(200, 400, 200, 200)];
    //redView.transform = CGAffineTransformMakeRotation(M_PI_4);
    redView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:redView];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = redView.bounds;
    UIBezierPath *shapePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(redView.bounds.size.width / 2, redView.bounds.size.height / 2) radius:100 startAngle:M_PI_4 endAngle:M_PI / 4 * 7 clockwise:YES];
//    UIBezierPath *shapePath = [UIBezierPath bezierPathWithOvalInRect:redView.bounds];
    shapeLayer.path = shapePath.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [redView.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 10.f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];
}



- (CGFloat)cubicEaseInOut:(CGFloat)number {
    
    if (number < 0.5) {
        return 4 * number * number * number;
    } else {
        CGFloat f = ((2 * number) - 2);
        return 0.5 * f * f * f;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
