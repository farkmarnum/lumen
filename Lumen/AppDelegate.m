//
//  AppDelegate.m
//  Lumen
//
//  Created by Anish Athalye on 4/10/15.
//  Copyright (c) 2015 Anish Athalye. All rights reserved.
//

#import "AppDelegate.h"
#import "Constants.h"
#import "BrightnessController.h"

@interface AppDelegate ()

@property (strong, nonatomic) IBOutlet NSMenu *statusMenu;
@property (strong, nonatomic) IBOutlet NSMenuItem *toggle;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) BrightnessController *brightnessController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [self.statusItem setMenu:self.statusMenu];
    [self.statusItem setTitle:MENU_SYMBOL];
    [self.statusItem setHighlightMode:YES];

    self.brightnessController = [[BrightnessController alloc] init];
    [self.brightnessController start];
    [self.toggle setTitle:STOP];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // do not need to do anything
}

- (IBAction)menuActionQuit:(id)sender {
    [NSApp terminate:self];
}

- (IBAction)menuActionToggle:(id)sender {
    if ([self.brightnessController isRunning]) {
        [self.brightnessController stop];
        [self.toggle setTitle:START];
    } else {
        [self.brightnessController start];
        [self.toggle setTitle:STOP];
    }
}

@end
