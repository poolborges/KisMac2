/*
 
 File:			NSToolbar.h
 Program:		BIGeneric
 Author:		Michael Roßberg
                mick@binaervarianz.de
 Changes:       Vitalii Parovishnyk(1012-2015)
 
 Description:	This framework provides abstract Cocoa methods to quickly draw 2D sprites
 
 This file is part of BIGL.
 
 BIGL is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.
 
 BIGL is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with BIGL; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

@interface NSToolbar(PrivateExtension) 
+ (BOOL)_allowSmallIcons;
+ (id)_newPlaceholderItemWithItemIdentifier:(id)fp8;
+ (id)_newStandardItemWithItemIdentifier:(id)fp8;
+ (id)_newUnknownItemWithItemIdentifier:(id)fp8;
+ (void)_registerToolbarInstance:(id)fp8;
+ (void)_unregisterToolbarInstance:(id)fp8;
- (id)_allowedItemIdentifiers;
- (BOOL)_allowsDuplicateItems;
- (void)_appendNewItemWithItemIdentifier:(id)fp8 notifyDelegate:(BOOL)fp12 notifyView:(BOOL)fp16 notifyFamilyAndUpdateDefaults:(BOOL)fp20;
- (void)_autoSaveCofiguration;
- (id)_backgroundColor;
- (BOOL)_canRunCustomizationPanel;
- (void)_checkForObsoleteDelegateMethodsInObject:(id)fp8;
- (void)_configSheetDidEnd:(id)fp8 returnCode:(NSInteger)fp12 contextInfo:(void *)fp16;
- (id)_configurationAutosaveName;
- (id)_createItemFromItemIdentifier:(id)fp8;
- (id)_customizationPaletteSheetWindow;
- (BOOL)_customizesAlwaysOnClickAndDrag;
- (id)_defaultItemIdentifiers;
- (void)_destroyToolbarAssociation:(id)fp8;
- (id)_dictionaryForSavedConfiguration;
- (void)_disableNotifications;
- (void)_enableNotifications;
- (void)_endCustomizationPalette:(id)fp8;
- (void)_endCustomizationPanel;
- (id)_findFirstItemInArray:(id)fp8 withItemIdentifier:(id)fp12;
- (NSInteger)_firstMoveableItemIndex;
- (void)_forceAppendItem:(id)fp8;
- (void)_forceInsertItem:(id)fp8 atIndex:(NSInteger)fp12;
- (void)_forceMoveItemFromIndex:(NSInteger)fp8 toIndex:(NSInteger)fp12;
- (void)_forceRemoveItemFromIndex:(NSInteger)fp8;
- (void)_forceReplaceItemAtIndex:(NSInteger)fp8 withItem:(id)fp12;
- (void)_hide:(id)fp8;
- (void)_insertNewItemWithItemIdentifier:(id)fp8 atIndex:(NSInteger)fp12 notifyDelegate:(BOOL)fp16 notifyView:(BOOL)fp20 notifyFamilyAndUpdateDefaults:(BOOL)fp24;
- (BOOL)_isEditing;
- (BOOL)_isSelectableItemIdentifier:(id)fp8;
- (id)_itemAtIndex:(NSInteger)fp8;
- (id)_items;
- (BOOL)_keyboardLoopNeedsUpdating;
- (void)_loadAllPlaceholderItems;
- (void)_loadFromUDIfNecessary;
- (void)_loadInitialItemIdentifiers:(id)fp8 requireImmediateLoad:(BOOL)fp12;
- (void)_loadViewIfNecessary;
- (void)_makeFirstResponderForKeyboardHotKeyEvent;
- (void)_makeNewToolbarAssociation:(id)fp8;
- (void)_moveItemFromIndex:(NSInteger)fp8 toIndex:(NSInteger)fp12 notifyDelegate:(BOOL)fp16 notifyView:(BOOL)fp20 notifyFamilyAndUpdateDefaults:(BOOL)fp24;
- (id)_newItemFromDelegateWithItemIdentifier:(id)fp8 willBeInsertedIntoToolbar:(BOOL)fp12;
- (id)_newItemFromInitPListWithItemIdentifier:(id)fp8;
- (id)_newItemFromItemIdentifier:(id)fp8 requireImmediateLoad:(BOOL)fp12 willBeInsertedIntoToolbar:(BOOL)fp16;
- (void)_newToolbarBornNotification:(id)fp8;
- (NSInteger)_nextDisplayMode;
- (void)_noteToolbarDisplayModeChangedAndPost:(id)fp8;
- (void)_noteToolbarSizeModeChangedAndPost:(id)fp8;
- (BOOL)_notificationPostingEnabled;
- (void)_notifyDelegate_DidRemoveItem:(id)fp8;
- (void)_notifyDelegate_DidRemoveItems:(id)fp8;
- (void)_notifyDelegate_WillAddItem:(id)fp8;
- (void)_notifyFamily_DidRemoveItemAtIndex:(NSInteger)fp8;
- (void)_notifyFamily_DidSetAllCurrentItems:(id)fp8;
- (void)_notifyFamily_InsertedNewItem:(id)fp8 atIndex:(NSInteger)fp12;
- (void)_notifyFamily_MovedFromIndex:(NSInteger)fp8 toIndex:(NSInteger)fp12;
- (void)_notifyView_DidRemoveItemAtIndex:(NSInteger)fp8;
- (void)_notifyView_DidSetAllCurrentItems:(id)fp8;
- (void)_notifyView_InsertedNewItem:(id)fp8 atIndex:(NSInteger)fp12;
- (void)_notifyView_MovedFromIndex:(NSInteger)fp8 toIndex:(NSInteger)fp12;
- (NSInteger)_numberOfItems;
- (void)_postDidCreateToolbarNotifications;
- (void)_postWillDeallocToolbarNotifications;
- (BOOL)_prefersToBeShown;
- (NSInteger)_previousDisplayMode;
- (void)_removeItemAtIndex:(NSInteger)fp8 notifyDelegate:(BOOL)fp12 notifyView:(BOOL)fp16 notifyFamilyAndUpdateDefaults:(BOOL)fp20;
- (void)_replaceAllItemsAndSetNewWithItemIdentifiers:(id)fp8;
- (void)_runCustomizationPanel;
- (BOOL)_sanityCheckPListDatabase:(id)fp8;
- (void)_saveConfigurationUsingName:(id)fp8 domain:(id)fp12;
- (BOOL)_setConfigurationFromDictionary:(id)fp8 notifyFamilyAndUpdateDefaults:(BOOL)fp12;
- (BOOL)_setConfigurationUsingName:(id)fp8 domain:(id)fp12;
- (void)_setCurrentItemsToItemIdentifiers:(id)fp8 notifyDelegate:(BOOL)fp12 notifyView:(BOOL)fp16 notifyFamilyAndUpdateDefaults:(BOOL)fp20;
- (void)_setCustomizesAlwaysOnClickAndDrag:(BOOL)fp8;
- (void)_setEnableDelegateNotifications:(BOOL)fp8;
- (void)_setFirstMoveableItemIndex:(NSInteger)fp8;
- (void)_setKeyboardLoopNeedsUpdating:(BOOL)fp8;
- (void)_setNeedsDisplayForItemIdentifierSelection:(id)fp8;
- (void)_setNextSizeAndDisplayMode;
- (void)_setPreviousSizeAndDisplayMode;
- (void)_setToolbarView:(id)fp8;
- (void)_setToolbarViewWindow:(id)fp8;
- (void)_setWantsToolbarContextMenu:(BOOL)fp8;
- (void)_show:(id)fp8;
- (BOOL)_sizeModeIsValidForCurrentDisplayMode:(NSInteger)fp8;
- (void)_toggleShown:(id)fp8;
- (void)_toolbarCommonBeginInit;
- (void)_toolbarCommonFinishInit;
- (void)_toolbarInsertedNewItemNotification:(id)fp8;
- (void)_toolbarModeChangedNotification:(id)fp8;
- (void)_toolbarMovedItemNotification:(id)fp8;
- (void)_toolbarRegisterForNotifications;
- (void)_toolbarRemovedItemNotification:(id)fp8;
- (void)_toolbarReplacedAllItemsNotification:(id)fp8;
- (void)_toolbarUnregisterForNotifications;
- (id)_toolbarView;
- (void)_toolbarWillDeallocNotification:(id)fp8;
- (void)_userInsertItemWithItemIdentifier:(id)fp8 atIndex:(NSInteger)fp12;
- (void)_userMoveItemFromIndex:(NSInteger)fp8 toIndex:(NSInteger)fp12;
- (void)_userRemoveItemAtIndex:(NSInteger)fp8;
- (void)_userResetToDefaultConfiguration;
- (void)_userSetCurrentItemsToItemIdentifiers:(id)fp8;
- (BOOL)_wantsToolbarContextMenu;
- (void)_windowDidHideToolbar;
- (void)_windowWillShowToolbar;
@end
