// Function name: embed-image
const GEMINI_API_KEY = Deno.env.get('GEMINI_API_KEY')!;
const EMBEDDING_DIM = 768;

function bytesToBase64(bytes: Uint8Array): string {
  let binary = "";
  const chunkSize = 0x8000;
  for (let i = 0; i < bytes.length; i += chunkSize) {
    binary += String.fromCharCode(...bytes.subarray(i, i + chunkSize));
  }
  return btoa(binary);
}

Deno.serve(async (req) => {
  try {
    const { imageUrl } = await req.json();

    const imgRes = await fetch(imageUrl);
    if (!imgRes.ok) {
      throw new Error(JSON.stringify(imgRes));
    }
    const base64Data = bytesToBase64(new Uint8Array(await imgRes.arrayBuffer()));

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
            parts: [
              {
                inlineData: {
                  mimeType: 'image/png',
                  data: base64Data
                }
              }
            ]
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