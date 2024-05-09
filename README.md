# Binary Blip

Binary Blip is a playful and educational project that demonstrates various batch file operations.

# Appearance

Creates a random string of variable length (between 10 and 310 characters) using uppercase letters, lowercase letters, and numbers.

## Unkillabilty

To protect its execution it uses a vbscript.

### Bath-file
During the main loop it cecks if:
- **Check Copy and itself:**
   - makes and cecks if exists the copy of him self in the directory `C:\Users\%USERNAME%\AppData\Local\%~nx0`;
- **Check Copy and VBS File:**
   - verifies if the batch file is still present in the `C:\Users\%USERNAME%\AppData\Local\` directory;
   - also checks if the `hidden.vbs` file exists. If not, it's recreated.
- **Check if `hidden.vbs` is runnig:
   - if not restart `hidden.vbs.`
  
### Vbscipt
During the main loop it cecks if:

- **The original bath-file exists**:
   - if not use the copy in `C:\Users\%USERNAME%\AppData\Local`
- **The original bath-file is runnig**:
   - if not executes the batch file.

## Execution
Run the batch file (only on windows).

**Notes:**
- This project is for educational and entertainment purposes only.
- The creator assumes no responsibility for any consequences resulting from the use of this code.

For more details, please refer to the project's license.
