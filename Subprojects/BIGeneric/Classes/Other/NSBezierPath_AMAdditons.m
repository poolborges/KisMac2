//
//  NSBezierPath_AMAdditons.m
//  PlateControl
//
//  Created by Andreas on Sun Jan 18 2004.
//  Copyright (c) 2004 Andreas Mayer. All rights reserved.
//

#import "NSBezierPath_AMAdditons.h"


@implementation NSBezierPath (AMAdditons)

+ (NSBezierPath *)bezierPathWithPlateInRect:(NSRect)rect
{
	NSBezierPath *result = [[NSBezierPath alloc] init];
	[result appendBezierPathWithPlateInRect:rect];
	
	return result;
}

- (void)appendBezierPathWithPlateInRect:(NSRect)rect
{
	if (rect.size.height > 0)
	{
		CGFloat xOff = rect.origin.x;
		CGFloat yOff = rect.origin.y;
		CGFloat radius = rect.size.height * 0.5;
		
		NSPoint point4 = NSMakePoint(xOff+radius, yOff+rect.size.height);
		NSPoint center1 = NSMakePoint(xOff+radius, yOff+radius);
		NSPoint center2 = NSMakePoint(xOff+rect.size.width-radius, yOff+radius);
		
		[self moveToPoint:point4];
		[self appendBezierPathWithArcWithCenter:center1 radius:radius startAngle:90.0 endAngle:270.0];
		[self appendBezierPathWithArcWithCenter:center2 radius:radius startAngle:270.0 endAngle:90.0];
		[self closePath];
	}
}


@end
