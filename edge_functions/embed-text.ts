// Function name: embed-text
const GEMINI_API_KEY = Deno.env.get('GEMINI_API_KEY')!;
const EMBEDDING_DIM = 768;

Deno.serve(async (req) => {
  try {
    const { text } = await req.json();

    const geminiRes = await fetch(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-embedding-2:embedContent',
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': GEMINI_API_KEY
        },
        body: JSON.stringify({
          content: {
            parts: [{ text }]
          },
          embedContentConfig: {
            outputDimensionality: EMBEDDING_DIM
          }
        })
      }
    );
    const geminiData = await geminiRes.json();
    if (!geminiRes.ok) {
      throw new Error(JSON.stringify(geminiData));
    }

    return new Response(
      JSON.stringify({ embedding: geminiData.embedding.values }),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (e) {
    return new Response(
      JSON.stringify({ error: String(e) }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});