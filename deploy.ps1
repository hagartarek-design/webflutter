# =====================================================
# Flutter Web Build + Firebase Hosting Deploy Script
# =====================================================

# 1️⃣ Cleanup old build
Write-Host "Cleaning previous build..." -ForegroundColor Cyan
flutter clean

# 2️⃣ Get dependencies
Write-Host "Fetching dependencies..." -ForegroundColor Cyan
flutter pub get

# 3️⃣ Build Flutter Web
Write-Host "Building Flutter Web..." -ForegroundColor Cyan
flutter build web

# 4️⃣ Deploy to Firebase Hosting
Write-Host "Deploying to Firebase Hosting..." -ForegroundColor Cyan
firebase deploy --only hosting

# 5️⃣ Print success message
Write-Host "✅ Deployment complete!" -ForegroundColor Green
Write-Host "Your project should now be live at:" -ForegroundColor Green
Write-Host "https://student-51d79.web.app" -ForegroundColor Yellow
