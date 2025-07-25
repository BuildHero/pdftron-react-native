//
//  RNTPTDocumentViewManager.m
//  RNPdftron
//
//  Copyright © 2018 PDFTron. All rights reserved.
//

#import "RNTPTDocumentViewManager.h"

@implementation RNTPTDocumentViewManager

RCT_EXPORT_MODULE(RNTPTDocumentView)

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _documentViews = [NSMutableDictionary dictionary];
    }
    return self;
}

RCT_EXPORT_VIEW_PROPERTY(onChange, RCTBubblingEventBlock)

RCT_CUSTOM_VIEW_PROPERTY(document, NSString, RNTPTDocumentView)
{
    if (json && [RCTConvert NSString:json]) {
        view.document = [RCTConvert NSString:json];
    }
}


RCT_CUSTOM_VIEW_PROPERTY(source, NSString, RNTPTDocumentView)
{
    if (json && [RCTConvert NSString:json]) {
        view.document = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(isBase64String, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.base64String = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(base64FileExtension, NSString, RNTPTDocumentView)
{
    if (json) {
        view.base64Extension = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(password, NSString, RNTPTDocumentView)
{
    if (json) {
        view.password = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(initialPageNumber, int, RNTPTDocumentView)
{
    if (json) {
        view.initialPageNumber = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(page, int, RNTPTDocumentView)
{
    if (json) {
        view.page = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(initialToolbar, NSString, RNTPTDocumentView)
{
    if (json) {
        view.initialToolbar = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(pageNumber, int, RNTPTDocumentView)
{
    if (json) {
        view.pageNumber = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(showLeadingNavButton, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.showNavButton = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(leadingNavButtonIcon, NSString, RNTPTDocumentView)
{
    if (json && [RCTConvert NSString:json]) {
        view.navButtonPath = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(overflowMenuButtonIcon, NSString, RNTPTDocumentView)
{
    if (json) {
        view.overflowMenuButtonPath = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(disabledElements, NSArray, RNTPTDocumentView)
{
    if (json) {
        NSArray *disabledElements = [RCTConvert NSArray:json];
        view.disabledElements = disabledElements;
    }
}

RCT_CUSTOM_VIEW_PROPERTY(disabledTools, NSArray, RNTPTDocumentView)
{
    if (json) {
        NSArray *disabledTools = [RCTConvert NSArray:json];
        view.disabledTools = disabledTools;
    }
}

// viewer options
//RCT_CUSTOM_VIEW_PROPERTY(nightModeEnabled, BOOL, RNTPTDocumentView)
//{
//    if (json) {
//        view.nightModeEnabled = [RCTConvert BOOL:json];
//    }
//}

RCT_CUSTOM_VIEW_PROPERTY(topToolbarEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.topToolbarEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(bottomToolbarEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.bottomToolbarEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideToolbarsOnTap, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.hideToolbarsOnTap = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hidePresetBar, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.presetsToolbarHidden = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(keyboardShortcutsEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.keyboardShortcutsEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(documentSliderEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.documentSliderEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(pageIndicatorEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.pageIndicatorEnabled = [RCTConvert BOOL:json];
    }
}

//RCT_CUSTOM_VIEW_PROPERTY(pageIndicatorShowsOnPageChange, BOOL, RNTPTDocumentView)
//{
//    if (json) {
//        view.pageIndicatorShowsOnPageChange = [RCTConvert BOOL:json];
//    }
//}
//
//RCT_CUSTOM_VIEW_PROPERTY(pageIndicatorShowsWithControls, BOOL, RNTPTDocumentView)
//{
//    if (json) {
//        view.pageIndicatorShowsWithControls = [RCTConvert BOOL:json];
//    }
//}

RCT_CUSTOM_VIEW_PROPERTY(customHeaders, NSDictionary, RNTPTDocumentView)
{
    if (json) {
        view.customHeaders = [RCTConvert NSDictionary:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(documentExtension, NSString, RNTPTDocumentView)
{
    if (json && [RCTConvert NSString:json]) {
        view.documentExtension = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(readOnly, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.readOnly = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(fitMode, NSString, RNTPTDocumentView)
{
    if (json) {
        view.fitMode = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(fitPolicy, int, RNTPTDocumentView)
{
    if (json) {
        view.fitPolicy = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(layoutMode, NSString, RNTPTDocumentView)
{
    if (json) {
        view.layoutMode = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(continuousAnnotationEditing, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.continuousAnnotationEditing = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationAuthor, NSString, RNTPTDocumentView)
{
    if (json) {
        view.annotationAuthor = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(showSavedSignatures, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.showSavedSignatures = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(storeNewSignature, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.storeNewSignature = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(signSignatureFieldsWithStamps, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.signSignatureFieldsWithStamps = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(maxSignatureCount, int, RNTPTDocumentView)
{
    if (json) {
        view.maxSignatureCount = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(followSystemDarkMode, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.followSystemDarkMode = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(useStylusAsPen, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.useStylusAsPen = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(multiTabEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.multiTabEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(inkMultiStrokeEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.inkMultiStrokeEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(tabTitle, NSString, RNTPTDocumentView)
{
    if (json) {
        view.tabTitle = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(maxTabCount, int, RNTPTDocumentView)
{
    if (json) {
        view.maxTabCount = [RCTConvert int:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(collabEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.collabEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(replyReviewStateEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.replyReviewStateEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(currentUser, NSString, RNTPTDocumentView)
{
    if (json) {
        view.currentUser = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(currentUserName, NSString, RNTPTDocumentView)
{
    if (json) {
        view.currentUserName = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(autoSaveEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.autoSaveEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(enableAntialiasing, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.enableAntialiasing = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationMenuItems, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.annotationMenuItems = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(pageChangeOnTap, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.pageChangeOnTap = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(thumbnailViewEditingEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.thumbnailViewEditingEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(imageInReflowEnabled, BOOL, RNTPTDocumentView)
{
   if (json) {
       view.imageInReflowEnabled = [RCTConvert BOOL:json];
   }
}

RCT_CUSTOM_VIEW_PROPERTY(reflowOrientation, NSString*, RNTPTDocumentView)
{
    if (json) {
        view.reflowOrientation = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(selectAnnotationAfterCreation, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.selectAnnotationAfterCreation = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(autoResizeFreeTextEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.autoResizeFreeTextEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(overrideAnnotationMenuBehavior, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.overrideAnnotationMenuBehavior = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(overrideBehavior, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.overrideBehavior = [RCTConvert NSStringArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideAnnotationMenu, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.hideAnnotMenuTools = [RCTConvert NSStringArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(longPressMenuItems, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.longPressMenuItems = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(overrideLongPressMenuBehavior, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.overrideLongPressMenuBehavior = [RCTConvert NSStringArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(longPressMenuEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.longPressMenuEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationPermissionCheckEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.annotationPermissionCheckEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationToolbars, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.annotationToolbars = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideDefaultAnnotationToolbars, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.hideDefaultAnnotationToolbars = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideViewModeItems, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.hideViewModeItems = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideThumbnailsViewItems, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.hideThumbnailsViewItems = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(topAppNavBarRightBar, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.topAppNavBarRightBar = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(bottomToolbar, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.bottomToolbar = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideAnnotationToolbarSwitcher, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.hideAnnotationToolbarSwitcher = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideTopToolbars, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.hideTopToolbars = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideTopAppNavBar, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.hideTopAppNavBar = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideThumbnailFilterModes, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.hideThumbnailFilterModes = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(zoom, double, RNTPTDocumentView)
{
    if (json) {
        view.zoom = [RCTConvert double:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(scale, double, RNTPTDocumentView)
{
    if (json) {
        view.scale = [RCTConvert double:json];
    }
}


RCT_CUSTOM_VIEW_PROPERTY(horizontalScrollPos, double, RNTPTDocumentView)
{
    if (json) {
        view.horizontalScrollPos = [RCTConvert double:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(verticalScrollPos, double, RNTPTDocumentView)
{
    if (json) {
        view.verticalScrollPos = [RCTConvert double:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationsListEditingEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.annotationsListEditingEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(excludedAnnotationListTypes, NSArray, RNTPTDocumentView)
{
    if (json) {
        NSArray *excludedAnnotationListTypes = [RCTConvert NSArray:json];
        view.excludedAnnotationListTypes = excludedAnnotationListTypes;
    }
}

RCT_CUSTOM_VIEW_PROPERTY(showQuickNavigationButton, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.showQuickNavigationButton = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(showNavigationListAsSidePanelOnLargeDevices, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.showNavigationListAsSidePanelOnLargeDevices = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(restrictDownloadUsage, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.restrictDownloadUsage = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(userBookmarksListEditingEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.userBookmarksListEditingEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(disableEditingByAnnotationType, NSArray, RNTPTDocumentView)
{
    if (json) {
        NSArray *uneditableAnnotationTypes = [RCTConvert NSArray:json];
        view.uneditableAnnotationTypes = uneditableAnnotationTypes;
    }
}

RCT_CUSTOM_VIEW_PROPERTY(hideScrollbars, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.hideScrollbars = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(saveStateEnabled, BOOL, RNTPTDocumentView)
{
    if (json) {
        view.saveStateEnabled = [RCTConvert BOOL:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationManagerUndoMode, NSString, RNTPTDocumentView)
{
    if (json) {
        view.annotationManagerUndoMode = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(annotationManagerEditMode, NSString, RNTPTDocumentView)
{
    if (json) {
        view.annotationManagerEditMode = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(defaultEraserType, NSString, RNTPTDocumentView)
{
    if (json) {
        view.defaultEraserType = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(overrideToolbarButtonBehavior, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.overrideToolbarButtonBehavior = [RCTConvert NSArray:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(openUrlPath, NSString, RNTPTDocumentView)
{
    if (json) {
        view.openUrlPath = [RCTConvert NSString:json];
    }
}

// Hygen Generated Props
RCT_CUSTOM_VIEW_PROPERTY(forceAppTheme, NSString, RNTPTDocumentView)
{
    if (json) {
        view.forceAppTheme = [RCTConvert NSString:json];
    }
}

RCT_CUSTOM_VIEW_PROPERTY(signatureColors, NSArray, RNTPTDocumentView)
{
    if (json) {
        view.signatureColors = [RCTConvert NSArray:json];
    }
}


- (UIView *)view
{
    RNTPTDocumentView *documentView = [[RNTPTDocumentView alloc] init];
    documentView.delegate = self;
    return documentView;
}

#pragma mark - Events

- (void)navButtonClicked: (RNTPTDocumentView *) sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onLeadingNavButtonPressed": @YES,
        });
    }
}

- (void)documentLoaded:(RNTPTDocumentView *)sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onDocumentLoaded": (sender.document ?: @""),
        });
    }
}

- (void)documentError:(RNTPTDocumentView *)sender error:(NSString *)error
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onDocumentError": (error ?: @""),
        });
    }
}

- (void)pageChanged:(RNTPTDocumentView *)sender previousPageNumber:(int)previousPageNumber
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onPageChanged": @"onPageChanged",
            @"previousPageNumber": @(previousPageNumber),
            @"pageNumber": @(sender.pageNumber),
        });
    }
}

- (void)scrollChanged:(RNTPTDocumentView *)sender horizontal:(double)horizontal vertical:(double)vertical
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onScrollChanged": @"onScrollChanged",
            @"horizontal": @(horizontal),
            @"vertical": @(vertical),
        });
    }
}

- (void)zoomChanged:(RNTPTDocumentView *)sender zoom:(double)zoom
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onZoomChanged" : @"onZoomChanged",
            @"zoom": @(zoom),
        });
    }
}

- (void)zoomFinished:(RNTPTDocumentView *)sender zoom:(double)zoom
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onZoomFinished": @"onZoomFinished",
            @"zoom": @(zoom),
        });
    }
}

- (void)layoutChanged:(RNTPTDocumentView *)sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onLayoutChanged" : @"onLayoutChanged",
        });
    }
}
- (void)pageMoved:(RNTPTDocumentView *)sender pageMovedFromPageNumber:(int)oldPageNumber toPageNumber:(int)newPageNumber;
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onPageMoved" : @"onPageMoved",
            @"previousPageNumber" : @(oldPageNumber),
            @"pageNumber" : @(newPageNumber),
        });
    }
}
- (void)pageAdded:(RNTPTDocumentView *)sender pageNumber:(int)pageNumber;
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onPagesAdded" : @"onPagesAdded",
            @"pageNumbers" : @[@(pageNumber)],
        });
    }
}
- (void)pageRemoved:(RNTPTDocumentView *)sender pageNumber:(int)pageNumber;
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onPagesRemoved" : @"onPagesRemoved",
            @"pageNumbers" : @[@(pageNumber)],
        });
    }
}

- (void)pagesRotated:(RNTPTDocumentView *)sender pageNumbers:(NSIndexSet *)pageNumbers;
{
    NSMutableArray *pageNumbersArray=[NSMutableArray array];
    [pageNumbers enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        [pageNumbersArray addObject:[NSNumber numberWithInteger:idx]];
    }];

    if (sender.onChange) {
        sender.onChange(@{
            @"onPagesRotated" : @"onPagesRotated",
            @"pageNumbers" : [pageNumbersArray copy],
        });
    }
}

- (void)annotationsSelected:(RNTPTDocumentView *)sender annotations:(NSArray<NSDictionary<NSString *,id> *> *)annotations
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onAnnotationsSelected": @"onAnnotationsSelected",
            @"annotations": annotations,
        });
    }
}

- (void)annotationChanged:(RNTPTDocumentView *)sender annotation:(NSDictionary *)annotation action:(NSString *)action
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onAnnotationChanged" : @"onAnnotationChanged",
            @"action": action,
            @"annotations": @[annotation],
        });
    }
}

- (void)annotationFlattened:(RNTPTDocumentView *)sender annotation:(NSDictionary *)annotation
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onAnnotationFlattened" : @"onAnnotationFlattened",
            @"annotations": @[annotation],
        });
    }
}

- (void)savedSignaturesChanged:(RNTPTDocumentView *)sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onSavedSignaturesChanged" : @"onSavedSignaturesChanged",
        });
    }
}

- (void)formFieldValueChanged:(RNTPTDocumentView *)sender fields:(NSDictionary *)fields
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onFormFieldValueChanged" : @"onFormFieldValueChanged",
            @"fields": @[fields],
        });
    }
}

- (void)exportAnnotationCommand:(RNTPTDocumentView *)sender action:(NSString *)action xfdfCommand:(NSString *)xfdfCommand annotation:(NSDictionary *)annotation
{
    if (sender.onChange) {
        if (xfdfCommand) {
            sender.onChange(@{
                @"onExportAnnotationCommand": @"onExportAnnotationCommand",
                @"action": action,
                @"xfdfCommand": (xfdfCommand ?: @""),
                @"annotations": @[annotation]
            });
        } else {
            sender.onChange(@{
                @"onExportAnnotationCommand": @"onExportAnnotationCommand",
                @"error": @"XFDF command cannot be generated"
            });
        }
    }
}

- (void)annotationMenuPressed:(RNTPTDocumentView *)sender annotationMenu:(NSString *)annotationMenu annotations:(NSArray<NSDictionary<NSString *,id> *> *)annotations
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onAnnotationMenuPress": @"onAnnotationMenuPress",
            @"annotationMenu": annotationMenu,
            @"annotations": annotations,
        });
    }
}

- (void)longPressMenuPressed:(RNTPTDocumentView *)sender longPressMenu:(NSString *)longPressMenu longPressText:(NSString *)longPressText
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onLongPressMenuPress": @"onLongPressMenuPress",
            @"longPressMenu": longPressMenu,
            @"longPressText": longPressText,
        });
    }
}

- (void)bookmarkChanged:(RNTPTDocumentView *)sender bookmarkJson:(NSString *)bookmarkJson
{
    if (sender.onChange) {
        if (bookmarkJson) {
            sender.onChange(@{
                @"onBookmarkChanged": @"onBookmarkChanged",
                @"bookmarkJson": bookmarkJson,
            });
        } else {
            sender.onChange(@{
                @"onBookmarkChanged": @"onBookmarkChanged",
                @"error": @"Bookmark cannot be exported"
            });
        }
        
    }
}

- (void)tabChanged:(RNTPTDocumentView *)sender currentTab:(NSString *)currentTab
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onTabChanged": @"onTabChanged",
            @"currentTab": currentTab,
        });
    }
}

- (void)toolChanged:(RNTPTDocumentView *)sender previousTool:(NSString *)previousTool tool:(NSString *)tool
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onToolChanged": @"onToolChanged",
            @"previousTool": previousTool ?: @"unknown tool",
            @"tool": tool ?: @"unknown tool",
        });
    }
}

- (void)undoRedoStateChanged:(RNTPTDocumentView *)sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onUndoRedoStateChanged": @"onUndoRedoStateChanged",
        });
    }
}

- (void)behaviorActivated:(RNTPTDocumentView *)sender action:(NSString *)action data:(NSDictionary *)data {
    if (sender.onChange) {
        sender.onChange(@{
            @"onBehaviorActivated": @"onBehaviorActivated",
            @"action": action,
            @"data": data,
        });
    }
}

- (void)textSearchStart:(RNTPTDocumentView *)sender
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onTextSearchStart": @"onTextSearchStart",
        });
    }
}

- (void)textSearchResult:(RNTPTDocumentView *)sender found:(BOOL)found textSelection:(NSDictionary *)textSelection
{
    if (sender.onChange) {
        NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithDictionary: @{
            @"onTextSearchResult": @"onTextSearchResult",
            @"found": [NSNumber numberWithBool:found]
        }];
        
        // set potential nil value through this way
        result[@"textSelection"] = textSelection;
        
        sender.onChange(result);
    }
}

- (void)annotationToolbarItemPressed:(RNTPTDocumentView *)sender withKey:(NSString *)itemKey
{
    if (sender.onChange) {
        NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithDictionary: @{
            @"onAnnotationToolbarItemPress": @"onAnnotationToolbarItemPress",
            PTAnnotationToolbarItemKeyId: (itemKey ?: @"")
        }];
                
        sender.onChange(result);
    }
}

- (void)toolbarButtonPressed:(RNTPTDocumentView *)sender withKey:(NSString *)itemKey
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onToolbarButtonPress": @"onToolbarButtonPress",
            PTAnnotationToolbarItemKeyId: (itemKey ?: @"")
        });
    }
}

// Hygen Generated Event Listeners
- (void)currentToolbarChanged:(RNTPTDocumentView *)sender toolbar:(NSString *)toolbar
{
    if (sender.onChange) {
        sender.onChange(@{
            @"onCurrentToolbarChanged": @"onCurrentToolbarChanged",
            @"toolbar": toolbar,
        });
    }
}


#pragma mark - Methods

#if RCT_NEW_ARCH_ENABLED
- (void)setToolModeForDocumentView:(RNTPTDocumentView *)documentView toolMode:(NSString *)toolMode {
    if (documentView) {
        [documentView setToolMode:toolMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setToolModeForDocumentViewTag:(NSNumber *)tag toolMode:(NSString *)toolMode
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setToolMode:toolMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)commitToolForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        return [documentView commitTool];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return NO;
    }
}
#else
- (BOOL)commitToolForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView commitTool];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return NO;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getDocumentPathForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        return [documentView getDocumentPath];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSString *)getDocumentPathForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getDocumentPath];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSMutableArray<NSDictionary *> *)getAllFieldsForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        return [documentView getAllFieldsForDocumentViewTag:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSMutableArray<NSDictionary *> *)getAllFieldsForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getAllFieldsForDocumentViewTag:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif
 
