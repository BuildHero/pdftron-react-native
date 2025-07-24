//
//  RNTPTDocumentViewManager.h
//  RNPdftron
//
//  Copyright © 2018 PDFTron. All rights reserved.
//

#import "RNTPTDocumentView.h"

#import <React/RCTViewManager.h>

@interface RNTPTDocumentViewManager : RCTViewManager <RNTPTDocumentViewDelegate>

@property (nonatomic, strong) NSMutableDictionary<NSNumber *, RNTPTDocumentView *> *documentViews;

#if RCT_NEW_ARCH_ENABLED
- (void)setToolModeForDocumentView:(RNTPTDocumentView *)documentView toolMode:(NSString *)toolMode;
#else
- (void)setToolModeForDocumentViewTag:(NSNumber *)tag toolMode:(NSString *)toolMode;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)commitToolForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)commitToolForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getDocumentPathForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSString *)getDocumentPathForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString*)exportAsImageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(int)pageNumber dpi:(int)dpi exportFormat:(NSString*)exportFormat transparent:(BOOL)transparent;
#else
- (NSString*) exportAsImageForDocumentViewTag:(NSNumber*)tag pageNumber:(int)pageNumber dpi:(int)dpi exportFormat:(NSString*)exportFormat transparent:(BOOL)transparent;
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageCountForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (int)getPageCountForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)importBookmarkJsonForDocumentView:(RNTPTDocumentView *)documentView bookmarkJson:(NSString *)bookmarkJson;
#else
- (void)importBookmarkJsonForDocumentViewTag:(NSNumber *)tag bookmarkJson:(NSString *)bookmarkJson;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openBookmarkListForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openBookmarkListForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)exportAnnotationsForDocumentView:(RNTPTDocumentView *)documentView options:(NSDictionary *)options;
#else
- (NSString *)exportAnnotationsForDocumentViewTag:(NSNumber *)tag options:(NSDictionary *)options;
#endif

