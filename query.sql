create extension vector;

-- profiles
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  email text not null,
  username text not null,
  avatar_path text,
  avatar_url text,
  followers_count integer not null default 0,
  following_count integer not null default 0,
  posts_count integer not null default 0,
  updated_at timestamptz not null default now()
);
create index idx_profiles_username on profiles(username);
create index idx_profiles_updated_at on profiles(updated_at desc);
alter publication supabase_realtime add table profiles;
alter table profiles replica identity full;
alter table profiles enable row level security;
grant select, insert, update on profiles to authenticated;
create policy "select: authenticated only"
on profiles
for select
to authenticated
using (true);
create policy "insert: own item only"
on profiles
for insert
to authenticated
with check (id = auth.uid());
create policy "update: own item only"
on profiles
for update
to authenticated
using (id = auth.uid());
create policy "delete: no one"
on profiles
for delete
using (false);

-- follows
create table follows (
  follower_id uuid not null references profiles(id) on delete cascade,
  following_id uuid not null references profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (follower_id, following_id)
);
create index idx_follows_follower_id on follows(follower_id);
create index idx_follows_following_id on follows(following_id);
create index idx_follows_created_at on follows(created_at desc);
alter publication supabase_realtime add table follows;
alter table follows enable row level security;
grant select, insert, delete on follows to authenticated;
create policy "select: authenticated only"
on follows
for select
to authenticated
using (true);
create policy "insert: own item only"
on follows
for insert
to authenticated
with check (follower_id = auth.uid());
create policy "update: no one"
on follows
for update
using (false);
create policy "delete: own item only"
on follows
for delete
to authenticated
using (follower_id = auth.uid());

-- posts
create table posts (
  id uuid primary key default gen_random_uuid(),
  profile_id uuid not null references profiles(id) on delete cascade,
  file_url text not null,
  file_path text not null,
  thumb_url text,
  thumb_path text,
  caption text not null,
  likes_count integer not null default 0,
  comments_count integer not null default 0,
  created_at timestamptz not null default now(),
  caption_embedding vector(768) not null,
  file_embedding vector(768) not null,
  fts tsvector generated always as (to_tsvector('simple', caption)) stored not null
);
create index idx_posts_profile_id on posts(profile_id);
create index idx_posts_created_at on posts(created_at desc);
create index idx_posts_text_embedding on posts using hnsw(caption_embedding vector_cosine_ops);
create index idx_posts_image_embedding on posts using hnsw(file_embedding vector_cosine_ops);
create index idx_posts_fts on posts using gin(fts);
alter publication supabase_realtime add table posts;
alter table posts replica identity full;
alter table posts enable row level security;
grant select, insert, delete on posts to authenticated;
create policy "select: authenticated only"
on posts
for select
to authenticated
using (true);
create policy "insert: own item only"
on posts
for insert
to authenticated
with check (profile_id = auth.uid());
create policy "update: no one"
on posts
for update
using (false);
create policy "delete: own item only"
on posts
for delete
to authenticated
using (profile_id = auth.uid());

-- post_likes
create table post_likes (
  post_id uuid not null references posts(id) on delete cascade,
  profile_id uuid not null references profiles(id) on delete cascade,
  primary key (post_id, profile_id)
);
create index idx_post_likes_post_id on post_likes(post_id);
create index idx_post_likes_profile_id on post_likes(profile_id);
alter table post_likes enable row level security;
grant select, insert, delete on post_likes to authenticated;
create policy "select: authenticated only"
on post_likes
for select
to authenticated
using (true);
create policy "insert: own item only"
on post_likes
for insert
to authenticated
with check (profile_id = auth.uid());
create policy "update: no one"
on post_likes
for update
using (false);
create policy "delete: own item only"
on post_likes
for delete
to authenticated
using (profile_id = auth.uid());

