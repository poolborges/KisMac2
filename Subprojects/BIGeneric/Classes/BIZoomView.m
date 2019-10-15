/*
 
 File:			BIZoomView.m
 Program:		BIGeneric
 Author:		Michael Roßberg
                mick@binaervarianz.de
 Changes:       Vitalii Parovishnyk(1012-2015)
 
 Description:	This framework provides abstract Cocoa methods to quickly draw 2D sprites
 
 This file is part of BIGL.
 
 BIGL is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 BIGL is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with BIGL; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#import "BIZoomView.h"
#import <BIGL/BIGL.h>

@implementation BIZoomView

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (!self)
	{
		return nil;
	}
		
    [self setAutoresizesSubviews:YES];
    [self setBackgroundColor:[NSColor whiteColor]];
    
    return self;
}

- (void)doZoom:(NSObject*)o
{
    @autoreleasepool
	{
        for (CGFloat i = 0.0; i < self.frame.size.width; i+=10)
		{
            [_v2 setLocation:NSMakePoint(self.frame.size.width-i, 0)];
            [_v1 setLocation:NSMakePoint(-i, 0)];
            [self setNeedsDisplay:YES];
            [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.05]]; 
        }
    }
}

- (void)zoomFrom:(NSView*)oldV to:(NSView*)newV
{
    NSImage *v1 = nil, *v2 = nil;
    NSInteger i = 0;
    
    [newV setFrame:[oldV frame]];
    
    if ([oldV respondsToSelector:@selector(dataWithTIFFInsideRect:)])
	{
        v1 = [[NSImage alloc] initWithData:[(BIGLView*)oldV dataWithTIFFInsideRect:self.frame]];
    }
	else
	{
        v1 = [[NSImage alloc] initWithData:[oldV dataWithPDFInsideRect:self.frame]];
    }
	
    if ([newV respondsToSelector:@selector(dataWithTIFFInsideRect:)])
	{
        v2 = [[NSImage alloc] initWithData:[(BIGLView*)newV dataWithTIFFInsideRect:self.frame]];
    }
	else
	{
        v2 = [[NSImage alloc] initWithData:[newV dataWithPDFInsideRect:self.frame]];
    }

    _v1 = [[BIGLImageView alloc] initWithImage:v1];
    _v2 = [[BIGLImageView alloc] initWithImage:v2];
    
    [self addSubView:_v1];
    [self addSubView:_v2];
    
    [_v1 setLocation:CGPointZero];
    [_v2 setLocation:CGPointMake(self.frame.size.height, 0)];
    
    for (i = 0; i < self.frame.size.height; i+=20)
	{
        [_v1 setLocation:CGPointMake(0, i)];
        [_v2 setLocation:CGPointMake(0, i - self.frame.size.height)];
        [self display];
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.02]]; 
    }

    [_v1 setLocation:CGPointMake(0, self.frame.size.height)];
    [_v2 setLocation:CGPointZero];
    [self display];
}

- (void)cleanUpZoom
{
    [self removeSubView:_v1];
    [self removeSubView:_v2];
}

@end