#if RCT_NEW_ARCH_ENABLED
- (nullable NSArray<NSDictionary *> *)importAnnotationsForDocumentView:(RNTPTDocumentView *)documentView xfdf:(NSString *)xfdfString replace:(BOOL)replace;
#else
- (nullable NSArray<NSDictionary *> *)importAnnotationsForDocumentViewTag:(NSNumber *)tag xfdf:(NSString *)xfdfString replace:(BOOL)replace;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)flattenAnnotationsForDocumentView:(RNTPTDocumentView *)documentView formsOnly:(BOOL)formsOnly;
#else
- (void)flattenAnnotationsForDocumentViewTag:(NSNumber *)tag formsOnly:(BOOL)formsOnly;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)deleteAnnotationsForDocumentView:(RNTPTDocumentView *)documentView annotations:(NSArray *)annotations;
#else
- (void)deleteAnnotationsForDocumentViewTag:(NSNumber *)tag annotations:(NSArray *)annotations;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)saveDocumentForDocumentView:(RNTPTDocumentView *)documentView completionHandler:(void (^)(NSString * _Nullable filePath))completionHandler;
#else
- (void)saveDocumentForDocumentViewTag:(NSNumber *)tag completionHandler:(void (^)(NSString * _Nullable filePath))completionHandler;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFlagForFieldsForDocumentView:(RNTPTDocumentView *)documentView forFields:(NSArray<NSString *> *)fields setFlag:(PTFieldFlag)flag toValue:(BOOL)value;
#else
- (void)setFlagForFieldsForDocumentViewTag:(NSNumber *)tag forFields:(NSArray<NSString *> *)fields setFlag:(PTFieldFlag)flag toValue:(BOOL)value;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setValuesForFieldsForDocumentView:(RNTPTDocumentView *)documentView map:(NSDictionary<NSString *, id> *)map;
#else
- (void)setValuesForFieldsForDocumentViewTag:(NSNumber *)tag map:(NSDictionary<NSString *, id> *)map;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getFieldForDocumentView:(RNTPTDocumentView *)documentView fieldName:(NSString *)fieldName;
#else
- (NSDictionary *)getFieldForDocumentViewTag:(NSNumber *)tag fieldName:(NSString *)fieldName;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFlagsForAnnotationsForDocumentView:(RNTPTDocumentView *)documentView annotationFlagList:(NSArray *)annotationFlagList;
#else
- (void)setFlagsForAnnotationsForDocumentViewTag:(NSNumber*) tag annotationFlagList:(NSArray *)annotationFlagList;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)selectAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber;
#else
- (void)selectAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPropertiesForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber propertyMap:(NSDictionary *)propertyMap;
#else
- (void)setPropertiesForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber propertyMap:(NSDictionary *)propertyMap;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getPropertiesForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber;
#else
- (NSDictionary *)getPropertiesForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setDrawAnnotationsForDocumentView:(RNTPTDocumentView *)documentView drawAnnotations:(BOOL)drawAnnotations;
#else
- (void)setDrawAnnotationsForDocumentViewTag:(NSNumber *)tag drawAnnotations:(BOOL)drawAnnotations;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setVisibilityForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber visibility:(BOOL)visibility;
#else
- (void)setVisibilityForAnnotationForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber visibility:(BOOL)visibility;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setHighlightFieldsForDocumentView:(RNTPTDocumentView *)documentView highlightFields:(BOOL)highlightFields;
#else
- (void)setHighlightFieldsForDocumentViewTag:(NSNumber *)tag highlightFields:(BOOL)highlightFields;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getAnnotationAtForDocumentView:(RNTPTDocumentView *)documentView x:(NSInteger)x y:(NSInteger)y distanceThreshold:(double)distanceThreshold minimumLineWeight:(double)minimumLineWeight;
#else
- (NSDictionary *)getAnnotationAtForDocumentViewTag:(NSNumber *)tag x:(NSInteger)x y:(NSInteger)y distanceThreshold:(double)distanceThreshold minimumLineWeight:(double)minimumLineWeight;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getAnnotationListAtForDocumentView:(RNTPTDocumentView *)documentView x1:(NSInteger)x1 y1:(NSInteger)y1 x2:(NSInteger)x2 y2:(NSInteger)y2;
#else
- (NSArray *)getAnnotationListAtForDocumentViewTag:(NSNumber *)tag x1:(NSInteger)x1 y1:(NSInteger)y1 x2:(NSInteger)x2 y2:(NSInteger)y2;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getAnnotationListOnPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (NSArray *)getAnnotationListOnPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getCustomDataForAnnotationForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber key:(NSString *)key;
#else
- (NSString *)getCustomDataForAnnotationForDocumentViewTag:(NSNumber *) tag annotationId:(NSString *)annotationId  pageNumber:(NSInteger)pageNumber key:(NSString *)key;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setAnnotationToolbarItemEnabledForDocumentView:(RNTPTDocumentView *)documentView itemId:(NSString *)itemId enable:(BOOL)enable;
#else
- (void)setAnnotationToolbarItemEnabled:(NSNumber *)tag itemId:(NSString *)itemId enable:(BOOL)enable;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getPageCropBoxForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (NSDictionary<NSString *, NSNumber *> *)getPageCropBoxForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSMutableArray<NSDictionary *> *)getAllFieldsForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (NSMutableArray<NSDictionary *> *)getAllFieldsForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)setCurrentPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (BOOL)setCurrentPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getVisiblePagesForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSArray *)getVisiblePagesForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoPreviousPageForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)gotoPreviousPageForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoNextPageForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)gotoNextPageForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoFirstPageForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)gotoFirstPageForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)gotoLastPageForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)gotoLastPageForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showGoToPageViewForDocumentView:(RNTPTDocumentView *)documentView;
#else
-(void)showGoToPageViewForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)closeAllTabsForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)closeAllTabsForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openTabSwitcherForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openTabSwitcherForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (double)getZoomForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (double)getZoomForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageRotationForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (int)getPageRotationForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)rotateClockwiseForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)rotateClockwiseForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)rotateCounterClockwiseForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)rotateCounterClockwiseForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)undoForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)undoForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)redoForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)redoForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (bool)canUndoForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (bool)canUndoForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (bool)canRedoForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (bool)canRedoForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setZoomLimitsForDocumentView:(RNTPTDocumentView *)documentView zoomLimitMode:(NSString *)zoomLimitMode minimum:(double)minimum maximum:(double)maximum;
#else
- (void)setZoomLimitsForDocumentViewTag:(nonnull NSNumber *)tag zoomLimitMode:(NSString *)zoomLimitMode minimum:(double)minimum maximum:(double)maximum;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)zoomWithCenterForDocumentView:(RNTPTDocumentView *)documentView zoom:(double)zoom x:(int)x y:(int)y;
#else
- (void)zoomWithCenterForDocumentViewTag:(nonnull NSNumber *)tag zoom:(double)zoom x:(int)x y:(int)y;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)zoomToRectForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(int)pageNumber rect:(NSDictionary *)rect;
#else
- (void)zoomToRectForDocumentViewTag:(nonnull NSNumber *)tag pageNumber:(int)pageNumber rect:(NSDictionary *)rect;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)smartZoomForDocumentView:(RNTPTDocumentView *)documentView x:(int)x y:(int)y animated:(BOOL)animated;
#else
- (void)smartZoomForDocumentViewTag:(nonnull NSNumber *)tag x:(int)x y:(int)y animated:(BOOL)animated;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getScrollPosForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSDictionary<NSString *, NSNumber *> *)getScrollPosForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary<NSString *, NSNumber *> *)getCanvasSizeForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSDictionary<NSString *, NSNumber *> *)getCanvasSizeForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)convertScreenPointsToPagePointsForDocumentView:(RNTPTDocumentView *)documentView points:(NSArray *)points;
#else
- (NSArray *)convertScreenPointsToPagePointsForDocumentViewTag:(nonnull NSNumber *)tag points:(NSArray *)points;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)convertPagePointsToScreenPointsForDocumentView:(RNTPTDocumentView *)documentView points:(NSArray *)points;
#else
- (NSArray *)convertPagePointsToScreenPointsForDocumentViewTag:(nonnull NSNumber *)tag points:(NSArray *)points;
#endif

