import { useState, useRef, useEffect } from 'react';
import { AiOutlineSend } from 'react-icons/ai';

const ChatInput = ({ onSend, isLoading }) => {
  const [text, setText] = useState('');
  const textareaRef = useRef(null);

  // Auto-expand textarea
  useEffect(() => {
    const el = textareaRef.current;
    if (el) {
      el.style.height = 'auto';
      el.style.height = el.scrollHeight + 'px';
    }
  }, [text]);

  const handleSend = () => {
    if (isLoading || !text.trim()) return;
    onSend(text.trim());
    setText('');
  };

  const handleKeyDown = (e) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      handleSend();
    }
  };

  return (
    <div className="input-wrapper">
      <textarea
        ref={textareaRef}
        className="chat-input-textarea"
        value={text}
        onChange={(e) => setText(e.target.value)}
        onKeyDown={handleKeyDown}
        placeholder="Type your message…"
        rows={1}
        disabled={isLoading}
      />
      <button className="chat-send-button" onClick={handleSend} disabled={isLoading}>
        <AiOutlineSend />
      </button>
    </div>
  );
};

export default ChatInput;
