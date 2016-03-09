//
//  OBMenuBarWindow.h
//
//  Copyright (c) 2013, Oliver Bolton (http://oliverbolton.com/)
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//      * Redistributions of source code must retain the above copyright
//        notice, this list of conditions and the following disclaimer.
//      * Redistributions in binary form must reproduce the above copyright
//        notice, this list of conditions and the following disclaimer in the
//        documentation and/or other materials provided with the distribution.
//      * Neither the name of the <organization> nor the
//        names of its contributors may be used to endorse or promote products
//        derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//  ARE DISCLAIMED. IN NO EVENT SHALL OLIVER BOLTON BE LIABLE FOR ANY DIRECT,
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
//  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import <AppKit/AppKit.h>

/**
 * `OBMenuBarWindow` is an `NSWindow` subclass that adds the ability to attach the window to an icon in the menu bar.
 *
 * It emulates much of the look and feel of `NSPopover` but retains the appearance and functionality of a regular window, including the title bar and traffic light controls.
 *
 * The user can drag the window to and from the menu bar icon to attach and detach it from the menu bar.
 *
 * See [OBMenuBarWindow on GitHub](https://github.com/obolton/OBMenuBarWindow) for more information.
 */
@interface OBMenuBarWindow : NSWindow

///---------------------
/// @name Menu bar icon
///---------------------

/**
 * Whether the window has an icon in the menu bar (default is `NO`).
 *
 * If this is `YES`, set the `menuBarIcon` property and optionally the `highlightedMenuBar` property.
 */
@property (nonatomic, assign) BOOL hasMenuBarIcon;

/**
 * The icon to show in the menu bar. The image should have a maximum height of 22 pixels (or 44 pixels for retina displays).
 */
@property (nonatomic, strong) NSImage *menuBarIcon;

/**
 * The highlighted version of the icon to show in the menu bar. The dimensions of the image should match the non-highlighted image.
 */
@property (nonatomic, strong) NSImage *highlightedMenuBarIcon;

/**
 * The status item associated with the window.
 */
@property (readonly) NSStatusItem *statusItem;

///---------------------------------
/// @name Attaching to the menu bar
///---------------------------------

/**
 * Whether the window is attached to its icon in the menu bar (default is `NO`).
 *
 * This property will only have an effect if the `hasMenuBarIcon` property is set to `YES`.
 */
@property (nonatomic, assign) BOOL attachedToMenuBar;

/**
 * Whether the window can be detached from the menu bar or not (default is `YES`).
 */
@property (nonatomic, assign) BOOL isDetachable;

/**
 * Whether to hide the "traffic light" window controls when the window is attached to the menu bar (default is `YES`).
 */
@property (nonatomic, assign) BOOL hideWindowControlsWhenAttached;

/**
 * The threshold distance between the centre of the title bar and the menu bar icon at which to "snap" the window to the menu bar when dragging (default is 30 pixels).
 */
@property (nonatomic, assign) CGFloat snapDistance;

/**
 The distance between the window and the menu bar when the window is attached (default is 0 pixels).
 */
@property (nonatomic, assign) CGFloat distanceFromMenuBar;

/**
 * The size of the arrow that points to the menu bar icon (default is {20, 10}).
 */
@property (nonatomic, assign) NSSize arrowSize;

///-----------------
/// @name Title bar
///-----------------

/**
 * The height of the title bar (default is 22 pixels).
 */
@property (nonatomic, assign) CGFloat titleBarHeight;

/**
 * The window's title text field.
 */
@property (readonly) NSTextField *titleTextField;

/**
 * The view containing the window's toolbar items. You can access this view to add additional controls to the titlebar.
 */
@property (readonly) NSView *toolbarView;

@end

/**
 * The `OBMenuBarWindowDelegate` protocol defines methods that a delegate of `OBMenuBarWindow` may implement to notify it when the window attaches to or detaches from the menu bar.
 */
@protocol OBMenuBarWindowDelegate <NSWindowDelegate>

@optional

/**
 * Called after the window attached to the menu bar.
 *
 * @param window The window.
 */
- (void)windowDidAttachToMenuBar:(OBMenuBarWindow *)window;

/**
 * Called after the window detached from the menu bar.
 *
 * @param window The window.
 */
- (void)windowDidDetachFromMenuBar:(OBMenuBarWindow *)window;

@end

///---------------------
/// @name Notifications
///---------------------

/**
 * Sent when the window attached to the menu bar.
 */
extern NSString * const OBMenuBarWindowDidAttachToMenuBar;

/**
 * Sent when the window detached from the menu bar.
 */
extern NSString * const OBMenuBarWindowDidDetachFromMenuBar;
