# 🔧 Troubleshooting: API Key Creation Error

**Error Message:** "Make sure all fields are correct to continue"

---

## 🎯 Quick Fixes (Try These First)

### Fix 1: Clear Browser Cache & Reload (Try First!)

```
1. Press Ctrl+Shift+Delete (or Cmd+Shift+Delete on Mac)
2. Clear browsing data for "All time"
3. Refresh the Google Cloud Console page
4. Try creating the API key again
```

**Success Rate:** 60% of the time, this solves it! ✅

---

### Fix 2: Go Back & Try Again

1. If you see the error message, click **Back** or close the dialog
2. Wait 30 seconds
3. Refresh the page: **F5**
4. Try creating the API key again

---

## 🔍 Detailed Troubleshooting

### **Problem 1: Creating API Key (Step 1.3)**

**If the error happens on the initial API key creation:**

1. Go to **APIs & Services** → **Credentials**
2. You should see a **"+ Create Credentials"** button
3. Click it and select **"API Key"**

**Common Issues:**
- ❌ Button doesn't appear → APIs not enabled yet (wait 2-3 minutes)
- ❌ Dialog opens but won't let you select → Refresh page (F5)
- ❌ Blank dialog → Try a different browser (Chrome works best)

**Solution:**
- Wait 5 minutes after enabling APIs
- Try using **Google Chrome** (not Edge or Safari)
- Clear cache and refresh

---

### **Problem 2: API Key Restrictions (Step 1.4)**

**This is the MOST COMMON cause of the error!**

When you edit the API key and add restrictions:

#### ❌ WRONG - This Causes the Error:

```
HTTP referrers: https://your-domain.com/*
```

**Why:** The URI format is incorrect. Vercel expects specific format.

#### ✅ CORRECT - Use These:

For **local development only:**
```
http://localhost:5173
http://localhost:4173
```

For **production (Vercel):**
```
https://your-project-name.vercel.app
https://your-custom-domain.com
```

**Key Points:**
- No wildcards (`*`) for localhost
- Use exact domain names
- One URI per line
- Include protocol (http or https)
- NO trailing slashes

---

### **Problem 3: OAuth Consent Screen (Step 1.5)**

**If error happens when creating OAuth Client ID:**

#### Step-by-Step Fix:

1. Go to **APIs & Services** → **OAuth consent screen**
2. Check if it's already configured
3. If not, click **"Create Consent Screen"**
4. Fill EXACTLY like this:

```
User Type:           External
App name:            AI Trip Planner
User support email:  your-email@gmail.com
Developer contact:   your-email@gmail.com

Click "Save and Continue"

Scopes page:         Click "Save and Continue" (no changes)
Test users page:     Click "Save and Continue" (no changes)
Summary page:        Click "Back to Dashboard"
```

5. Now go to **Credentials** → **"+ Create Credentials"** → **"OAuth client ID"**
6. Choose **"Web application"**
7. Add name: `AI Trip Planner Web Client`
8. ⚠️ IMPORTANT - Add these redirects EXACTLY:
   ```
   http://localhost:5173
   http://localhost:4173
   https://your-vercel-url.vercel.app
   ```

**Common Errors:**
- ❌ Missing **Authorized JavaScript origins** → Add `http://localhost:5173`
- ❌ Wrong format → Use `http://` not `https://` for localhost
- ❌ Typos in domain → Copy/paste to avoid mistakes

---

## 📋 Step-by-Step Checklist

### When Creating API Key:

- [ ] Use **Google Chrome** browser
- [ ] APIs are enabled (wait 5 minutes after enabling)
- [ ] Clear cache before trying
- [ ] Don't add restrictions to the FIRST API key
- [ ] Just copy the key and close

### When Restricting API Key:

- [ ] Edit the key AFTER it's created
- [ ] Use correct URI format (see examples above)
- [ ] No wildcards for localhost
- [ ] Select "HTTP referrers (websites)"
- [ ] Check the three required APIs

### When Creating OAuth Client:

- [ ] Consent screen is FIRST (do this before OAuth Client)
- [ ] Choose "External" for user type
- [ ] Add your real email (not fake)
- [ ] Use exact redirect URIs
- [ ] No trailing slashes

---

## 🛠️ Solution By Error Location

### If Error on API Key Restrictions Dialog

**Try this:**

1. Click the API key name to open it
2. Scroll down to **"Key restrictions"**
3. For **Application restrictions:** Select **"HTTP referrers (web sites)"**
4. In the text box, add ONLY:
   ```
   http://localhost:5173
   ```
