# 🔑 AI Trip Planner - Environment Variables Setup Guide

A complete guide to obtaining and configuring all required API keys and credentials for the AI Trip Planner.

---

## 📋 Overview

The AI Trip Planner requires **11 environment variables** to function properly:

```
4 from Google Cloud Console
7 from Firebase Console
```

**Total Setup Time:** 30-45 minutes

---

## 🎯 Environment Variables Checklist

Print this checklist and fill in as you obtain each key:

```
GOOGLE CLOUD APIS:
□ VITE_GOOGLE_GEMINI_AI_API_KEY
□ VITE_GOOGLE_PLACE_API_KEY
□ VITE_GOOGLE_MAPS_API_KEY
□ VITE_GOOGLE_AUTH_CLIENT_ID

FIREBASE:
□ VITE_FIREBASE_API_KEY
□ VITE_FIREBASE_AUTH_DOMAIN
□ VITE_FIREBASE_PROJECT_ID
□ VITE_FIREBASE_STORAGE_BUCKET
□ VITE_FIREBASE_MESSAGING_SENDER_ID
□ VITE_FIREBASE_APP_ID
□ VITE_FIREBASE_MEASUREMENT_ID
```

---

## 🌐 Part 1: Google Cloud Setup (20 minutes)

### **Step 1.1: Create a Google Cloud Project**

