# Making G-Code toolpaths with mods

![mods-pcb](https://github.com/fellesverkstedet/fabricatable-machines/blob/master/hank-medium-format-cnc/img/mods-pcb.png)

* Open the HTML file
* Press **select select png** to load at black and white png image of your circuit *(.png files must be 1269.644DPI for correct Z depth)*
* Press **calculate** in the next window to generate a toolpath
* The g-code will automatically be downloaded to your default browser downloads location
* Use replicapes ocotprint web interface to load and start the g-code

### Recommended EAGLE settings for a ø0.4mm milling bit
* Export layer 1 traces as a monochrome image in 1269 dpi (decimal does not work). 
* Use minimum clearance 18mil (0.4572 mm) to account for rounding errors due to dpi.  

### Notes

* Works best in Chrome
* You can also use mods.cba.mit.edu and load the .txt config file there
* Mods enables you to make custom programs easily in the browser

### Bugs

* .png files must be 1269.644DPI for correct Z dept
* The page in Chrome often needs to be reloaded before opening a program
