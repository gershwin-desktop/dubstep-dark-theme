#import "GNUstepGUI/GSWindowDecorationView.h"
#import "Dubstep.h"
#import "Dubstep+Button.h"
#import <AppKit/AppKit.h>#

@implementation Dubstep

// Initialize with bundle. Add setup code for theme if needed.
- (void)initWithBundle
{
  // Additional setup code for your theme, if needed 
}

// Converts RGBA values to NSColor.
- (NSColor *)rgbaToColor: (NSArray<NSNumber *> *)rgba
{
    CGFloat red = rgba[0].floatValue / 255;
    CGFloat green = rgba[1].floatValue / 255;
    CGFloat blue = rgba[2].floatValue / 255;
    CGFloat alpha = rgba[3].floatValue;
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
}

// Provides the default background color for the theme.
- (NSColor *)defaultBackgroundColor
{
  NSArray *rgba = @[@51.0,@51.0,@51.0,@1.0]; // Mockups default theme
  return [self rgbaToColor:rgba];
}

// Returns the background color for the status bar.
- (NSColor *)statusBarBackgroundColor\
{
  return [NSColor blackColor]; 
}

// Returns padding value for menu items.
- (CGFloat)menuPadding
{
   return 16.0;
}
// END Custom Props

// Determines whether menu icons should be shown.
- (BOOL)menuShouldShowIcon
{
  return false;
}

// Returns the inset for menu separators.
- (CGFloat)menuSeparatorInset
{
  return 0.0;
}

// Returns the background color for menu items.
- (NSColor *)menuItemBackgroundColor
{
  return [self statusBarBackgroundColor];
}

// Returns the border color for the menu.
- (NSColor *)menuBackgroundColor
{
  return [self statusBarBackgroundColor];
}

- (NSColor*)menuBorderColor
{
  NSArray *rgba = @[@68.0,@68.0,@68.0,@1.0];
  return [self rgbaToColor:rgba];
}

// Returns the border color for the edge of the menu.
- (NSColor *)menuBorderColorForEdge
{
  return [NSColor blackColor];
}

// Returns the horizontal overlap for submenus.
- (CGFloat)menuSubmenuHorizontalOverlap
{
  return 3;
}

// Returns the height of the title bar.
- (float)titlebarHeight
{
  return 40.0f;
}

// Returns the left padding of the title bar.
- (float)titlebarPaddingLeft
{
  return 16.0f;
}

// Returns the right padding of the title bar.
- (float)titlebarPaddingRight
{
  return 16.0f;
}

// Returns the top padding of the title bar.
- (float)titlebarPaddingTop
{
  return 4.0f;
}

// Returns the size of the title bar buttons.
- (float)titlebarButtonSize
{
  return 12.0f;
}

// Returns the padding for window buttons.
- (float)windowButtonPadding
{
  return 8.0f;
}

// Returns the height of the resize bar.
- (float) resizebarHeight
{
  return 12.0f;
}

// Returns the vertical overlap for submenus.
- (CGFloat)menuSubmenuVerticalOverlap
{
  return 0;
}

// Returns the height of the menu bar.
- (CGFloat)menuBarHeight
{
  return 32;
}

// Returns the height of menu items.
- (CGFloat)menuItemHeight
{
  return 28;
}

// Returns the height of the menu separator.
- (CGFloat)menuSeparatorHeight
{
  return 1;
}

// Draws a rounded window with specified rect and radius.
- (void)drawRoundedWindow:(NSRect)rect radius:(CGFloat)radius {
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:radius yRadius:radius];
    [path fill];
}

