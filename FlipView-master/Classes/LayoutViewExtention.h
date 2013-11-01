

#import <Foundation/Foundation.h>
@class HeaderView;
@class FooterView;

@interface LayoutViewExtention : UIView {
	UIInterfaceOrientation currrentInterfaceOrientation;
	BOOL isFullScreen;	
	HeaderView* headerView;
	FooterView* footerView;

}
-(void)initalizeViews:(NSDictionary*)viewCollectionDictonary;
-(void)rotate:(UIInterfaceOrientation)interfaceOrientation animation:(BOOL)animation;
-(void)reAdjustLayout;

@property (nonatomic,readonly) UIInterfaceOrientation currrentInterfaceOrientation;
@property (nonatomic,assign) BOOL isFullScreen;
@property (nonatomic,retain) HeaderView* headerView;
@property (nonatomic,retain) FooterView* footerView;


@end
