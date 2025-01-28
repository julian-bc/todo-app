import { StatusBar } from 'expo-status-bar';
import { useEffect, useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { API_URL } from './config';

export default function App() {
  const [todos, setTodos] = useState([]);
  
  useEffect(() => {
    fetchTodos();
  }, [])
  
  async function fetchTodos () {
    try {
      const response = await fetch(`${API_URL}:8080/todos/1`);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      const data = await response.json();
      setTodos(data);
    } catch (error) {
      console.error('Error fetching todos:', error.message);
    }
  }
  
  return (
    <View style={styles.container}>
      <Text>{JSON.stringify(todos, null, 2)}</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
