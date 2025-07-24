#import "RNTPTDocumentViewModule.h"

#import "RNTPTDocumentViewManager.h"

#import <React/RCTLog.h>
#import <PDFNet/PDFNet.h>

@implementation RNTPTDocumentViewModule

@synthesize bridge = _bridge;

#if RCT_NEW_ARCH_ENABLED
@synthesize viewRegistry_DEPRECATED = _viewRegistry_DEPRECATED;
#endif

#if RCT_NEW_ARCH_ENABLED
- (RNTPTDocumentView *)getDocumentView:(nonnull NSNumber *)tag viewRegistry:(nonnull RCTViewRegistry *)viewRegistry
{
    UIView *view = [viewRegistry viewForReactTag:tag];
    
    RNTPTDocumentView *documentView;
    
    if ([view isKindOfClass:[RNTPTDocumentView class]]) {
        documentView = (RNTPTDocumentView *)view;
    } else {
        // // This component is used in Fabric through LegacyInteropLayer.
        UIView *subview = view.subviews.firstObject;
        
        if ([subview isKindOfClass:[RNTPTDocumentView class]]) {
            documentView = (RNTPTDocumentView *)subview;
        } else {
            throw [NSException exceptionWithName:@"InvalidView" reason:@"View is not a RNTPTDocumentView" userInfo:nil];
        }
    }
    
    return documentView;
}
#endif

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE(DocumentViewManager) // JS-name

- (RNTPTDocumentViewManager *)documentViewManager
{
    return [self.bridge moduleForClass:[RNTPTDocumentViewManager class]];
}

- (NSError *)errorFromException:(NSException *)exception
{
    return [NSError errorWithDomain:@"com.pdftron.react-native" code:0 userInfo:
            @{
        NSLocalizedDescriptionKey: exception.name,
        NSLocalizedFailureReasonErrorKey: exception.reason ?: @"",
    }];
}

#pragma mark - Methods

RCT_REMAP_METHOD(setToolMode,
                 setToolModeForDocumentViewTag:(nonnull NSNumber *)tag
                 toolMode:(NSString *)toolMode
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [self.documentViewManager setToolModeForDocumentView:documentView toolMode:toolMode];
        }];
#else
        [[self documentViewManager] setToolModeForDocumentViewTag:tag toolMode:toolMode];
#endif
        resolve(nil);
    }
    @catch (NSException *exception) {
        reject(@"set_tool_mode_failed", @"Failed to set tool mode", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(commitTool,
                 commitToolForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL committed = [[self documentViewManager] commitToolForDocumentView:documentView];
            resolve(@(committed));
        }];
#else
        BOOL committed = [[self documentViewManager] commitToolForDocumentViewTag:tag];
        resolve(@(committed));
#endif
    }
    @catch (NSException *exception) {
        reject(@"commit_tool", @"Failed to commit tool", [self errorFromException:exception]);
    }
}

#pragma mark - Methods (w/ promises)

RCT_REMAP_METHOD(getDocumentPath,
                 getDocumentPathForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSString *path = [[self documentViewManager] getDocumentPathForDocumentView:documentView];
            resolve(path);
        }];
#else
        NSString *path = [[self documentViewManager] getDocumentPathForDocumentViewTag:tag];
        resolve(path);
#endif
    }
    @catch (NSException *exception) {
        reject(@"export_failed", @"Failed to get document path", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getAllFields,
                 getAllFieldsForDocumentViewTag:(nonnull NSNumber *)tag
                 pageNumber:(int)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSMutableArray<NSDictionary *> *fields = [[self documentViewManager] getAllFieldsForDocumentView:documentView pageNumber:pageNumber];
            resolve(fields);
        }];
#else
        NSMutableArray<NSDictionary *> *fields= [[self documentViewManager] getAllFieldsForDocumentViewTag:tag pageNumber:pageNumber];
        resolve(fields);
#endif
    }
    @catch (NSException *exception) {
        reject(@"export_failed", @"Failed to get all fields for the page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(exportAsImage,
                 exportAsImageForDocumentViewTag:(nonnull NSNumber *)tag
                 pageNumber:(int)pageNumber
                 dpi:(int)dpi
                 exportFormat:(NSString*)exportFormat
                 transparent:(BOOL)transparent
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSString *path = [[self documentViewManager] exportAsImageForDocumentView:documentView pageNumber:pageNumber dpi:dpi exportFormat:exportFormat transparent:transparent];
            resolve(path);
        }];
#else
        NSString *path = [[self documentViewManager] exportAsImageForDocumentViewTag:tag pageNumber:pageNumber dpi:dpi exportFormat:exportFormat transparent:transparent];
        resolve(path);
#endif
    }
    @catch (NSException *exception) {
        reject(@"export_failed", @"Failed to get document path", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setCurrentToolbar,
                 setCurrentToolbarForDocumentViewTag:(nonnull NSNumber *)tag
                 toolbarTitle:(NSString*)toolbarTitle
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setCurrentToolbarForDocumentView:documentView toolbarTitle:toolbarTitle];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setCurrentToolbarForDocumentViewTag:tag toolbarTitle:toolbarTitle];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_current_toolbar_failed", @"Failed to set current toolbar", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getPageCount,
                 getPageCountForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            int pageCount = [[self documentViewManager] getPageCountForDocumentView:documentView];
            resolve(@(pageCount));
        }];
