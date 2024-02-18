# Colors

A script created to learn about shell scripting in bash.

The script makes heavy use of 
[ANSI escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code#Colors) 
specifically the ones involving colors.

The script currently prints the 3/4-bit colors to standard out, followed
by the 8 bit colors.

### Required Tools:
- bash
> If you are on linux or mac, your terminal application probably uses bash by
default

Check to see if you are using the **bash** shell
```bash
echo $0
```
<br>
> If the output of the above command is "bash", you are using the bash shell

## Installation Instructions
Clone the repository to your local machine
```bash
git clone https://github.com/MrWhiskersss/color-script.git ./coloring
```
<br>

Change the current working directory to the directory the repository was cloned to
```bash
cd coloring
```
<br>

Mark the script as executable
```bash
chmod u+x colors.sh
```
<br>

> If you don't want to make the script available from any directory, and 
instead intend to simply run it from the repository directory, the following 
steps in this section can be ignored.
<br>

Install the script, making it executable for any user from any directory
```bash
sudo cp colors.sh /usr/local/bin/colors
```
<br>

Change the ownership of the executable to prevent anyone without root access 
from modifying the behavior
```bash
sudo chown root:root /usr/local/bin/colors
```
<br>

> If you install the script on your system like this and you also intend to 
modify the script code within your local cloned repository, understand that 
running "colors" and running "./colors.sh" from the command line will produce 
different results (assuming you modified colors.sh). Running "colors" from 
the command line will run the installed script located in /usr/local/bin/ 
but running "./colors.sh" will run the script in the cloned repository. 
See the usage instructions below for further clarification on how to run the 
script.
<br>

**Optionally**, after installation if you do not intend to modify the code or 
contribute to the script through github, you can remove the repository 
directory from your system
```bash
cd ../
sudo rm -r coloring
```
<br>


## Usage Instructions
Running the **local** script *from the repository directory*
```bash
./colors.sh
```
<br>

Running the **installed** script *from any directory*
```bash
colors
```
