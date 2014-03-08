# Step 1: Install Posh-Git
Go ahead and follow the instructions here: https://github.com/dahlbyk/posh-git

# Step 2: Overwrite Your Profile
In your *~\Documents\WindowsPowerShell* folder you will find a file, probably called *Microsoft.PowerShell_profile.ps1*.  Replace the file contents with the *Microsoft.PowerShell_profile.ps1" from this repository.

# Step 3: Create Other Scripts (optional)
If you want, this profile will also now load files automatically from *~\Documents\WindowsPowerShell\Scripts*, so create that directory and put any other ps1's you like in there!

# Extra Scripts
I will periodically update the scripts that I use within the *Scripts* folder on this repository.  Currently I have:

- *Scripts\Remove-Service.ps1* - Shortens calling (gwmi win32_service -filter "name='Service'").delete() and provides simple error catch for non-existent services.