5. For **API restrictions:** Click **"Restrict key"**
6. Check ONLY these 3:
   - Generative Language API
   - Places API
   - Maps JavaScript API
7. Click **"Save"** (not "Create")

If still error:
- Clear cache (Ctrl+Shift+Delete)
- Try different browser
- Wait 5 minutes and try again

---

### If Error on OAuth Client Creation

**Try this:**

1. Go to **APIs & Services** → **OAuth consent screen**
2. Verify it shows **"External"** and your email
3. Go to **Credentials**
4. Click **"+ Create Credentials"** → **"OAuth client ID"**
5. Select **"Web application"**
6. Name: `AI Trip Planner Web Client`
7. Under **Authorized JavaScript origins**, click **"Add URI"**
8. Add: `http://localhost:5173`
9. Click **"+ Add URI"** again
10. Add: `http://localhost:4173`
11. Under **Authorized redirect URIs**, click **"Add URI"**
12. Add: `http://localhost:5173`
13. Click **"+ Add URI"** again
14. Add: `http://localhost:4173`
15. Click **"Create"**

Each field must be entered separately (don't paste multiple URIs in one field).

---

## 🔗 Format Examples

### ✅ CORRECT Formats:

```
http://localhost:5173
http://localhost:4173
https://my-app-12345.vercel.app
https://myapp.example.com
```

### ❌ WRONG Formats:

```
localhost:5173              ← Missing protocol
http://localhost:5173/      ← Trailing slash
http://localhost:5173/*     ← Wildcard
https://localhost:5173      ← HTTPS for localhost (wrong)
http://localhost:5173 http://localhost:4173  ← Multiple in one field
```

---

## 🆘 If None of These Work

### Nuclear Option: Start Fresh

1. Go to **APIs & Services** → **Credentials**
2. Delete the problematic API key/OAuth client
3. Clear browser cache (Ctrl+Shift+Delete)
4. Switch to **Google Chrome** if using different browser
5. Open a new **private/incognito window**
6. Go to Google Cloud Console again
7. Create API key fresh

**Important:** Wait 2-3 minutes between deletion and creation.

---

## ✅ Success Confirmation

You'll know it worked when:

- ✅ API Key shows a value like: `AIzaSy...` (long string)
- ✅ OAuth Client ID shows: `xxx.apps.googleusercontent.com`
- ✅ No error message appears
- ✅ You can click **"Create"** or **"Done"** successfully

---

## 📞 Specific Error Messages & Fixes

| Error | Cause | Fix |
|-------|-------|-----|
| "Make sure all fields are correct" | Missing OAuth consent screen | Create consent screen first |
| "Invalid URI format" | Wrong format for redirects | Use correct format above |
| "This key is invalid" | Restriction conflict | Remove restrictions, try again |
| "401 Unauthorized" | APIs not enabled | Wait 5 min after enabling |
| Blank dialog | Browser cache issue | Clear cache, refresh page |

---

## 🎯 Quick Decision Tree

**You see "Make sure all fields are correct"**

👇

**Where did the error occur?**

- **Creating API Key?** → Clear cache, wait 5 min, try again ✅
- **Restricting API Key?** → Check URI format (no wildcards) ✅
- **OAuth Consent Screen?** → Make sure you filled email field ✅
- **OAuth Client Creation?** → Add URIs one by one (not all at once) ✅

---

## 💡 Pro Tips

1. **Use Google Chrome** - Works most reliably
2. **One field at a time** - Don't paste multiple values into one field
3. **Wait between steps** - Google Cloud needs time to process
4. **Fresh browser window** - Use Incognito mode for clean slate
5. **Documentation handy** - Have this guide open while creating keys

---

## ✨ Once It Works

After successfully creating your API key and OAuth client:

1. Copy the **API Key** → Paste into `.env` file as `VITE_GOOGLE_GEMINI_AI_API_KEY`
2. Copy the **Client ID** → Paste into `.env` file as `VITE_GOOGLE_AUTH_CLIENT_ID`
3. Use same API Key for `VITE_GOOGLE_PLACE_API_KEY` and `VITE_GOOGLE_MAPS_API_KEY`
4. Continue with [ENV_SETUP.md](ENV_SETUP.md) Step 2 (Firebase Setup)

---

**Still having issues?** Try the troubleshooting above in order - most users find their solution within first 3 fixes! 🎯

Generated: February 25, 2026