1. Go to **[Google Cloud Console](https://console.cloud.google.com/)**
2. Click **"Select a Project"** → **"New Project"**
3. Enter project name: `AI Trip Planner` (or your choice)
4. Click **"Create"** (wait 1-2 minutes)
5. Once created, the new project will be automatically selected

### **Step 1.2: Enable Required APIs**

#### Enable Google Generative AI (Gemini) API
1. In Google Cloud Console, go to **APIs & Services** → **Enabled APIs & services**
2. Click **"+ Enable APIs and Services"**
3. Search for: `Generative Language API`
4. Click on it and press **"Enable"** (wait 30 seconds)
5. You should see "✓ API Enabled"

#### Enable Places API
1. Click **"+ Enable APIs and Services"** again
2. Search for: `Places API`
3. Click on it and press **"Enable"** (wait 30 seconds)

#### Enable Maps API
1. Click **"+ Enable APIs and Services"** again
2. Search for: `Maps JavaScript API`
3. Click on it and press **"Enable"** (wait 30 seconds)

✅ All three APIs should now show as enabled.

### **Step 1.3: Create API Key**

1. Go to **APIs & Services** → **Credentials**
2. Click **"+ Create Credentials"** → **"API Key"**
3. A popup will show your API key (e.g., `AIzaSy...`)
4. Copy this key and save it safely (you'll need it multiple times)
5. Click **"Close"**

📝 **Save this as:** `VITE_GOOGLE_GEMINI_AI_API_KEY`
📝 **Also use for:** `VITE_GOOGLE_PLACE_API_KEY` and `VITE_GOOGLE_MAPS_API_KEY`

> ⚠️ **Note:** In production, you should create separate API keys for each service with appropriate restrictions. For development, one key works fine.

### **Step 1.4: Restrict Your API Key (Security)**

⚠️ **Important:** Restrict your API key to your applications only

1. In **Credentials** page, click on your newly created API key
2. Under **Key restrictions** → **Application restrictions**
3. Select **"HTTP referrers (web sites)"**
4. Add these referrers:
   ```
   http://localhost:5173
   http://localhost:4173
   https://your-domain.com/*
   ```
5. Under **API restrictions**:
   - Select **"Restrict key"**
   - Check these APIs:
     - Generative Language API
     - Places API
     - Maps JavaScript API
6. Click **"Save"**

### **Step 1.5: Create OAuth 2.0 Credentials**

1. In **APIs & Services** → **Credentials**
2. Click **"+ Create Credentials"** → **"OAuth client ID"**
3. If you see "You must first set a user consent screen", click **"Configure Consent Screen"**

#### Configure OAuth Consent Screen:
1. Choose **"External"** user type
2. Click **"Create"**
3. Fill in the form:
   - **App name:** `AI Trip Planner`
   - **User support email:** Your email
   - **Developer contact:** Your email
4. Click **"Save and Continue"**
5. On **Scopes** page: Click **"Save and Continue"** (no scopes needed)
6. On **Test users** page: Click **"Save and Continue"**
7. Review and click **"Back to Dashboard"**

#### Create OAuth Client ID:
1. Go back to **Credentials**
2. Click **"+ Create Credentials"** → **"OAuth client ID"**
3. Choose application type: **"Web application"**
4. Add name: `AI Trip Planner Web Client`
5. Under **Authorized JavaScript origins**, add:
   ```
   http://localhost:5173
   http://localhost:4173
   https://your-domain.com
   ```
6. Under **Authorized redirect URIs**, add:
   ```
   http://localhost:5173
   http://localhost:4173
   https://your-domain.com
   ```
7. Click **"Create"**
8. Copy the **Client ID** (e.g., `xxx.apps.googleusercontent.com`)

📝 **Save this as:** `VITE_GOOGLE_AUTH_CLIENT_ID`

✅ **Google Cloud Setup Complete!**

---

## 🔥 Part 2: Firebase Setup (20 minutes)

### **Step 2.1: Create a Firebase Project**

1. Go to **[Firebase Console](https://console.firebase.google.com/)**
2. Click **"Add Project"**
3. Enter project name: `AI Trip Planner` (or same as Google Cloud)
4. Continue with the wizard:
   - Analytics: Disable (not needed for this project)
   - Click **"Create Project"**
5. Wait for project creation (2-3 minutes)

### **Step 2.2: Register Web App**

1. In Firebase Console, click **"Web"** icon (`</>`) to register a web app
2. App nickname: `AI Trip Planner Web`
3. Check "Also set up Firebase Hosting" (optional)
4. Click **"Register App"**

### **Step 2.3: Copy Firebase Configuration**

1. After registration, you'll see your Firebase config:
   ```javascript
   const firebaseConfig = {
     apiKey: "AIzaSy...",
     authDomain: "xxx.firebaseapp.com",
     projectId: "xxx",
     storageBucket: "xxx.appspot.com",
     messagingSenderId: "xxx",
     appId: "1:xxx:web:xxx",
     measurementId: "G-xxx"
   };
   ```

2. Copy each value and map to your environment variables:

| Firebase Config | Environment Variable |
|---|---|
| `apiKey` | `VITE_FIREBASE_API_KEY` |
| `authDomain` | `VITE_FIREBASE_AUTH_DOMAIN` |
| `projectId` | `VITE_FIREBASE_PROJECT_ID` |
| `storageBucket` | `VITE_FIREBASE_STORAGE_BUCKET` |
| `messagingSenderId` | `VITE_FIREBASE_MESSAGING_SENDER_ID` |
| `appId` | `VITE_FIREBASE_APP_ID` |
| `measurementId` | `VITE_FIREBASE_MEASUREMENT_ID` |

3. Save all 7 values in your `.env` file

### **Step 2.4: Enable Firestore Database**

1. In Firebase Console, go to **"Firestore Database"** (left sidebar)
2. Click **"Create Database"**
3. Choose location (closest to you)
4. Start in **"Production mode"**
5. Click **"Enable"**

### **Step 2.5: Update Firestore Security Rules**

1. In Firestore, go to **"Rules"** tab
2. Replace with these rules:
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       // Only authenticated users can read/write their trips
       match /AITrips/{document=**} {
         allow read, write: if request.auth.uid != null;
       }
     }
   }
   ```
3. Click **"Publish"**

### **Step 2.6: Enable Authentication**

1. Go to **"Authentication"** (left sidebar)
2. Click **"Get started"**
3. Enable **"Google"** sign-in method:
   - Click "Google" provider
   - Enable it
   - Select "AI Trip Planner" from Google Cloud Project dropdown
   - Click **"Save"**

✅ **Firebase Setup Complete!**

---

## 💻 Part 3: Local Development Setup

### **Step 3.1: Create .env.local File**

1. In your project root directory, create a file named **`.env.local`**
   ```bash
   touch .env.local
   ```

2. Open `.env.local` in your text editor

3. Copy this template:
   ```env
   # Google APIs
   VITE_GOOGLE_GEMINI_AI_API_KEY=your_api_key_here
   VITE_GOOGLE_PLACE_API_KEY=your_api_key_here
   VITE_GOOGLE_MAPS_API_KEY=your_api_key_here
   VITE_GOOGLE_AUTH_CLIENT_ID=your_client_id_here.apps.googleusercontent.com

   # Firebase
   VITE_FIREBASE_API_KEY=your_firebase_api_key
   VITE_FIREBASE_AUTH_DOMAIN=your-project.firebaseapp.com
   VITE_FIREBASE_PROJECT_ID=your-project-id
   VITE_FIREBASE_STORAGE_BUCKET=your-project.appspot.com
   VITE_FIREBASE_MESSAGING_SENDER_ID=your-sender-id
   VITE_FIREBASE_APP_ID=1:your-app-id:web:your-web-id
   VITE_FIREBASE_MEASUREMENT_ID=G-your-measurement-id
   ```

4. Replace `your_xxx_here` with actual values from Google Cloud and Firebase

5. Save the file

⚠️ **Important:** `.env.local` is in `.gitignore` and won't be committed. Keep it safe!

### **Step 3.2: Verify Local Setup**

1. Run development server:
   ```bash
   npm run dev
   ```

2. Open browser to `http://localhost:5173`

3. Test these features:
   - ✓ Page loads without errors
   - ✓ Click "Get Started" (no errors in console)
   - ✓ "Sign In" button works
   - ✓ Google OAuth popup appears
   - ✓ Can sign in successfully

4. Check browser console:
   - No red errors should appear
   - No CORS errors (orange warnings are ok)

✅ **Local Setup Verified!**

---

## 🌍 Part 4: Production Deployments

### **Option A: Vercel Deployment**

#### Step 1: Push Code to GitHub
```bash
git add .
git commit -m "Ready for production deployment"
git push origin main
```

#### Step 2: Connect to Vercel
1. Go to [Vercel.com](https://vercel.com)
2. Sign up with GitHub
3. Click "New Project"
4. Select your repository
5. Vercel auto-detects Vite configuration

#### Step 3: Add Environment Variables
1. After clicking "Deploy", go to **Settings** → **Environment Variables**
2. Add all 11 variables:

| Variable Name | Value | Source |
|---|---|---|
| `VITE_GOOGLE_GEMINI_AI_API_KEY` | Your API key | Google Cloud |
| `VITE_GOOGLE_PLACE_API_KEY` | Your API key | Google Cloud |
| `VITE_GOOGLE_MAPS_API_KEY` | Your API key | Google Cloud |
| `VITE_GOOGLE_AUTH_CLIENT_ID` | Your Client ID | Google Cloud |
| `VITE_FIREBASE_API_KEY` | Firebase config | Firebase |
| `VITE_FIREBASE_AUTH_DOMAIN` | Firebase config | Firebase |
| `VITE_FIREBASE_PROJECT_ID` | Firebase config | Firebase |
| `VITE_FIREBASE_STORAGE_BUCKET` | Firebase config | Firebase |
| `VITE_FIREBASE_MESSAGING_SENDER_ID` | Firebase config | Firebase |
| `VITE_FIREBASE_APP_ID` | Firebase config | Firebase |
| `VITE_FIREBASE_MEASUREMENT_ID` | Firebase config | Firebase |

3. For each variable:
   - Paste the value
   - Keep scope as "Production, Preview, Development"
   - Click "Add"

#### Step 4: Redeploy
1. Click "Deployments"
2. Click latest deployment
3. Click "..." → "Redeploy"
4. Wait for build to complete

#### Step 5: Update Google OAuth URIs
Back in Google Cloud Console:
1. Go to **APIs & Services** → **Credentials**
2. Edit your OAuth Client ID
3. Add these authorized URIs:
   ```
   https://your-vercel-app.vercel.app
   https://your-custom-domain.com
   ```
4. Save

---

### **Option B: Netlify Deployment**

#### Step 1: Connect Repository
1. Go to [Netlify.com](https://netlify.com)
2. Click "New site from Git"
3. Select GitHub and your repository

#### Step 2: Add Environment Variables
1. Go to **Site settings** → **Build & Deploy** → **Environment**
2. Click "Edit variables"
3. Add all 11 variables as listed above

#### Step 3: Deploy
```bash
netlify deploy --prod
```

---

### **Option C: Docker Deployment**

#### Step 1: Create .env File for Docker
Create a new file named `.env` (not `.env.local`):
```env
VITE_GOOGLE_GEMINI_AI_API_KEY=your_value
VITE_GOOGLE_PLACE_API_KEY=your_value
VITE_GOOGLE_MAPS_API_KEY=your_value
VITE_GOOGLE_AUTH_CLIENT_ID=your_value
VITE_FIREBASE_API_KEY=your_value
VITE_FIREBASE_AUTH_DOMAIN=your_value
VITE_FIREBASE_PROJECT_ID=your_value
VITE_FIREBASE_STORAGE_BUCKET=your_value
VITE_FIREBASE_MESSAGING_SENDER_ID=your_value
VITE_FIREBASE_APP_ID=your_value
VITE_FIREBASE_MEASUREMENT_ID=your_value
```

#### Step 2: Build and Run
```bash
docker-compose up -d
```

#### Step 3: Add Domain to Google OAuth
In Google Cloud:
1. Edit OAuth Client ID
2. Add authorized URI: `https://your-docker-domain.com`

---

## ✅ Verification Checklist

After setting up all environment variables, verify everything works:

### **Local Testing**
```
□ npm run dev (server starts)
□ Page loads at http://localhost:5173
□ No errors in browser console
□ Can click "Get Started"
□ Can click "Sign In"
□ Google OAuth popup appears
□ Can sign in with Google account
□ User data saved in Firebase
□ Can create a new trip
□ Can view saved trips
□ Images load correctly
□ Maps display correctly
□ No console errors
```

### **Production Testing** (after deployment)
```
□ Live site loads
□ Google OAuth works
□ Can sign in
□ Can create trip
□ Can view trips
□ API responses are fast (<1s)
□ No 404 errors
□ No CORS errors
□ Firebase updates correctly
```

---

## 🔒 Security Best Practices

### **Development Environment**
✅ Keep `.env.local` in `.gitignore` (already done)
✅ Never commit `.env.local` to GitHub
✅ Use different API keys for dev and production
✅ Enable API key restrictions in Google Cloud

### **Production Environment**
✅ Set environment variables in platform dashboard, not in code
✅ Use separate API keys with restricted permissions
✅ Enable HTTPS for all URLs
✅ Restrict OAuth redirect URIs to your domain only
✅ Monitor API usage and set quotas

### **Regular Maintenance**
✅ Rotate API keys every 3-6 months
✅ Review Cloud logging for suspicious activity
✅ Update Firebase security rules regularly
✅ Monitor API quotas and usage

---

## 🆘 Troubleshooting

### **Problem: "CORS error" in browser console**

**Solution:**
1. Check Google Cloud Console API settings
2. Verify your domain is in the CORS allowed origins
3. For `localhost` add: `http://localhost:5173`
4. For production, add your domain

### **Problem: "Authentication failed" when signing in**

**Solution:**
1. Check `VITE_GOOGLE_AUTH_CLIENT_ID` is correct
2. Verify OAuth consent screen is configured
3. Check authorized redirect URIs include your current domain
4. Try signing in with the same Google account used to create the project

### **Problem: Firebase returns "Permission denied"**

**Solution:**
1. Check Firestore security rules are properly set
2. Rules should allow `request.auth.uid != null`
3. Verify user is authenticated (signed in)
4. Check browser console for auth errors

### **Problem: Maps or Places API not working**

**Solution:**
1. Ensure all three APIs are enabled in Google Cloud
2. Verify API key has no restrictive quotas
3. Check API key restrictions allow your domains
4. Verify usage quota hasn't been exceeded

### **Problem: Environment variables not loading**

**Solution:**
```bash
# Local Development
1. File must be named .env.local (not .env)
2. Must be in project root directory
3. Run: npm run dev (Vite picks up .env.local)
4. Restart dev server after changes

# Production (Vercel)
1. Check variables are in dashboard (NOT in code)
2. Redeploy after adding variables
3. Check variable names start with VITE_
```

### **Problem: "Invalid API Key" error**

**Solution:**
1. Copy API key exactly as shown (no extra spaces)
2. Verify you're using the correct key for the service
3. Check key hasn't been deleted or disabled
4. Try generating a new API key

---

## 📚 Reference Links

- [Google Cloud Console](https://console.cloud.google.com/)
- [Firebase Console](https://console.firebase.google.com/)
- [Vite Environment Variables](https://vitejs.dev/guide/env-and-mode.html)
- [Google Cloud API Documentation](https://cloud.google.com/docs)
- [Firebase Documentation](https://firebase.google.com/docs)

---

## 💡 Important Tips

1. **Separate Keys for Services:** In production, create separate API keys for each service
2. **Key Rotation:** Rotate keys every 3-6 months
3. **Monitor Usage:** Check Google Cloud console for API usage
4. **Backup Configuration:** Keep a secure backup of your API keys
5. **Never Share Keys:** Don't share API keys with anyone

---

## ✨ Next Steps

1. ✅ Complete all steps in this guide
2. ✅ Verify local setup works
3. ✅ Choose deployment platform
4. ✅ Follow deployment guide: [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md)
5. ✅ Deploy to production!

---

**Environment setup complete! You're ready to deploy! 🚀**

For deployment instructions, see [START_HERE.md](./START_HERE.md)
