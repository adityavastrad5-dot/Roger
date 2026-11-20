-- Roger - Push-to-Talk App - Supabase Schema
-- Run this in your Supabase SQL Editor

-- 1. Users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email VARCHAR UNIQUE NOT NULL,
  username VARCHAR NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- 2. Friends table (relationships)
CREATE TABLE friends (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  friend_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(user_id, friend_id)
);

-- 3. Messages table (PTT audio records)
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  receiver_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  audio_url VARCHAR NOT NULL,
  duration INT,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Enable Realtime on messages table (for instant notifications)
ALTER PUBLICATION supabase_realtime ADD TABLE messages;

-- Enable Row Level Security (users can only see their own data)
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE friends ENABLE ROW LEVEL SECURITY;
ALTER TABLE messages ENABLE ROW LEVEL SECURITY;

-- Policy: Users can read their own record
CREATE POLICY "Users can read own data" 
  ON users FOR SELECT 
  USING (auth.uid() = id);

-- Policy: Users can update their own record
CREATE POLICY "Users can update own data" 
  ON users FOR UPDATE 
  USING (auth.uid() = id);

-- Policy: Users can see their friends
CREATE POLICY "Users can read their friends" 
  ON friends FOR SELECT 
  USING (auth.uid() = user_id OR auth.uid() = friend_id);

-- Policy: Users can see messages sent to them or from them
CREATE POLICY "Users can read their messages" 
  ON messages FOR SELECT 
  USING (auth.uid() = sender_id OR auth.uid() = receiver_id);

-- Policy: Users can insert their own messages
CREATE POLICY "Users can insert own messages" 
  ON messages FOR INSERT 
  WITH CHECK (auth.uid() = sender_id);
