# Mash OS for Windows

This project packages https://mash-os.ai.studio/ in an Electron window. It loads the live website and requires an internet connection to use; the website source is not included.

## Rebuild on Windows

1. Copy the project to the Windows machine, including `package.json`, `package-lock.json`, `src/`, and `build-windows.cmd`. The `node_modules/` and `release/` folders are generated and do not need to be copied.
2. Install [Node.js 24 LTS](https://nodejs.org/en/download/) for Windows. The installer includes npm. Open a new terminal after installation.
3. Connect to the internet. The first build downloads npm packages, Electron, and packaging tools.
4. Double-click `build-windows.cmd`, or run it from PowerShell:

   ```powershell
   cd D:\Code\mash-os-exe
   .\build-windows.cmd
   ```

The script installs the exact dependency versions recorded in `package-lock.json` with `npm ci`, then creates the portable x64 executable in `release/`. Its name includes the version from `package.json`, for example `Mash OS 1.0.0.exe`. A successful build exits without errors; run the resulting executable to check the app.

Alternatively, run the commands manually:

```powershell
npm.cmd ci
npm.cmd run dist
```

Use `npm.cmd start` to run the app during development. The `.cmd` form works when PowerShell blocks `npm.ps1` under its execution policy.

The portable executable does not install shortcuts. It is unsigned, so Windows may show a publisher warning. It uses the default Electron icon. For a new release, update the version in both `package.json` and `package-lock.json`, or use `npm.cmd version` to update them together.

`npm.cmd run dist:dir` creates an unpacked application directory. `npm.cmd run dist:installer` attempts an NSIS installer, but the installer build previously failed on the original machine when Windows could not launch an intermediate executable. The portable build avoids that step.
