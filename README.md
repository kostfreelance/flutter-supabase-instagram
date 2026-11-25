# Flutter Supabase Instagram

Flutter Supabase Instagram is a photo and video sharing social app built with Flutter and Supabase. It offers simplified Instagram-like features and UI, runs on both Android and iOS, and is easy to customize thanks to Clean Architecture (feature-first) and Riverpod. It also includes hybrid post search from a single text query: searching post captions via FTS (tsvector) + pgvector and searching post images via pgvector (using embeddings generated with gemini-embedding-2).

![Preview image](/preview.png)

## Main Features

* Infinite Feed: Photo and video infinite scrolling feed
* Realtime Interactions: Realtime likes and realtime comments
* Social & Messaging: Following and unfollowing users, one-to-one realtime chat, and sharing posts to other social networks
* Authentication: Email authentication
* Hybrid Search: searching post captions via FTS (tsvector) + pgvector and searching post images via pgvector (using gemini-embedding-2 embeddings)
* Backend & Architecture: Supabase (Database, Storage, Authentication, Edge Functions, Triggers, Hybrid search, etc), Clean Architecture (feature-first), Riverpod (state management), GoRouter (routing)

## Project Setup

1. Create a new Supabase project with only "Enable Data API" selected under "Data access".
2. Copy your "Project URL" and "Publishable key" into lib/core/config/supabase_config.dart.
3. Disable "Confirm email" under "Authentication -> Sign In / Providers".
4. Run the SQL query from query.sql in the SQL Editor.
5. Go to "Edge Functions -> Functions -> Deploy a new function -> Via Editor" and add the functions from edge_functions/.
6. Add your GEMINI_API_KEY under "Edge Functions -> Secrets".