#else
        int pageCount = [[self documentViewManager] getPageCountForDocumentViewTag:tag];
        resolve(@(pageCount));
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_failed", @"Failed to get page count", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(importBookmarkJson,
                 importBookmarkJsonForDocumentViewTag:(nonnull NSNumber *)tag
                 bookmarkJson:(NSString *)bookmarkJson
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] importBookmarkJsonForDocumentView:documentView bookmarkJson:bookmarkJson];
            resolve(nil);
        }];
#else
        [[self documentViewManager] importBookmarkJsonForDocumentViewTag:tag bookmarkJson:bookmarkJson];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"import_failed", @"Failed to import bookmark json", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openBookmarkList,
                 openBookmarkListForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openBookmarkListForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openBookmarkListForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_bookmark_list_failed", @"Failed to open bookmark list", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(exportAnnotations,
                 exportAnnotationsForDocumentViewTag:(nonnull NSNumber *)tag
                 options:(NSDictionary *)options
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSString *xfdf = [[self documentViewManager] exportAnnotationsForDocumentView:documentView
                                                                                  options:options];
            resolve(xfdf);
        }];
#else
        NSString *xfdf = [[self documentViewManager] exportAnnotationsForDocumentViewTag:tag
                                                                                 options:options];
        resolve(xfdf);
#endif
    }
    @catch (NSException *exception) {
        reject(@"export_failed", @"Failed to export annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(importAnnotations,
                 importAnnotationsForDocumentViewTag:(nonnull NSNumber *)tag
                 xfdf:(NSString *)xfdf
                 replace:(BOOL)replace
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray<NSDictionary *>* importedAnnotations = [[self documentViewManager] importAnnotationsForDocumentView:documentView xfdf:xfdf replace:replace];
            resolve(importedAnnotations);
        }];
#else
        NSArray<NSDictionary *>* importedAnnotations = [[self documentViewManager] importAnnotationsForDocumentViewTag:tag xfdf:xfdf replace:replace];
        resolve(importedAnnotations);
#endif
    }
    @catch (NSException *exception) {
        reject(@"import_failed", @"Failed to import annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(flattenAnnotations,
                 flattenAnnotationsForDocumentViewTag:(nonnull NSNumber *)tag
                 formsOnly:(BOOL)formsOnly
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] flattenAnnotationsForDocumentView:documentView formsOnly:formsOnly];
            resolve(nil);
        }];
#else
        [[self documentViewManager] flattenAnnotationsForDocumentViewTag:tag formsOnly:formsOnly];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"flatten_failed", @"Failed to flatten annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(deleteAnnotations,
                 deleteAnnotationsForDocumentViewTag:(nonnull NSNumber *)tag
                 annotations:(NSArray *)annotations
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] deleteAnnotationsForDocumentView:documentView annotations:annotations];
            resolve(nil);
        }];
#else
        [[self documentViewManager] deleteAnnotationsForDocumentViewTag:tag annotations:annotations];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"delete_failed", @"Failed to delete annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(saveDocument,
                 saveDocumentForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] saveDocumentForDocumentView:documentView completionHandler:^(NSString * _Nullable filePath) {
                if (filePath) {
                    resolve(filePath);
                } else {
                    reject(@"save_failed", @"Failed to save document", nil);
                }
            }];
        }];
#else
        [[self documentViewManager] saveDocumentForDocumentViewTag:tag completionHandler:^(NSString * _Nullable filePath) {
            if (filePath) {
                resolve(filePath);
            } else {
                reject(@"save_failed", @"Failed to save document", nil);
            }
        }];
#endif
    }
    @catch (NSException *exception) {
        reject(@"save_failed", @"Failed to save document", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setFlagForFields,
                 setFlagForFieldsForDocumentViewTag:(nonnull NSNumber *)tag
                 fields:(NSArray<NSString *> *)fields
                 flag:(NSInteger)flag
                 value:(BOOL)value
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setFlagForFieldsForDocumentView:documentView forFields:fields setFlag:(PTFieldFlag)flag toValue:value];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setFlagForFieldsForDocumentViewTag:tag forFields:fields setFlag:(PTFieldFlag)flag toValue:value];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_flag_for_fields", @"Failed to set flag on fields", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setValuesForFields,
                 setValuesForFieldsForDocumentViewTag:(nonnull NSNumber *)tag
                 map:(NSDictionary<NSString *, id> *)map
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setValuesForFieldsForDocumentView:documentView map:map];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setValuesForFieldsForDocumentViewTag:tag map:map];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_value_for_fields", @"Failed to set value on fields", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getField,
                 getFieldForDocumentViewTag:(nonnull NSNumber *)tag
                 fieldName:(NSString *)fieldName
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary *field = [[self documentViewManager] getFieldForDocumentView:documentView fieldName:fieldName];
            resolve(field);
        }];
#else
        NSDictionary *field = [[self documentViewManager] getFieldForDocumentViewTag:tag fieldName:fieldName];
        resolve(field);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_field", @"Failed to get field", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openAnnotationList,
                 openAnnotationListForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openAnnotationListForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openAnnotationListForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_annotation_list", @"Failed to open annotation list", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setFlagsForAnnotations,
                 setFlagsForAnnotationsForDocumentViewTag:(nonnull NSNumber *)tag
                 annotationFlagList:(NSArray *)annotationFlagList
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setFlagsForAnnotationsForDocumentView:documentView annotationFlagList:annotationFlagList];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setFlagsForAnnotationsForDocumentViewTag:tag annotationFlagList:annotationFlagList];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_flag_for_annotations", @"Failed to set flag on annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(selectAnnotation,
                 selectAnnotationForDocumentViewTag:(nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] selectAnnotationForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber];
            resolve(nil);
        }];