-- post_comments
create table post_comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references posts(id) on delete cascade,
  profile_id uuid not null references profiles(id) on delete cascade,
  content text not null,
  created_at timestamptz not null default now()
);
create index idx_post_comments_post_id on post_comments(post_id);
create index idx_post_comments_profile_id on post_comments(profile_id);
create index idx_post_comments_created_at on post_comments(created_at desc);
alter publication supabase_realtime add table post_comments;
alter table post_comments enable row level security;
grant select, insert on post_comments to authenticated;
create policy "select: authenticated only"
on post_comments
for select
to authenticated
using (true);
create policy "insert: own item only"
on post_comments
for insert
to authenticated
with check (profile_id = auth.uid());
create policy "update: no one"
on post_comments
for update
using (false);
create policy "delete: no one"
on post_comments
for delete
using (false);

-- chats
create table chats (
  id uuid primary key default gen_random_uuid(),
  participant_ids uuid[] not null,
  updated_at timestamptz not null default now()
);
create index idx_chats_participant_ids on chats using gin(participant_ids);
create index idx_chats_updated_at on chats(updated_at desc);
alter publication supabase_realtime add table chats;
alter table chats replica identity full;
alter table chats enable row level security;
grant select, insert, update, delete on chats to authenticated;
create policy "select: own item only"
on chats
for select
to authenticated
using (auth.uid() = ANY(participant_ids));
create policy "insert: authenticated only"
on chats
for insert
to authenticated
with check (true);
create policy "update: own item only"
on chats
for update
to authenticated
using (auth.uid() = ANY(participant_ids));
create policy "delete: own item only"
on chats
for delete
to authenticated
using (auth.uid() = ANY(participant_ids));

-- chat_participants
create table chat_participants (
  chat_id uuid not null references chats(id) on delete cascade,
  profile_id uuid not null references profiles(id) on delete cascade,
  updated_at timestamptz not null default now(),
  primary key (chat_id, profile_id)
);
create index idx_chat_participants_chat_id on chat_participants(chat_id);
create index idx_chat_participants_profile_id on chat_participants(profile_id);
alter table chat_participants enable row level security;
grant select, insert, update on chat_participants to authenticated;
create policy "select: authenticated only"
on chat_participants
for select
to authenticated
using (true);
create policy "insert: authenticated only"
on chat_participants
for insert
to authenticated
with check (true);
create policy "update: own item only"
on chat_participants
for update
to authenticated
using (profile_id = auth.uid());
create policy "delete: no one"
on chat_participants
for delete
using (false);

-- chat_messages
create table chat_messages (
  id uuid primary key default gen_random_uuid(),
  chat_id uuid not null references chats(id) on delete cascade,
  profile_id uuid not null references profiles(id) on delete cascade,
  content text not null,
  participant_ids uuid[] not null,
  created_at timestamptz not null default now()
);
create index idx_chat_messages_chat_id on chat_messages(chat_id);
create index idx_chat_messages_profile_id on chat_messages(profile_id);
create index idx_chat_messages_participant_ids on chat_messages using gin(participant_ids);
create index idx_chat_messages_created_at on chat_messages(created_at desc);
alter publication supabase_realtime add table chat_messages;
alter table chat_messages enable row level security;
grant select, insert on chat_messages to authenticated;
create policy "select: own chats only"
on chat_messages
for select
to authenticated
using (auth.uid() = ANY(participant_ids));
create policy "insert: own chats only"
on chat_messages
for insert
to authenticated
with check (auth.uid() = ANY(participant_ids));
create policy "update: no one"
on chat_messages
for update
using (false);
create policy "delete: no one"
on chat_messages
for delete
using (false);

-- storage.profiles
insert into storage.buckets (id, name, public)
values ('profiles', 'profiles', true);
create policy "profiles select: all"
on storage.objects
for select
to public
using (bucket_id = 'profiles');
create policy "profiles insert: own item only"
on storage.objects
for insert
to authenticated
with check (bucket_id = 'profiles' and owner_id = auth.uid()::text);
create policy "profiles update: no one"
on storage.objects
for update
to authenticated
using (bucket_id = 'profiles' and false);
create policy "profiles delete: own item only"
on storage.objects
for delete
to authenticated
using (bucket_id = 'profiles' and owner_id = auth.uid()::text);

