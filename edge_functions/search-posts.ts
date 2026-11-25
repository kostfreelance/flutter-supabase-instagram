// Function name: search-posts
import { createClient } from 'npm:@supabase/supabase-js@2';

const GEMINI_API_KEY = Deno.env.get('GEMINI_API_KEY')!;
const EMBEDDING_DIM = 768;

Deno.serve(async (req) => {
  try {
    const { query } = await req.json();

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
            parts: [{ text: query }]
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
    const queryEmbedding = geminiData.embedding.values;

    const supabase = createClient(
      Deno.env.get('SUPABASE_URL')!,
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!
    );
    const { data, error } = await supabase.rpc('search_posts', {
      query,
      query_embedding: queryEmbedding
    });
    if (error) {
      throw new Error(JSON.stringify(error));
    }

    return new Response(
      JSON.stringify(data),
      { status: 200, headers: { 'Content-Type': 'application/json' } }
    );
  } catch (e) {
    return new Response(
      JSON.stringify({ error: String(e) }),
      { status: 500, headers: { 'Content-Type': 'application/json' } }
    );
  }
});