#else
        [[self documentViewManager] selectAnnotationForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"select_annotation", @"Failed to select annotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setPropertiesForAnnotation,
                 setPropertiesForAnnotationForDocumentViewTag: (nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 propertyMap:(NSDictionary *)propertyMap
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setPropertiesForAnnotationForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber propertyMap:propertyMap];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setPropertiesForAnnotationForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber propertyMap:propertyMap];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_property_for_annotation", @"Failed to set property for annotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getPropertiesForAnnotation,
                 getPropertiesForAnnotationForDocumentViewTag: (nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary *propertyMap = [[self documentViewManager] getPropertiesForAnnotationForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber];
            resolve(propertyMap);
        }];
#else
        NSDictionary *propertyMap = [[self documentViewManager] getPropertiesForAnnotationForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber];
        resolve(propertyMap);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_properties_for_annotation", @"Failed to get properties for annotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setDrawAnnotations,
                 setDrawAnnotationsForDocumentViewTag: (nonnull NSNumber *)tag
                 drawAnnotations:(BOOL)drawAnnotations
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setDrawAnnotationsForDocumentView:documentView drawAnnotations:drawAnnotations];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setDrawAnnotationsForDocumentViewTag:tag drawAnnotations:drawAnnotations];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_draw_annotations", @"Failed to set draw annotations", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setVisibilityForAnnotation,
                 setVisibilityForAnnotationForDocumentViewTag: (nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 visibility:(BOOL)visibility
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setVisibilityForAnnotationForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber visibility:visibility];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setVisibilityForAnnotationForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber visibility:visibility];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_visibility_for_annotation", @"Failed to set visibility for annotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setHighlightFields,
                 setHighlightFieldsForDocumentViewTag: (nonnull NSNumber *)tag
                 highlightFields:(BOOL)highlightFields
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setHighlightFieldsForDocumentView:documentView highlightFields:highlightFields];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setHighlightFieldsForDocumentViewTag:tag highlightFields:highlightFields];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_highlight_fields", @"Failed to set highlight fields", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getAnnotationAt,
                 getAnnotationAtForDocumentViewTag: (nonnull NSNumber *)tag
                 x:(NSInteger)x
                 y:(NSInteger)y
                 distanceThreshold:(double)distanceThreshold
                 minimumLineWeight:(double)minimumLineWeight
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary *annotation = [[self documentViewManager] getAnnotationAtForDocumentView:documentView x:x y:y distanceThreshold:distanceThreshold minimumLineWeight:minimumLineWeight];
            resolve(annotation);
        }];
#else
        NSDictionary *annotation = [[self documentViewManager] getAnnotationAtForDocumentViewTag:tag x:x y:y distanceThreshold:distanceThreshold minimumLineWeight:minimumLineWeight];
        resolve(annotation);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_annotation_at", @"Failed to get annotation at", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getAnnotationListAt,
                 getAnnotationListAtForDocumentViewTag: (nonnull NSNumber *)tag
                 x1:(NSInteger)x1
                 y1:(NSInteger)y1
                 x2:(NSInteger)x2
                 y2:(NSInteger)y2
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *annotations = [[self documentViewManager] getAnnotationListAtForDocumentView:documentView x1:x1 y1:y1 x2:x2 y2:y2];
            resolve(annotations);
        }];
#else
        NSArray *annotations = [[self documentViewManager] getAnnotationListAtForDocumentViewTag:tag x1:x1 y1:y1 x2:x2 y2:y2];
        resolve(annotations);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_annotation_list_at", @"Failed to get annotation list at", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getAnnotationListOnPage,
                 getAnnotationListOnPageForDocumentViewTag: (nonnull NSNumber *)tag
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *annotations = [[self documentViewManager] getAnnotationListOnPageForDocumentView:documentView pageNumber:pageNumber];
            resolve(annotations);
        }];
#else
        NSArray *annotations = [[self documentViewManager] getAnnotationListOnPageForDocumentViewTag:tag pageNumber:pageNumber];
        resolve(annotations);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_annotation_list_on_page", @"Failed to get annotation list on page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getCustomDataForAnnotation,
                 getCustomDataForAnnotationForDocumentViewTag: (nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 key:(NSString *)key
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSString *customData = [[self documentViewManager]
                                    getCustomDataForAnnotationForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber key:key];
            resolve(customData);
        }];
#else
        NSString *customData = [[self documentViewManager]
                                getCustomDataForAnnotationForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber key:key];
        resolve(customData);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_custom_data_for_annotation", @"Failed to get custom data for annotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setAnnotationToolbarItemEnabled,
                 setAnnotationToolbarItemEnabledForDocumentViewTag:(nonnull NSNumber *)tag
                 itemId:(NSString *)itemId
                 enable:(BOOL)enable
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setAnnotationToolbarItemEnabledForDocumentView:documentView itemId:itemId enable:enable];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setAnnotationToolbarItemEnabled:tag itemId:itemId enable:enable];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_annotation_toolbar_item_enabled", @"Failed to set item enabled/disabled", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getPageCropBox,
                 getPageCropBoxForDocumentViewTag: (nonnull NSNumber *)tag
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary<NSString *, NSNumber *> *cropBox = [[self documentViewManager] getPageCropBoxForDocumentView:documentView pageNumber:pageNumber];
            resolve(cropBox);
        }];
