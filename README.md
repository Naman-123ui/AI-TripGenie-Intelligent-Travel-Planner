# 🌍 AI Trip Planner

> **Intelligent Travel Planning Made Simple** - An AI-powered web application that generates personalized trip itineraries with hotel and restaurant recommendations using Google Gemini AI.

![React](https://img.shields.io/badge/React-18.3.1-61DAFB?logo=react)
![Vite](https://img.shields.io/badge/Vite-6.3.5-646CFF?logo=vite)
![Firebase](https://img.shields.io/badge/Firebase-Real--time%20DB-FFA500?logo=firebase)
![Google AI](https://img.shields.io/badge/Google%20AI-Gemini%20API-4285F4?logo=google)
![Tailwind CSS](https://img.shields.io/badge/Tailwind%20CSS-Design%20System-38B2AC?logo=tailwindcss)

---

## ✨ Key Features

### 🤖 **AI-Powered Itinerary Generation**
- Leverages **Google Gemini 1.5 Flash** AI to generate custom travel itineraries
- Analyzes user preferences (budget, travel style, duration) to create personalized plans
- Generates structured JSON responses with detailed place recommendations

### 📍 **Smart Location Search**
- Integrated **Google Places API** autocomplete for destination selection
- Real-time location suggestions with coordinates
- Geolocation support for precise trip planning

### 🏨 **Hotel & Restaurant Recommendations**
- AI-curated hotel options based on budget and preferences
- Place-to-visit recommendations with detailed information
- Photo gallery integration for visual exploration

### 👤 **User Authentication**
- **Google OAuth 2.0** authentication for secure login
- Session persistence using localStorage
- Protected routes and user-specific trip management

### 💾 **Data Persistence**
- **Firebase Firestore** for scalable cloud storage
- Real-time synchronization of user trips
- Query-based trip retrieval by user email

### 📱 **Responsive Design**
- Mobile-first approach with Tailwind CSS
- Fully responsive UI (mobile, tablet, desktop)
- Beautiful component library using Radix UI

---

## 🏗️ Architecture & Tech Stack

### **Frontend**
- **React 18.3** - Modern UI library with hooks
- **Vite 6.3** - Lightning-fast build tool with HMR
- **Tailwind CSS 4** - Utility-first CSS framework
- **React Router 7** - Client-side routing

### **AI & APIs**
- **Google Generative AI (Gemini)** - LLM for itinerary generation
- **Google Places API** - Location autocomplete & place details
- **Google Maps API** - Map visualization & coordinates

### **Backend & Database**
- **Firebase Firestore** - NoSQL database
- **Axios** - HTTP client for API calls

### **UI Components**
- **Radix UI** - Accessible component primitives
- **Sonner** - Toast notifications
- **Lucide React** - Icon library
- **React Icons** - Additional icon set

---

## 📁 Project Structure

```
src/
├── components/
│   ├── custom/
│   │   ├── Header.jsx         # Navigation header
│   │   └── Hero.jsx           # Landing page hero section
│   └── ui/                    # Reusable UI components
│       ├── button.jsx         # Custom button component
│       ├── dialog.jsx         # Modal dialog
│       ├── input.jsx          # Form input
│       ├── popover.jsx        # Popover component
│       └── sonner.jsx         # Toast notifications
├── create-trip/
│   └── index.jsx              # Trip creation form & AI generation
├── my-trips/
│   ├── index.jsx              # User trips dashboard
│   └── components/
│       └── UserTripCardItem.jsx # Trip card component
├── view-trip/
│   ├── [tripId]/
│   │   └── index.jsx          # Trip detail view
│   └── components/
│       ├── Hotels.jsx         # Hotel recommendations
│       ├── PlacesToVisit.jsx  # Places to visit section
│       ├── Footer.jsx         # Trip footer
│       └── InfoSection.jsx    # Trip overview
├── service/
│   ├── AIModal.jsx            # Gemini AI integration
│   ├── firebaseConfig.jsx     # Firebase initialization
│   └── GlobalApi.jsx          # Google Places API client
├── constants/
│   └── option.jsx             # Prompts & default options
├── lib/
│   └── utils.js               # Utility functions
├── App.jsx                    # Root component
└── main.jsx                   # Entry point
```

---

## 🚀 Getting Started

### **Prerequisites**
- Node.js 18+ and npm/yarn
- Google Cloud API Keys:
  - Google Generative AI (Gemini API)
  - Google Places API
  - Google Maps API
- Firebase project setup

### **Environment Setup**

Create a `.env.local` file in the root directory:

```env
VITE_GOOGLE_GEMINI_AI_API_KEY=your_gemini_api_key_here
VITE_GOOGLE_PLACE_API_KEY=your_google_places_api_key_here
VITE_GOOGLE_MAPS_API_KEY=your_google_maps_api_key_here
VITE_FIREBASE_API_KEY=your_firebase_key_here
VITE_FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
VITE_FIREBASE_PROJECT_ID=your_firebase_project_id
VITE_FIREBASE_STORAGE_BUCKET=your_storage_bucket
VITE_FIREBASE_MESSAGING_SENDER_ID=your_sender_id
VITE_FIREBASE_APP_ID=your_app_id
```

### **Installation**

```bash
# Clone the repository
git clone https://github.com/yourusername/ai-trip-planner.git
cd ai-trip-planner

# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

---

## 💡 How It Works

### **Trip Creation Flow**

```
User Input (Location, Budget, Duration)
    ↓
Google Places API (Location validation & coordinates)
    ↓
AI Prompt Engineering (Context building)
    ↓
Gemini AI Processing (LLM generates itinerary)
    ↓
JSON Parsing (Structure response)
    ↓
Firebase Storage (Save trip to Firestore)
    ↓
Route Navigation (Display trip details)
```

### **Key Technical Implementations**

#### 1. **AI Integration**
```
- Uses Gemini 1.5 Flash model with JSON output mode
- Custom system prompts for trip generation
- Temperature & token optimization for better responses
- Dynamic context injection based on user preferences
```

#### 2. **Real-time Authentication**
```
- OAuth 2.0 flow with Google provider
- Automatic session persistence
- Protected routes with user validation
- Logout with session cleanup
```

#### 3. **Database Structure**
```
AITrips Collection (Firestore):
  ├── userEmail (query key)
  ├── tripData (AI-generated itinerary)
  ├── userSelection (user preferences)
  └── tripId (unique identifier)
```

---

## 📊 Key Learning & Implementation Highlights

### **For Interview Discussion**

#### 1. **AI/LLM Integration**
- Integrated **Google Gemini API** with structured JSON output mode
- Implemented prompt engineering for consistent, formatted responses
- Managed context windows and token limits for optimal performance
- Error handling for API failures with user feedback

#### 2. **Full-Stack Development**
- **Frontend**: React with component-based architecture, state management
- **Backend**: Firebase Firestore with Firestore queries and real-time updates
- **API Integration**: Multiple third-party APIs (Gemini, Places, Maps)
- **Authentication**: Secure OAuth 2.0 with Google

#### 3. **Performance Optimization**
- Vite for fast development and optimized production builds
- Lazy loading of routes using React Router
- Efficient API calls with axios request configuration
- Responsive design with Tailwind CSS

#### 4. **Code Quality**
- ESLint configuration for code standards
- Component modularity and reusability
- Clean code practices with proper separation of concerns
- Error handling and user feedback mechanisms

#### 5. **UX/UI Design**
- Intuitive form workflows
- Loading states and animations
- Toast notifications for user feedback
- Accessible components using Radix UI

---

## 🔧 Advanced Features to Highlight

### **Real-World Challenges Solved**

✅ **Dynamic Prompt Engineering** - Adjusting AI prompts based on user budget and travel style  
✅ **State Management** - Managing complex form states and async API calls  
✅ **Error Recovery** - Graceful handling of API failures with retry logic  
✅ **User Experience** - Skeleton loaders and optimistic UI updates  
✅ **Scalability** - Firebase for handling multiple users and concurrent requests  

---

## 📈 Potential Enhancements (Future Scope)

- [ ] **Trip Sharing** - Share itineraries with friends via shareable links
- [ ] **Real-time Collaboration** - Multiple users editing the same trip
- [ ] **Payment Integration** - Book hotels directly through the app
- [ ] **Mobile App** - React Native version for iOS/Android
- [ ] **Advanced Filtering** - Filter by ratings, reviews, distance
- [ ] **Maps Visualization** - Interactive map with trip routes
- [ ] **Multi-language Support** - Internationalization (i18n)
- [ ] **Weather Integration** - Real-time weather for destinations
- [ ] **Social Features** - User profiles, reviews, ratings

---

## 📚 Dependencies Breakdown

| Package | Purpose | Version |
|---------|---------|---------|
| `@google/generative-ai` | Gemini AI API integration | ^0.24.1 |
| `firebase` | Backend & database | ^11.9.1 |
| `@react-google-maps/api` | Google Maps integration | ^2.20.6 |
| `@react-oauth/google` | Google authentication | ^0.12.2 |
| `react-router-dom` | Client-side routing | ^7.6.2 |
| `axios` | HTTP requests | ^1.10.0 |
| `tailwindcss` | Styling framework | ^4.1.10 |
| `sonner` | Toast notifications | ^2.0.5 |
| `lucide-react` | Icon library | ^0.516.0 |

---

## 🎯 Project highlights:


1. **Full-Stack Capability** - From frontend UI to backend database integration
2. **API Integration Mastery** - Multiple APIs (Gemini, Places, Maps, Firebase)
3. **Modern Tech Stack** - React 18, Vite, Firebase, Tailwind CSS
4. **Problem-Solving** - Prompt engineering for consistent AI outputs
5. **User-Centric Design** - Responsive, accessible, intuitive UX
6. **Scalability** - Firebase ensures the app can handle growth
7. **Real-World Application** - Solves an actual problem people face

---



*Built with ❤️ using React, Vite, Firebase, and Google AI APIs*
