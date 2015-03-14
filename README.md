*******************
** EXAMPLE CURLS **
*******************

CREATE_USER
curl -X POST -d "user[email]=hao@hao.com&user[password]=password&user[password_confirmation]=password&commit=Sign up" -H "Accept: application/json" localhost:3000/api/registrations

SIGN_OUT
curl -X DELETE -H "Accept: application/json" -H "Content-Type: application/json" -H  "X-API-TOKEN: BWVSo5-N73iYGqJNCyukF4nApWtzt-8n2Q" http://localhost:3000/api/sessions

SIGN_IN
curl -X POST -d "email=anna@anna.com&password=password" http://localhost:3000/api/sessions

RFI INDEX
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: 6ntxe61YzV7NfyGS_QTEm9VJNNK2gDDP3w" http://localhost:3000/api/rfis

RFI CREATE
curl -X POST -d 'title=nawbreh' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis

RFI SHOW
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis/4

RFI UPDATE
curl -X PUT -d 'title=NewTitle' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis/4

RFI DELETE
curl -X DELETE -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis/6

CATEGORY INDEX
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis/4/categories

CATEGORY CREATE
curl -X POST -d 'text=myCategory' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/rfis/4/categories

CATEGORY SHOW
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/categories/7

CATEGORY UPDATE
curl -X PUT -d 'text=NewCategoryName' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/categories/7

CATEGORY DELETE
curl -X DELETE -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/categories/7

QUESTION INDEX
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/categories/4/questions

QUESTION CREATE
curl -X POST -d 'text=TestMe&impact=medium' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/categories/4/questions

QUESTION DELETE
curl -X DELETE -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/questions/4

QUESTION UPDATE
curl -X PUT -d 'text=NewQuestionName' -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/questions/7

QUESTION SHOW
curl -X GET -H "Accept: application/json" -H "X-API-TOKEN: yzTNUTzL5rq59Xfwz8sBhXsphcgxrDDxeg" http://localhost:3000/api/questions/6