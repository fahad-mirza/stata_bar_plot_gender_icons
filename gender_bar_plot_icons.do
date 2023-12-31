	* Install packages (One time only)
	* ssc install palettes, replace
	* ssc install colrspace, replace
	* ssc install schemepack, replace

	* Gender-wise performance of students in MCQs and CRQs (Grade 8)

	* Loading the sample dataset
	* Example generated by -dataex-. For more info, type help dataex
	clear
	input str4 type str5 gender float(score x)
	"Category 1" "Girls" 73 1
	"Category 1" "Boys"  77 3
	"Category 2" "Girls" 54 6
	"Category 2" "Boys"  45 8
	end
	
	
	* Generating variables that will contain text for gender icons
	* This requires installing fonts that are uploaded on github for ease of use
	generate markerM = "{fontface Travelcons:q}"
	generate markerF = "{fontface Travelcons:w}"

	
	* You need to execute commands from this point onwards in one go
	
	* The commands below start with generating a colorpalette (without plotting colors)
	* The RGB codes for colors are then saved in a local that are used within the twoway plot
	
	* Scatteri is an 'immediate' command in Stata and allows you to plot by providing
	* index values or manual input, whichever suits the need.
	* More information: help twoway scatteri
	
	colorpalette tableau, nograph
	twoway 	(bar score x if gender == "Girls", fcolor("`r(p14)'") lwidth(none) barwidth(1.75)) ///
			(bar score x if gender == "Boys", fcolor("`r(p10)'") lwidth(none) barwidth(1.75)) ///
			///
			(scatteri 7 1 "Girls", ms(i) mlabsize(6.2) mlabposition(0) mlabcolor(background)) ///
			(scatteri 20 1 "`=markerF[1]'", mlabsize(15) mlabposition(0) mlabcolor(background)) ///
			(scatteri 7 3 "Boys", ms(i) mlabsize(6) mlabposition(0) mlabcolor(background)) ///
			(scatteri 20 3 "`=markerM[1]'", mlabsize(15) mlabposition(0) mlabcolor(background)) ///
			(scatteri 7 6 "Girls", ms(i) mlabsize(6.2) mlabposition(0) mlabcolor(background)) ///
			(scatteri 20 6 "`=markerF[1]'", mlabsize(15) mlabposition(0) mlabcolor(background)) ///
			(scatteri 7 8 "Boys", ms(i) mlabsize(6) mlabposition(0) mlabcolor(background)) ///
			(scatteri 20 8 "`=markerM[1]'", mlabsize(15) mlabposition(0) mlabcolor(background)) ///
			///
			(scatteri -2 0 -2 4, recast(line) lcolor(gs4)) ///
			(scatteri -2 0 -3.5 0, recast(line) lcolor(gs4)) /// 
			(scatteri -2 4 -3.5 4, recast(line) lcolor(gs4)) ///
			(scatteri -6 2 "Category 1", ms(i) mlabposition(0) mlabcolor(gs4) mlabsize(4.5)) ///
			///
			(scatteri -2 5 -2 9, recast(line) lcolor(gs4)) ///
			(scatteri -2 5 -3.5 5, recast(line) lcolor(gs4)) /// 
			(scatteri -2 9 -3.5 9, recast(line) lcolor(gs4)) ///
			(scatteri -6 7 "Category 2", ms(i) mlabposition(0) mlabcolor(gs4) mlabsize(4.5)) ///			
			///
			(scatteri 67 1 "{bf}`=score[1]'%", ms(i) mlabposition(0) mlabsize(8) mlabcolor(background)) ///
			(scatteri 71 3 "{bf}`=score[2]'%", ms(i) mlabposition(0) mlabsize(8) mlabcolor(background)) ///
			(scatteri 48 6 "{bf}`=score[3]'%", ms(i) mlabposition(0) mlabsize(8) mlabcolor(background)) ///
			(scatteri 39 8 "{bf}`=score[4]'%", ms(i) mlabposition(0) mlabsize(8) mlabcolor(background)) ///
			, ///
			///
			yscale(noline range(0 80)) ///
			ylabel(none, nogrid noticks) ///
			xscale(noline off) ///
			xlabel(none, valuelabel nogrid noticks) ///
			legend(off) ///
			title("{bf}Use of Icons in bar graphs (Stata)", pos(11) size(3.5)) ///
			scheme(white_tableau)
			
			
	* Exporting the plot in PNG format and large resolution
	graph export "./gender_bar_plot_icons.png", as(png) width(3840) replace
	
	