#else
        NSDictionary<NSString *, NSNumber *> *cropBox = [[self documentViewManager] getPageCropBoxForDocumentViewTag:tag pageNumber:pageNumber];
        resolve(cropBox);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_page_crop_box", @"Failed to get page cropbox", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setCurrentPage,
                 setCurrentPageforDocumentViewTag: (nonnull NSNumber *) tag
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool setResult = [[self documentViewManager] setCurrentPageForDocumentView:documentView pageNumber:pageNumber];
            resolve([NSNumber numberWithBool:setResult]);
        }];
#else
        bool setResult = [[self documentViewManager] setCurrentPageForDocumentViewTag:tag pageNumber:pageNumber];
        resolve([NSNumber numberWithBool:setResult]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_current_page", @"Failed to set current page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getVisiblePages,
                 getVisiblePagesforDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *pages = [[self documentViewManager] getVisiblePagesForDocumentView:documentView];
            resolve(pages);
        }];
#else
        NSArray *pages = [[self documentViewManager] getVisiblePagesForDocumentViewTag:tag];
        resolve(pages);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_visible_pages", @"Failed to get visible pages", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(gotoPreviousPage,
                 gotoPreviousPageforDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool setResult = [[self documentViewManager] gotoPreviousPageForDocumentView:documentView];
            resolve([NSNumber numberWithBool:setResult]);
        }];
#else
        bool setResult = [[self documentViewManager] gotoPreviousPageForDocumentViewTag:tag];
        resolve([NSNumber numberWithBool:setResult]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"goto_previous_page", @"Failed to go to previous page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(gotoNextPage,
                 gotoNextPageforDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool setResult = [[self documentViewManager] gotoNextPageForDocumentView:documentView];
            resolve([NSNumber numberWithBool:setResult]);
        }];
#else
        bool setResult = [[self documentViewManager] gotoNextPageForDocumentViewTag:tag];
        resolve([NSNumber numberWithBool:setResult]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"goto_next_page", @"Failed to go to next page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(gotoFirstPage,
                 gotoFirstPageforDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool setResult = [[self documentViewManager] gotoFirstPageForDocumentView:documentView];
            resolve([NSNumber numberWithBool:setResult]);
        }];
#else
        bool setResult = [[self documentViewManager] gotoFirstPageForDocumentViewTag:tag];
        resolve([NSNumber numberWithBool:setResult]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"goto_first_page", @"Failed to go to first page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(gotoLastPage,
                 gotoLastPageforDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool setResult = [[self documentViewManager] gotoLastPageForDocumentView:documentView];
            resolve([NSNumber numberWithBool:setResult]);
        }];
#else
        bool setResult = [[self documentViewManager] gotoLastPageForDocumentViewTag:tag];
        resolve([NSNumber numberWithBool:setResult]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"goto_last_page", @"Failed to go to last page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(showGoToPageView,
                 showGoToPageViewForDocumentViewTag: (nonnull NSNumber *) tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] showGoToPageViewForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] showGoToPageViewForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"show_go_to_page_view", @"Failed to open goto page view", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(closeAllTabs,
                 closeAllTabsForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] closeAllTabsForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] closeAllTabsForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"close_all_tabs", @"Failed to close all tabs", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openTabSwitcher,
                 openTabSwitcherForDocumentViewTag:(nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openTabSwitcherForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openTabSwitcherForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_tab_switcher", @"Failed to open tab switcher", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getPageRotation,
                 getPageRotationForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            int pageNumber = [[self documentViewManager] getPageRotationForDocumentView:documentView];
            resolve([NSNumber numberWithInt:pageNumber]);
        }];
#else
        int pageNumber = [[self documentViewManager] getPageRotationForDocumentViewTag:tag];
        resolve([NSNumber numberWithInt:pageNumber]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_page_rotation", @"Failed to get page rotation", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(rotateClockwise,
                 rotateClockwiseForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] rotateClockwiseForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] rotateClockwiseForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"rotate_clockwise", @"Failed to rotate clockwise", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(rotateCounterClockwise,
                 rotateCounterClockwiseForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] rotateCounterClockwiseForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] rotateCounterClockwiseForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"rotate_counter_clockwise", @"Failed to rotate counter-clockwise", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(undo,
                 undoForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] undoForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] undoForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"undo", @"Failed to undo", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(redo,
                 redoForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] redoForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] redoForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"redo", @"Failed to redo", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(canUndo,
                 canUndoForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL canUndo = [[self documentViewManager] canUndoForDocumentView:documentView];
            resolve(@(canUndo));
        }];
#else
        BOOL canUndo = [[self documentViewManager] canUndoForDocumentViewTag:tag];
        resolve(@(canUndo));
#endif
    }
    @catch (NSException *exception) {
        reject(@"canUndo", @"Failed to get canUndo", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(canRedo,
                 canRedoForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL canRedo = [[self documentViewManager] canRedoForDocumentView:documentView];
            resolve(@(canRedo));
        }];
#else
        BOOL canRedo = [[self documentViewManager] canRedoForDocumentViewTag:tag];
        resolve(@(canRedo));
#endif
    }
    @catch (NSException *exception) {
        reject(@"canRedo", @"Failed to canRedo", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getZoom,
                 getZoomForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            double zoom = [[self documentViewManager] getZoomForDocumentView:documentView];
            resolve([NSNumber numberWithDouble:zoom]);
        }];
