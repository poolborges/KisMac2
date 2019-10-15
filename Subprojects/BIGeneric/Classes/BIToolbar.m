/*
 
 File:			BIToolbar.m
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

#import "BIToolbar.h"
#import "BIToolbarView.h"

@implementation BIToolbar

- (id)initWithIdentifier:(NSString *)identifier
{
	self = [super initWithIdentifier:identifier];
	if (!self)
	{
		return nil;
	}
	
	[self setAllowsUserCustomization:NO];
	
	return self;
}

- (void)_setToolbarView:(id)view
{
	BIToolbarView *b = [[BIToolbarView alloc] initWithFrame:NSMakeRect(0, 0, MAXFLOAT, MAXFLOAT)];
	[view addSubview:b positioned:NSWindowBelow relativeTo:nil];
	[super _setToolbarView:view];
}

@end
