import { useReducer, useState } from 'react';
import ChatWindow from './components/ChatWindow';
import ChatInput from './components/ChatInput';
import { WELCOME_MSG } from './assets/messages'
import { AiOutlineRobot } from 'react-icons/ai';
import { AiOutlineUser } from 'react-icons/ai';
import './App.css'

const initialState = {
  chatState: { messages: [], finished: false },
  chatHistory: [{ role: 'assistant', parts: [{ text: WELCOME_MSG }], icon: <AiOutlineRobot /> }],
};

function reducer(state, action) {
  switch (action.type) {
    case 'ADD_USER_MESSAGE':
      return {
        ...state,
        chatHistory: [
          ...state.chatHistory,
          { role: 'user', parts: [{ text: action.payload }], icon: <AiOutlineUser /> },
        ],
        // chatState: { ...state.chatState, finished: false },
      };
    case 'ADD_ASSISTANT_MESSAGE':
      return {
        ...state,
        chatHistory: [
          ...state.chatHistory,
          { role: 'assistant', parts: action.payload.parts, icon: <AiOutlineRobot /> },
        ],
        chatState: action.payload.state,
      };
    default:
      return state;
  }
}

const App = () => {
  const [state, dispatch] = useReducer(reducer, initialState);
  const [loading, setLoading] = useState(false);

  const sendMessage = async (prompt) => {
    // Immediately dispatch user message
    dispatch({ type: 'ADD_USER_MESSAGE', payload: prompt });

    // Manually build the updated chat state with finished = false
    const updatedChatState = {
      ...state.chatState,
      finished: false,
    };

    setLoading(true);

    try {
      const response = await fetch('http://localhost:8000/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ message: prompt, state: updatedChatState }),
      });

      if (!response.ok) throw new Error(response.statusText);
      
      const data = await response.json();
      const parts = data.parts || [{ text: data.reply }];

      dispatch({
        type: 'ADD_ASSISTANT_MESSAGE',
        payload: { parts, state: data.state },
      });

    } catch (error) {
      
      const parts = [{ text: `Error calling API: ${error.message}` }];
      
      dispatch({
        type: 'ADD_ASSISTANT_MESSAGE',
        payload: { parts, state: state.chatState },
      });
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="app-container">
      <header className="header">
        <h1>LaunchWise AI</h1>
      </header>

      <main className="chat-container">
        <ChatWindow chatHistory={state.chatHistory} />
      </main>

      <footer className="chat-input-container">
        <ChatInput onSend={sendMessage} isLoading={loading} />
      </footer>
    </div>
  );
};

export default App;