#if RCT_NEW_ARCH_ENABLED
- (NSString *)exportAsImageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(int)pageNumber dpi:(int)dpi exportFormat:(NSString*)exportFormat transparent:(BOOL)transparent
{
    if (documentView) {
        return [documentView exportAsImage:pageNumber dpi:dpi exportFormat:exportFormat transparent:transparent];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSString *)exportAsImageForDocumentViewTag:(NSNumber *)tag pageNumber:(int)pageNumber dpi:(int)dpi exportFormat:(NSString*)exportFormat transparent:(BOOL)transparent
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView exportAsImage:pageNumber dpi:dpi exportFormat:exportFormat transparent:transparent];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageCountForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        return [documentView getPageCount];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return 0;
    }
}
#else
- (int)getPageCountForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getPageCount];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return 0;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)importBookmarkJsonForDocumentView:(RNTPTDocumentView *)documentView bookmarkJson:(NSString *)bookmarkJson
{
    if (documentView) {
        [documentView importBookmarkJson:bookmarkJson];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)importBookmarkJsonForDocumentViewTag:(NSNumber *)tag bookmarkJson:(NSString *)bookmarkJson
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView importBookmarkJson:bookmarkJson];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
-(void)openBookmarkListForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openBookmarkList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
-(void)openBookmarkListForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openBookmarkList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)exportAnnotationsForDocumentView:(RNTPTDocumentView *)documentView options:(NSDictionary *)options
{
    if (documentView) {
        return [documentView exportAnnotationsWithOptions:options];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSString *)exportAnnotationsForDocumentViewTag:(NSNumber *)tag options:(NSDictionary *)options
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView exportAnnotationsWithOptions:options];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)importAnnotationCommandForDocumentView:(RNTPTDocumentView *)documentView xfdfCommand:(NSString *)xfdfCommand initialLoad:(BOOL)initialLoad
{
    if (documentView) {
        [documentView importAnnotationCommand:xfdfCommand initialLoad:initialLoad];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)importAnnotationCommandForDocumentViewTag:(NSNumber *)tag xfdfCommand:(NSString *)xfdfCommand initialLoad:(BOOL)initialLoad
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView importAnnotationCommand:xfdfCommand initialLoad:initialLoad];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (nullable NSArray<NSDictionary *> *)importAnnotationsForDocumentView:(RNTPTDocumentView *)documentView xfdf:(NSString *)xfdfString replace:(BOOL)replace
{
    if (documentView) {
        return [documentView importAnnotations:xfdfString replace:replace];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (nullable NSArray<NSDictionary *> *)importAnnotationsForDocumentViewTag:(NSNumber *)tag xfdf:(NSString *)xfdfString replace:(BOOL)replace
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView importAnnotations:xfdfString replace:replace];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)flattenAnnotationsForDocumentView:(RNTPTDocumentView *)documentView formsOnly:(BOOL)formsOnly
{
    if (documentView) {
        [documentView flattenAnnotations:formsOnly];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)flattenAnnotationsForDocumentViewTag:(NSNumber *)tag formsOnly:(BOOL)formsOnly
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView flattenAnnotations:formsOnly];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)deleteAnnotationsForDocumentView:(RNTPTDocumentView *)documentView annotations:(NSArray *)annotations
{
    if (documentView) {
        [documentView deleteAnnotations:annotations];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)deleteAnnotationsForDocumentViewTag:(NSNumber *)tag annotations:(NSArray *)annotations
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView deleteAnnotations:annotations];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)saveDocumentForDocumentView:(RNTPTDocumentView *)documentView completionHandler:(void (^)(NSString * _Nullable filePath))completionHandler
{
    if (documentView) {
        [documentView saveDocumentWithCompletionHandler:^(NSString * _Nullable filePath){
            if (completionHandler) {
                completionHandler(filePath);
            }
        }];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"Unable to find DocumentView for tag"
                                     userInfo:nil];
    }
}
#else
- (void)saveDocumentForDocumentViewTag:(NSNumber *)tag completionHandler:(void (^)(NSString * _Nullable filePath))completionHandler
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView saveDocumentWithCompletionHandler:^(NSString * _Nullable filePath){
            if (completionHandler) {
                completionHandler(filePath);
            }
        }];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException
                                       reason:@"Unable to find DocumentView for tag"
                                     userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFlagForFieldsForDocumentView:(RNTPTDocumentView *)documentView forFields:(NSArray<NSString *> *)fields setFlag:(PTFieldFlag)flag toValue:(BOOL)value
{
    if (documentView) {
        [documentView setFlagForFields:fields setFlag:flag toValue:value];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setFlagForFieldsForDocumentViewTag:(NSNumber *)tag forFields:(NSArray<NSString *> *)fields setFlag:(PTFieldFlag)flag toValue:(BOOL)value
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setFlagForFields:fields setFlag:flag toValue:value];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setValuesForFieldsForDocumentView:(RNTPTDocumentView *)documentView map:(NSDictionary<NSString *, id> *)map
{
    if (documentView) {
        [documentView setValuesForFields:map];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setValuesForFieldsForDocumentViewTag:(NSNumber *)tag map:(NSDictionary<NSString *, id> *)map
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setValuesForFields:map];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getFieldForDocumentView:(RNTPTDocumentView *)documentView fieldName:(NSString *)fieldName
{
    if (documentView) {
        return [documentView getField:fieldName];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSDictionary *)getFieldForDocumentViewTag:(NSNumber *)tag fieldName:(NSString *)fieldName
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getField:fieldName];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFlagsForAnnotationsForDocumentView:(RNTPTDocumentView *)documentView annotationFlagList:(NSArray *)annotationFlagList
{
    if (documentView) {
        [documentView setFlagsForAnnotations:annotationFlagList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setFlagsForAnnotationsForDocumentViewTag:(NSNumber *)tag annotationFlagList:(NSArray *)annotationFlagList
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setFlagsForAnnotations:annotationFlagList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)selectAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        [documentView selectAnnotation:annotationId pageNumber:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)selectAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView selectAnnotation:annotationId pageNumber:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPropertiesForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber propertyMap:(NSDictionary *)propertyMap
{
    if (documentView) {
        [documentView setPropertiesForAnnotation:annotationId pageNumber:pageNumber propertyMap:propertyMap];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setPropertiesForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber propertyMap:(NSDictionary *)propertyMap
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setPropertiesForAnnotation:annotationId pageNumber:pageNumber propertyMap:propertyMap];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getPropertiesForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        return [documentView getPropertiesForAnnotation:annotationId pageNumber:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSDictionary *)getPropertiesForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getPropertiesForAnnotation:annotationId pageNumber:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setDrawAnnotationsForDocumentView:(RNTPTDocumentView *)documentView drawAnnotations:(BOOL)drawAnnotations
{
    if (documentView) {
        [documentView setDrawAnnotations:drawAnnotations];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setDrawAnnotationsForDocumentViewTag:(NSNumber *)tag drawAnnotations:(BOOL)drawAnnotations
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setDrawAnnotations:drawAnnotations];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setVisibilityForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber visibility:(BOOL)visibility
{
    if (documentView) {
        [documentView setVisibilityForAnnotation:annotationId pageNumber:pageNumber visibility:visibility];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setVisibilityForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber visibility:(BOOL)visibility
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setVisibilityForAnnotation:annotationId pageNumber:pageNumber visibility:visibility];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setHighlightFieldsForDocumentView:(RNTPTDocumentView *)documentView highlightFields:(BOOL)highlightFields
{
    if (documentView) {
        [documentView setHighlightFields:highlightFields];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setHighlightFieldsForDocumentViewTag:(NSNumber *)tag highlightFields:(BOOL)highlightFields
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setHighlightFields:highlightFields];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getAnnotationAtForDocumentView:(RNTPTDocumentView *)documentView x:(NSInteger)x y:(NSInteger)y distanceThreshold:(double)distanceThreshold minimumLineWeight:(double)minimumLineWeight
{
    if (documentView) {
        return [documentView getAnnotationAt:x y:y distanceThreshold:distanceThreshold minimumLineWeight:minimumLineWeight];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSDictionary *)getAnnotationAtForDocumentViewTag:(NSNumber *)tag x:(NSInteger)x y:(NSInteger)y distanceThreshold:(double)distanceThreshold minimumLineWeight:(double)minimumLineWeight
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getAnnotationAt:x y:y distanceThreshold:distanceThreshold minimumLineWeight:minimumLineWeight];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getAnnotationListAtForDocumentView:(RNTPTDocumentView *)documentView x1:(NSInteger)x1 y1:(NSInteger)y1 x2:(NSInteger)x2 y2:(NSInteger)y2
{
    if (documentView) {
        return [documentView getAnnotationListAt:x1 y1:y1 x2:x2 y2:y2];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSArray *)getAnnotationListAtForDocumentViewTag:(NSNumber *)tag x1:(NSInteger)x1 y1:(NSInteger)y1 x2:(NSInteger)x2 y2:(NSInteger)y2
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getAnnotationListAt:x1 y1:y1 x2:x2 y2:y2];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getAnnotationListOnPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        return [documentView getAnnotationListOnPage:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#else
- (NSArray *)getAnnotationListOnPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getAnnotationListOnPage:pageNumber];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
        return nil;
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getCustomDataForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId  pageNumber:(NSInteger)pageNumber key:(NSString *)key
{
    if (documentView) {
        return [documentView getCustomDataForAnnotation:annotationId pageNumber:pageNumber key:key];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSString *)getCustomDataForAnnotationForDocumentViewTag:(NSNumber *) tag annotationId:(NSString *)annotationId  pageNumber:(NSInteger)pageNumber key:(NSString *)key
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView getCustomDataForAnnotation:annotationId pageNumber:pageNumber key:key];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setAnnotationToolbarItemEnabledForDocumentView:(RNTPTDocumentView *)documentView itemId:(NSString *)itemId enable:(BOOL)enable
{
    if (documentView) {
        return [documentView setAnnotationToolbarItemEnabled:itemId enable:enable];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setAnnotationToolbarItemEnabled:(NSNumber *)tag itemId:(NSString *)itemId enable:(BOOL)enable
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView setAnnotationToolbarItemEnabled:itemId enable:enable];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getPageCropBoxForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *cropBox = [documentView getPageCropBox:pageNumber];
        return cropBox;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSDictionary<NSString *, NSNumber *> *)getPageCropBoxForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *cropBox = [documentView getPageCropBox:pageNumber];
        return cropBox;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)setCurrentPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        bool setResult = [documentView setCurrentPage:pageNumber];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)setCurrentPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool setResult = [documentView setCurrentPage:pageNumber];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getVisiblePagesForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSArray *pages = [documentView getVisiblePages];
        return pages;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSArray *)getVisiblePagesForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSArray *pages = [documentView getVisiblePages];
        return pages;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoPreviousPageForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        bool setResult = [documentView gotoPreviousPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)gotoPreviousPageForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool setResult = [documentView gotoPreviousPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoNextPageForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        bool setResult = [documentView gotoNextPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)gotoNextPageForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool setResult = [documentView gotoNextPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoFirstPageForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        bool setResult = [documentView gotoFirstPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)gotoFirstPageForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool setResult = [documentView gotoFirstPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoLastPageForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        bool setResult = [documentView gotoLastPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)gotoLastPageForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool setResult = [documentView gotoLastPage];
        return setResult;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showGoToPageViewForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView showGoToPageView];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)showGoToPageViewForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView showGoToPageView];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)closeAllTabsForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView closeAllTabs];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)closeAllTabsForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView closeAllTabs];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openTabSwitcherForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openTabSwitcher];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)openTabSwitcherForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openTabSwitcher];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (double)getZoomForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        double zoom = [documentView getZoom];
        return zoom;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (double)getZoomForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        double zoom = [documentView getZoom];
        return zoom;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageRotationForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        int rotation = [documentView getPageRotation];
        return rotation;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (int)getPageRotationForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        int rotation = [documentView getPageRotation];
        return rotation;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)rotateClockwiseForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView rotateClockwise];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)rotateClockwiseForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView rotateClockwise];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)rotateCounterClockwiseForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView rotateCounterClockwise];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)rotateCounterClockwiseForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView rotateCounterClockwise];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)undoForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView undo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)undoForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView undo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)redoForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView redo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)redoForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView redo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (bool)canUndoForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        return [documentView canUndo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (bool)canUndoForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView canUndo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (bool)canRedoForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        return [documentView canRedo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (bool)canRedoForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        return [documentView canRedo];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setZoomLimitsForDocumentView:(RNTPTDocumentView *)documentView zoomLimitMode:(NSString *)zoomLimitMode minimum:(double)minimum maximum:(double)maximum
{
    if (documentView) {
        [documentView setZoomLimits:zoomLimitMode minimum:minimum maximum:maximum];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setZoomLimitsForDocumentViewTag:(nonnull NSNumber *)tag zoomLimitMode:(NSString *)zoomLimitMode minimum:(double)minimum maximum:(double)maximum
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setZoomLimits:zoomLimitMode minimum:minimum maximum:maximum];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)zoomWithCenterForDocumentView:(RNTPTDocumentView *)documentView zoom:(double)zoom x:(int)x y:(int)y
{
    if (documentView) {
        [documentView zoomWithCenter:zoom x:x y:y];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)zoomWithCenterForDocumentViewTag:(nonnull NSNumber *)tag zoom:(double)zoom x:(int)x y:(int)y
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView zoomWithCenter:zoom x:x y:y];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)zoomToRectForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(int)pageNumber rect:(NSDictionary *)rect
{
    if (documentView) {
        [documentView zoomToRect:pageNumber rect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)zoomToRectForDocumentViewTag:(nonnull NSNumber *)tag pageNumber:(int)pageNumber rect:(NSDictionary *)rect
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView zoomToRect:pageNumber rect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)smartZoomForDocumentView:(RNTPTDocumentView *)documentView x:(int)x y:(int)y animated:(BOOL)animated
{
    if (documentView) {
        [documentView smartZoom:x y:y animated:animated];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)smartZoomForDocumentViewTag:(nonnull NSNumber *)tag x:(int)x y:(int)y animated:(BOOL)animated
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView smartZoom:x y:y animated:animated];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getScrollPosForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *scrollPos = [documentView getScrollPos];
        return scrollPos;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSDictionary<NSString *, NSNumber *> *)getScrollPosForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *scrollPos = [documentView getScrollPos];
        return scrollPos;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getCanvasSizeForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *canvasSize = [documentView getCanvasSize];
        return canvasSize;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSDictionary<NSString *, NSNumber *> *)getCanvasSizeForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSDictionary<NSString *, NSNumber *> *canvasSize = [documentView getCanvasSize];
        return canvasSize;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showViewSettingsForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect
{
    if (documentView) {
        [documentView showViewSettingsFromRect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)showViewSettingsForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView showViewSettingsFromRect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showAddPagesViewForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect
{
    if (documentView) {
        [documentView showAddPagesViewFromRect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)showAddPagesViewForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView showAddPagesViewFromRect:rect];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)shareCopyForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect withFlattening:(BOOL)flattening
{
    if (documentView) {
        [documentView shareCopyfromRect:rect withFlattening:flattening];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)shareCopyForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect withFlattening:(BOOL)flattening
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView shareCopyfromRect:rect withFlattening:flattening];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif
        
#if RCT_NEW_ARCH_ENABLED
- (void)setCurrentToolbarForDocumentView:(RNTPTDocumentView *)documentView toolbarTitle:(NSString *)toolbarTitle
{
    if (documentView) {
        [documentView setCurrentToolbar:toolbarTitle];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setCurrentToolbarForDocumentViewTag:(NSNumber *)tag toolbarTitle:(NSString *)toolbarTitle
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setCurrentToolbar:toolbarTitle];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
-(void)openLayersListForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openLayersList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
-(void)openLayersListForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openLayersList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
-(void)openNavigationListsForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openNavigationLists];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
-(void)openNavigationListsForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openNavigationLists];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
-(void)openOutlineListForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openOutlineList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
-(void)openOutlineListForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openOutlineList];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openThumbnailsViewForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView openThumbnailsView];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)openThumbnailsViewForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openThumbnailsView];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getSavedSignaturesForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSArray * signatures = [documentView getSavedSignatures];
        return signatures;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSArray *)getSavedSignaturesForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSArray * signatures = [documentView getSavedSignatures];
        return signatures;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getSavedSignatureFolderForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSString * folder = [documentView getSavedSignatureFolder];
        return folder;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSString *)getSavedSignatureFolderForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSString * folder = [documentView getSavedSignatureFolder];
        return folder;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#pragma mark - Hygen Generated Methods