#else
        double zoom = [[self documentViewManager] getZoomForDocumentViewTag:tag];
        resolve([NSNumber numberWithDouble:zoom]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_zoom", @"Failed to get zoom", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setZoomLimits,
                 setZoomLimitsForDocumentViewTag:(nonnull NSNumber *)tag
                 zoomLimitMode:(NSString *)zoomLimitMode
                 minimum:(double)minimum
                 maximum:(double)maximum
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setZoomLimitsForDocumentView:documentView zoomLimitMode:zoomLimitMode minimum:minimum maximum:maximum];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setZoomLimitsForDocumentViewTag:tag zoomLimitMode:zoomLimitMode minimum:minimum maximum:maximum];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_failed", @"Failed to set zoom limits", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(zoomWithCenter,
                 zoomWithCenterForDocumentViewTag:(nonnull NSNumber *)tag
                 zoom:(double)zoom
                 x:(int)x
                 y:(int)y
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] zoomWithCenterForDocumentView:documentView zoom:zoom x:x y:y];
            resolve(nil);
        }];
#else
        [[self documentViewManager] zoomWithCenterForDocumentViewTag:tag zoom:zoom x:x y:y];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"zoom_failed", @"Failed to zoom with center", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(zoomToRect,
                 zoomToRect:(nonnull NSNumber *)tag
                 pageNumber:(int)pageNumber
                 rect:(NSDictionary *)rect
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] zoomToRectForDocumentView:documentView pageNumber:pageNumber rect:rect];
            resolve(nil);
        }];
#else
        [[self documentViewManager] zoomToRectForDocumentViewTag:tag pageNumber:pageNumber rect:rect];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"zoom_failed", @"Failed to zoom to rect", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(smartZoom,
                 smartZoomForDocumentViewTag:(nonnull NSNumber *)tag
                 x:(int)x
                 y:(int)y
                 animated:(BOOL)animated
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] smartZoomForDocumentView:documentView x:x y:y animated:animated];
            resolve(nil);
        }];
#else
        [[self documentViewManager] smartZoomForDocumentViewTag:tag x:x y:y animated:animated];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"zoom_failed", @"Failed to smart zoom", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getScrollPos,
                 getScrollPosForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary<NSString *, NSNumber *> *scrollPos = [[self documentViewManager] getScrollPosForDocumentView:documentView];
            resolve(scrollPos);
        }];
#else
        NSDictionary<NSString *, NSNumber *> *scrollPos = [[self documentViewManager] getScrollPosForDocumentViewTag:tag];
        resolve(scrollPos);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_scroll_pos", @"Failed to get scroll pos", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setProgressiveRendering,
                 setProgressiveRenderingforDocumentViewTag: (nonnull NSNumber *) tag
                 progressiveRendering:(BOOL)progressiveRendering
                 initialDelay:(NSInteger)initialDelay
                 interval:(NSInteger)interval
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setProgressiveRenderingForDocumentView:documentView progressiveRendering:progressiveRendering initialDelay:initialDelay interval:interval];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setProgressiveRenderingForDocumentViewTag:tag progressiveRendering:progressiveRendering initialDelay:initialDelay interval:interval];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_progressive_rendering", @"Failed to set progressive rendering", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setImageSmoothing,
                 setImageSmoothingforDocumentViewTag: (nonnull NSNumber *) tag
                 imageSmoothing:(BOOL)imageSmoothing
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setImageSmoothingforDocumentView:documentView imageSmoothing:imageSmoothing];
            resolve(nil);
        }];
        
#else
        [[self documentViewManager] setImageSmoothingforDocumentViewTag:tag imageSmoothing:imageSmoothing];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_image_smoothing", @"Failed to set image smoothing", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getCanvasSize,
                 getCanvasSizeForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary<NSString *, NSNumber *> *canvasSize = [[self documentViewManager] getCanvasSizeForDocumentView:documentView];
            resolve(canvasSize);
        }];
#else
        NSDictionary<NSString *, NSNumber *> *canvasSize = [[self documentViewManager] getCanvasSizeForDocumentViewTag:tag];
        resolve(canvasSize);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_canvas_size", @"Failed to get canvas size", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(isReflowMode,
                 isReflowModeForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL inReflow = [[self documentViewManager] isReflowModeForDocumentView:documentView];
            resolve(@(inReflow));
        }];
#else
        BOOL inReflow = [[self documentViewManager] isReflowModeForDocumentViewTag:tag];
        resolve(@(inReflow));
#endif
    }
    @catch (NSException *exception) {
        reject(@"is_reflow_mode", @"Failed to get is reflow mode", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(toggleReflow,
                 toggleReflowForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] toggleReflowForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] toggleReflow:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"toggle_reflow", @"Failed to toggle reflow", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(showViewSettings,
                 showViewSettingsForDocumentViewTag: (nonnull NSNumber *)tag
                 rect:(NSDictionary *)rect
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] showViewSettingsForDocumentView:documentView rect:rect];
            resolve(nil);
        }];
#else
        [[self documentViewManager] showViewSettingsForDocumentViewTag:tag rect:rect];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"show_view_settings", @"Failed to show view settings", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(showAddPagesView,
                 showAddPagesViewForDocumentViewTag: (nonnull NSNumber *)tag
                 rect:(NSDictionary *)rect
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] showAddPagesViewForDocumentView:documentView rect:rect];
            resolve(nil);
        }];
