

#import <UIKit/UIKit.h>

@class WallViewController;
@class UIViewExtention;
@class MessageModel;

@interface FlipViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    WallViewController *viewController;
}

+ (FlipViewAppDelegate *) instance;
-(void)showViewInFullScreen:(UIViewExtention*)viewToShow withModel:(MessageModel*)model;
-(void)closeFullScreen;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) WallViewController *viewController;

@end

