

#import "LayoutViewExtention.h"


@implementation LayoutViewExtention

@synthesize currrentInterfaceOrientation,isFullScreen,headerView,footerView;

-(void)rotate:(UIInterfaceOrientation)interfaceOrientation animation:(BOOL)animation{
	currrentInterfaceOrientation = interfaceOrientation;
	
	[self reAdjustLayout];
}

-(void) setFooterView:(FooterView *)footerview {
	footerView = [footerview retain];
	[self addSubview:(UIView*)footerview];
}

-(void) setHeaderView:(HeaderView *)headerview {
	headerView = [headerview retain];
	[self addSubview:(UIView*)headerview];
}


-(void)reAdjustLayout {
	//view extending this class can overide this method
}

-(void)initalizeViews:(NSDictionary*)viewCollectionDictonary {
	//view extending this class can overide this method
}

-(void) dealloc {
	[headerView release];
	[footerView release];
	[super dealloc];
}


@end
