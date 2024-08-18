#import "GNUstepGUI/GSWindowDecorationView.h"
#import "Dubstep.h"
#import "Dubstep+Button.h"
#import <AppKit/AppKit.h>

@implementation Dubstep

// Ensuring the title bar is drawn
- (void)drawTitleBar:(NSRect)frame inView:(NSView *)view state:(GSThemeControlState)state {
    // Set title bar color
    NSColor *titleBarColor = [self defaultBackgroundColor]; // Match title bar color with window color
    [titleBarColor setFill];
    NSRectFill(frame);

    // Optionally, add a line at the bottom of the title bar
    NSColor *borderColor = [NSColor colorWithCalibratedWhite:0.3 alpha:1.0]; // Lighter gray
    NSBezierPath *borderPath = [NSBezierPath bezierPath];
    [borderPath moveToPoint:NSMakePoint(NSMinX(frame), NSMinY(frame))];
    [borderPath lineToPoint:NSMakePoint(NSMaxX(frame), NSMinY(frame))];
    [borderColor setStroke];
    [borderPath stroke];
}

// Overriding the method to draw window decorations
- (void)drawWindowDecoration:(NSRect)rect inView:(NSView *)view {
    // Draw the title bar
    [self drawTitleBar:NSMakeRect(rect.origin.x, rect.origin.y + rect.size.height - 22, rect.size.width, 22)
                inView:view
                state:GSThemeNormalState];
}

// Initialize with bundle. Add setup code for theme if needed.
- (void)initWithBundle
{
  // Additional setup code for your theme, if needed 
}

// Converts RGBA values to NSColor.
- (NSColor *)rgbaToColor:(NSArray<NSNumber *> *)rgba
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
- (NSColor *)statusBarBackgroundColor
{
  return [NSColor blackColor]; 
}

// Returns padding value for menu items.
- (CGFloat)menuPadding
{
   return 16.0;
}

// Determines whether menu icons should be shown.
- (BOOL)menuShouldShowIcon
{
  return NO;
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

- (NSColor *)menuBorderColor
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
- (float)resizebarHeight
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
    NSBezierPath *roundedRectPath = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:14.0 yRadius:14.0];
    
    // Clip to the rounded rectangle path
    [roundedRectPath addClip];

    // Fill the background with the rounded shape
    [roundedRectPath fill];
}

// Draws the window border.
- (void)drawWindowBorder:(NSRect)rect
               withFrame:(NSRect)frame
            forStyleMask:(unsigned int)styleMask
                   state:(int)inputState
                andTitle:(NSString *)title
{
    NSColor *color = [self defaultBackgroundColor];
    [color setFill];

    // Create a path for a rounded rectangle
    NSBezierPath *roundedRectPath = [NSBezierPath bezierPathWithRoundedRect:rect xRadius:14.0 yRadius:14.0];
    
    // Clip to the rounded rectangle path
    [roundedRectPath addClip];

    // Fill the background with the rounded shape
    [roundedRectPath fill];

    // Make the border invisible by setting the stroke color to clear
    [[NSColor clearColor] setStroke];
    [roundedRectPath setLineWidth:0.0];
    [roundedRectPath stroke];

    // Set the title bar color to match the window background color
    NSColor *titleBarColor = color;
    [titleBarColor setFill];
    NSRect titleBarFrame = NSMakeRect(rect.origin.x, rect.origin.y + rect.size.height - 22, rect.size.width, 22);
    NSBezierPath *titleBarPath = [NSBezierPath bezierPathWithRect:titleBarFrame];
    [titleBarPath fill];

    // Draw the application title in the title bar
    NSDictionary *attributes = @{ NSFontAttributeName: [NSFont systemFontOfSize:14],
                                  NSForegroundColorAttributeName: [NSColor whiteColor] };
    NSSize textSize = [title sizeWithAttributes:attributes];
    NSPoint textOrigin = NSMakePoint(NSMidX(titleBarFrame) - textSize.width / 2,
                                     NSMidY(titleBarFrame) - textSize.height / 2);
    [title drawAtPoint:textOrigin withAttributes:attributes];

    NSLog(@"Title drawn: %@", title);
}

// Provides the standard window button for a given button type.
- (NSButton *)standardWindowButton:(NSWindowButton)button
                       forStyleMask:(NSUInteger)mask
{
  NSButton *newButton = [[NSButton alloc] init];
  [newButton setRefusesFirstResponder:YES];
  [newButton setButtonType:NSMomentaryChangeButton];
  [newButton setImagePosition:NSImageOnly];
  [newButton setBordered:NO];
  [newButton setTag:button];
  
  // Configure button images and actions based on button type
  switch (button)
    {
      case NSWindowCloseButton:
        [newButton setImage:[NSImage imageNamed:@"common_Close"]];
        [newButton setAlternateImage:[NSImage imageNamed:@"common_CloseH"]];
        [newButton setAction:@selector(performClose:)];
        break;

      case NSWindowMiniaturizeButton:
        [newButton setImage:[NSImage imageNamed:@"common_Miniaturize"]];
        [newButton setAlternateImage:[NSImage imageNamed:@"common_MiniaturizeH"]];
        [newButton setAction:@selector(miniaturize:)];
        break;

      case NSWindowZoomButton:
        // FIXME: Configure zoom button
        [newButton setImage:[NSImage imageNamed:@"common_Maximize"]];
        [newButton setAlternateImage:[NSImage imageNamed:@"common_MaximizeH"]];
        [newButton setAction:@selector(zoom:)];
        break;

      case NSWindowToolbarButton:
        // FIXME: Configure toolbar button
        [newButton setAction:@selector(toggleToolbarShown:)];
        break;
      case NSWindowDocumentIconButton:
      default:
        // FIXME: Configure document icon button
        break;
    }

  return newButton;
}

