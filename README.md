# Binary Blip

Binary Blip is a playful and educational project that demonstrates various batch file operations. It includes the following features:

1. **Self-Copy:**
   - Upon execution, the batch file creates a copy of itself in the directory `C:\Users\%USERNAME%\AppData\Local\%~nx0`.

2. **Get wmic.exe Process PID:**
   - Utilizes WMI to obtain the PID of the `wmic.exe` process with a specific command line.
   - This PID is used later in the script.

3. **Create a Hidden VBS File:**
   - Generates a `hidden.vbs` file containing a VBS script.
   - The script checks if the `wmic.exe` process is still running. If not, it recopies and executes the batch file.

4. **Generate a Random String:**
   - Creates a random string of variable length (between 10 and 310 characters) using uppercase letters, lowercase letters, and numbers.

5. **Check Copy and VBS File:**
   - Verifies if the batch file is still present in the `C:\Users\%USERNAME%\AppData\Local\` directory.
   - Also checks if the `hidden.vbs` file exists. If not, it's recreated.

## Execution
Run the batch file (only on windows).

**Notes:**
- This project is for educational and entertainment purposes only.
- The creator assumes no responsibility for any consequences resulting from the use of this code.

For more details, please refer to the project's license.
