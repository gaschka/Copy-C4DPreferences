param (
    [Parameter(Mandatory=$true)]
    [string]$source_dir,

    [Parameter(Mandatory=$true)]
    [string]$destination_dir
)

# Display input parameters
Write-Output "Source Directory: $source_dir"
Write-Output "Destination Directory: $destination_dir"

# Array of paths to copy (read from file)
$paths_to_copy = Get-Content -Path (Join-Path -Path $PSScriptRoot -ChildPath "C4D-FilesToCopy.txt") -ErrorAction Stop

# Function to copy items recursively
function Copy-ItemRecursively {
    param (
        [string]$source_path,
        [string]$destination_path
    )

    if (Test-Path $source_path) {
        if ((Get-Item $source_path).PSIsContainer) {
            # Ensure the destination directory exists
            if (-not (Test-Path $destination_path)) {
                New-Item -ItemType Directory -Force -Path $destination_path | Out-Null
            }
            # Copy the entire directory
            Copy-Item -Path "$source_path\*" -Destination $destination_path -Recurse -Force
        }
        else {
            # Ensure the destination directory exists
            $destination_dir = Split-Path $destination_path -Parent
            if (-not (Test-Path $destination_dir)) {
                New-Item -ItemType Directory -Force -Path $destination_dir | Out-Null
            }
            # Copy the file
            Copy-Item -Path $source_path -Destination $destination_path -Force
        }
    }
    else {
        Write-Error "Source path does not exist: $source_path"
    }
}

# Step: Copy each hardcoded path
foreach ($path in $paths_to_copy) {
    $source_path = Join-Path -Path $source_dir -ChildPath $path
    $destination_path = Join-Path -Path $destination_dir -ChildPath $path

    Copy-ItemRecursively -source_path $source_path -destination_path $destination_path
}

Write-Output "Files and folders copied successfully."
