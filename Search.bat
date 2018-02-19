@echo OFF
    setlocal enableextensions disabledelayedexpansion

	rem ##############Mail Source############################
    set "source=C:\Users\lemuelg\Desktop\Sort_by_Text_Filter_lem_V2\Mail_Samples\*.eml"
	rem ##############Filter Source############################
    set "txtsource=%cd%\Filters"
	rem ##############Output Location############################
    set "target=C:\Users\lemuelg\Desktop\Sort_by_Text_Filter_lem_V2\Output"
	
	rem ##############DO NOT EDIT THE BOTTOM PART############################
    set txt=
    set /P txt= %=%
    set "found="
    for /f "delims=" %%a in ('
        findstr /m /l /g:"%txtsource%\%txt%.txt" "%source%" 2^>nul 
    ') do (
        if not defined found set "found=1"
        move "%%a" "%target%"
    )

    if not defined found (
        echo Failure
    )

    pause