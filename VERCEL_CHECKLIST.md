# ✅ Vercel Deployment Quick Checklist

**Use this checklist while deploying to Vercel. Print it out!**

---

## 📋 Before You Start

- [ ] GitHub account created and logged in
- [ ] Code pushed to GitHub (`main` branch)
- [ ] All 11 API keys collected and documented
- [ ] Vercel account created
- [ ] Google Cloud OAuth redirect URIs include: `https://your-app.vercel.app`

---

## 🚀 Deployment Checklist

### GitHub & Vercel Connection

- [ ] Signed up for Vercel
- [ ] Connected GitHub account to Vercel
- [ ] Authorized Vercel to access repositories
- [ ] Found `ai-trip-planner` repository in import options

### Project Import

- [ ] Clicked "Import" on `ai-trip-planner` repo
- [ ] Framework detected: **Vite** ✅
- [ ] Build command: **npm run build** ✅
- [ ] Output directory: **dist** ✅
- [ ] Install command: **npm ci** ✅

### Environment Variables (11 Total)

#### Google Cloud (4 variables)
- [ ] `VITE_GOOGLE_GEMINI_AI_API_KEY` = _______________
- [ ] `VITE_GOOGLE_PLACE_API_KEY` = _______________
- [ ] `VITE_GOOGLE_MAPS_API_KEY` = _______________
- [ ] `VITE_GOOGLE_AUTH_CLIENT_ID` = _______________

#### Firebase (7 variables)
- [ ] `VITE_FIREBASE_API_KEY` = _______________
- [ ] `VITE_FIREBASE_AUTH_DOMAIN` = _______________
- [ ] `VITE_FIREBASE_PROJECT_ID` = _______________
- [ ] `VITE_FIREBASE_STORAGE_BUCKET` = _______________
- [ ] `VITE_FIREBASE_MESSAGING_SENDER_ID` = _______________
- [ ] `VITE_FIREBASE_APP_ID` = _______________
- [ ] `VITE_FIREBASE_MEASUREMENT_ID` = _______________

**Each variable set to: Production ✅**

### Deploy

- [ ] Clicked "Deploy" button
- [ ] Build started (watch the logs)
- [ ] Build completed (look for ✓ checkmark)
- [ ] Deployment successful message appeared
- [ ] Got Vercel URL: `https://_________________.vercel.app`

---

## 🧪 Post-Deployment Testing

### Site Loading
- [ ] Vercel URL loads in browser
- [ ] No 404 or 500 errors
- [ ] Page loads in < 3 seconds
- [ ] Console open (F12) - no red errors

### Authentication
- [ ] "Get Started" button is clickable
- [ ] "Sign In with Google" button opens popup
- [ ] Can sign in with Google account
- [ ] Redirects to app after sign in
- [ ] Profile picture shows in header

### Trip Creation
- [ ] Location input works (autocomplete from Places API)
- [ ] Can select number of days
- [ ] Can choose budget tier
- [ ] Can select traveler type
- [ ] "Generate Plan" button is clickable

### AI Generation
- [ ] Generate Plan processes (shows loading state)
- [ ] Takes ~30 seconds to generate
- [ ] Returns trip with itinerary
- [ ] No errors in console

### Display & Features
- [ ] Trip details display correctly
- [ ] Hotels section shows recommendations
- [ ] Places to visit section shows itinerary
- [ ] Images load correctly
- [ ] Maps display location
- [ ] Can go to "My Trips" section
- [ ] Can view saved trips

### Final Checks
- [ ] No console errors (should be clean)
- [ ] No CORS errors
- [ ] All images load
- [ ] All buttons work
- [ ] Can sign out
- [ ] Can sign back in

---

## 🔐 Security Verification

### Environment Variables
- [ ] All 11 variables visible in Settings → Environment Variables
- [ ] No variables hardcoded in source code
- [ ] No variables in GitHub (checked .gitignore)
- [ ] No variables in console output

### OAuth Configuration
- [ ] Google Cloud Console has Vercel URL in authorized origins
- [ ] Google Cloud Console has Vercel URL in redirect URIs
- [ ] Firebase Console allows the Vercel domain

