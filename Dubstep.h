#import <AppKit/AppKit.h>
#import <Foundation/NSUserDefaults.h>
#import <GNUstepGUI/GSTheme.h>

@interface Dubstep: GSTheme
{  
  NSUserDefaults *defaults;
}
- (void)drawPathButton:(NSBezierPath *)path
                    in:(NSView *)view
                 state:(GSThemeControlState)state;
@end

