/**
  Created by JamesChang
  Date/檔案建立日期: 2020/2/1
  Time/檔案建立時間: 下午 02:53
  File Description/檔案描述:
**/
-- 20190915(收支系統)

INSERT INTO BS100  (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES  (UUID_TO_BIN(UUID()),'MS200','MS200_STATUS','收支類別(0～100:支出、100～200:收入)','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');

-- 20190405

INSERT INTO BS100  (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES  (UUID_TO_BIN(UUID()),'BS101','DICT100_STRING_TYPE','字詞屬性','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100  (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES  (UUID_TO_BIN(UUID()),'BS101','DICT100_NAME_TYPE','異體字','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
-- 20181213

INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS101','LANGUAGE_FAMILY','語系','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS101','I18_TYPE','群組類別','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
-- 20181212

INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS101','BS_COUNTRY_ZH_TW','國家代碼(繁體中文_台灣)','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS101','BS_COUNTRY_ENs','國家代碼(英文縮寫)','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS101','BS_COUNTRY_EN','國家代碼(英文)','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS103','BS_AREA','基底資料_住址_三級','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS103','BS_DOWNTN','基底資料_住址_二級','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');
INSERT INTO BS100 (UUID,SYSTYPE,PTYPE,TYPEDESC,ISSURE,NOTES,DATE_CREATED,MAN_CREATED,LAST_UPDATED,MAN_LAST_UPDATED) VALUES (UUID_TO_BIN(UUID()),'BS103','BS_COUNTY','基底資料_住址_一級','2','批次新增',CURRENT_TIMESTAMP,'FWJDBA',CURRENT_TIMESTAMP,'FWJDBA');