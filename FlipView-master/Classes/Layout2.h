

#import <Foundation/Foundation.h>
#import "LayoutViewExtention.h"
@class UIViewExtention;

@interface Layout2 : LayoutViewExtention {
	UIViewExtention* view1;
	UIViewExtention* view2;
}
@property (nonatomic,retain) UIViewExtention* view1;
@property (nonatomic,retain) UIViewExtention* view2;

@end
