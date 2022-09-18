import * as React from 'react';
import { StyleSheet, View, Text } from 'react-native';
import { generateColor } from 'atomic-rn-color-library';

export default function App() {
  const [generatedColor, setGeneratedColor] = React.useState<string | undefined>();

  React.useEffect(() => {
      generateColor({ colorType: "hex", red: 100, green: 0 }).then(setGeneratedColor); 
  }, []);

  return (
    <View style={styles.container}>
        <Text>Color: {generatedColor}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});