/*
 
 File:			BIDecompressor.m
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

#import "BIDecompressor.h"
#import "BINSExtensions.h"

@implementation BIDecompressor

- (id)initWithFile:(NSString*)file
{
	uint32_t magic = 0;
	
	self = [super init];
	if (!self)
	{
		return nil;
	}
	
	_file = gzopen([[file standardPath] UTF8String], "rb");
	if (!_file) {
		return nil;
	}
	
	if (gzread(_file, &magic, sizeof(magic)) != sizeof(magic)
		|| CFSwapInt32BigToHost(magic) != 'BIGe')
	{
		NSLog(@"Invalid magic cookie");
		
		return nil;
	}
	
	return self;
}

- (NSString*)nextString
{
	uint32_t size = 0;
	UInt8* data = 0;
	NSString *str = @"";
	
	if (gzread(_file, &size, sizeof(size)) != sizeof(size))
	{
		return nil;
	}
	
	size = CFSwapInt32BigToHost(size);
	
	if (size & 0x80000000)
	{
		NSLog(@"Encoded too large item for this method");
		
		return nil;
	}
	
	data = new UInt8[size+1];
	if (gzread(_file, data, size) != (NSInteger)size)
	{
		NSLog(@"Damaged Dataset");
		delete [] data;
		
		return nil;
	}
	data[size] = 0;
	
	str = @((const char*)data);
	delete [] data;
	
	return str;
}

- (NSData*)nextData
{
	uint32_t size = 0, read = 0, thisRead = 1;
	UInt8* data = 0;
	NSData *str = nil;
	
	if (gzread(_file, &size, sizeof(size)) != sizeof(size))
	{
		return nil;
	}
	
	size = CFSwapInt32BigToHost(size);
	
	if (size & 0x80000000)
	{
		NSLog(@"Encoded too large item for this method");
		
		return nil;
	}
	
	data = new UInt8[size];
	
	while( (read != size) && (thisRead > 0) )
	{
		thisRead = gzread(_file, data, size);
		read += thisRead;
	}
	if (read != size)
	{
		NSLog(@"Damaged Dataset");
		delete [] data;
		
		return nil;
	}
	
	str = [NSData dataWithBytes:data length:size];
	delete [] data;
	
	return str;
}

- (void)close
{
	gzclose(_file);
}

@end
