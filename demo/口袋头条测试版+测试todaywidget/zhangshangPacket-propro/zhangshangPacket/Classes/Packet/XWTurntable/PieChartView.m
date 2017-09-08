//
//  PieChartView.m
//  zhangshangPacket
//
//  Created by apple on 2017/5/28.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "PieChartView.h"
#import <QuartzCore/QuartzCore.h>


@implementation PieChartView
@synthesize delegate;
@synthesize datasource;


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)reloadData
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    //prepare
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat theHalf = rect.size.width/2;
    CGFloat lineWidth = theHalf;
    if ([self.delegate respondsToSelector:@selector(centerCircleRadius)])
    {
        lineWidth -= [self.delegate centerCircleRadius];
        NSAssert(lineWidth <= theHalf, @"wrong circle radius");
    }
    CGFloat radius = theHalf-lineWidth/2;
    
    CGFloat centerX = theHalf;
    CGFloat centerY = rect.size.height/2;
    
    //drawing
    
    double sum = 0.0f;
    int slicesCount = [self.datasource numberOfSlicesInPieChartView:self];
    
    for (int i = 0; i < slicesCount; i++)
    {
        sum += [self.datasource pieChartView:self valueForSliceAtIndex:i];
    }
    
    ///起始位置
    float startAngle = - M_PI/slicesCount;
    float endAngle = 0.0f;
    
    for (int i = 0; i < slicesCount; i++)
    {
        double value = [self.datasource pieChartView:self valueForSliceAtIndex:i];
        
        endAngle = startAngle + M_PI*2*value/sum;
        CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, false);
        
        UIColor  *drawColor = [self.datasource pieChartView:self colorForSliceAtIndex:i];
        
        CGContextSetStrokeColorWithColor(context, drawColor.CGColor);
        CGContextSetLineWidth(context, lineWidth);
        CGContextStrokePath(context);
        startAngle += M_PI*2*value/sum;
    }
}






@end
