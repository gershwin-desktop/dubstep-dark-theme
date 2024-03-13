#import "GNUstepGUI/GSWindowDecorationView.h"
#import "Dubstep.h"
#import <AppKit/AppKit.h>#

@implementation Dubstep

- (void)initWithBundle {
  // Additional setup code for your theme, if needed 
}

// Custom Props
- (NSColor *)rgbaToColor: (NSArray<NSNumber *> *)rgba {
    CGFloat red = rgba[0].floatValue / 255;
    CGFloat green = rgba[1].floatValue / 255;
    CGFloat blue = rgba[2].floatValue / 255;
    CGFloat alpha = rgba[3].floatValue;
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
    // return [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];
}

/*
- (NSColorList*)colors
{
    return [self systemColors];
}
*/

- (NSColor *)defaultBackgroundColor {
  // CGFloat level = 0.1;
  // return [NSColor colorWithCalibratedRed:level green:level blue:level alpha:1.0];
  // NSArray *rgba = @[@41.0,@39.0,@53.0,@1.0]; // My Mac
  NSArray *rgba = @[@51.0,@51.0,@51.0,@1.0]; // Mockups default theme
  // NSArray *rgba = @[@255.0,@255.0,@255.0,@1.0]; // Mockups default theme
  return [self rgbaToColor:rgba];
}

- (NSColor *)statusBarBackgroundColor {
  return [NSColor blackColor];
  // return [NSColor colorWithCalibratedRed:0.2 green:0.2 blue:0.25 alpha:1.0];
  // return [NSColor colorWithCalibratedRed:1.0 green:0.0 blue:0.0 alpha:1.0];
}

- (CGFloat)menuPadding
{
   return 16.0;
}
// END Custom Props

// Override the getter for menuShouldShowIcon
- (BOOL)menuShouldShowIcon {
  return false;
}

/*- (BOOL)toolbarIsOpaque {
  return NO;
}*/

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

- (NSColor *)menuItemBackgroundColor {
  return [self statusBarBackgroundColor];
}

- (NSColor *)menuBackgroundColor {
  return [self statusBarBackgroundColor];
}

- (NSColor*)menuBorderColor {
  NSArray *rgba = @[@68.0,@68.0,@68.0,@1.0];
  return [self rgbaToColor:rgba];
}

- (NSColor *)menuBorderColorForEdge {
  return [NSColor blackColor];
}

/*- (NSColor *)menuBorderColor {
  NSColor *color = [NSColor colorWithCalibratedRed:0.212
                                             green:0.184
                                              blue:0.176
                                             alpha:1.0];
  return color;
*/

/*
- (NSColor *) menuBackgroundColor
{
  //NSUserDefaults *theme_defaults = [NSUserDefaults standardUserDefaults];
  float transparency = [theme_defaults floatForKey:@"RikMenuBarTransparency"];
  NSColor *color = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue:
0.992 alpha: transparency]; return color;
}

- (NSColor *) menuItemBackgroundColor
{
  NSColor *color = [NSColor colorWithCalibratedRed: 0.992 green: 0.992 blue:
0.992 alpha: 0.95]; return color;
}*/

- (CGFloat)menuSubmenuHorizontalOverlap {
  return 3;
}

- (float)titlebarHeight {
  return 40.0f;
}


- (float)titlebarPaddingLeft {
  return 16.0f;
}

- (float)titlebarPaddingRight {
  return 16.0f;
}

- (float)titlebarPaddingTop {
  return 4.0f;
}


- (float)titlebarButtonSize {
  return 12.0f;
}

- (float)windowButtonPadding {
  return 8.0f;
}

- (float) resizebarHeight
{
  return 8.0f;
}


- (CGFloat)menuSubmenuVerticalOverlap {
  return 0;
}

- (CGFloat)menuBarHeight {
  return 32;
}

- (CGFloat)menuItemHeight {
  return 28;
}
- (CGFloat)menuSeparatorHeight {
  return 1;
}

- (void)drawWindowBorder:(NSRect)rect
         withFrame:(NSRect)frame
      forStyleMask:(unsigned int)styleMask
             state:(int)inputState
          andTitle:(NSString *)title
{
  // Color the window frame 
  NSColor *color; 
  color = [self defaultBackgroundColor];
  // color = [NSColor whiteColor];
  [color set];
  NSRectFill(rect);

  //frame.size.width = rect.size.width - 2;
  //frame.origin.x = rect.origin.x + 1;

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
  // [window update];


  // id<GSWindowDecorator> *decorator = [self windowDecorator];
  // [decorator setBackgroundColor: color];
}

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
        // FIXME
        [newButton setImage: [NSImage imageNamed: @"common_Maximize"]];
        [newButton setAlternateImage: [NSImage imageNamed: @"common_MaximizeH"]];
        [newButton setAction: @selector(zoom:)];
        break;

      case NSWindowToolbarButton:
        // FIXME
        [newButton setAction: @selector(toggleToolbarShown:)];
        break;
      case NSWindowDocumentIconButton:
      default:
        // FIXME
        break;
    }

  return AUTORELEASE(newButton);
}

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

