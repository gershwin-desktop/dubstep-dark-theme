#import <AppKit/AppKit.h>
#import "Dubstep.h"

@implementation Dubstep

// Define global colors
// static NSColor *defaultForegroundColor = nil;
// static NSColor *defaultBackgroundColor = nil;
// static NSColor *statusBarBackgroundColor = nil;
// Initialize theme colors
// static NSColor *defaultForegroundColor = [NSColor colorWithCalibratedRed:1.0 green:1.0 blue:1.0 alpha:1.0];
// static NSColor *defaultBackgroundColor = [NSColor colorWithCalibratedRed:0.2 green:0.2 blue:0.2 alpha:1.0];
// static NSColor *statusBarBackgroundColor = [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];


- (void)setUp
{
    // Additional setup code for your theme, if needed
}

// Custom Props

- (NSColor*)statusBarBackgroundColor
{
  return [NSColor colorWithCalibratedRed:0.2 green:0.2 blue:0.25 alpha:1.0];
  // return [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];
}

// - (CGFloat)menuPadding
// {
//   return 16.0;
// }
// END Custom Props

// Override the getter for menuShouldShowIcon
- (BOOL)menuShouldShowIcon {
    return false;
}

/*- (CGFloat)menuBarHeight {
    return 32.0;
}

- (CGFloat)menuSeparatorHeight {
    return 0.0;
}*/

- (CGFloat)menuSeparatorInset {
    return 0.0;
}

/*- (CGFloat)menuItemHeight {
    return 28.0;
}*/

- (NSColor*)menuItemBackgroundColor {
    // return statusBarBackgroundColor;
    // return [NSColor blackColor];
    return [self statusBarBackgroundColor];
}

- (NSColor*)menuBackgroundColor {
    // return statusBarBackgroundColor;
    // return [NSColor blackColor];
    return [self statusBarBackgroundColor];
}

/*- (NSColor*)menuBorderColor {
    return [NSColor blackColor];
}*/

- (NSColor*)menuBorderColorForEdge {
    return [NSColor blackColor];
}

- (NSColor *) menuBorderColor
{ 
  NSColor *color = [NSColor colorWithCalibratedRed: 0.212 green: 0.184 blue: 0.176 alpha: 1.0];
  return color;
}

/*
- (NSColor *) menuBackgroundColor
{
  //NSUserDefaults *theme_defaults = [NSUserDefaults standardUserDefaults];
  float transparency = [theme_defaults floatForKey:@"RikMenuBarTransparency"];    
  NSColor *color = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue: 0.992 alpha: transparency];
  return color;
}

- (NSColor *) menuItemBackgroundColor
{
  NSColor *color = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue: 0.992 alpha: 0.95];
  return color;
}*/

- (CGFloat) menuSubmenuHorizontalOverlap
{
  return 3;
}

- (float) titlbarPaddingLeft
{
  return 32.0f;
}

- (float) titlbarPaddingRight
{
  return 32.0f;
}

-(CGFloat) menuSubmenuVerticalOverlap
{
  return 0;
}

- (CGFloat) menuBarHeight
{
  return 32;
}

- (CGFloat) menuItemHeight
{
  return 28;
}
- (CGFloat) menuSeparatorHeight
{
  return 1;
}