#else
        [[self documentViewManager] showAddPagesViewForDocumentViewTag:tag rect:rect];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"show_add_pages", @"Failed to show add pages view", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(shareCopy,
                 shareCopyForDocumentViewTag: (nonnull NSNumber *)tag
                 rect:(NSDictionary *)rect
                 withFlattening:(BOOL)flattening
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] shareCopyForDocumentView:documentView rect:rect withFlattening:flattening];
            resolve(nil);
        }];
#else
        [[self documentViewManager] shareCopyForDocumentViewTag:tag rect:rect withFlattening:flattening];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"share_copy", @"Failed to share a copy", [self errorFromException:exception]);
    }
}



RCT_REMAP_METHOD(openThumbnailsView,
                 openThumbnailsViewForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openThumbnailsViewForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openThumbnailsViewForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_thumbnails_view", @"Failed to open thumbnails view", [self errorFromException:exception]);
    }
}

#pragma mark - Coordinate

RCT_REMAP_METHOD(convertScreenPointsToPagePoints,
                 convertScreenPointsToPagePointsForDocumentViewTag: (nonnull NSNumber *)tag
                 points:(NSArray *)points
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *convertedPoints = [[self documentViewManager] convertScreenPointsToPagePointsForDocumentView:documentView points:points];
            resolve(convertedPoints);
        }];
#else
        NSArray *convertedPoints = [[self documentViewManager] convertScreenPointsToPagePointsForDocumentViewTag:tag points:points];
        resolve(convertedPoints);
#endif
    }
    @catch (NSException *exception) {
        reject(@"convert_screen_points_to_page_points", @"Failed to convert screen points to page points", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(convertPagePointsToScreenPoints,
                 convertPagePointsToScreenPointsForDocumentViewTag: (nonnull NSNumber *)tag
                 points:(NSArray *)points
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *convertedPoints = [[self documentViewManager] convertPagePointsToScreenPointsForDocumentView:documentView points:points];
            resolve(convertedPoints);
        }];
#else
        NSArray *convertedPoints = [[self documentViewManager] convertPagePointsToScreenPointsForDocumentViewTag:tag points:points];
        resolve(convertedPoints);
#endif
    }
    @catch (NSException *exception) {
        reject(@"convert_page_points_to_screen_points", @"Failed to convert page points to screen points", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getPageNumberFromScreenPoint,
                 getPageNumberFromScreenPointForDocumentViewTag: (nonnull NSNumber *)tag
                 x:(double)x
                 y:(double)y
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            int pageNumber = [[self documentViewManager] getPageNumberFromScreenPointForDocumentView:documentView x:x y:y];
            resolve([NSNumber numberWithInt:pageNumber]);
        }];
#else
        int pageNumber = [[self documentViewManager] getPageNumberFromScreenPointForDocumentViewTag:tag x:x y:y];
        resolve([NSNumber numberWithInt:pageNumber]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_page_number_from_screen_point", @"Failed to get page number from screen point", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setOverprint,
                 setOverprintforDocumentViewTag: (nonnull NSNumber *) tag
                 overprint:(NSString *)overprint
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setOverprintforDocumentView:documentView overprint:overprint];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setOverprintforDocumentViewTag:tag overprint:overprint];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_overprint", @"Failed to set overprint", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setPageBorderVisibility,
                 setPageBorderVisibilityForDocumentViewTag: (nonnull NSNumber *) tag
                 pageBorderVisibility:(BOOL)pageBorderVisibility
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setPageBorderVisibilityForDocumentView:documentView pageBorderVisibility:pageBorderVisibility];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setPageBorderVisibilityForDocumentViewTag:tag pageBorderVisibility:pageBorderVisibility];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_page_border_visibility", @"Failed to set page border visibility", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setPageTransparencyGrid,
                 setPageTransparencyGridForDocumentViewTag: (nonnull NSNumber *) tag
                 pageTransparencyGrid:(BOOL)pageTransparencyGrid
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setPageTransparencyGridForDocumentView:documentView pageTransparencyGrid:pageTransparencyGrid];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setPageTransparencyGridForDocumentViewTag:tag pageTransparencyGrid:pageTransparencyGrid];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_page_transparency_grid", @"Failed to set page transparency grid", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setDefaultPageColor,
                 setDefaultPageColorForDocumentViewTag: (nonnull NSNumber *) tag
                 defaultPageColor:(NSDictionary *)defaultPageColor
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setDefaultPageColorForDocumentView:documentView defaultPageColor:defaultPageColor];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setDefaultPageColorForDocumentViewTag:tag defaultPageColor:defaultPageColor];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_default_page_color", @"Failed to set default page color", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setBackgroundColor,
                 setBackgroundColorForDocumentViewTag: (nonnull NSNumber *) tag
                 backgroundColor:(NSDictionary *)backgroundColor
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setBackgroundColorForDocumentView:documentView backgroundColor:backgroundColor];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setBackgroundColorForDocumentViewTag:tag backgroundColor:backgroundColor];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_background_color", @"Failed to set background color", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setColorPostProcessMode,
                 setColorPostProcessModeForDocumentViewTag: (nonnull NSNumber *)tag
                 colorPostProcessMode:(NSString *)colorPostProcessMode
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setColorPostProcessModeForDocumentView:documentView colorPostProcessMode:colorPostProcessMode];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setColorPostProcessModeForDocumentViewTag:tag colorPostProcessMode:colorPostProcessMode];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_color_post_process_mode", @"Failed to set color post-process mode", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setColorPostProcessColors,
                 setColorPostProcessColorsForDocumentViewTag: (nonnull NSNumber *)tag
                 whiteColor:(NSDictionary *)whiteColor
                 blackColor:(NSDictionary *)blackColor
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setColorPostProcessColorsForDocumentView:documentView whiteColor:whiteColor blackColor:blackColor];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setColorPostProcessColorsForDocumentViewTag:tag whiteColor:whiteColor blackColor:blackColor];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_color_post_process_colors", @"Failed to set color post-process colors", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(findText,
                 findTextForDocumentViewTag: (nonnull NSNumber *)tag
                 searchString:(NSString *)searchString
                 matchCase:(BOOL)matchCase
                 matchWholeWord:(BOOL)matchWholeWord
                 searchUp:(BOOL)searchUp
                 regExp:(BOOL)regExp
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] findTextForDocumentView:documentView searchString:searchString matchCase:matchCase matchWholeWord:matchWholeWord searchUp:searchUp regExp:regExp];
            resolve(nil);
        }];