// Draws the window border.
- (void)drawWindowBorder:(NSRect)rect
         withFrame:(NSRect)frame
      forStyleMask:(unsigned int)styleMask
             state:(int)inputState
          andTitle:(NSString *)title
{
  // Color the window frame 
  NSColor *color; 
  color = [self defaultBackgroundColor]; 
  // [color set];
  // NSRectFill(rect);
  [color setFill];
  [self drawRoundedWindow:rect radius:14.0];

  rect.size.width = rect.size.width + 16;
  rect.origin.x += 8; 

  // Drawing code commented out, adjust as needed for specific window styles
  /*
  if (styleMask & (NSTitledWindowMask | NSClosableWindowMask 
                   | NSMiniaturizableWindowMask))
  {
    NSRect titleBarRect;
    float TITLE_HEIGHT = [self titlebarHeight] + [self titlebarPaddingTop];
    titleBarRect = NSMakeRect(0.0, frame.size.height - TITLE_HEIGHT,
                              frame.size.width, TITLE_HEIGHT);
    if (NSIntersectsRect(rect, titleBarRect))
        [self drawTitleBarRect: titleBarRect 
              forStyleMask: styleMask
              state: inputState 
              andTitle: title];
  }

  if (styleMask & NSResizableWindowMask)
  {
    NSRect resizeBarRect;
    float RESIZE_HEIGHT = [self resizebarHeight];
    resizeBarRect = NSMakeRect(0.0, 0.0, frame.size.width, RESIZE_HEIGHT);
    if (NSIntersectsRect(rect, resizeBarRect))
    {
      [self drawResizeBarRect: resizeBarRect];
    }
  }

  if (styleMask & (NSTitledWindowMask | NSClosableWindowMask 
                   | NSMiniaturizableWindowMask | NSResizableWindowMask))
  {
      // NSColor *borderColor = [self colorNamed: @"windowBorderColor"
      //                                   state: GSThemeNormalState];
      NSColor *borderColor = color;
      if (nil == borderColor)
        {
          borderColor = [NSColor blackColor];
        }
      [borderColor set];
      PSsetlinewidth(1.0);
      if (NSMinX(rect) < 1.0)
    	{
    	  PSmoveto(0.5, 0.0);
    	  PSlineto(0.5, frame.size.height);
    	  PSstroke();
    	}
      if (NSMaxX(rect) > frame.size.width - 1.0)
    	{
    	  PSmoveto(frame.size.width - 0.5, 0.0);
    	  PSlineto(frame.size.width - 0.5, frame.size.height);
    	  PSstroke();
    	}
      if (NSMaxY(rect) > frame.size.height - 1.0)
    	{
    	  PSmoveto(0.0, frame.size.height - 0.5);
    	  PSlineto(frame.size.width, frame.size.height - 0.5);
    	  PSstroke();
    	}
      if (NSMinY(rect) < 1.0)
    	{
    	  PSmoveto(0.0, 0.5);
    	  PSlineto(frame.size.width, 0.5);
    	  PSstroke();
    	}
  }
  */
}

/*
- (void)drawWindowBackground:(NSRect)frame
                        view:(NSView *)view;
{
  // Color the NSWindow
  frame.size.width += 200;
  NSColor *color; 
  color = [self defaultBackgroundColor];
  // color = [NSColor redColor];
  [color set];
  NSRectFill(frame);
  
  // Color the Window Decorator
  NSWindow *window;
  window = [view window];
  [window setBackgroundColor:color];
  [window setTitle:@"Gershwin"];
  [window setHasShadow:YES];
}
*/

// Provides the standard window button for a given button type.
- (NSButton *) standardWindowButton: (NSWindowButton)button
		       forStyleMask: (NSUInteger) mask
{
  NSButton *newButton;

  newButton = [[NSButton alloc] init];
  [newButton setRefusesFirstResponder: YES];
  [newButton setButtonType: NSMomentaryChangeButton];
  [newButton setImagePosition: NSImageOnly];
  [newButton setBordered: NO];
  [newButton setTag: button];
  
  // Configure button images and actions based on button type
  switch (button)
    {
      case NSWindowCloseButton:
        [newButton setImage: [NSImage imageNamed: @"common_Close"]];
        [newButton setAlternateImage: [NSImage imageNamed: @"common_CloseH"]];
        [newButton setAction: @selector(performClose:)];
        break;

      case NSWindowMiniaturizeButton:
        [newButton setImage: [NSImage imageNamed: @"common_Miniaturize"]];
        [newButton setAlternateImage: [NSImage imageNamed: @"common_MiniaturizeH"]];
        [newButton setAction: @selector(miniaturize:)];
        break;

      case NSWindowZoomButton:
        // FIXME: Configure zoom button
        [newButton setImage: [NSImage imageNamed: @"common_Maximize"]];
        [newButton setAlternateImage: [NSImage imageNamed: @"common_MaximizeH"]];
        [newButton setAction: @selector(zoom:)];
        break;

      case NSWindowToolbarButton:
        // FIXME: Configure toolbar button
        [newButton setAction: @selector(toggleToolbarShown:)];
        break;
      case NSWindowDocumentIconButton:
      default:
        // FIXME: Configure document icon button
        break;
    }

  return AUTORELEASE(newButton);
}

// Returns the frame for the close button within the window's bounds.
- (NSRect)closeButtonFrameForBounds:(NSRect)rect
{

  GSTheme *theme = [GSTheme theme];

  NSRect newRect = NSMakeRect(rect.size.width - [theme titlebarButtonSize] - [theme titlebarPaddingRight],
                              rect.size.height - [theme titlebarButtonSize] -[theme windowButtonPadding],
                              [theme titlebarButtonSize],
                              [theme titlebarButtonSize]);
  newRect.origin.x = [self titlebarPaddingLeft];
  newRect.origin.y -= [self windowButtonPadding];

  NSColor *bgColor = [self defaultBackgroundColor];
  [bgColor set];
  NSRectFill(newRect);

  return newRect;
}

