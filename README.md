# Roger
# Roger - Push-to-Talk App

Roger is a simple, real-time push-to-talk web application built with Supabase and vanilla JavaScript.

## Features

- 📡 Real-time push-to-talk messaging
- 🎙️ One-tap audio recording
- 👥 Add friends by email
- 🔐 Secure authentication
- 📱 Mobile responsive
- 💬 Real-time message notifications

## Tech Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Supabase (PostgreSQL + Realtime)
- **Storage**: Supabase Storage (S3-compatible)
- **Deployment**: Vercel

## Getting Started

### Prerequisites

- Supabase account (free tier)
- GitHub account
- Vercel account (for deployment)

### Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/roger.git
   cd roger
   ```

2. **Deploy to Vercel**
   - Go to [vercel.com](https://vercel.com)
   - Click "New Project"
   - Import your GitHub repository
   - Click "Deploy"
   - Your app will be live!

3. **Configure Supabase**
   - Create a project at [supabase.com](https://supabase.com)
   - Run the SQL schema (see `supabase_setup.sql`)
   - Create an `audio` storage bucket
   - Update `index.html` with your Supabase credentials

## File Structure

```
roger/
├── index.html          # Main app file
├── package.json        # Project metadata
├── README.md           # This file
└── supabase_setup.sql  # Database schema
```

## How It Works

1. **Sign Up**: Create a new account with email and password
2. **Add Friends**: Add friends by their email address
3. **Record Message**: Select a friend, hold the button, and record
4. **Send**: Release the button to send the audio message
5. **Receive**: Messages appear instantly for your friend

## Deployment

### Deploy to Vercel (Recommended)

1. Push your code to GitHub
2. Go to [vercel.com](https://vercel.com)
3. Click "New Project"
4. Select your GitHub repository
5. Click "Deploy"
6. Your app is live!

### Deploy to Netlify

1. Connect your GitHub repository
2. Set build command to: (leave blank)
3. Set publish directory to: (leave blank)
4. Click "Deploy"

## Configuration

Update these values in `index.html`:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_KEY = 'YOUR_PUBLIC_API_KEY';
```

Get these from your Supabase project settings.

## Database Schema

The app uses 3 main tables:

- **users**: User profiles and authentication
- **friends**: Friend relationships
- **messages**: PTT audio messages with metadata

See `supabase_setup.sql` for full schema.

## Security

- Row Level Security (RLS) enabled on all tables
- Users can only see their own data
- Messages are only visible to sender and receiver
- Authentication required for all actions

## License

MIT - Feel free to use this project for your own purposes!

## Support

For issues or questions, open an issue on GitHub.

## Contributing

Feel free to fork, modify, and improve this project!
