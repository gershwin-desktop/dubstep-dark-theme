#import <AppKit/AppKit.h>
#import <AppKit/GSWindowDecorationView.h>

@interface DubstepWindowDecorationView : GSWindowDecorationView
{
  BOOL hasTitleBar, hasResizeBar, hasCloseButton, hasMiniaturizeButton;
  BOOL isTitled; //, hasToolbar, hasMenu;
  NSRect titleBarRect;
  NSRect resizeBarRect;
  NSRect closeButtonRect;
  NSRect miniaturizeButtonRect;
  NSRect zoomButtonRect;

  NSButton *closeButton, *miniaturizeButton;
  NSButton *zoomButton;
}

- (BOOL) pointInContentRect:(NSPoint)point;
- (BOOL) pointInTitleBarRect:(NSPoint)point;
- (BOOL) pointInResizeBarRect:(NSPoint)point;
- (GSResizeEdgeMode) resizeModeForPoint:(NSPoint)point;
- (void) _themeDidActivate: (NSNotification*)notification;
@end