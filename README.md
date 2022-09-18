# React Native Color SDK / Library / App

This repository contains three projects

- RGColorSDK - a Swift SDK to generate color strings in either hex or RGB format (for the web). Designed to be distributed via cocoapods. 

- RNColorLibrary - An NPM package, that wraps RGColorSDK using react natives "native modules" to provide a typescript interface to the swift sdk for react native projects on iOS.

- RNColorApp - An app that uses RNColorLibrary to generate colors based on user input and displays these colors as a background. 

## Caveats

Might not run on your machine, it should be not guarantees - I added screen shots in the app readme. I had to run the commands in terminal with rosetta mode enabled, but with xcode running natively on my m1 mac.

The SDK and Library projects are designed to be distributed, but currently are just linked to each other locally (via relative paths in the Podfiles and package.json). This means that the SDK needs to be added explicitly to the podfile of the app (which I think would not normally be needed).

The API's are not documented - I would normally add some swift dooc comments at the iOS level, and some JSDoc or typescript doc comments at the library level. 

The Swift SDK is using Doubles as input instead of Ints which would be more appropriate for a Swift SDK. Would probably make more sense to make the conversion from the js "number" at the RNColorLibrary level so the swift SDK is more idiomatic. 

The RNColorLibrary doesn't have any tests, I didn't investigate adding tests for a native module but it is probably possible and would be helpful to avoid breaking the JS <-> Objc layer. 

There is not really any error handling at the SDK or Library layer, though they should always return a valid color.

At the app level, everything is in one file and the way of checking if there has been any user input is a bit clunky. I think this could be refactored but it does work fine. 

Probably some more, I timeboxed this project but happy to discuss any design decisions :). 