-- storage.posts
insert into storage.buckets (id, name, public)
values ('posts', 'posts', true);
create policy "posts select: all"
on storage.objects
for select
to public
using (bucket_id = 'posts');
create policy "posts insert: own item only"
on storage.objects
for insert
to authenticated
with check (bucket_id = 'posts' and owner_id = auth.uid()::text);
create policy "posts update: no one"
on storage.objects
for update
to authenticated
using (bucket_id = 'posts' and false);
create policy "posts delete: own item only"
on storage.objects
for delete
to authenticated
using (bucket_id = 'posts' and owner_id = auth.uid()::text);

-- profiles.followers_count, profiles.following_count
create function profile_follow_count_function()
returns trigger
security definer
language plpgsql
as $$
begin
  if (tg_op = 'INSERT') then
    update profiles
    set followers_count = followers_count + 1
    where id = new.following_id;
    update profiles
    set following_count = following_count + 1
    where id = new.follower_id;
    return new;
  elsif (tg_op = 'DELETE') then
    update profiles
    set followers_count = greatest(0, followers_count - 1)
    where id = old.following_id;
    update profiles
    set following_count = greatest(0, following_count - 1)
    where id = old.follower_id;
    return old;
  end if;
  return null;
end;
$$;
create trigger profile_follow_count_trigger
after insert or delete on follows
for each row
execute function profile_follow_count_function();

-- profiles.posts_count
create function profile_posts_count_function()
returns trigger
security definer
language plpgsql
as $$
begin
  if (tg_op = 'INSERT') then
    update profiles
    set posts_count = posts_count + 1 
    where id = new.profile_id;
    return new;
  elsif (tg_op = 'DELETE') then
    update profiles 
    set posts_count = greatest(0, posts_count - 1)
    where id = old.profile_id;
    return old;
  end if;
  return null;
end;
$$;
create trigger profile_posts_count_trigger
after insert or delete on posts
for each row
execute function profile_posts_count_function();

-- posts.likes_count
create function post_likes_count_function()
returns trigger
security definer
language plpgsql
as $$
begin
  if (tg_op = 'INSERT') then
    update posts
    set likes_count = likes_count + 1
    where id = new.post_id;
    return new;
  elsif (tg_op = 'DELETE') then
    update posts
    set likes_count = greatest(0, likes_count - 1)
    where id = old.post_id;
    return old;
  end if;
  return null;
end;
$$;
create trigger post_likes_count_trigger
after insert or delete on post_likes
for each row
execute function post_likes_count_function();

-- posts.comments_count
create function post_comments_count_function()
returns trigger
security definer
language plpgsql
as $$
begin
  if (tg_op = 'INSERT') then
    update posts
    set comments_count = comments_count + 1
    where id = new.post_id;
    return new;
  elsif (tg_op = 'DELETE') then
    update posts
    set comments_count = greatest(0, comments_count - 1)
    where id = old.post_id;
    return old;
  end if;
  return null;
end;
$$;
create trigger post_comments_count_trigger
after insert or delete on post_comments
for each row
execute function post_comments_count_function();

-- search_posts
create function search_posts(
  query text,
  query_embedding vector(768)
)
returns table (
  id uuid,
  profile_id uuid,
  file_url text,
  file_path text,
  thumb_url text,
  thumb_path text,
  caption text,
  likes_count integer,
  comments_count integer,
  created_at timestamptz,
  profiles jsonb
)
security definer
language sql
as $$
  with q as (
    select websearch_to_tsquery('simple', query) as tsq
  )
  select
    p.id,
    p.profile_id,
    p.file_url,
    p.file_path,
    p.thumb_url,
    p.thumb_path,
    p.caption,
    p.likes_count,
    p.comments_count,
    p.created_at,
    to_jsonb(pr) as profiles
  from posts p
  inner join profiles pr on pr.id = p.profile_id
  cross join q
  where
    p.fts @@ q.tsq
    or (1 - (p.caption_embedding <=> query_embedding)) > 0.61
    or (1 - (p.file_embedding <=> query_embedding)) > 0.31
  order by (
    least(ts_rank(p.fts, q.tsq), 1.0) * 0.30
    + greatest(0, 1 - (p.caption_embedding <=> query_embedding)) * 0.50
    + greatest(0, 1 - (p.file_embedding <=> query_embedding)) * 0.20
  ) desc
  limit 20;
$$;