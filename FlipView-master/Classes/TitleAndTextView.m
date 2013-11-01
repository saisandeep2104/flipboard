/*
 - This module is licensed under the MIT license.
 -
 - Copyright (C) 2011 by raw engineering
 -
 - Permission is hereby granted, free of charge, to any person obtaining a copy
 - of this software and associated documentation files (the "Software"), to deal
 - in the Software without restriction, including without limitation the rights
 - to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 - copies of the Software, and to permit persons to whom the Software is
 - furnished to do so, subject to the following conditions:
 -
 - The above copyright notice and this permission notice shall be included in
 - all copies or substantial portions of the Software.
 -
 - THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 - IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 - FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 - AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 - LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 - OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 - THE SOFTWARE.
 -
-//
-//  TitleAndTextView.m
-//  FlipView
-//
-//  Created by Reefaq Mohammed on 16/07/11.
 */

#import "TitleAndTextView.h"
#import "MessageModel.h"

@implementation TitleAndTextView

@synthesize messageModel;

- (id) initWithMessageModel:(MessageModel*)messagemodel{
	if (self = [super init]) {
		self.messageModel = messagemodel;
		[self initializeFields];
		
		UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
		[self addGestureRecognizer:tapRecognizer];
		[tapRecognizer release];

	}
	return self;
}

- (void)reAdjustLayout{

	[contentView setFrame:CGRectMake(1, 1, self.frame.size.width-2, self.frame.size.height - 2)];
	
	CGSize contentViewArea = CGSizeMake((contentView.frame.size.width - 20), (contentView.frame.size.height-30));
	
	
    [messageLabel setFrame:CGRectMake(someImageView.frame.origin.x ,(someImageView.frame.origin.y + someImageView.frame.size.height), contentViewArea.width, contentViewArea.height - (someImageView.frame.origin.y + someImageView.frame.size.height))];
    
	[messageLabel setText:messageModel.content];
//	messageLabel.contentMode = UITextAlignmentLeft;

}

- (void) initializeFields {
   
    /*************
    *
    *I am trying to set the CGRectMake of the image as the height and width of the view so I make these floats. Just to make sure this would acutally adjust size I am manually setting the values of the floats. working on dynamic sizing
    *
    **************/
   /* float talls = self.frame.size.height;
    float wides = self.frame.size.width;
    
    talls = 350;
    wides = 350;
    */
    
    contentView = [[UIView alloc] init];
	[contentView setBackgroundColor:[UIColor whiteColor]];
	contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

/*****  init with image sets background *****/
    someImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:messageModel.someImage]];
	someImageView.image = [UIImage imageNamed:messageModel.someImage];
	[someImageView setFrame:CGRectMake(10, 10, 360, 300)];
	[contentView addSubview:someImageView];

	userNameLabel = [[UILabel alloc] init];
//  this was displaying a null value
	userNameLabel.font =[UIFont fontWithName:@"Helvetica" size:25];
	[userNameLabel setTextColor:RGBCOLOR(2,90,177)];
	[userNameLabel setBackgroundColor:[UIColor clearColor]];
	[contentView addSubview:userNameLabel];
	
    messageLabel = [[UILabel alloc] init];
	messageLabel.font = [UIFont fontWithName:@"Helvetica" size:20];
	messageLabel.textColor =  RGBCOLOR(33,33,33);
	messageLabel.highlightedTextColor = RGBCOLOR(33,33,33);
	messageLabel.contentMode = UIViewContentModeCenter;
	[messageLabel setBackgroundColor:[UIColor whiteColor]];
	messageLabel.numberOfLines = 0;
	[contentView addSubview:messageLabel];
	
	[self addSubview:contentView];
	
	[self reAdjustLayout];
}

-(void)tapped:(UITapGestureRecognizer *)recognizer {
	[[FlipViewAppDelegate instance] showViewInFullScreen:self withModel:self.messageModel];
}


-(void) setFrame:(CGRect)rect {
		self.originalRect = rect;
		[super setFrame:rect];
}

- (void) dealloc{
	[messageModel release];
	[contentView release];
    [someImageView release];
	[messageLabel release];
	[super dealloc];
}


@end