// Returns the frame for the miniaturize button within the window's bounds.
- (NSRect)miniaturizeButtonFrameForBounds:(NSRect)rect
{

  GSTheme *theme = [GSTheme theme];

  NSRect newRect = NSMakeRect(rect.size.width - [theme titlebarButtonSize] - [theme titlebarPaddingRight],
                              rect.size.height - [theme titlebarButtonSize] - [theme windowButtonPadding],
                              [theme titlebarButtonSize],
                              [theme titlebarButtonSize]);
  newRect.origin.x = [self titlebarPaddingLeft] + [theme titlebarButtonSize] + 8;
  newRect.origin.y -= [self windowButtonPadding];

  return newRect;
}

// Draws the title bar rectangle with the provided style mask, state, and title.
static NSDictionary *titleTextAttributes[3] = {nil, nil, nil};
// HINT: Check out line 1803 on the following source page...
// https://github.com/gnustep/libs-gui/blob/master/Source/GSThemeDrawing.m
- (void)drawTitleBarRect:(NSRect)titleBarRect
            forStyleMask:(unsigned int)styleMask
                   state:(int)inputState
                andTitle:(NSString *)title
{

  // Initialize title text attributes if not already done
  static const NSRectEdge edges[4] = {NSMinXEdge, NSMaxYEdge, NSMaxXEdge,
                                      NSMinYEdge};
  CGFloat grays[3][4] = {{NSLightGray, NSLightGray, NSDarkGray, NSDarkGray},
                         {NSWhite, NSWhite, NSDarkGray, NSDarkGray},
                         {NSLightGray, NSLightGray, NSBlack, NSBlack}};

  if (!titleTextAttributes[0]) {
    NSMutableParagraphStyle *p;
    NSColor *keyColor, *normalColor, *mainColor;

    p = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [p setLineBreakMode:NSLineBreakByClipping];

    // FIXME: refine color names based on style mask
    // (HUD or textured or regular window)
    

    keyColor = [self colorNamed:@"keyWindowFrameTextColor"
                          state:GSThemeNormalState];
    if (nil == keyColor) {
      keyColor = [NSColor windowFrameTextColor];
    }

    normalColor = [self colorNamed:@"normalWindowFrameTextColor"
                             state:GSThemeNormalState];
    if (nil == normalColor) {
      normalColor = [NSColor redColor];
    }

    mainColor = [self colorNamed:@"mainWindowFrameTextColor"
                           state:GSThemeNormalState];
    
    if (nil == mainColor) {
      mainColor = [NSColor windowFrameTextColor];
    }

    titleTextAttributes[0] = [[NSMutableDictionary alloc]
        initWithObjectsAndKeys:[NSFont titleBarFontOfSize:0],
                               NSFontAttributeName, keyColor,
                               NSForegroundColorAttributeName, p,
                               NSParagraphStyleAttributeName, nil];

    titleTextAttributes[1] = [[NSMutableDictionary alloc]
        initWithObjectsAndKeys:[NSFont titleBarFontOfSize:0],
                               NSFontAttributeName, normalColor,
                               NSForegroundColorAttributeName, p,
                               NSParagraphStyleAttributeName, nil];

    titleTextAttributes[2] = [[NSMutableDictionary alloc]
        initWithObjectsAndKeys:[NSFont titleBarFontOfSize:0],
                               NSFontAttributeName, mainColor,
                               NSForegroundColorAttributeName, p,
                               NSParagraphStyleAttributeName, nil];

    RELEASE(p);
  } 
    
  // Draw the title
  if (styleMask & NSTitledWindowMask) {
    NSSize titleSize;

    if (styleMask & NSMiniaturizableWindowMask) {
      titleBarRect.origin.x += 18;
      titleBarRect.size.width -= 18;
    }
    if (styleMask & NSClosableWindowMask) {
      titleBarRect.size.width -= 18;
    }
    titleBarRect.size.height = [self titlebarHeight] + ([self titlebarPaddingTop] * 2);
    

    titleSize = [title sizeWithAttributes:titleTextAttributes[inputState]];
    //titleBarRect.size.height = [self titlebarHeight] + [self titlebarPaddingTop];
    if (titleSize.width <= titleBarRect.size.width){      
      // Uses only as much space as the string needs
      titleBarRect.size.height = titleSize.height; // + [self titlebarPaddingTop];
      titleBarRect.origin.x = NSMidX(titleBarRect) - titleSize.width / 2;
      titleBarRect.origin.y = NSMidY(titleBarRect) - titleSize.height / 2;      
    }
    // Add a fill to the titlebar NSRect
    NSColor *c; 
    c = [self defaultBackgroundColor];    
    [c set]; 
    NSRectFill(titleBarRect);
     
    [title drawInRect: titleBarRect withAttributes: titleTextAttributes[inputState]];
  }
  
}

