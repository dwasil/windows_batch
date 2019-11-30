echo OFF

echo Usage:
echo generator.bat PATH START STOP
echo.
echo Example:
echo generator.bat "ou=Department,dc=example,dc=com" 100 1000
echo Will generate 900 groups Group100 - Group1000
echo and one of 900 users in each of it User100 - User1000
echo Wasil D. (2019)
echo.

SET pathto=%~1
SET start=%2
SET stop=%3

FOR /L %%c IN (%start%, 1, %stop%) DO (
	
	dsadd group cn=Group%%c,%pathto%
	dsadd user cn=User%%c,%pathto% -disabled no -memberof cn=Group%%c,%pathto%
)
