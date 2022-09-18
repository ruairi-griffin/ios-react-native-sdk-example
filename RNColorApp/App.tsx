import * as React from 'react';
import { StyleSheet, View, Text, TextInput, Switch } from 'react-native';
import { generateColor } from 'atomic-rn-color-library';

export default function App() {
  const [result, setResult] = React.useState<string>("#FFFFFF");

  const [red, setRed] = React.useState<string | undefined>();
  const [blue, setBlue] = React.useState<string | undefined>();
  const [green, setGreen] = React.useState<string | undefined>();
  const [useRGB, setUseRGB] = React.useState<boolean>(false);
  const [switchHasChanged, setSwitchHasChanged] = React.useState<boolean>(false);

  const hasReceivedUserInput = red !== undefined || blue != undefined || green != undefined || switchHasChanged;
  const colorType = useRGB ? "RGB" : "hex";

  React.useEffect(() => {
    if (hasReceivedUserInput) {
      let redInt = parseTextFieldAsInt(red);
      let greenInt = parseTextFieldAsInt(green);
      let blueInt = parseTextFieldAsInt(blue);
      generateColor({ colorType: colorType, red: redInt, green: greenInt, blue: blueInt }).then(setResult);
    }
  }, [red, green, blue, useRGB, switchHasChanged]);

  const switchValueChanged = (value: boolean) => {
    setUseRGB(value)
    setSwitchHasChanged(true)
  };

  return (
    <View style={[styles.container, { backgroundColor: result }]}>
      <View style={{ flex: 1 }} />
      <View style={[styles.container, { backgroundColor: '#FFFFFF', flex: 2, width: 200 }]}>

        <Text>Value: {result}</Text>

        <View style={styles.rowContainer}>
          <Text>hex</Text>
          <Switch style={{margin: 10}} value={useRGB} onValueChange={switchValueChanged} />
          <Text>RGB</Text>
        </View>
        
        <ColorTextField colorName="red" color={red} setColor={setRed} />
        <ColorTextField colorName="green" color={green} setColor={setGreen} />
        <ColorTextField colorName="blue" color={blue} setColor={setBlue} />

      </View>
      <View style={{ flex: 2 }} />
    </View>
  );

}


interface colorTextFieldProps {
  colorName: string,
  color: string | undefined,
  setColor: React.Dispatch<React.SetStateAction<string | undefined>>
}

const ColorTextField = (props: colorTextFieldProps) => {

  const placeholder = props.colorName + " (0 - 255)"

  return (
    <>
      <TextInput
        style={styles.input}
        onChangeText={props.setColor}
        value={props.color}
        placeholder={placeholder}
        keyboardType="numeric"
      />
      <Text>{formatColorText()}</Text>
    </>
  );

  function formatColorText(): string {
    let parsedValue = parseTextFieldAsInt(props.color)
    if (parsedValue === undefined) {
      return props.colorName + ": random"
    } else {
      return props.colorName + ": " + parsedValue
    }
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
  input: {
    height: 40,
    width: 150,
    margin: 10,
    borderWidth: 1,
    padding: 10,
  },
  rowContainer: {
    flexDirection: 'row',
    alignItems: 'center'
  }
});


function parseTextFieldAsInt(value: string | undefined): number | undefined {
  if (value === undefined) {
    return undefined;
  } else {
    let int = parseInt(value);
    if (int < 0 || int > 255 || isNaN(int)) {
      return undefined;
    } else {
      return int;
    }
  }
}
