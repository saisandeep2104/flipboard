

#import <Foundation/Foundation.h>

@interface HeaderView : UIView {
	UIInterfaceOrientation currrentInterfaceOrientation;
	NSString* wallTitleText;
	UILabel* wallNameLabel;
}
@property (nonatomic,readonly) UIInterfaceOrientation currrentInterfaceOrientation;
@property (nonatomic,retain) NSString* wallTitleText;
-(void)rotate:(UIInterfaceOrientation)interfaceOrientation animation:(BOOL)animation;

@end
