# ABM Employee Attendance System

A complete **Employee Attendance Management System** built with modern web technologies.

## 🚀 Quick Start

### Prerequisites
- Node.js (v14+)
- MongoDB (local or Atlas)
- npm/yarn

### Installation (3 Steps)

**Step 1: Setup Backend**
```bash
cd c:\ABM\server
npm install
npm start
```

**Step 2: Setup Frontend** (new terminal)
```bash
cd c:\ABM\client
npm install
npm start
```

**Step 3: Open Browser**
```
http://localhost:3000
```

## 📋 Features

### Employee Dashboard
- ✅ Check In / Check Out
- ✅ View Attendance Records
- ✅ Apply for Leave
- ✅ Manage Profile

### Admin Dashboard  
- ✅ View Statistics
- ✅ Manage Employees
- ✅ Attendance Reports
- ✅ Leave Approvals

## 🛠️ Tech Stack

- **Frontend**: React.js
- **Backend**: Node.js + Express
- **Database**: MongoDB
- **Authentication**: JWT

## 📁 Project Structure

```
ABM/
├── server/          # Backend API
├── client/          # React Frontend
├── public/          # Static files
├── config/          # Config files
└── database.sql     # Schema reference
```

## 🔧 API Endpoints

### Auth
- `POST /api/auth/register`
- `POST /api/auth/login`

### Attendance
- `POST /api/attendance/check-in`
- `POST /api/attendance/check-out`
- `GET /api/attendance/my-attendance`

### Leave
- `POST /api/leave/apply`
- `GET /api/leave/my-leaves`
- `GET /api/leave/all` (admin)

### Users
- `GET /api/users/profile`
- `PUT /api/users/profile`

## 📚 Detailed Documentation

See [SETUP_GUIDE.md](./SETUP_GUIDE.md) for:
- Complete installation instructions
- MongoDB setup
- Environment configuration
- Default credentials
- Troubleshooting guide
- Full API endpoint documentation

## 🚀 Running the System

1. **Backend**: `cd server && npm install && npm start` (runs on port 5000)
2. **Frontend**: `cd client && npm install && npm start` (runs on port 3000)
3. **Database**: MongoDB on localhost:27017

## 🐛 Troubleshooting

**Connection Issues?**
- Ensure MongoDB is running
- Check .env file settings
- Verify ports 5000 and 3000 are available

**Module Not Found?**
- Run `npm install` in both server and client directories

**CORS Error?**
- Backend should be running before frontend
- Check backend is accessible at http://localhost:5000

## 📖 Employee Dashboard
## Employee Features
- ✅ Check-in/Check-out functionality
- ✅ View attendance history with monthly reports
- ✅ Submit and track leave requests
- ✅ Update personal profile
- ✅ Change password securely

## Admin Features
- ✅ Dashboard with key statistics
- ✅ Manage all employees
- ✅ View attendance reports with analytics
- ✅ Approve or reject leave requests
- ✅ System configuration and settings

---

**Created Date:** February 26, 2026  
**Version:** 2.0.0 (Node.js + React + MongoDB)

---

**Ready to get started?** Follow the Quick Start section above! 🎉

