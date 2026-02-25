# 🚀 Vercel Deployment Guide - AI Trip Planner

**Complete step-by-step guide to deploy the AI Trip Planner to Vercel in 15 minutes.**

---

## 📋 Prerequisites

Before you start, make sure you have:

- ✅ GitHub account (Vercel deploys from GitHub)
- ✅ Vercel account (free tier is fine)
- ✅ Google Cloud API keys (from [ENV_SETUP.md](ENV_SETUP.md))
- ✅ Firebase credentials (from [ENV_SETUP.md](ENV_SETUP.md))
- ✅ Code pushed to GitHub

---

## ⏱️ Timeline

| Step | Time | What You Do |
|------|------|-----------|
| 1 | 2 min | Create GitHub repo & push code |
| 2 | 3 min | Create Vercel account |
| 3 | 2 min | Connect GitHub to Vercel |
| 4 | 5 min | Add 11 environment variables |
| 5 | 2 min | Deploy |
| 6 | 5 min | Test live site |
| **Total** | **~15 min** | **LIVE!** 🎉 |

---

## 🚀 Step 1: Push Code to GitHub (2 minutes)

### 1.1 Create a GitHub Repository

1. Go to **[GitHub.com](https://github.com)**
2. Click **New** (upper left corner)
3. Repository name: `ai-trip-planner`
4. Description: `AI-powered travel itinerary generator`
5. Choose **Public** (for free deployment on Vercel)
6. Click **Create repository**

### 1.2 Push Your Code

In your project directory, run:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: AI Trip Planner ready for production"

# Add remote (replace USERNAME with your GitHub username)
git remote add origin https://github.com/USERNAME/ai-trip-planner.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**Verify:** Open GitHub in browser and confirm your code is there.

---

## ⚡ Step 2: Create Vercel Account (3 minutes)

### 2.1 Sign Up

1. Go to **[Vercel.com](https://vercel.com)**
2. Click **Sign Up**
3. Choose **GitHub** (recommended)
4. Authorize Vercel to access your GitHub
5. Verify your email

### 2.2 Complete Profile

1. Set your username
2. Choose "Hobby" (free tier)
3. Click **Continue**

✅ **Vercel account created!**

---

## 🔗 Step 3: Connect GitHub to Vercel (2 minutes)

### 3.1 Import Project

1. Go to **[Vercel Dashboard](https://vercel.com/dashboard)**
2. Click **Add New** → **Project**
3. You should see your GitHub repositories
4. Find `ai-trip-planner` and click **Import**

### 3.2 Configure Project

The import wizard will show:

```
Framework Preset: Vite
Root Directory: ./
Build Command: npm run build
Output Directory: dist
Install Command: npm ci
```

✅ **All settings are correct!** (Already configured in vercel.json)

5. Click **Deploy** (it will ask for environment variables next)

---

## 🔐 Step 4: Add Environment Variables (5 minutes)

**BEFORE clicking Deploy**, you need to add your API keys.

### 4.1 Add Variables from Project Settings

After clicking Import, you should see the "Environment Variables" section.

If not, after initial deploy, go to:  
**Settings** → **Environment Variables**

### 4.2 Add All 11 Variables

Add each variable one by one:

#### **Google Cloud APIs** (4 variables)

| Variable Name | Value | Get From |
|---|---|---|
| `VITE_GOOGLE_GEMINI_AI_API_KEY` | Your Gemini API key | Google Cloud Console |
| `VITE_GOOGLE_PLACE_API_KEY` | Your Places API key | Google Cloud Console |
| `VITE_GOOGLE_MAPS_API_KEY` | Your Maps API key | Google Cloud Console |
| `VITE_GOOGLE_AUTH_CLIENT_ID` | Your OAuth Client ID | Google Cloud Console |

#### **Firebase** (7 variables)

| Variable Name | Value | Get From |
|---|---|---|
| `VITE_FIREBASE_API_KEY` | Your Firebase API key | Firebase Console |
| `VITE_FIREBASE_AUTH_DOMAIN` | `your-project.firebaseapp.com` | Firebase Console |
| `VITE_FIREBASE_PROJECT_ID` | Your Firebase Project ID | Firebase Console |
| `VITE_FIREBASE_STORAGE_BUCKET` | `your-project.appspot.com` | Firebase Console |
| `VITE_FIREBASE_MESSAGING_SENDER_ID` | Your Sender ID | Firebase Console |
| `VITE_FIREBASE_APP_ID` | Your App ID | Firebase Console |
| `VITE_FIREBASE_MEASUREMENT_ID` | Your Measurement ID | Firebase Console |

### 4.3 How to Add Each Variable

1. Click **Add New Variable**
2. Enter the variable name (e.g., `VITE_GOOGLE_GEMINI_AI_API_KEY`)
3. Paste the value
4. Select scope: **Production** (check the box)
5. Click **Add**
6. Repeat for all 11 variables

✅ **All 11 variables added!**

---

## 🎯 Step 5: Deploy (2 minutes)

### 5.1 Trigger Deploy

Once all variables are added:

1. Click **Deploy** button
2. Watch the build logs
3. Wait for "✓ Build completed successfully"

**Build time:** ~30-45 seconds

### 5.2 Get Your URL

Once deployed, you'll see:

```
✓ Deployment Complete!
🎉 You're all set!

Your production URL:
https://ai-trip-planner-xxxxx.vercel.app
```

Copy this URL - it's your live site!

---

## 🧪 Step 6: Test Live Site (5 minutes)

### 6.1 Test Basic Features

1. Open your Vercel URL in browser
2. Click **"Get Started"**
3. Click **"Sign In with Google"**
4. Sign in with your Google account
5. Test trip creation:
   - Enter location
   - Select number of days
   - Choose budget tier
   - Select traveler type
   - Click "Generate Plan"
6. Wait for AI to generate itinerary (~30 seconds)
7. Verify hotels, places, and itinerary display
8. Check console (F12) for errors

### 6.2 Verification Checklist

- [ ] Site loads without errors
- [ ] Google Sign-in works
- [ ] Can create a trip
- [ ] AI generates itinerary
- [ ] Hotels display with images
- [ ] Places to visit show correctly
- [ ] Maps load properly
- [ ] No console errors (red)
- [ ] Page is fast and responsive
- [ ] Can sign out and back in

✅ **All tests passing!**

---

## 🔧 Post-Deployment Configuration

### 6.3 Add Custom Domain (Optional)

1. Go to **Project Dashboard**
2. Click **Settings** → **Domains**
3. Add your domain (e.g., `mytrips.com`)
4. Follow DNS configuration instructions

### 6.4 Set Up Monitoring (Optional)

1. Go to **Project Dashboard**
2. Click **Analytics** to monitor:
   - Deployment frequency
   - Performance metrics
   - Error tracking

### 6.5 Enable Automatic Deployments

Already enabled! Any push to `main` branch automatically deploys.

---

## 🚨 Troubleshooting

### Problem: "Build Failed" Error

**Solution:**
1. Check build logs (click the failed deployment)
2. Look for error messages
3. Common fixes:
   - Missing environment variables (re-check all 11)
   - Node version mismatch (Vercel defaults to 18 - should be fine)
   - npm dependencies issue (run `npm ci` locally to verify)

### Problem: "Cannot find module" Error

**Solution:**
1. Ensure `package-lock.json` is committed to GitHub
2. Run `npm ci` locally to verify dependencies
3. Push updated lock file to GitHub
4. Redeploy from Vercel dashboard

### Problem: Environment Variables Not Loading

**Solution:**
1. Go to **Settings** → **Environment Variables**
2. Verify all 11 variables are there
3. Ensure they're set to **Production** scope
4. Redeploy project:
   - Click **Deployments** tab
   - Find latest deployment
   - Click **...** → **Redeploy**

### Problem: Site Works Locally But Not on Vercel

**Solution:**
1. Check you're using correct variable names (must start with `VITE_`)
2. Verify accessing via `import.meta.env.VITE_XXXXX`
3. Make sure environmental variables are set in Vercel
4. Check for environment-specific code that might not work on Vercel

### Problem: Firebase Authentication Not Working

**Solution:**
1. In Firebase Console → Authentication → Sign-in method
2. Ensure Google is enabled
3. Add your Vercel domain to OAuth redirect URIs:
   - Go to Google Cloud Console
   - Edit OAuth Client
   - Add: `https://your-app.vercel.app`
   - Save

### Problem: Google Places API Not Working

**Solution:**
1. Check your Places API key has no usage quota reached
2. Verify API is enabled in Google Cloud Console
3. Ensure key restrictions allow your Vercel domain
4. Check billing account is valid

---

## 📊 Monitor Your Deployment

### View Logs

```
Dashboard → Deployments → [Latest] → Logs
```

### View Analytics

```
Dashboard → Analytics
```

Shows:
- Page views
- Performance metrics
- Error rates
- Build times

### View Usage

```
Dashboard → Settings → Usage
```

Shows:
- Build minutes used
- Bandwidth used
- Deployment frequency

---

## 🔄 How to Update Your Site

### To Deploy Updates

1. Make code changes locally
2. Test locally: `npm run dev`
3. Commit: `git commit -m "Feature: Add new feature"`
4. Push: `git push origin main`
5. **Automatic deployment starts!**
6. Check Vercel Dashboard for build status
7. Your site updates automatically

### To Update Environment Variables

1. Go to **Settings** → **Environment Variables**
2. Click the variable to edit
3. Update value
4. Click **Save**
5. Click **Deployments**
6. Find latest deployment
7. Click **...** → **Redeploy**

---

## 📈 Performance Tips

### 1. Optimize Bundle Size

Already done! Your bundle is optimized with:
- Code splitting enabled
- Tree-shaking enabled
- Minification enabled
- Source maps disabled

### 2. Enable Caching

Vercel automatically caches:
- `/assets/*` files (1 year)
- HTML files (no cache - always fresh)
- API responses (handled by Firebase)

### 3. Monitor Build Time

Current build time: ~30 seconds ✅ (Good)

If slow, check:
- Large dependencies
- Build-time computations
- Network requests

---

## 🎯 Summary

You now have:

✅ **Live website** at `https://your-app.vercel.app`  
✅ **Automatic deployments** on every GitHub push  
✅ **Custom domain** support (optional)  
✅ **Monitoring & analytics** built-in  
✅ **Free HTTPS** for your domain  
✅ **Global CDN** for fast page loads  
✅ **Automatic backups** (Firebase)  
✅ **100% uptime SLA** (Vercel enterprise)  

---

## 🔐 Security Reminder

### DON'T Ever:
- ❌ Share your API keys
- ❌ Commit `.env` files
- ❌ Post keys in issues/PRs
- ❌ Share Vercel settings screenshots with keys visible

### DO Always:
- ✅ Keep keys in Vercel Environment Variables only
- ✅ Rotate keys every 3-6 months
- ✅ Monitor API usage for unusual activity
- ✅ Enable two-factor auth on Vercel & Google Cloud

---

## 📞 Need Help?

- **Vercel Docs:** https://vercel.com/docs
- **Vercel Support:** https://vercel.com/support
- **React Docs:** https://react.dev
- **Firebase Docs:** https://firebase.google.com/docs
- **Vite Docs:** https://vitejs.dev

---

## ✨ What's Next?

### After Launch:

1. **Monitor performance** - Check analytics daily first week
2. **Gather feedback** - Ask users for feedback
3. **Track errors** - Set up error tracking (Sentry, LogRocket)
4. **Scale up** - Upgrade plan if needed
5. **Add features** - Deploy improvements regularly

### Consider Adding:

- [ ] Error tracking (Sentry)
- [ ] Analytics (Google Analytics)
- [ ] Email notifications
- [ ] Caching optimization
- [ ] CDN images (Vercel Image Optimization)
- [ ] API rate limiting
- [ ] User feedback widget

---

## 🎉 Congratulations!

Your AI Trip Planner is now **LIVE on the internet!** 🚀

Share your URL with friends and get feedback. Update your site anytime with a simple `git push`.

**Happy deploying!**

---

**Deployment Date:** February 25, 2026  
**Platform:** Vercel  
**Status:** ✅ Live & Ready  
**Next Deployment:** Follow instructions above to update anytime
