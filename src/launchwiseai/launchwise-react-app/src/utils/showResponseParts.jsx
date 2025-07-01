import ReactMarkdown from 'react-markdown';
import remarkGfm from 'remark-gfm';

// Utility to convert Python bytes literal (e.g. b'\x89PNG\r\n...') into Base64
function pythonBytesToBase64(literal) {
  const content = literal.slice(2, -1); // remove leading b' and trailing '
  const bytes = [];

  for (let i = 0; i < content.length; ) {
    if (content[i] === '\\') {
      const next = content[i + 1];

      if (next === 'x') {
        const hex = content.substr(i + 2, 2);

        bytes.push(parseInt(hex, 16));

        i += 4;
      } else if (next === 'u') {
        const hex = content.substr(i + 2, 4);
        const code = parseInt(hex, 16);

        bytes.push(code & 0xff);

        i += 6;
      } else {
        // handle common single-character escapes
        let escCode;

        switch (next) {
          case 'n': escCode = 0x0a; break;
          case 'r': escCode = 0x0d; break;
          case 't': escCode = 0x09; break;
          case 'b': escCode = 0x08; break;
          case 'f': escCode = 0x0c; break;
          case '\\': escCode = 0x5c; break;
          case "'": escCode = 0x27; break;
          case '"': escCode = 0x22; break;
          default: escCode = content.charCodeAt(i + 1) & 0xff;
        }

        bytes.push(escCode);

        i += 2;
      }
    } else {
      bytes.push(content.charCodeAt(i) & 0xff);

      i++;
    }
  }

  const binaryString = bytes.map(b => String.fromCharCode(b)).join('');

  return btoa(binaryString);
}

const ShowResponseParts = ({ parts }) => (
  <>
    {parts.map((p, idx) => {
      if (p.text) {
        return (
          <div key={idx} className="markdown" font-family="Source Sans Pro">
            <ReactMarkdown remarkPlugins={[remarkGfm]}>            
              {p.text}
            </ReactMarkdown>
          </div>
        );
      } else if (p.inline_data?.data) {
        const raw = p.inline_data.data;
        let base64data;

        // If Python-style bytes literal, convert to Base64
        if (raw.startsWith("b'") || raw.startsWith('b"')) {
          base64data = pythonBytesToBase64(raw);

          return (
            <img
              key={idx}
              src={`data:image/png;base64,${base64data}`}
              alt="response"
              style={{ maxWidth: '100%' }}
            />
          );
        } else {
          // Otherwise assume raw is string
          return (
            <div key={idx} className="markdown" font-family="Source Sans Pro">
              <ReactMarkdown remarkPlugins={[remarkGfm]}>            
                {raw}
              </ReactMarkdown>
            </div>
          );
        }
      } else {
        return <pre key={idx}>{JSON.stringify(p)}</pre>;
      }
    })}
  </>
);

export default ShowResponseParts;
