# Quick Start Guide for Mac/Linux Users

## Prerequisites
- Node.js (v14+) - https://nodejs.org/
- MongoDB running - https://www.mongodb.com/

## Quick Start

### Option 1: Run Both Servers Separately (Recommended)

**Terminal 1 - Backend:**
```bash
cd server
npm install
npm start
```

The backend will start on `http://localhost:5000`

**Terminal 2 - Frontend:**
```bash
cd client
npm install
npm start
```

The frontend will start on `http://localhost:3000` and open in your browser.

### Option 2: Run Both at Once

```bash
# Terminal 1
cd server && npm install && npm start

# Terminal 2 (new terminal)
cd client && npm install && npm start
```

## MongoDB Setup

### Local MongoDB
```bash
# Start MongoDB
mongod

# Or if installed via Homebrew on Mac
brew services start mongodb-community
```

### MongoDB Atlas (Cloud)
Update `.env` in server folder with your connection string:
```
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/abm_consulting
```

## System Ports

- Backend: `http://localhost:5000`
- Frontend: `http://localhost:3000`
- MongoDB: `mongodb://localhost:27017`

## First Login

Register a new account or check `SETUP_GUIDE.md` for more details.

## Troubleshooting

**Port already in use:**
```bash
# Find process using port 5000
lsof -i :5000

# Find process using port 3000
lsof -i :3000

# Kill process (replace PID with actual process ID)
kill -9 PID
```

**MongoDB connection error:**
- Ensure MongoDB is running
- Check MONGODB_URI in server/.env

For more help, see [SETUP_GUIDE.md](./SETUP_GUIDE.md)