// Draw the menu background and item cells
- (void)drawMenuRect:(NSRect)rect
              inView:(NSView *)view
        isHorizontal:(BOOL)horizontal
           itemCells:(NSArray *)itemCells
{
    // Initialize variables for menu item drawing
    NSMenuView *menuView = (NSMenuView *)view;
    NSRect bounds = [view bounds];
    NSRect intersectionRect = NSIntersectionRect(bounds, rect);
    
    // Clear the existing menu background in the drawing rectangle
    NSRectFillUsingOperation(bounds, NSCompositeClear);
    
    // Set the border color
    NSColor *borderColor = [self menuBorderColor];
    [borderColor setStroke];
    
    // Create a path for the menu border
    NSBezierPath *menuPath;
    
    if (horizontal) {
        // Horizontal menu bar
        menuPath = [NSBezierPath bezierPathWithRect:bounds];
        
        // Fill background color
        NSColor *fillColor = [self menuBackgroundColor];
        [fillColor setFill];
        NSRectFill(bounds);
        
        // Draw the top border line
        NSBezierPath *linePath = [NSBezierPath bezierPath];
        [linePath moveToPoint:NSMakePoint(bounds.origin.x, bounds.origin.y)];
        [linePath lineToPoint:NSMakePoint(bounds.origin.x + bounds.size.width, bounds.origin.y)];
        [linePath setLineWidth:1];
        [linePath stroke];
    } else {
        // Vertical menus with rounded corners
        CGFloat radius = 6.0;
        menuPath = [NSBezierPath bezierPathWithRoundedRect:bounds
                                                   xRadius:radius
                                                   yRadius:radius];
        
        // Draw the menu border
        [menuPath stroke];
    }
    
    // Draw the menu item cells
    NSUInteger itemCount = itemCells.count;
    for (NSUInteger i = 0; i < itemCount; i++) {
        NSRect itemRect = [menuView rectOfItemAtIndex:i];
        if (NSIntersectsRect(rect, itemRect)) {
            NSMenuItemCell *itemCell = [menuView menuItemCellForItemAtIndex:i];
            [itemCell drawWithFrame:itemRect inView:menuView];
        }
    }
}

- (void)drawBackgroundForMenuView:(NSMenuView *)menuView
                        withFrame:(NSRect)bounds
                        dirtyRect:(NSRect)dirtyRect
                       horizontal:(BOOL)horizontal
{
    // This method is currently not implemented. The original code was commented out.
    // You can implement custom background drawing here if needed.
}


// Draw the border and background for a menu item cell
- (void)drawBorderAndBackgroundForMenuItemCell:(NSMenuItemCell *)cell
                                     withFrame:(NSRect)cellFrame
                                        inView:(NSView *)controlView
                                         state:(GSThemeControlState)state
                                  isHorizontal:(BOOL)isHorizontal
{
    // Define the background color for the menu item
    NSColor *menuItemBackground = [self menuItemBackgroundColor];
    
    // Colors for the gradient background when the item is selected or highlighted
    NSColor *selectedBackgroundColor1 = [NSColor colorWithCalibratedRed:0.392
                                                                  green:0.533
                                                                   blue:0.953
                                                                  alpha:1.0];
    NSColor *selectedBackgroundColor2 = [NSColor colorWithCalibratedRed:0.165
                                                                  green:0.373
                                                                   blue:0.929
                                                                  alpha:1.0];

    // Create a gradient for the selected/highlighted state
    NSGradient *menuItemGradient =
        [[NSGradient alloc] initWithStartingColor:selectedBackgroundColor1
                                      endingColor:selectedBackgroundColor2];
    
    // Prepare the cell for drawing
    [cell setBordered:NO];
    cellFrame = [cell drawingRectForBounds:cellFrame];

    if (isHorizontal) {
        cellFrame.origin.y = 1;
    }

    // Check if the menu item is in a selected or highlighted state
    if (state == GSThemeSelectedState || state == GSThemeHighlightedState) {
        // Clear the background of the menu item to make way for the gradient
        NSRectFillUsingOperation(cellFrame, NSCompositeClear);
        
        // Draw a gradient background for selected/highlighted states
        [menuItemGradient drawInRect:cellFrame angle:-90];
        return;
    } else if (!isHorizontal) {
        // Set the background color for non-selected/non-highlighted items in vertical menus
        [menuItemBackground setFill];
    } else {
        // For horizontal menus, do not draw any background
        return;
    }

    // Draw the background color
    NSRectFillUsingOperation(cellFrame, NSCompositeClear);
    NSRectFill(cellFrame);
}

@end