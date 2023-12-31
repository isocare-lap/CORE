$PBExportHeader$misservice.sra
$PBExportComments$Generated Application Object
forward
global type misservice from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type misservice from application
string appname = "misservice"
boolean toolbartips = false
boolean toolbarusercontrol = false
string displayname = "MisService"
end type
global misservice misservice

on misservice.create
appname="misservice"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on misservice.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