// Draws a path button with specified state.
- (void)drawPathButton:(NSBezierPath *)path
                    in:(NSView *)view
                 state:(GSThemeControlState)state {
    [[NSColor blackColor] setStroke];
    [path stroke];
}

// Returns the frame for the close button within the window's bounds.
- (NSRect)closeButtonFrameForBounds:(NSRect)rect
{
  NSRect newRect = NSMakeRect(rect.size.width - [self titlebarButtonSize] - [self titlebarPaddingRight],
                            rect.size.height - [self titlebarButtonSize] - [self windowButtonPadding],
                            [self titlebarButtonSize],
                            [self titlebarButtonSize]);
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
  NSRect newRect = NSMakeRect(rect.size.width - [self titlebarButtonSize] - [self titlebarPaddingRight],
                              rect.size.height - [self titlebarButtonSize] - [self windowButtonPadding],
                              [self titlebarButtonSize],
                              [self titlebarButtonSize]);
  newRect.origin.x = [self titlebarPaddingLeft] + [self titlebarButtonSize] + 8;
  newRect.origin.y -= [self windowButtonPadding];

  return newRect;
}

// Draws the title bar rectangle with the provided style mask, state, and title.
static NSDictionary *titleTextAttributes[3] = {nil, nil, nil};

- (void)drawTitleBarRect:(NSRect)titleBarRect
            forStyleMask:(unsigned int)styleMask
                   state:(int)inputState
                andTitle:(NSString *)title
{
    // Initialize title text attributes if not already done
    if (!titleTextAttributes[0]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        [paragraphStyle setLineBreakMode:NSLineBreakByClipping];

        NSColor *keyColor = [self colorNamed:@"keyWindowFrameTextColor" state:GSThemeNormalState] ?: [NSColor windowFrameTextColor];
        NSColor *normalColor = [self colorNamed:@"normalWindowFrameTextColor" state:GSThemeNormalState] ?: [NSColor redColor];
        NSColor *mainColor = [self colorNamed:@"mainWindowFrameTextColor" state:GSThemeNormalState] ?: [NSColor windowFrameTextColor];

        titleTextAttributes[0] = @{
            NSFontAttributeName: [NSFont titleBarFontOfSize:0],
            NSForegroundColorAttributeName: keyColor,
            NSParagraphStyleAttributeName: paragraphStyle
        };

        titleTextAttributes[1] = @{
            NSFontAttributeName: [NSFont titleBarFontOfSize:0],
            NSForegroundColorAttributeName: normalColor,
            NSParagraphStyleAttributeName: paragraphStyle
        };

        titleTextAttributes[2] = @{
            NSFontAttributeName: [NSFont titleBarFontOfSize:0],
            NSForegroundColorAttributeName: mainColor,
            NSParagraphStyleAttributeName: paragraphStyle
        };

        RELEASE(paragraphStyle);
    }

    // Draw the title if the window has a title bar
    if (styleMask & NSTitledWindowMask) {
        if (styleMask & NSMiniaturizableWindowMask) {
            titleBarRect.origin.x += 18;
            titleBarRect.size.width -= 18;
        }
        if (styleMask & NSClosableWindowMask) {
            titleBarRect.size.width -= 18;
        }

        titleBarRect.size.height = [self titlebarHeight] + ([self titlebarPaddingTop] * 2);

        NSSize titleSize = [title sizeWithAttributes:titleTextAttributes[inputState]];
        if (titleSize.width <= titleBarRect.size.width) {
            // Center the title horizontally and vertically
            titleBarRect.origin.x = NSMidX(titleBarRect) - titleSize.width / 2;
            titleBarRect.origin.y = NSMidY(titleBarRect) - titleSize.height / 2;
            titleBarRect.size.height = titleSize.height;
        }

        // Fill the title bar background
        NSColor *backgroundColor = [self defaultBackgroundColor];
        [backgroundColor set];
        NSRectFill(titleBarRect);

        // Draw the title
        [title drawInRect:titleBarRect withAttributes:titleTextAttributes[inputState]];
    }
}

// Draw the menu background and item cells
- (void)drawMenuRect:(NSRect)rect
              inView:(NSView *)view
        isHorizontal:(BOOL)horizontal
           itemCells:(NSArray *)itemCells
{
    NSMenuView *menuView = (NSMenuView *)view;
    NSRect bounds = [view bounds];
    
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

// Draw the background for menu view
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
    NSColor *menuItemBackground = [self menuItemBackgroundColor];
    
    NSColor *selectedBackgroundColor1 = [NSColor colorWithCalibratedRed:0.392
                                                                  green:0.533
                                                                   blue:0.953
                                                                  alpha:1.0];
    NSColor *selectedBackgroundColor2 = [NSColor colorWithCalibratedRed:0.165
                                                                  green:0.373
                                                                   blue:0.929
                                                                  alpha:1.0];

    NSGradient *menuItemGradient =
        [[NSGradient alloc] initWithStartingColor:selectedBackgroundColor1
                                      endingColor:selectedBackgroundColor2];
    
    [cell setBordered:NO];
    cellFrame = [cell drawingRectForBounds:cellFrame];

    if (isHorizontal) {
        cellFrame.origin.y = 1;
    }

    if (state == GSThemeSelectedState || state == GSThemeHighlightedState) {
        NSRectFillUsingOperation(cellFrame, NSCompositeClear);
        [menuItemGradient drawInRect:cellFrame angle:-90];
        return;
    } else if (!isHorizontal) {
        [menuItemBackground setFill];
    } else {
        return;
    }

    NSRectFillUsingOperation(cellFrame, NSCompositeClear);
    NSRectFill(cellFrame);
}

@end