static NSDictionary *titleTextAttributes[3] = {nil, nil, nil};
/*
- (void) drawTitleBarRect: (NSRect)titleBarRect 
             forStyleMask: (unsigned int)styleMask
                    state: (int)inputState 
                 andTitle: (NSString*)title
{
  static const NSRectEdge edges[4] = {NSMinXEdge, NSMaxYEdge,
				    NSMaxXEdge, NSMinYEdge};
  CGFloat grays[3][4] =
    {{NSLightGray, NSLightGray, NSDarkGray, NSDarkGray},
    {NSWhite, NSWhite, NSDarkGray, NSDarkGray},
    {NSLightGray, NSLightGray, NSBlack, NSBlack}};
  NSRect workRect;
  GSDrawTiles *tiles = nil;

  if (!titleTextAttributes[0])
    {
      NSMutableParagraphStyle *p;
      NSColor *keyColor, *normalColor, *mainColor;

      p = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
      [p setLineBreakMode: NSLineBreakByClipping];

      // FIXME: refine color names based on style mask
      // (HUD or textured or regular window)

      keyColor = [self colorNamed: @"keyWindowFrameTextColor"
                            state: GSThemeNormalState];
      if (nil == keyColor)
        {
          keyColor = [NSColor windowFrameTextColor];
        }

      normalColor = [self colorNamed: @"normalWindowFrameTextColor"
                               state: GSThemeNormalState];
      if (nil == normalColor)
        {
          normalColor = [NSColor blackColor];
        }
 
      mainColor = [self colorNamed: @"mainWindowFrameTextColor"
                             state: GSThemeNormalState];
      if (nil == mainColor)
        {
          mainColor = [NSColor windowFrameTextColor];
        }
 
      titleTextAttributes[0] = [[NSMutableDictionary alloc]
	initWithObjectsAndKeys:
	  [NSFont titleBarFontOfSize: 0], NSFontAttributeName,
	  keyColor, NSForegroundColorAttributeName,
	  p, NSParagraphStyleAttributeName,
	  nil];

      titleTextAttributes[1] = [[NSMutableDictionary alloc]
	initWithObjectsAndKeys:
	  [NSFont titleBarFontOfSize: 0], NSFontAttributeName,
	  normalColor, NSForegroundColorAttributeName,
	  p, NSParagraphStyleAttributeName,
	  nil];

      titleTextAttributes[2] = [[NSMutableDictionary alloc]
	initWithObjectsAndKeys:
	  [NSFont titleBarFontOfSize: 0], NSFontAttributeName,
	  mainColor, NSForegroundColorAttributeName,
	  p, NSParagraphStyleAttributeName,
	  nil];

      RELEASE(p);
    }

  tiles = [self tilesNamed: @"GSWindowTitleBar" state: GSThemeNormalState];
  if (tiles == nil)
    {
      
      // Draw the black border towards the rest of the window. (The outer black
      // border is drawn in -drawRect: since it might be drawn even if we don't have
      // a title bar.
      
      NSColor *borderColor = [self colorNamed: @"windowBorderColor"
                                        state: GSThemeNormalState];
      if (nil == borderColor)
        {
          borderColor = [NSColor blackColor];
        }
      [borderColor set];
 
      PSmoveto(0, NSMinY(titleBarRect) + 0.5);
      PSrlineto(titleBarRect.size.width, 0);
      PSstroke();

      
      // Draw the button-like border.
      
      workRect = titleBarRect;
      workRect.origin.x += 1;
      workRect.origin.y += 1;
      workRect.size.width -= 2;
      workRect.size.height -= 2;

      workRect = NSDrawTiledRects(workRect, workRect, edges, grays[inputState], 4);
     
      
      // Draw the background.
      
      switch (inputState) 
	{
	default:
	case 0:
	  [[NSColor windowFrameColor] set];
	  break;
	case 1:
	  [[NSColor lightGrayColor] set];
	  break;
	case 2:
	  [[NSColor darkGrayColor] set];
	  break;
	}
      NSRectFill(workRect);
    }
  else
    {
      [self fillRect: titleBarRect
          withTiles: tiles
         background: [NSColor windowFrameColor]];
      workRect = titleBarRect;
    }
  // Draw the title.
  if (styleMask & NSTitledWindowMask)
    {
      NSSize titleSize;
    
      if (styleMask & NSMiniaturizableWindowMask)
	{
	  workRect.origin.x += 17;
	  workRect.size.width -= 17;
	}
      if (styleMask & NSClosableWindowMask)
	{
	  workRect.size.width -= 17;
	}
  
      titleSize = [title sizeWithAttributes: titleTextAttributes[inputState]];
      if (titleSize.width <= workRect.size.width)
	workRect.origin.x = NSMidX(workRect) - titleSize.width / 2;
      workRect.origin.y = NSMidY(workRect) - titleSize.height / 2;
      workRect.size.height = titleSize.height;
      [title drawInRect: workRect
	 withAttributes: titleTextAttributes[inputState]];
    }
}
*/




