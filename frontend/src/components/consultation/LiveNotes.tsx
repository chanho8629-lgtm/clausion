import { useState, useCallback } from 'react';

interface NoteEntry {
  id: string;
  timestamp: string;
  content: string;
}

interface LiveNotesProps {
  consultationId?: string;
}

export default function LiveNotes({ consultationId }: LiveNotesProps) {
  const [notes, setNotes] = useState<NoteEntry[]>([]);
  const [input, setInput] = useState('');

  const saveNotesToServer = useCallback(async (allNotes: NoteEntry[]) => {
    if (!consultationId) return;
    try {
      const BASE_URL = import.meta.env.VITE_API_URL ?? '';
      const jwt = localStorage.getItem('token');
      await fetch(`${BASE_URL}/api/consultations/${consultationId}/notes`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          ...(jwt ? { Authorization: `Bearer ${jwt}` } : {}),
        },
        body: JSON.stringify({ notes: allNotes.map((n) => `[${n.timestamp}] ${n.content}`).join('\n') }),
      });
    } catch {
      // Best-effort save
    }
  }, [consultationId]);

  const addNote = () => {
    if (!input.trim()) return;
    const now = new Date();
    const timestamp = now.toLocaleTimeString('ko-KR', {
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: false,
    });
    const newNotes = [
      ...notes,
      { id: `n-${Date.now()}`, timestamp, content: input.trim() },
    ];
    setNotes(newNotes);
    setInput('');
    saveNotesToServer(newNotes);
  };

  return (
    <div className="bg-slate-800 rounded-2xl p-4 flex flex-col h-full">
      <h4 className="text-xs font-semibold text-slate-300 mb-3 uppercase tracking-wider">
        실시간 메모
      </h4>

      <div className="flex-1 overflow-y-auto space-y-2 mb-3">
        {notes.length === 0 && (
          <p className="text-xs text-slate-500 text-center py-4">메모를 추가하세요</p>
        )}
        {notes.map((note) => (
          <div key={note.id} className="flex gap-2 text-xs">
            <span
              className="text-slate-500 flex-shrink-0 font-mono"
              style={{ fontFamily: "'JetBrains Mono', monospace" }}
            >
              {note.timestamp}
            </span>
            <span className="text-slate-300 leading-relaxed">{note.content}</span>
          </div>
        ))}
      </div>

      <div className="flex gap-2">
        <input
          type="text"
          value={input}
          onChange={(e) => setInput(e.target.value)}
          onKeyDown={(e) => e.key === 'Enter' && addNote()}
          placeholder="메모 추가..."
          className="flex-1 bg-slate-700 border border-slate-600 rounded-lg px-3 py-2 text-xs text-slate-200 placeholder:text-slate-500 focus:outline-none focus:border-indigo-500 transition-colors"
        />
        <button
          onClick={addNote}
          className="px-3 py-2 text-xs font-medium rounded-lg bg-indigo-600 text-white hover:bg-indigo-700 transition-colors flex-shrink-0"
        >
          추가
        </button>
      </div>
    </div>
  );
}