- (void) drawMenuRect: (NSRect)rect
         inView: (NSView *)view
   isHorizontal: (BOOL)horizontal
      itemCells: (NSArray *)itemCells
{
  int         i = 0;
  int         howMany = [itemCells count];
  NSMenuView *menuView = (NSMenuView *)view;
  NSRect      bounds = [view bounds];

  NSRect r = NSIntersectionRect(bounds, rect);
  NSRectFillUsingOperation(bounds, NSCompositeClear);
  NSBezierPath * menuPath;
  NSColor *borderColor = [self menuBorderColor];
  [borderColor setStroke];

  // EXPERIMENTAL PADDING
  // CGFloat padding = [self menuPadding];

  if(horizontal == YES)
    {
      // Compensate for padding in the x-axis
      // bounds.origin.x += padding;
      // bounds.size.width -= 2 * padding;

      // here the semitrasparent status bar...
      menuPath = [NSBezierPath bezierPathWithRect:bounds];
      NSColor* fillColor = [self menuBackgroundColor];
      [fillColor setFill];
      NSRectFill(bounds);
      NSBezierPath* linePath = [NSBezierPath bezierPath];
      [linePath moveToPoint: NSMakePoint(bounds.origin.x, bounds.origin.y)];
      [linePath lineToPoint: NSMakePoint(bounds.origin.x+ bounds.size.width, bounds.origin.y)];
      [linePath setLineWidth: 1];
      [linePath stroke];
    }
  else
    {
      // here the vertical menus
      CGFloat radius = 6;
      menuPath = [NSBezierPath bezierPathWithRoundedRect: bounds
                                                 xRadius: radius
                                                 yRadius: radius];

      [[self menuBackgroundColor] setFill];
      [menuPath fill];

      NSBezierPath * strokemenuPath = [NSBezierPath bezierPathWithRoundedRect: bounds
                                                 xRadius: radius
                                                 yRadius: radius];
      [strokemenuPath stroke];
    }
  // Draw the menu cells.
  for (i = 0; i < howMany; i++)
    {
      NSRect aRect;
      NSMenuItemCell *aCell;
      aRect = [menuView rectOfItemAtIndex: i];
      if (NSIntersectsRect(rect, aRect) == YES)
        {
          // Compensate for padding in the x-axis
          // aRect.origin.x += padding;
          // aRect.size.width -= 2 * padding;
          aCell = [menuView menuItemCellForItemAtIndex: i];
          [aCell drawWithFrame: aRect inView: menuView];
        }
    }
}

- (void) drawBackgroundForMenuView: (NSMenuView*)menuView
                         withFrame: (NSRect)bounds
                         dirtyRect: (NSRect)dirtyRect
                        horizontal: (BOOL)horizontal
{
  NSString  *name = horizontal ? GSMenuHorizontalBackground :
    GSMenuVerticalBackground;

  NSRectEdge sides[4] = { NSMinXEdge, NSMaxYEdge, NSMaxXEdge, NSMinYEdge };


  [[self menuBackgroundColor] setFill];

  NSRect r = NSIntersectionRect(bounds, dirtyRect);
  NSRectFillUsingOperation(r, NSCompositeClear);
  NSBezierPath * roundedRectanglePath = [NSBezierPath bezierPathWithRoundedRect:r  xRadius: 4 yRadius: 4];
  //NSColor *borderColor = [self menuBorderColor];
  //[borderColor setStroke];
  [roundedRectanglePath fill];
  [roundedRectanglePath stroke];
}

- (void) drawBorderAndBackgroundForMenuItemCell: (NSMenuItemCell *)cell
                                      withFrame: (NSRect)cellFrame
                                         inView: (NSView *)controlView
                                          state: (GSThemeControlState)state
                                   isHorizontal: (BOOL)isHorizontal
{


  NSColor * backgroundColor = [self menuItemBackgroundColor];
  NSColor* selectedBackgroundColor1 = [NSColor colorWithCalibratedRed: 0.392 green: 0.533 blue: 0.953 alpha: 1];
  NSColor* selectedBackgroundColor2 = [NSColor colorWithCalibratedRed: 0.165 green: 0.373 blue: 0.929 alpha: 1];

  NSColor* menuItemBackground = [self menuItemBackgroundColor];
  NSGradient* menuitemgradient = [[NSGradient alloc] initWithStartingColor: selectedBackgroundColor1
                                                               endingColor: selectedBackgroundColor2];
  NSColor * c;
  [cell setBordered:NO];
  cellFrame = [cell drawingRectForBounds: cellFrame];

  if(isHorizontal)
  {
    cellFrame.origin.y = 1;

    // EXPERIMENTAL PADDING BEGINNING
    // CGFloat padding = [self menuPadding];  // Adjust the padding value as needed
  
    // Modify cellFrame to add padding to the left and right
    // cellFrame.origin.x += padding;
    // cellFrame.size.width += 2 * padding;
    // EXPERIMENTAL PADDING END
  }


  if (state == GSThemeSelectedState || state == GSThemeHighlightedState)
    {

      NSRectFillUsingOperation(cellFrame, NSCompositeClear);
      [menuitemgradient drawInRect:cellFrame angle: -90];
      return;
    }
  else
    {
      if(isHorizontal)
        {
          return;
        }
      else
        {
          c = menuItemBackground;
        }
    }

  // Set cell's background color
  [c setFill];
  NSRectFillUsingOperation(cellFrame, NSCompositeClear);
  NSRectFill(cellFrame);

}

@end

