CREATE OR REPLACE PROCEDURE SP_LOGIN
(
  dd_error OUT VARCHAR2,
  usern IN AOD_USER_PROFILE.USER_NAME%TYPE,
  passw IN AOD_USER_PROFILE.PASSWORD%TYPE,
)
IS 
BEGIN 
 DECLARE
	usid AOD_USER_PROFILE.USER_ID%TYPE;
	no_user_found EXCEPTION;
	incorrect_password EXCEPTION;
	d_err NUMBER(1);
 BEGIN
 d_err = TEST_USER_INPUT(usern, passw);
 CASE d_err 
	WHEN 1 THEN RAISE no_user_found;
	WHEN 2 THEN RAISE incorrect_password;
	ELSE RETURN;
 END CASE;
 EXCEPTION
  WHEN no_user_found THEN
    dd_error := 'Unfortunatelly, a particular user is not found! Please, try again...';
  WHEN incorrect_password THEN
    dd_error := 'Unfortunatelly, the password is not correct! Please, try again...';
 END;
END SP_LOGIN;