# Copy-C4DPreferences

This PowerShell script simplifies the migration of preferences and plugins from one major Cinema 4D release to another.

## Features
- Easily copy configuration files, preferences, and plugins between different Cinema 4D versions.
- Configurable text file for easy specification of which files and folders to migrate.

## Instructions

### Step 1: Configure Files and Folders
- Open the file `C4D-FilesToCopy.txt`.
- Add the paths of the files and folders you'd like to migrate. Each path should be listed on a new line.

### Step 2: Run the PowerShell Script
- Open Windows PowerShell.
- Navigate to the folder containing the script.
- Run the script using the following command:
  ```powershell
  .\Copy-C4DPreferences.ps1

### Step 3: Specify Source and Destination
- When prompted, enter the source and destination folder paths.
  - The **source folder** is typically where the Cinema 4D version you're migrating **from** stores its preferences.
    - Example: `C:\Users\user\AppData\Roaming\Maxon\202x.0.0_hash`
  - The **destination folder** is where the Cinema 4D version you're migrating **to** stores its preferences.
    - Example: `C:\Users\user\AppData\Roaming\Maxon\202x.5.0_hash`
