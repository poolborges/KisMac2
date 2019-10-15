/*
 
 File:			BIToolbarView.m
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

#import "BIToolbarView.h"

@interface BIToolbarView ()

@property(nonatomic, strong) NSColor *startingColor;
@property(nonatomic, strong) NSColor *middleColor;
@property(nonatomic, strong) NSColor *endingColor;

@end

@implementation BIToolbarView

- (id)initWithFrame:(NSRect)frame
{
	self = [super initWithFrame:frame];
	if (self)
	{
		// Initialization code here.
		[self setStartingColor:[NSColor colorWithCalibratedWhite:0.372 alpha:1.000]];
		[self setMiddleColor:[NSColor colorWithCalibratedWhite:0.250 alpha:1.000]];
		[self setEndingColor:[NSColor colorWithCalibratedWhite:0.404 alpha:1.000]];
	}
	return self;
}

- (void)drawRect:(NSRect)rect
{
	if (_endingColor == nil || [_startingColor isEqual:_endingColor])
	{
		// Fill view with a standard background color
		[_startingColor set];
		NSRectFill(rect);
	}
	else
	{
		// Fill view with a top-down gradient
		// from startingColor to endingColor
		NSGradient* aGradient = [[NSGradient alloc] initWithColors:@[_startingColor, _middleColor, _endingColor]];
		[aGradient drawInRect:[self bounds] angle:90];
	}
}

@end
