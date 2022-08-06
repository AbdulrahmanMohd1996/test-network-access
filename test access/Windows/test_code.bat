@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem // Define constants here:
set "FILE1=servers.txt"
set "FILE2=ports.txt"
set "RET=names=values.txt" & rem // (none to output to console)
if not defined RET set "RET=con"
rem /* Count number of lines of 1st file (2nd file is not checked);
rem    this is necessary to know when to stop reading: */
for /F %%C in ('^< "%FILE1%" find /C /V ""') do set "NUM1=%%C"
rem /* Here input redirection is used, each file gets its individual
rem    (undefined) handle (that is not used by the system) which is later
rem    redirected to handle `0`, `STDIN`, in the parenthesised block;
rem    so the 1st file data stream is redirected to handle `4` and the
rem    2nd file to handle `3`; within the block, as soon as a line is read
rem    by `set /P` from a data stream, the respective handle is redirected
rem    back to `0`, `STDIN`, where `set /P` expects its input data: */
4< "%FILE1%" 3< "%FILE2%" > "%RET%" (
     rem // Loop through the number of lines of the 1st file:
     for /L %%I in (1,1,%NUM1%) do (
         set "LINE1=" & rem /* (clear variable to maintain empty lines;
                        rem     `set /P` does not change variable value
                        rem     in case nothing is entered/redirected) */
         rem // Change handle of 1st file back to `STDIN` and read line:
         0<&4 set /P "LINE1="
         set "LINE2=" & rem // (clear variable to maintain empty lines)
         rem // Change handle of 2nd file back to `STDIN` and read line:
         0<&3 set /P "LINE2="
         rem /* Return combined pair of lines (only if line of 2nd file is
         rem    not empty as `set /P` sets `ErrorLevel` on empty input): */
         if not ErrorLevel 1 echo(!LINE1!=!LINE2!
     )
)
endlocal
exit /B