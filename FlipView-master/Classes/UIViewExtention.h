

#import <Foundation/Foundation.h>


@interface UIViewExtention : UIView {
	UIInterfaceOrientation currrentInterfaceOrientation;
	BOOL isFullScreen;	
	CGRect originalRect;
	BOOL isMediaAndTextCapable;
	
}
-(void)rotate:(UIInterfaceOrientation)interfaceOrientation animation:(BOOL)animation;
-(void)reAdjustLayout;

-(void)showFullScreen;
-(void)closeFullScreen;

@property (nonatomic,readonly) UIInterfaceOrientation currrentInterfaceOrientation;
@property (nonatomic,assign) BOOL isFullScreen;
@property (nonatomic,assign) BOOL isMediaAndTextCapable;
@property (nonatomic,assign) CGRect originalRect;
@end
