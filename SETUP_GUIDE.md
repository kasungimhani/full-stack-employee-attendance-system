# ABM Employee Attendance System - Setup Guide

## System Overview
This is a complete Employee Attendance Management System with:
- **Backend**: Node.js + Express + MongoDB
- **Frontend**: React.js
- **Database**: MongoDB

## Prerequisites

Before starting, make sure you have installed:
1. **Node.js** (v14 or higher) - https://nodejs.org/
2. **MongoDB** (running locally or Atlas) - https://www.mongodb.com/
3. **npm** or **yarn** - comes with Node.js

## Installation & Running Steps

### Step 1: Setup MongoDB

#### Option A: Local MongoDB
1. Install MongoDB Community Edition
2. Start MongoDB service:
   - **Windows**: 
     ```
     mongod
     ```
   - Make sure it's running on `mongodb://localhost:27017`

#### Option B: MongoDB Atlas (Cloud)
1. Go to https://www.mongodb.com/cloud/atlas
2. Create a free account and cluster
3. Copy your connection string
4. Update `.env` in server folder with your connection string

### Step 2: Setup Backend Server

1. Open terminal and navigate to server folder:
   ```
   cd c:\ABM\server
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Verify `.env` file exists with these values:
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/abm_consulting
   JWT_SECRET=your_secret_key_here_change_this_in_production
   JWT_EXPIRE=7d
   NODE_ENV=development
   ```

4. Start the server:
   ```
   npm start
   ```
   
   Or for development with auto-reload:
   ```
   npm run dev
   ```

   **Expected Output:**
   ```
   Server running on http://localhost:5000
   Environment: development
   MongoDB Connected: localhost
   ```

### Step 3: Setup Frontend Client

1. Open a new terminal and navigate to client folder:
   ```
   cd c:\ABM\client
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Start the React development server:
   ```
   npm start
   ```

   **Expected Output:**
   ```
   Compiled successfully!
   Local: http://localhost:3000
   ```

### Step 4: Access the Application

Open your browser and go to:
```
http://localhost:3000
```

## Default Credentials

You can register a new account or use these test accounts (you need to create them first):

### Create Admin Account:
1. Register with any email
2. Login to MongoDB and manually update the role:
   ```
   db.users.updateOne({email: "admin@example.com"}, {$set: {role: "admin"}})
   ```

### Create Employee Account:
1. Simply register with any email and password
2. Default role is "employee"

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/refresh` - Refresh token

### Attendance
- `POST /api/attendance/check-in` - Check in
- `POST /api/attendance/check-out` - Check out
- `GET /api/attendance/my-attendance` - Get attendance records
- `GET /api/attendance/monthly-report/:userId` - Get monthly report

### Leave
- `POST /api/leave/apply` - Apply for leave
- `GET /api/leave/my-leaves` - Get my leave requests
- `GET /api/leave/all` - Get all leaves (admin)
- `PUT /api/leave/:leaveId/status` - Update leave status (admin)

### Users
- `GET /api/users/profile` - Get user profile
- `PUT /api/users/profile` - Update profile
- `POST /api/users/change-password` - Change password
- `GET /api/users/all` - Get all users (admin)

## Features

### Employee Features
- ✅ Register and Login
- ✅ Check In / Check Out
- ✅ View Attendance History
- ✅ Apply for Leave
- ✅ View Leave Status
- ✅ Update Profile
- ✅ Change Password

### Admin Features
- ✅ View Dashboard with Statistics
- ✅ Manage Employees
- ✅ View Attendance Reports
- ✅ Approve/Reject Leave Requests
- ✅ View All User Data

## Troubleshooting

### MongoDB Connection Error
- Make sure MongoDB is running
- Check `MONGODB_URI` in `.env`
- Verify database name is correct

### Port Already in Use
- Backend (5000):
  ```
  netstat -ano | findstr :5000
  taskkill /PID <PID> /F
  ```
- Frontend (3000):
  ```
  netstat -ano | findstr :3000
  taskkill /PID <PID> /F
  ```

### CORS Error
- Make sure backend is running on `http://localhost:5000`
- Check CORS configuration in `server/server.js`

### Frontend Blank Page
- Clear browser cache (Ctrl+Shift+Delete)
- Check browser console for errors (F12)
- Make sure backend is running

## File Structure

```
C:\ABM\
├── server/                    # Node.js Backend
│   ├── controllers/          # Route controllers
│   ├── models/               # MongoDB schemas
│   ├── routes/               # API routes
│   ├── middleware/           # Authentication middleware
│   ├── config/               # Database configuration
│   ├── server.js             # Main server file
│   ├── package.json          # Dependencies
│   └── .env                  # Environment variables
│
├── client/                    # React Frontend
│   ├── src/
│   │   ├── pages/            # Page components
│   │   ├── components/       # Reusable components
│   │   ├── services/         # API services
│   │   ├── App.js            # Main App component
│   │   └── index.js          # Entry point
│   ├── public/               # Static files
│   └── package.json          # Dependencies
│
├── database.sql              # SQL schema (for reference)
└── README.md                 # Documentation
```

## Quick Start Commands

### Terminal 1 - Backend:
```bash
cd c:\ABM\server
npm install
npm start
```

### Terminal 2 - Frontend:
```bash
cd c:\ABM\client
npm install
npm start
```

### Then Open:
```
Browser: http://localhost:3000
```

## Support

If you encounter any issues:
1. Check the console output for error messages
2. Verify all services are running (MongoDB, Backend, Frontend)
3. Clear browser cache and reload
4. Restart Node.js servers

---
**System is ready to use!** 🎉
