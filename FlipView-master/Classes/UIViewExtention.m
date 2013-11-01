

#import "UIViewExtention.h"


@implementation UIViewExtention

@synthesize currrentInterfaceOrientation,isFullScreen,originalRect,isMediaAndTextCapable;

-(void)rotate:(UIInterfaceOrientation)interfaceOrientation animation:(BOOL)animation{
	currrentInterfaceOrientation = interfaceOrientation;

	[self reAdjustLayout];
}

-(void)reAdjustLayout {
	//view extending this class can overide this method
}

-(void)showFullScreen {
	//view extending this class can overide this method
}

-(void)closeFullScreen {
	//view extending this class can overide this method
}

@end