### Deployment Safety
- [ ] Vercel has HTTPS enabled (automatic)
- [ ] Code is from GitHub (safe source)
- [ ] No sensitive data in repository
- [ ] .env files are in .gitignore

---

## 📊 Performance Check

### Build Time
- [ ] Build completed in < 2 minutes
- [ ] Typical build: ~30-45 seconds
- [ ] If longer: Check for large dependencies

### Page Load
- [ ] Homepage loads in < 1 second
- [ ] After sign in, loads in < 2 seconds
- [ ] Trip generation: ~30 seconds (normal for AI)
- [ ] Display of results: < 1 second

### Bundle Size
- [ ] Total bundle: ~269 KB (gzipped)
- [ ] Should be acceptable for production

---

## 🔄 Redeploy Instructions

**If something goes wrong:**

1. Go to **Vercel Dashboard**
2. Select your project
3. Go to **Deployments** tab
4. Find your latest deployment
5. Click **...** (three dots)
6. Select **Redeploy**
7. Wait for new build

---

## 📱 Test on Different Devices

- [ ] Desktop/Laptop (Chrome)
- [ ] Desktop (Firefox or Safari)
- [ ] Mobile phone (landscape)
- [ ] Mobile phone (portrait)
- [ ] Tablet (if available)

---

## 📝 Document Your Deployment

### Save These Details

- [ ] Vercel Project URL: `https://_________________.vercel.app`
- [ ] Deployment Date: _______________
- [ ] Deployed Version: 1.0.0
- [ ] Environment: Production
- [ ] Status: Live ✅

### Share With Team

- [ ] Send URL to team/stakeholders
- [ ] Get feedback on functionality
- [ ] Document any issues that need fixing

---

## 🎯 After Deployment

### Day 1 (Today)
- [ ] Monitor site for errors
- [ ] Check if all features work
- [ ] Share with 2-3 test users

### Week 1
- [ ] Monitor analytics
- [ ] Fix any reported issues
- [ ] Optimize performance if needed
- [ ] Gather user feedback

### Ongoing
- [ ] Monitor Vercel dashboard weekly
- [ ] Update code and redeploy as needed
- [ ] Keep API keys secure
- [ ] Plan feature updates

---

## 🆘 Troubleshooting Quick Links

### If Build Fails:
1. Check build logs in Vercel
2. Verify all environment variables added
3. Check package.json for errors
4. Run `npm ci` locally to test

### If Site Doesn't Work After Deploy:
1. Check environment variables in Settings
2. Verify API keys are correct
3. Redeploy the project
4. Check browser console (F12) for errors

### If Sign In Doesn't Work:
1. Go to Google Cloud Console
2. Check OAuth Client ID is correct
3. Verify Vercel URL in authorized origins
4. Update .env variable if key changed

### If APIs Return Errors:
1. Check API keys are correct
2. Verify APIs are enabled in Google Cloud
3. Check API quotas haven't been exceeded
4. Ensure key restrictions allow your domain

---

## ✅ Sign-Off Checklist

- [ ] All 11 environment variables added to Vercel
- [ ] Build completed successfully
- [ ] Site is live and accessible
- [ ] All features tested and working
- [ ] No critical errors in console
- [ ] Ready to share with users

---

## 📞 Support

**Having issues?**

Check these in order:
1. [VERCEL_DEPLOYMENT.md](VERCEL_DEPLOYMENT.md) - Full troubleshooting guide
2. [ENV_SETUP.md](ENV_SETUP.md) - API key setup issues
3. Vercel Docs: https://vercel.com/docs
4. Vercel Support: https://vercel.com/support

---

## 🎉 Success!

If you've checked all boxes above, **your app is successfully deployed to Vercel!**

**Your live URL:** `https://_________________.vercel.app`

Share this with the world! 🚀

---

**Print this checklist and keep it handy during deployment!**

---

Last Updated: February 25, 2026  
Status: ✅ Ready for Vercel Deployment
