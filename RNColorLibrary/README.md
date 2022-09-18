# atomic-rn-color-library
Provides random colors in rgb or hex format

iOS only. 

## Installation

```sh
npm install atomic-rn-color-library
```

Requires pod install and restarting app

## Usage

```js
import { generateColor } from 'atomic-rn-color-library';

// ...

const [generatedColor, setGeneratedColor] = React.useState<string | undefined>();

// ...
React.useEffect(() => {
    generateColor({ colorType: "hex", red: 100, green: 0, blue: 50 }).then(setGeneratedColor); 
}, []);
```

red, green or blue arguments may be omitted and will be replaced with random values.

## Demo App

```sh
yarn example ios
```

## License

MIT

---

Made with [create-react-native-library](https://github.com/callstack/react-native-builder-bob)