#if RCT_NEW_ARCH_ENABLED
- (void)setStampImageDataForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber stampImageDataUrl:(NSString *)stampImageDataUrl
{
    if (documentView) {
        [documentView setStampImageData:annotationId pageNumber:pageNumber stampImageDataUrl:stampImageDataUrl];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to get field for tag" userInfo:nil];
    }
}
#else
- (void)setStampImageDataForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber stampImageDataUrl:(NSString *)stampImageDataUrl
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setStampImageData:annotationId pageNumber:pageNumber stampImageDataUrl:stampImageDataUrl];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to get field for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFormFieldHighlightColorForDocumentView:(RNTPTDocumentView *)documentView fieldHighlightColor:(NSDictionary *)fieldHighlightColor
{
    if (documentView) {
        [documentView setFormFieldHighlightColor:fieldHighlightColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to get field for tag" userInfo:nil];
    }
}
#else
- (void)setFormFieldHighlightColorForDocumentViewTag:(NSNumber *)tag fieldHighlightColor:(NSDictionary *)fieldHighlightColor
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setFormFieldHighlightColor:fieldHighlightColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to get field for tag" userInfo:nil];
    }
}
#endif


#pragma mark - Coordination

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)convertScreenPointsToPagePointsForDocumentView:(RNTPTDocumentView *)documentView points:(NSArray *)points
{
    if (documentView) {
        NSArray *convertedPoints = [documentView convertScreenPointsToPagePoints:points];
        return convertedPoints;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSArray *)convertScreenPointsToPagePointsForDocumentViewTag:(nonnull NSNumber *)tag points:(NSArray *)points
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSArray *convertedPoints = [documentView convertScreenPointsToPagePoints:points];
        return convertedPoints;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)convertPagePointsToScreenPointsForDocumentView:(RNTPTDocumentView *)documentView points:(NSArray *)points
{
    if (documentView) {
        NSArray *convertedPoints = [documentView convertPagePointsToScreenPoints:points];
        return convertedPoints;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSArray *)convertPagePointsToScreenPointsForDocumentViewTag:(nonnull NSNumber *)tag points:(NSArray *)points
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSArray *convertedPoints = [documentView convertPagePointsToScreenPoints:points];
        return convertedPoints;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageNumberFromScreenPointForDocumentView:(RNTPTDocumentView *)documentView x:(double)x y:(double)y {
    if (documentView) {
        int pageNumber = [documentView getPageNumberFromScreenPoint:x y:y];
        return pageNumber;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (int)getPageNumberFromScreenPointForDocumentViewTag:(nonnull NSNumber *)tag x:(double)x y:(double)y {
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        int pageNumber = [documentView getPageNumberFromScreenPoint:x y:y];
        return pageNumber;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setProgressiveRenderingForDocumentView:(RNTPTDocumentView *)documentView progressiveRendering:(BOOL)progressiveRendering initialDelay:(NSInteger)initialDelay interval:(NSInteger)interval
{
    if (documentView) {
        [documentView setProgressiveRendering:progressiveRendering initialDelay:initialDelay interval:interval];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setProgressiveRenderingForDocumentViewTag:(NSNumber *)tag progressiveRendering:(BOOL)progressiveRendering initialDelay:(NSInteger)initialDelay interval:(NSInteger)interval
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setProgressiveRendering:progressiveRendering initialDelay:initialDelay interval:interval];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setImageSmoothingforDocumentView:(RNTPTDocumentView *)documentView imageSmoothing:(BOOL)imageSmoothing
{
    if (documentView) {
        [documentView setImageSmoothing:imageSmoothing];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setImageSmoothingforDocumentViewTag:(NSNumber *)tag imageSmoothing:(BOOL)imageSmoothing
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setImageSmoothing:imageSmoothing];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setOverprintforDocumentView:(RNTPTDocumentView *)documentView overprint:(NSString *)overprint
{
    if (documentView) {
        [documentView setOverprint:overprint];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setOverprintforDocumentViewTag:(NSNumber *)tag overprint:(NSString *)overprint
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setOverprint:overprint];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPageBorderVisibilityForDocumentView:(RNTPTDocumentView *)documentView pageBorderVisibility:(BOOL)pageBorderVisibility
{
    if (documentView) {
        [documentView setPageBorderVisibility:pageBorderVisibility];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setPageBorderVisibilityForDocumentViewTag:(NSNumber *)tag pageBorderVisibility:(BOOL)pageBorderVisibility
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setPageBorderVisibility:pageBorderVisibility];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPageTransparencyGridForDocumentView:(RNTPTDocumentView *)documentView pageTransparencyGrid:(BOOL)pageTransparencyGrid
{
    if (documentView) {
        [documentView setPageTransparencyGrid:pageTransparencyGrid];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setPageTransparencyGridForDocumentViewTag:(NSNumber *)tag pageTransparencyGrid:(BOOL)pageTransparencyGrid
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setPageTransparencyGrid:pageTransparencyGrid];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setDefaultPageColorForDocumentView:(RNTPTDocumentView *)documentView defaultPageColor:(NSDictionary *)defaultPageColor
{
    if (documentView) {
        [documentView setDefaultPageColor:defaultPageColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setDefaultPageColorForDocumentViewTag:(NSNumber *)tag defaultPageColor:(NSDictionary *)defaultPageColor
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setDefaultPageColor:defaultPageColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setBackgroundColorForDocumentView:(RNTPTDocumentView *)documentView backgroundColor:(NSDictionary *)backgroundColor
{
    if (documentView) {
        [documentView setBackgroundColor:backgroundColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setBackgroundColorForDocumentViewTag:(NSNumber *)tag backgroundColor:(NSDictionary *)backgroundColor
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setBackgroundColor:backgroundColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setColorPostProcessModeForDocumentView:(RNTPTDocumentView *)documentView colorPostProcessMode:(NSString *)colorPostProcessMode
{
    if (documentView) {
        [documentView setColorPostProcessMode:colorPostProcessMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setColorPostProcessModeForDocumentViewTag:(NSNumber *)tag colorPostProcessMode:(NSString *)colorPostProcessMode
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setColorPostProcessMode:colorPostProcessMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif
        
#if RCT_NEW_ARCH_ENABLED
- (void)setColorPostProcessColorsForDocumentView:(RNTPTDocumentView *)documentView whiteColor:(NSDictionary *)whiteColor blackColor:(NSDictionary *)blackColor
{
    if (documentView) {
        [documentView setColorPostProcessColors:whiteColor blackColor:blackColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)setColorPostProcessColorsForDocumentViewTag:(NSNumber *)tag whiteColor:(NSDictionary *)whiteColor blackColor:(NSDictionary *)blackColor
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView setColorPostProcessColors:whiteColor blackColor:blackColor];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)findTextForDocumentView:(RNTPTDocumentView *)documentView searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord searchUp:(BOOL)searchUp regExp:(BOOL)regExp
{
    if (documentView) {
        [documentView findText:searchString matchCase:matchCase matchWholeWord:matchWholeWord searchUp:searchUp regExp:regExp];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)findTextForDocumentViewTag:(NSNumber *)tag searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord searchUp:(BOOL)searchUp regExp:(BOOL)regExp
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView findText:searchString matchCase:matchCase matchWholeWord:matchWholeWord searchUp:searchUp regExp:regExp];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)cancelFindTextForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView cancelFindText];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)cancelFindTextForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView cancelFindText];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openSearchForDocumentView:(RNTPTDocumentView *)documentView;
{
    if (documentView) {
        [documentView openSearch];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)openSearchForDocumentViewTag:(NSNumber *)tag;
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView openSearch];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)startSearchModeForDocumentView:(RNTPTDocumentView *)documentView searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord
{
    if (documentView) {
        [documentView startSearchMode:searchString matchCase:matchCase matchWholeWord:matchWholeWord];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)startSearchModeForDocumentViewTag:(NSNumber *)tag searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView startSearchMode:searchString matchCase:matchCase matchWholeWord:matchWholeWord];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)exitSearchModeForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView exitSearchMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)exitSearchModeForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView exitSearchMode];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getSelectionForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        NSDictionary *selection = [documentView getSelection:pageNumber];
        return selection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSDictionary *)getSelectionForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSDictionary *selection = [documentView getSelection:pageNumber];
        return selection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)hasSelectionForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        bool hasSelection = [documentView hasSelection];
        return hasSelection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)hasSelectionForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool hasSelection = [documentView hasSelection];
        return hasSelection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)clearSelectionForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView clearSelection];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)clearSelectionForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView clearSelection];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getSelectionPageRangeForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        NSDictionary *pageRange = [documentView getSelectionPageRange];
        return pageRange;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (NSDictionary *)getSelectionPageRangeForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        NSDictionary *pageRange = [documentView getSelectionPageRange];
        return pageRange;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)hasSelectionOnPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber
{
    if (documentView) {
        bool hasSelection = [documentView hasSelectionOnPage:pageNumber];
        return hasSelection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)hasSelectionOnPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        bool hasSelection = [documentView hasSelectionOnPage:pageNumber];
        return hasSelection;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)selectInRectForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect
{
    if (documentView) {
        BOOL selected = [documentView selectInRect:rect];
        return selected;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)selectInRectForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        BOOL selected = [documentView selectInRect:rect];
        return selected;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)isThereTextInRectForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect
{
    if (documentView) {
        BOOL hasText = [documentView isThereTextInRect:rect];
        return hasText;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)isThereTextInRectForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        BOOL hasText = [documentView isThereTextInRect:rect];
        return hasText;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)selectAllForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView selectAll];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)selectAllForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView selectAll];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)isReflowModeForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        BOOL inReflow = [documentView isReflowMode];
        return inReflow;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (BOOL)isReflowModeForDocumentViewTag:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        BOOL inReflow = [documentView isReflowMode];
        return inReflow;
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)toggleReflowForDocumentView:(RNTPTDocumentView *)documentView
{
    if (documentView) {
        [documentView toggleReflow];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#else
- (void)toggleReflow:(NSNumber *)tag
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    if (documentView) {
        [documentView toggleReflow];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

#pragma mark - DocumentView attached/detached

- (void)documentViewAttachedToWindow:(RNTPTDocumentView *)documentView
{
    self.documentViews[documentView.reactTag] = documentView;
}

- (void)documentViewDetachedFromWindow:(RNTPTDocumentView *)documentView
{
    [self.documentViews removeObjectForKey:documentView.reactTag];
}

#if RCT_NEW_ARCH_ENABLED
- (void)setAnnotationDisplayAuthorMapForDocumentView:(RNTPTDocumentView *)documentView authorMap:(NSDictionary *)authorMap completion:(void(^)(BOOL success, NSError * _Nullable error)) completion
{
    if (documentView) {
        [documentView setAnnotationDisplayAuthorMap:authorMap completion:completion];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView" userInfo:nil];
    }
}
#else
- (void)setAnnotationDisplayAuthorMapForDocumentViewTag: (NSNumber *)tag authorMap:(NSDictionary *)authorMap completion:(void(^)(BOOL success, NSError * _Nullable error)) completion
{
    RNTPTDocumentView *documentView = self.documentViews[tag];
    
    if (documentView) {
        [documentView setAnnotationDisplayAuthorMap:authorMap completion:completion];
    } else {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"Unable to find DocumentView for tag" userInfo:nil];
    }
}
#endif

@end