#if RCT_NEW_ARCH_ENABLED
- (int)getPageNumberFromScreenPointForDocumentView:(RNTPTDocumentView *)documentView x:(double)x y:(double)y;
#else
- (int)getPageNumberFromScreenPointForDocumentViewTag:(nonnull NSNumber *)tag x:(double)x y:(double)y;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setProgressiveRenderingForDocumentView:(RNTPTDocumentView *)documentView progressiveRendering:(BOOL)progressiveRendering initialDelay:(NSInteger)initialDelay interval:(NSInteger)interval;
#else
- (void)setProgressiveRenderingForDocumentViewTag:(NSNumber *)tag progressiveRendering:(BOOL)progressiveRendering initialDelay:(NSInteger)initialDelay interval:(NSInteger)interval;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setImageSmoothingforDocumentView:(RNTPTDocumentView *)documentView imageSmoothing:(BOOL)imageSmoothing;
#else
- (void)setImageSmoothingforDocumentViewTag:(NSNumber *)tag imageSmoothing:(BOOL)imageSmoothing;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setOverprintforDocumentView:(RNTPTDocumentView *)documentView overprint:(NSString *)overprint;
#else
- (void)setOverprintforDocumentViewTag:(NSNumber *)tag overprint:(NSString *)overprint;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPageBorderVisibilityForDocumentView:(RNTPTDocumentView *)documentView pageBorderVisibility:(BOOL)pageBorderVisibility;
#else
- (void)setPageBorderVisibilityForDocumentViewTag:(NSNumber *)tag pageBorderVisibility:(BOOL)pageBorderVisibility;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setPageTransparencyGridForDocumentView:(RNTPTDocumentView *)documentView pageTransparencyGrid:(BOOL)pageTransparencyGrid;
#else
- (void)setPageTransparencyGridForDocumentViewTag:(NSNumber *)tag pageTransparencyGrid:(BOOL)pageTransparencyGrid;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setDefaultPageColorForDocumentView:(RNTPTDocumentView *)documentView defaultPageColor:(NSDictionary *)defaultPageColor;
#else
- (void)setDefaultPageColorForDocumentViewTag:(NSNumber *)tag defaultPageColor:(NSDictionary *)defaultPageColor;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setBackgroundColorForDocumentView:(RNTPTDocumentView *)documentView backgroundColor:(NSDictionary *)backgroundColor;
#else
- (void)setBackgroundColorForDocumentViewTag:(NSNumber *)tag backgroundColor:(NSDictionary *)backgroundColor;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setColorPostProcessModeForDocumentView:(RNTPTDocumentView *)documentView colorPostProcessMode:(NSString *)colorPostProcessMode;
#else
- (void)setColorPostProcessModeForDocumentViewTag:(NSNumber *)tag colorPostProcessMode:(NSString *)colorPostProcessMode;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setColorPostProcessColorsForDocumentView:(RNTPTDocumentView *)documentView whiteColor:(NSDictionary *)whiteColor blackColor:(NSDictionary *)blackColor;
#else
- (void)setColorPostProcessColorsForDocumentViewTag:(NSNumber *)tag whiteColor:(NSDictionary *)whiteColor blackColor:(NSDictionary *)blackColor;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)findTextForDocumentView:(RNTPTDocumentView *)documentView searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord searchUp:(BOOL)searchUp regExp:(BOOL)regExp;
#else
- (void)findTextForDocumentViewTag:(NSNumber *)tag searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord searchUp:(BOOL)searchUp regExp:(BOOL)regExp;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)cancelFindTextForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)cancelFindTextForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openSearchForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openSearchForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)startSearchModeForDocumentView:(RNTPTDocumentView *)documentView searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord;
#else
- (void)startSearchModeForDocumentViewTag:(NSNumber *)tag searchString:(NSString *)searchString matchCase:(BOOL)matchCase matchWholeWord:(BOOL)matchWholeWord;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)exitSearchModeForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)exitSearchModeForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getSelectionForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (NSDictionary *)getSelectionForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)hasSelectionForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)hasSelectionForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)clearSelectionForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)clearSelectionForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSDictionary *)getSelectionPageRangeForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSDictionary *)getSelectionPageRangeForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (bool)hasSelectionOnPageForDocumentView:(RNTPTDocumentView *)documentView pageNumber:(NSInteger)pageNumber;
#else
- (bool)hasSelectionOnPageForDocumentViewTag:(NSNumber *)tag pageNumber:(NSInteger)pageNumber;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)selectInRectForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect;
#else
- (BOOL)selectInRectForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)isThereTextInRectForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect;
#else
- (BOOL)isThereTextInRectForDocumentViewTag:(NSNumber *)tag rect:(NSDictionary *)rect;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)selectAllForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)selectAllForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)importAnnotationCommandForDocumentView:(RNTPTDocumentView *)documentView xfdfCommand:(NSString *)xfdfCommand initialLoad:(BOOL)initialLoad;
#else
- (void)importAnnotationCommandForDocumentViewTag:(NSNumber *)tag xfdfCommand:(NSString *)xfdfCommand initialLoad:(BOOL)initialLoad;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setCurrentToolbarForDocumentView:(RNTPTDocumentView *)documentView toolbarTitle:(NSString*)toolbarTitle;
#else
- (void)setCurrentToolbarForDocumentViewTag:(NSNumber *)tag toolbarTitle:(NSString*)toolbarTitle;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openOutlineListForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openOutlineListForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openLayersListForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openLayersListForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openNavigationListsForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openNavigationListsForDocumentViewTag:(NSNumber *) tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openAnnotationListForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openAnnotationListForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (BOOL)isReflowModeForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (BOOL)isReflowModeForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)toggleReflowForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)toggleReflow:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showViewSettingsForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect;
#else
- (void)showViewSettingsForDocumentViewTag:(nonnull NSNumber *)tag rect:(NSDictionary *)rect;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)showAddPagesViewForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect;
#else
- (void)showAddPagesViewForDocumentViewTag:(nonnull NSNumber *)tag rect:(NSDictionary *)rect;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)shareCopyForDocumentView:(RNTPTDocumentView *)documentView rect:(NSDictionary *)rect withFlattening:(BOOL)flattening;
#else
- (void)shareCopyForDocumentViewTag:(nonnull NSNumber *)tag rect:(NSDictionary *)rect withFlattening:(BOOL)flattening;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)openThumbnailsViewForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (void)openThumbnailsViewForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSArray *)getSavedSignaturesForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSArray *)getSavedSignaturesForDocumentViewTag:(NSNumber *)tag;
#endif

#if RCT_NEW_ARCH_ENABLED
- (NSString *)getSavedSignatureFolderForDocumentView:(RNTPTDocumentView *)documentView;
#else
- (NSString *)getSavedSignatureFolderForDocumentViewTag:(NSNumber *)tag;
#endif

#pragma mark - Hygen Generated Methods
#if RCT_NEW_ARCH_ENABLED
- (void)setStampImageDataForDocumentView:(RNTPTDocumentView *)documentView annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber stampImageDataUrl:(NSString *)stampImageDataUrl;
#else
- (void)setStampImageDataForDocumentViewTag:(NSNumber *)tag annotationId:(NSString *)annotationId pageNumber:(NSInteger)pageNumber stampImageDataUrl:(NSString *)stampImageDataUrl;
#endif

#if RCT_NEW_ARCH_ENABLED
- (void)setFormFieldHighlightColorForDocumentView:(RNTPTDocumentView *)documentView fieldHighlightColor:(NSDictionary *)fieldHighlightColor;
#else
- (void)setFormFieldHighlightColorForDocumentViewTag:(NSNumber *)tag fieldHighlightColor:(NSDictionary *)fieldHighlightColor;
#endif

@end
