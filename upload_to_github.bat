@echo off
echo ========================================
echo Upload to GitHub for Cloud Build
echo ========================================
echo.

echo This script will help you upload your project to GitHub
echo so you can use cloud build services to create .ipa file
echo.

set /p github_username="Enter your GitHub username: "
set /p repo_name="Enter repository name (e.g., ecommerce-app): "

echo.
echo Initializing Git repository...
git init

echo.
echo Adding files to Git...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: E-Commerce Flutter App"

echo.
echo Setting up remote repository...
git branch -M main
git remote add origin https://github.com/%github_username%/%repo_name%.git

echo.
echo Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo Upload Complete!
echo ========================================
echo.
echo Your project is now available at:
echo https://github.com/%github_username%/%repo_name%
echo.
echo Next Steps:
echo 1. Go to https://codemagic.io
echo 2. Sign up with GitHub account
echo 3. Connect your repository
echo 4. Start build to get .ipa file
echo.
echo OR
echo.
echo 1. Go to your GitHub repository
echo 2. Click Actions tab
echo 3. The iOS build will start automatically
echo 4. Download .ipa from Actions artifacts
echo.

pause
