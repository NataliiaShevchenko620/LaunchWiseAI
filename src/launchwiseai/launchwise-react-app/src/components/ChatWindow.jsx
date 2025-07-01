import ShowResponseParts from '../utils/showResponseParts.jsx';

const ChatWindow = ({ chatHistory }) => (
  <div className="chat-window">
    {chatHistory.map((msg, i) => (
      <div key={i} className={`message-row ${msg.role}`}>  
        <div className={`avatar ${msg.role}`}>{msg.icon}</div>
        <div className="message-bubble">
          <ShowResponseParts parts={msg.parts} />
        </div>
      </div>
    ))}
  </div>
);

export default ChatWindow;