#import <AppKit/NSButtonCell.h>

typedef enum {
  DubstepScrollerArrowLeft,
  DubstepScrollerArrowRight,
  DubstepScrollerArrowUp,
  DubstepScrollerArrowDown
} DubstepScrollerArrowType;

@interface DubstepScrollerArrowCell : NSButtonCell
{
  DubstepScrollerArrowType scroller_arrow_type;
}
-(void) setArrowType: (DubstepScrollerArrowType) t;
@end

