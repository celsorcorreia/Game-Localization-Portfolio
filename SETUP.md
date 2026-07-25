# Publishing the repository

The GitHub integration could read the empty repository but was not authorised to create its first commit. This package contains the complete initial structure.

## Windows setup

1. Extract this folder.
2. Open PowerShell inside the extracted folder.
3. Install GitHub CLI if needed:

```powershell
winget install --id GitHub.cli
```

4. Authenticate:

```powershell
gh auth login
```

5. Run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\setup-repository.ps1
```

6. In the GitHub repository, open **Settings → Pages** and select **GitHub Actions** as the source.

The site should then be available at:

```text
https://celsorcorreia.github.io/Game-Localization-Portfolio/
```
