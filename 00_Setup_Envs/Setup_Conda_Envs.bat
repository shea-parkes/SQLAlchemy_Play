rem ### OBJECTIVE:
rem   	Automate the setup of Conda environments to ease installation pains.
rem
rem ### DEVELOPER NOTES:
rem   Uses Conda & Pip.  (Conda for pre-compiled and Pip for broader package list.)

SETLOCAL ENABLEDELAYEDEXPANSION

rem ### LIBRARIES, LOCATIONS, LITERALS, ETC. GO ABOVE HERE

call :setup_conda_env devf
goto :eof


:setup_conda_env
set i_env=%1
call conda remove --yes --all -n !i_env!
call conda create --yes -n !i_env! --file !i_env!_conda.txt
if exist !i_env!_pip.txt (
    call activate !i_env!
    pip install -r !i_env!_pip.txt
    call deactivate
)
goto :eof
