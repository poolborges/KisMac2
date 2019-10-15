/*
 
 File:			BINSExtensions.m
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

#import "BINSExtensions.h"

static BOOL _alertDone;

@implementation NSWindow(BIExtension)

- (void)alertSheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
{
	_alertDone = YES;
}

- (void)showAlertMessage:(NSString *)msg title:(NSString *)title button:(NSString *)button
{
	NSAlert *alert = [[NSAlert alloc] init];
	alert.messageText = title;
	alert.informativeText = msg;
	
	[alert addButtonWithTitle:button];
	[alert setAlertStyle:NSCriticalAlertStyle];
	
	__weak typeof(self) weakSelf = self;
	[alert beginSheetModalForWindow:self completionHandler:^(NSModalResponse returnCode) {
		[weakSelf alertSheetDidEnd:weakSelf returnCode:returnCode contextInfo:nil];
	}];
}

@end

@implementation NSString(BIExtension)

- (NSString*)standardPath
{
	if ([self length] > 2 && [[self substringToIndex:2] isEqualToString:@"/:"])
	{
		NSMutableString *path = [NSMutableString stringWithString:[self substringFromIndex:1]];
		[path replaceOccurrencesOfString:@"/" withString:@">" options:0 range:NSMakeRange(0, [path length])];
		[path replaceOccurrencesOfString:@":" withString:@"/" options:0 range:NSMakeRange(0, [path length])];
		[path replaceOccurrencesOfString:@">" withString:@":" options:0 range:NSMakeRange(0, [path length])];
		
		return path;
	}
	
	return [self stringByStandardizingPath];
}

@end


@implementation NSNotificationCenter(BIExtension)

+ (void)postNotification:(NSString*)notificationName
{
	[[NSNotificationCenter defaultCenter] postNotificationName:notificationName
														object:nil];
}

@end

@implementation NSObject(BIExtension)

- (void)unsubscribeNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

@implementation NSThread(BIExtension) 

+ (void)sleep:(NSTimeInterval)seconds
{
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:seconds]];
}

@end
