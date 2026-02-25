# 🚀 AI Trip Planner - Complete Deployment Guide

This guide covers all deployment options for the AI Trip Planner application.

---

## 📋 Pre-Deployment Checklist

Before deploying, ensure:

- ✅ All code is committed and pushed to GitHub
- ✅ No console errors or warnings
- ✅ `.env.example` file is up-to-date with all required variables
- ✅ Node.js 18+ and npm 9+ installed locally
- ✅ All API keys obtained from:
  - [Google Cloud Console](https://console.cloud.google.com/)
  - [Firebase Console](https://console.firebase.google.com/)

---

## 🔑 Required API Keys & Credentials

### 1. **Google Cloud Setup**
   1. Create a project in [Google Cloud Console](https://console.cloud.google.com/)
   2. Enable these APIs:
      - **Google Generative AI API** (Gemini)
      - **Places API**
      - **Maps API**
   3. Create an API key for server-side (Gemini API)
   4. Create OAuth 2.0 credentials for web application

### 2. **Google OAuth Setup**
   1. Go to [Google Cloud Console](https://console.cloud.google.com/) → APIs & Services → Credentials
   2. Create OAuth 2.0 Client ID (Web application)
   3. Add authorized redirect URIs:
      - `http://localhost:5173` (local development)
      - `https://your-domain.com` (production)
      - `https://your-domain.com/auth/callback` (if applicable)
   4. Copy the Client ID

### 3. **Firebase Setup**
   1. Go to [Firebase Console](https://console.firebase.google.com/)
   2. Create a new project
   3. Enable Firestore Database
      - Choose production mode
      - Set security rules appropriately
   4. Go to Project Settings → Service Accounts
   5. Copy the Web App configuration (all values starting with VITE_FIREBASE_)

---

## 📦 Deployment Options

### **Option 1: Vercel (Recommended for Vite Apps) ⭐**

#### Step 1: Prepare Your Repository
```bash
# Ensure all changes are committed
git add .
git commit -m "Prepare for deployment to Vercel"
git push origin main
```

#### Step 2: Connect to Vercel
1. Go to [Vercel.com](https://vercel.com)
2. Sign up/Login with GitHub
3. Click "New Project"
4. Select your GitHub repository
5. Vercel will auto-detect Vite configuration

#### Step 3: Configure Environment Variables
1. In Vercel Project Settings → Environment Variables
2. Add all variables from `.env.example`:
   ```
   VITE_GOOGLE_GEMINI_AI_API_KEY=your_key
   VITE_GOOGLE_PLACE_API_KEY=your_key
   VITE_GOOGLE_MAPS_API_KEY=your_key
   VITE_GOOGLE_AUTH_CLIENT_ID=your_id
   VITE_FIREBASE_API_KEY=your_key
   VITE_FIREBASE_AUTH_DOMAIN=your_domain
   VITE_FIREBASE_PROJECT_ID=your_id
   VITE_FIREBASE_STORAGE_BUCKET=your_bucket
   VITE_FIREBASE_MESSAGING_SENDER_ID=your_id
   VITE_FIREBASE_APP_ID=your_id
   VITE_FIREBASE_MEASUREMENT_ID=your_id
   ```

#### Step 4: Deploy
```bash
# Vercel automatically deploys on git push
# No additional commands needed

# View deployment: https://your-project.vercel.app
```

---

### **Option 2: Netlify**

#### Step 1: Connect Your Repository
1. Go to [Netlify.com](https://netlify.com)
2. Click "Connect to Git"
3. Select your GitHub repository
4. Netlify will auto-detect configuration

#### Step 2: Configure Build Settings
- Build command: `npm run build`
- Publish directory: `dist`

#### Step 3: Set Environment Variables
Site Settings → Build & Deploy → Environment → Edit Variables
Add all variables from `.env.example`

#### Step 4: Deploy
```bash
# Deploy via CLI (optional)
npm install -g netlify-cli
netlify deploy
```

---

### **Option 3: Docker (Self-Hosted)**

#### Step 1: Build Docker Image
```bash
docker build -t ai-trip-planner:latest .
```

#### Step 2: Create `.env.docker` file
```bash
cp .env.example .env.docker
# Edit .env.docker with your actual API keys
```

#### Step 3: Run with Docker Compose
```bash
# Start the application
docker-compose up -d

# View logs
docker-compose logs -f app

# Stop the application
docker-compose down
```

#### Step 4: Access Application
- Local: `http://localhost:3000`
- Update OAuth redirect URI in Google Cloud Console to include your server domain

---

### **Option 4: GitHub Pages (Static Hosting)**

#### Step 1: Update vite.config.js
```javascript
export default {
  base: '/ai-trip-planner/', // if hosted as a subpath
  // ... rest of config
}
```

#### Step 2: Configure GitHub Actions
```bash
# .github/workflows/deploy.yml is already included
# Ensure GitHub Pages is enabled in repo settings
```

#### Step 3: Deploy
```bash
git push origin main
# GitHub Actions will automatically deploy to gh-pages
```

---

### **Option 5: Traditional VPS/Cloud (AWS EC2, DigitalOcean, etc.)**

#### Step 1: SSH into Server
```bash
ssh user@your-server-ip
```

#### Step 2: Install Dependencies
```bash
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs npm
```

#### Step 3: Clone Repository
```bash
cd /var/www
git clone https://github.com/your-username/ai-trip-planner.git
cd ai-trip-planner
npm ci
```

#### Step 4: Set Environment Variables
```bash
nano .env
# Paste all your API keys
```

#### Step 5: Build Application
```bash
npm run build
```

#### Step 6: Install & Configure PM2
```bash
sudo npm install -g pm2
pm2 start "npm run preview" --name "ai-trip-planner"
pm2 startup
pm2 save
```

#### Step 7: Configure Nginx (Reverse Proxy)
```bash
sudo apt-get install -y nginx

# Create nginx config
sudo nano /etc/nginx/sites-available/default
```

Replace with:
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:4173;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# Test and enable
sudo nginx -t
sudo systemctl restart nginx
```

#### Step 8: Setup SSL with Let's Encrypt
```bash
sudo apt-get install -y certbot python3-certbot-nginx
sudo certbot --nginx -d your-domain.com
```

---

## 🔒 Security Checklist

- ✅ Never commit `.env` files
- ✅ Use environment variables for all secrets
- ✅ Enable Firebase security rules
  ```javascript
  rules_version = '2';
  service cloud.firestore {
    match /databases/{database}/documents {
      match /AITrips/{document=**} {
        allow read, write: if request.auth.uid != null;
      }
    }
  }
  ```
- ✅ Setup CORS properly for your domain
- ✅ Enable OAuth consent screen in Google Cloud
- ✅ Use HTTPS only in production
- ✅ Regularly rotate API keys
- ✅ Monitor API usage and set quotas

---

## 📊 Performance Optimization

The application includes:
- ✅ Code splitting for better caching
- ✅ Tree-shaking of unused code
- ✅ Image optimization
- ✅ Lazy loading of components
- ✅ Production-ready build output

---

## 🐛 Troubleshooting

### **CORS Errors**
- Add your domain to Google Cloud CORS allowed origins
- Check Firebase CORS settings

### **API Keys Not Working**
- Verify all 11 environment variables are set
- Check API quota in Google Cloud Console
- Ensure APIs are enabled

### **Firebase Permission Denied**
- Review and update Firestore security rules
- Ensure user is authenticated (Google OAuth)
- Check Firebase authentication providers

### **Build Failed**
- Clear node_modules: `rm -rf node_modules && npm ci`
- Check Node.js version: `node --version` (should be 18+)
- Review build logs for specific errors

---

## 🚀 Monitoring & Maintenance

### **Vercel**
- View analytics: Vercel Dashboard → Analytics
- Monitor performance: Vercel Dashboard → Web Analytics
- Check logs: Vercel Dashboard → Logs

### **Docker**
```bash
# Check container status
docker-compose ps

# View logs
docker-compose logs -f app

# Update image
git pull
docker-compose up -d --build
```

### **VPS**
```bash
# Check PM2 status
pm2 status

# View PM2 logs
pm2 logs ai-trip-planner

# Monitor system resources
htop
```

---

## 📞 Support & Resources

- **Google Cloud Documentation**: https://cloud.google.com/docs
- **Firebase Documentation**: https://firebase.google.com/docs
- **Vercel Documentation**: https://vercel.com/docs
- **Vite Documentation**: https://vitejs.dev/
- **React Documentation**: https://react.dev/

---

## ✨ Post-Deployment

1. **Test all features** in production
2. **Monitor error logs** for issues
3. **Set up alerts** for API quota limits
4. **Backup Firestore data** regularly
5. **Update DNS** records if using custom domain
6. **Share deployment URL** with team

---

**Deployment ready! 🎉**
