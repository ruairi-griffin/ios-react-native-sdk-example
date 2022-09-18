#import <React/RCTBridgeModule.h>
#import <React/RCTViewManager.h>

@interface RCT_EXTERN_MODULE(AtomicRnColorLibrary, NSObject)

RCT_EXTERN_METHOD(generateColor:(nonnull NSString)typeString withRed:(nonnull NSNumber)red withGreen:(nonnull NSNumber)green withBlue:(nonnull NSNumber)blue withResolver:(RCTPromiseResolveBlock)resolve withRejecter:(RCTPromiseRejectBlock)reject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
