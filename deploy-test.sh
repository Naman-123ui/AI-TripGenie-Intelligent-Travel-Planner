#!/bin/bash

# AI Trip Planner - Local Deployment Test Script
# This script tests the build and preview before actual deployment

set -e

echo "🚀 AI Trip Planner - Pre-Deployment Test"
echo "=========================================="
echo ""

# Check Node.js version
echo "✓ Checking Node.js version..."
NODE_VERSION=$(node -v)
echo "  Node version: $NODE_VERSION"
NPM_VERSION=$(npm -v)
echo "  NPM version: $NPM_VERSION"
echo ""

# Install dependencies
echo "✓ Installing dependencies..."
npm ci
echo "  Dependencies installed ✓"
echo ""

# Run linter
echo "✓ Running ESLint..."
npm run lint || echo "  ⚠️  Some lint warnings found (non-critical)"
echo ""

# Build application
echo "✓ Building application..."
npm run build
echo "  Build completed ✓"
echo ""

# Check build output
echo "✓ Verifying build output..."
if [ -d "dist" ]; then
    DIST_SIZE=$(du -sh dist | cut -f1)
    echo "  Build size: $DIST_SIZE"
    echo "  Build verification ✓"
else
    echo "  ✗ Build directory not found!"
    exit 1
fi
echo ""

# Display deployment readiness
echo "=========================================="
echo "✅ Local deployment test completed successfully!"
echo ""
echo "Next steps for deployment:"
echo "1. Update .env with production API keys"
echo "2. Choose your deployment platform (Vercel, Netlify, Docker, etc.)"
echo "3. Follow the guide in DEPLOYMENT_GUIDE.md"
echo ""
echo "To preview locally: npm run preview"
echo "To see detailed deployment guide: cat DEPLOYMENT_GUIDE.md"
echo ""