#else
        [[self documentViewManager] findTextForDocumentViewTag:tag searchString:searchString matchCase:matchCase matchWholeWord:matchWholeWord searchUp:searchUp regExp:regExp];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"find_text", @"Failed to initiaze a text search", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(cancelFindText,
                 cancelFindTextForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] cancelFindTextForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] cancelFindTextForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"cancel_text", @"Failed to cancel text search", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openSearch,
                 openSearchForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openSearchForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openSearchForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_search", @"Failed to open search", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(startSearchMode,
                 startSearchModeForDocumentViewTag: (nonnull NSNumber *)tag
                 searchString:(NSString *)searchString
                 matchCase:(BOOL)matchCase
                 matchWholeWord:(BOOL)matchWholeWord
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] startSearchModeForDocumentView:documentView searchString:searchString matchCase:matchCase matchWholeWord:matchWholeWord];
            resolve(nil);
        }];
#else
        [[self documentViewManager] startSearchModeForDocumentViewTag:tag searchString:searchString matchCase:matchCase matchWholeWord:matchWholeWord];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"start_search_mode", @"Failed to start search mode", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(exitSearchMode,
                 exitSearchModeForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] exitSearchModeForDocumentView:documentView];
        }];
#else
        [[self documentViewManager] exitSearchModeForDocumentViewTag:tag];
#endif
    }
    @catch (NSException *exception) {
        reject(@"exit_search_mode", @"Failed to exit text search mode", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getSelection,
                 getSelectionForDocumentViewTag: (nonnull NSNumber *)tag
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary *selection = [[self documentViewManager] getSelectionForDocumentView:documentView pageNumber:pageNumber];
            resolve(selection);
        }];
#else
        NSDictionary *selection = [[self documentViewManager] getSelectionForDocumentViewTag:tag pageNumber:pageNumber];
        resolve(selection);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_selection", @"Failed to get text selection", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(hasSelection,
                 hasSelectionForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool hasSelection = [[self documentViewManager] hasSelectionForDocumentView:documentView];
            resolve([NSNumber numberWithBool:hasSelection]);
        }];
#else
        bool hasSelection = [[self documentViewManager] hasSelectionForDocumentViewTag:tag];
        resolve([NSNumber numberWithBool:hasSelection]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"has_selection", @"Failed to get whether document has text selection", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(clearSelection,
                 clearSelectionForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] clearSelectionForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] clearSelectionForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"clear_selection", @"Failed to clear text selection", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getSelectionPageRange,
                 getSelectionPageRangeForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSDictionary *pageRange = [[self documentViewManager] getSelectionPageRangeForDocumentView:documentView];
            resolve(pageRange);
        }];
#else
        NSDictionary *pageRange = [[self documentViewManager] getSelectionPageRangeForDocumentViewTag:tag];
        resolve(pageRange);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_selection_page_range", @"Failed to get text selection page range", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(hasSelectionOnPage,
                 hasSelectionOnPageForDocumentViewTag: (nonnull NSNumber *)tag
                 pageNumber:(NSInteger)pageNumber
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            bool hasSelection = [[self documentViewManager] hasSelectionOnPageForDocumentView:documentView pageNumber:pageNumber];
            resolve([NSNumber numberWithBool:hasSelection]);
        }];
#else
        bool hasSelection = [[self documentViewManager] hasSelectionOnPageForDocumentViewTag:tag pageNumber:pageNumber];
        resolve([NSNumber numberWithBool:hasSelection]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"has_selection_on_page", @"Failed to get whether document has text selection on page", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(selectInRect,
                 selectInRectForDocumentViewTag: (nonnull NSNumber *)tag
                 rect:(NSDictionary *)rect
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL selected = [[self documentViewManager] selectInRectForDocumentView:documentView rect:rect];
            resolve([NSNumber numberWithBool:selected]);
        }];
#else
        BOOL selected = [[self documentViewManager] selectInRectForDocumentViewTag:tag rect:rect];
        resolve([NSNumber numberWithBool:selected]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"select_in_rect", @"Failed to select in rect", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(isThereTextInRect,
                 isThereTextInRectForDocumentViewTag: (nonnull NSNumber *)tag
                 rect:(NSDictionary *)rect
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            BOOL hasText = [[self documentViewManager] isThereTextInRectForDocumentView:documentView rect:rect];
            resolve([NSNumber numberWithBool:hasText]);
        }];
