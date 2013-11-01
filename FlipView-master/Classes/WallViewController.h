

#import <UIKit/UIKit.h>
#import "AFKPageFlipper.h"
#import "MessageModel.h"
#import "FullScreenView.h"

@interface WallViewController : UIViewController <AFKPageFlipperDataSource> {
	NSMutableArray* viewControlerStack;	
	AFKPageFlipper *flipper;
	UIViewExtention* viewToShowInFullScreen;
	FullScreenView* fullScreenView;
	UIView* fullScreenBGView;
	NSString* wallTitle;
	BOOL isInFullScreenMode;
	NSMutableArray* messageArrayCollection;
}

-(void)showViewInFullScreen:(UIViewExtention*)viewToShow withModel:(MessageModel*)model;
-(void)closeFullScreen;
-(void)buildPages:(NSArray*)messagesArray;

@property (nonatomic, assign) NSMutableArray* viewControlerStack;
@property (nonatomic, assign) UIGestureRecognizer* gestureRecognizer;
@property (nonatomic, retain) NSString* wallTitle;

@end
