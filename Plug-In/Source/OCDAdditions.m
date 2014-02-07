#import "OCDAdditions.h"

const NSUInteger OCDKeyEquivalentMask = NSControlKeyMask | NSAlternateKeyMask | NSCommandKeyMask;

@implementation NSApplication (OCDAdditions)

- (NSMenu *)ocd_windowMenu {
	for (NSMenuItem *item in self.mainMenu.itemArray)
		if ([[item.submenu valueForKey:@"_menuName"] isEqualToString:@"NSWindowsMenu"])
			return item.submenu;
	
	return [self.mainMenu itemWithTitle:@"Window"].submenu;
}

@end

@implementation NSMenu (OCDAdditions)

- (NSMenuItem *)ocd_addSeparatorItem {
	NSMenuItem *item = [NSMenuItem separatorItem];
	[self addItem:item];
	return item;
}

- (NSMenuItem *)ocd_addItemWithTitle:(NSString *)title submenu:(NSMenu *)submenu {
	NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:title action:nil keyEquivalent:nil];
	item.submenu = submenu;
	[self addItem:item];
	return item;
}

- (NSMenuItem *)ocd_addItemWithTitle:(NSString *)title target:(id)target action:(SEL)action keyEquivalent:(NSString *)keyEquivalent {
	NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:title action:action keyEquivalent:keyEquivalent];
	item.target = target;
	item.keyEquivalentModifierMask = OCDKeyEquivalentMask;
	[self addItem:item];
	return item;
}

@end