#else
        BOOL hasText = [[self documentViewManager] isThereTextInRectForDocumentViewTag:tag rect:rect];
        resolve([NSNumber numberWithBool:hasText]);
#endif
    }
    @catch (NSException *exception) {
        reject(@"is_there_text_in_rect", @"Failed to get whether there is text in rect", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(selectAll,
                 selectAllForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] selectAllForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] selectAllForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"select_all", @"Failed to select all", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openOutlineList,
                 openOutlineListForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openOutlineListForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openOutlineListForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_outline_list_failed", @"Failed to open outline list", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openLayersList,
                 openLayersListForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openLayersListForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openLayersListForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_layers_list_failed", @"Failed to open layers list", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(openNavigationLists,
                 openNavigationListsForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] openNavigationListsForDocumentView:documentView];
            resolve(nil);
        }];
#else
        [[self documentViewManager] openNavigationListsForDocumentViewTag:tag];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"open_navigation_lists_failed", @"Failed to open navigation lists", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getSavedSignatures,
                 getSavedSignaturesForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSArray *signatures = [[self documentViewManager] getSavedSignaturesForDocumentView:documentView];
            resolve(signatures);
        }];
#else
        NSArray *signatures = [[self documentViewManager] getSavedSignaturesForDocumentViewTag:tag];
        resolve(signatures);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_saved_signatures_failed", @"Failed to get saved signatures", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(getSavedSignatureFolder,
                 getSavedSignatureFolderForDocumentViewTag: (nonnull NSNumber *)tag
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            NSString *folder = [[self documentViewManager] getSavedSignatureFolderForDocumentView:documentView];
            resolve(folder);
        }];
#else
        NSString *folder = [[self documentViewManager] getSavedSignatureFolderForDocumentViewTag:tag];
        resolve(folder);
#endif
    }
    @catch (NSException *exception) {
        reject(@"get_saved_signature_folder_failed", @"Failed to get saved signatures folder", [self errorFromException:exception]);
    }
}



#pragma mark - Collaboration

RCT_REMAP_METHOD(importAnnotationCommand,
                 importAnnotationCommandForDocumentViewTag:(nonnull NSNumber *)tag
                 xfdf:(NSString *)xfdfCommand
                 initialLoad:(BOOL)initialLoad
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] importAnnotationCommandForDocumentView:documentView xfdfCommand:xfdfCommand initialLoad:initialLoad];
            resolve(nil);
        }];
#else
        [[self documentViewManager] importAnnotationCommandForDocumentViewTag:tag xfdfCommand:xfdfCommand initialLoad:initialLoad];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"import_failed", @"Failed to import annotation command", [self errorFromException:exception]);
    }
}

#pragma mark - Hygen Generated Methods
RCT_REMAP_METHOD(setStampImageData,
                 setStampImageDataForDocumentViewTag:(nonnull NSNumber *)tag
                 annotationId:(NSString *)annotationId
                 pageNumber:(NSInteger)pageNumber
                 stampImageDataUrl:(NSString *)stampImageDataUrl
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setStampImageDataForDocumentView:documentView annotationId:annotationId pageNumber:pageNumber stampImageDataUrl:stampImageDataUrl];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setStampImageDataForDocumentViewTag:tag annotationId:annotationId pageNumber:pageNumber stampImageDataUrl:stampImageDataUrl];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_stamp_image_data", @"Failed to set stamp image data", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setFormFieldHighlightColor,
                 setFormFieldHighlightColorForDocumentViewTag:(nonnull NSNumber *)tag
                 fieldHighlightColor:(NSDictionary *)fieldHighlightColor
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setFormFieldHighlightColorForDocumentView:documentView fieldHighlightColor:fieldHighlightColor];
            resolve(nil);
        }];
#else
        [[self documentViewManager] setFormFieldHighlightColorForDocumentViewTag:tag fieldHighlightColor:fieldHighlightColor];
        resolve(nil);
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_form_field_highlight_color", @"Failed to set form field highlight color", [self errorFromException:exception]);
    }
}

RCT_REMAP_METHOD(setAnnotationDisplayAuthorMap,
                 setAnnotationDisplayAuthorMapForDocumentViewTag:(nonnull NSNumber *)tag
                 map:(NSDictionary *)map
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
#if RCT_NEW_ARCH_ENABLED
        [_viewRegistry_DEPRECATED addUIBlock:^(RCTViewRegistry *viewRegistry) {
            RNTPTDocumentView *documentView = [self getDocumentView:tag viewRegistry:viewRegistry];
            [[self documentViewManager] setAnnotationDisplayAuthorMapForDocumentView:documentView authorMap:map completion:^(BOOL success, NSError * _Nullable error) {
                if (!success) {
                    reject(@"set_annotation_display_author_map", @"Failed to set annotation display author map", error);
                } else {
                    resolve(nil);
                }
            }];
        }];
#else
        [[self documentViewManager] setAnnotationDisplayAuthorMapForDocumentViewTag:tag authorMap:map completion:^(BOOL success, NSError * _Nullable error) {
            if (!success) {
                reject(@"set_annotation_display_author_map", @"Failed to set annotation display author map", error);
            } else {
                resolve(nil);
            }
        }];
#endif
    }
    @catch (NSException *exception) {
        reject(@"set_annotation_display_author_map", @"Failed to set annotation display author map", [self errorFromException:exception]);
    }
}
@end
