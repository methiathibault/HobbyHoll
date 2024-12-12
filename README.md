# HobbyHoll

A hobby tracking application built with Flutter and Express.js

## Prerequisites

- Node.js and npm
- Flutter SDK
- MariaDB/MySQL
- Git

## Installation & Setup

### Backend (Express.js)

1. Clone the repository and navigate to backend:
```bash
git clone git@github.com:methiathibault/HobbyHoll.git
cd back
```

2. Install dependencies:
```bash
npm install
```

3. Create .env file:
```bash
DB_NAME=your_database_name
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_HOST=localhost
```

4. Use fixutres :
```bash
node ./database/config.js
```

5. Start the server:
```bash
npm start
```
Server runs at http://localhost:3001

### Frontend (Flutter)

1. Navigate to frontend directory:
```bash
cd front
```

2. Install dependencies:
```bash
flutter pub get
```
3. Run the app:
```bash
flutter run
```
### Features
- Create, read, update and delete hobbies
- Search by name or type
- Sort by:
    - Release date
    - Name (alphabetically)
    - Rating
- Detailed view for each hobby
- Material Design UI with custom theme colors:
    - Primary: #2F70AF
    - Secondary: #B9848C
    - Tertiary: #806491

### Tech Stack
Frontend:
- Flutter
- Provider (state management)
- Custom theming
- HTTP package

Backend:
- Express.js
- Sequelize ORM
- MariaDB
- Environment variables
- CORS enabled

### Project Structure
```
hobbyholl/
├── back/
│   ├── controllers/
│   ├── models/
│   ├── routes/
│   ├── database/
│   └── server.js
└── front/
    ├── lib/
    │   ├── app.api/
    │   ├── app.list/
    │   ├── app.theme/
    │   └── main.dart
    └── pubspec.yaml
```

### API Endpoints
- GET /api/hobbies - List all hobbies
- GET /api/hobbies/:id - Get single hobby
- POST /api/hobbies - Create hobby
- PUT /api/hobbies/:id - Update hobby
- DELETE /api/hobbies/:id - Delete hobby
- GET /api/hobbies/searchByName/:name - Search by name
- GET /api/hobbies/searchByType/:type - Search by type