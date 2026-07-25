$ErrorActionPreference = "Stop"

$RepoUrl = "https://github.com/celsorcorreia/Game-Localization-Portfolio.git"
$Branch = "main"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git is not installed. Install Git for Windows first."
}

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI is not installed. Install it with: winget install --id GitHub.cli"
}

gh auth status

if (-not (Test-Path ".git")) {
    git init
    git branch -M $Branch
    git remote add origin $RepoUrl
}

git add .
git commit -m "Initialize game localization portfolio"
git push -u origin $Branch

Write-Host "Repository published successfully." -ForegroundColor Green
Write-Host "Now open GitHub: Settings > Pages > Source > GitHub Actions." -ForegroundColor Yellow