// HINT: Check out line 1803 on the following source page...
// https://github.com/gnustep/libs-gui/blob/master/Source/GSThemeDrawing.m
- (void)drawTitleBarRect:(NSRect)titleBarRect
            forStyleMask:(unsigned int)styleMask
                   state:(int)inputState
                andTitle:(NSString *)title
{

  static const NSRectEdge edges[4] = {NSMinXEdge, NSMaxYEdge, NSMaxXEdge,
                                      NSMinYEdge};
  CGFloat grays[3][4] = {{NSLightGray, NSLightGray, NSDarkGray, NSDarkGray},
                         {NSWhite, NSWhite, NSDarkGray, NSDarkGray},
                         {NSLightGray, NSLightGray, NSBlack, NSBlack}};
  // NSRect workRect;
  // GSDrawTiles *tiles = nil;

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





- (void)drawMenuRect:(NSRect)rect
              inView:(NSView *)view
        isHorizontal:(BOOL)horizontal
           itemCells:(NSArray *)itemCells
{
  int i = 0;
  int howMany = [itemCells count];
  NSMenuView *menuView = (NSMenuView *)view;
  NSRect bounds = [view bounds];

  NSRect r = NSIntersectionRect(bounds, rect);
  NSRectFillUsingOperation(bounds, NSCompositeClear);
  NSBezierPath *menuPath;
  NSColor *borderColor = [self menuBorderColor];
  [borderColor setStroke];

  // EXPERIMENTAL PADDING
  // CGFloat padding = [self menuPadding];

  if (horizontal == YES) {
    // Compensate for padding in the x-axis
    // bounds.origin.x += padding;
    // bounds.size.width -= 2 * padding;

    // here the semitrasparent status bar...
    menuPath = [NSBezierPath bezierPathWithRect:bounds];
    NSColor *fillColor = [self menuBackgroundColor];
    [fillColor setFill];
    NSRectFill(bounds);
    NSBezierPath *linePath = [NSBezierPath bezierPath];
    [linePath moveToPoint:NSMakePoint(bounds.origin.x, bounds.origin.y)];
    [linePath lineToPoint:NSMakePoint(bounds.origin.x + bounds.size.width,
                                      bounds.origin.y)];
    [linePath setLineWidth:1];
    [linePath stroke];
  } else {
    // here the vertical menus
    CGFloat radius = 6;
    menuPath = [NSBezierPath bezierPathWithRoundedRect:bounds
                                               xRadius:radius
                                               yRadius:radius];

    [[self menuBackgroundColor] setFill];
    [menuPath fill];

    NSBezierPath *strokemenuPath =
        [NSBezierPath bezierPathWithRoundedRect:bounds
                                        xRadius:radius
                                        yRadius:radius];
    [strokemenuPath stroke];
  }
  // Draw the menu cells.
  for (i = 0; i < howMany; i++) {
    NSRect aRect;
    NSMenuItemCell *aCell;
    aRect = [menuView rectOfItemAtIndex:i];
    if (NSIntersectsRect(rect, aRect) == YES) {
      // Compensate for padding in the x-axis
      // aRect.origin.x += padding;
      // aRect.size.width -= 2 * padding;
      aCell = [menuView menuItemCellForItemAtIndex:i];
      [aCell drawWithFrame:aRect inView:menuView];
    }
  }
}


- (void)drawBackgroundForMenuView:(NSMenuView *)menuView
                        withFrame:(NSRect)bounds
                        dirtyRect:(NSRect)dirtyRect
                       horizontal:(BOOL)horizontal
{
  // NSString *name = horizontal ? GSMenuHorizontalBackground : GSMenuVerticalBackground;

  // NSRectEdge sides[4] = {NSMinXEdge, NSMaxYEdge, NSMaxXEdge, NSMinYEdge};

  [[self menuBackgroundColor] setFill];

  NSRect r = NSIntersectionRect(bounds, dirtyRect);
  NSRectFillUsingOperation(r, NSCompositeClear);
  NSBezierPath *roundedRectanglePath =
      [NSBezierPath bezierPathWithRoundedRect:r xRadius:4 yRadius:4];
  // NSColor *borderColor = [self menuBorderColor];
  //[borderColor setStroke];
  [roundedRectanglePath fill];
  [roundedRectanglePath stroke];
}


- (void)drawBorderAndBackgroundForMenuItemCell:(NSMenuItemCell *)cell
                                     withFrame:(NSRect)cellFrame
                                        inView:(NSView *)controlView
                                         state:(GSThemeControlState)state
                                  isHorizontal:(BOOL)isHorizontal
{

  NSColor *backgroundColor = [self menuItemBackgroundColor];
  NSColor *selectedBackgroundColor1 = [NSColor colorWithCalibratedRed:0.392
                                                                green:0.533
                                                                 blue:0.953
                                                                alpha:1.0];
  NSColor *selectedBackgroundColor2 = [NSColor colorWithCalibratedRed:0.165
                                                                green:0.373
                                                                 blue:0.929
                                                                alpha:1.0];

  NSColor *menuItemBackground = [self menuItemBackgroundColor];
  NSGradient *menuitemgradient =
      [[NSGradient alloc] initWithStartingColor:selectedBackgroundColor1
                                    endingColor:selectedBackgroundColor2];
  NSColor *c;
  [cell setBordered:NO];
  cellFrame = [cell drawingRectForBounds:cellFrame];

  if (isHorizontal) {
    cellFrame.origin.y = 1;

    // EXPERIMENTAL PADDING BEGINNING
    // CGFloat padding = [self menuPadding];  // Adjust the padding value as
    // needed

    // Modify cellFrame to add padding to the left and right
    // cellFrame.origin.x += padding;
    // cellFrame.size.width += 2 * padding;
    // EXPERIMENTAL PADDING END
  }

  if (state == GSThemeSelectedState || state == GSThemeHighlightedState) {

    NSRectFillUsingOperation(cellFrame, NSCompositeClear);
    [menuitemgradient drawInRect:cellFrame angle:-90];
    return;
  } else {
    if (isHorizontal) {
      return;
    } else {
      c = menuItemBackground;
    }
  }

  // Set cell's background color
  [c setFill];
  NSRectFillUsingOperation(cellFrame, NSCompositeClear);
  NSRectFill(cellFrame);
}


- (NSColorList *)colorshit
{
	NSColorList *colorList = [[NSColorList alloc] initWithname:@"DUBstep"];

    [colorList setColor:[NSColor darkGrayColor] forKey: @"alternateSelectedControlColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"alternateSelectedControlTextColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"controlBackgroundColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"controlColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"controlDarkShadowColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"controlHighlightColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"controlLightHighlightColor"];
    [colorList setColor:[NSColor darkGrayColor] forKey: @"controlShadowColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"controlTextColor"];
    [colorList setColor:[NSColor darkGrayColor] forKey: @"disabledControlTextColor"];
    [colorList setColor:[NSColor grayColor] forKey: @"gridColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"headerColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"headerTextColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"highlightColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"keyboardFocusIndicatorColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"knobColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"labelColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"quaternaryLabelColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"scrollBarColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"secondaryLabelColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"secondarySelectedControlColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"selectedControlColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"selectedControlTextColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"selectedKnobColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"selectedMenuItemColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"selectedMenuItemTextColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"selectedTextBackgroundColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"selectedTextColor"];
    [colorList setColor:[NSColor blackColor] forKey: @"shadowColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"tertiaryLabelColor"];
    [colorList setColor:[NSColor lightGrayColor] forKey: @"textBackgroundColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"textColor"];
    [colorList setColor:[NSColor blackColor] forKey: @"windowBackgroundColor"];
    [colorList setColor:[NSColor blackColor] forKey: @"windowFrameColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"windowFrameTextColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"keyWindowFrameTextColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"mainWindowFrameTextColor"];
    [colorList setColor:[NSColor blackColor] forKey: @"rowBackgroundColor"];
    [colorList setColor:[NSColor darkGrayColor] forKey: @"alternateRowBackgroundColor"];
    [colorList setColor:[NSColor yellowdColor] forKey: @"toolTipColor"];
    [colorList setColor:[NSColor whiteColor] forKey: @"toolTipTextColor"];

	return colorList;
}


@end