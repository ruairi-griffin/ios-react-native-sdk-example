import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'atomic-rn-color-library' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo managed workflow\n';

const AtomicRnColorLibrary = NativeModules.AtomicRnColorLibrary  ? NativeModules.AtomicRnColorLibrary  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function generateColor(input: colorGeneratorInput): Promise<string> {
  const redInput = numberOrNegativeOne(input.red)
  const greenInput = numberOrNegativeOne(input.green)  
  const blueInput = numberOrNegativeOne(input.blue)  
  return AtomicRnColorLibrary.generateColor(input.colorType, redInput, greenInput, blueInput)
}

export interface colorGeneratorInput {
  colorType: "hex" | "RGB",
  red?: number,
  green?: number,
  blue?: number,
}

function numberOrNegativeOne(n?: number): number {
  if(n === undefined) {
    return -1
  } else {
    return n
  }
}
