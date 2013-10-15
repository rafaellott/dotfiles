dotfiles
========

Airline  
* In order to install the font do the following
	1. Download the [powerline-fonts](https://github.com/Lokaltog/powerline-fonts) that have been patched to have the fancy powerline symbols.
	2. In the downloaded fonts, find the font that you use for your terminal and copy over those fonts to *~/.fonts*
	3. Install the fonts using: `fc-cache -vf ~/.fonts`
	4. Once installed, configure your terminal to use these fonts.
	5. Enable fancy symbols by adding this line to your vimrc: `let g:airline_powerline_fonts=1`
