$PBExportHeader$financeservice.sra
$PBExportComments$Generated Application Object
forward
global type financeservice from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type financeservice from application
string appname = "financeservice"
end type
global financeservice financeservice

on financeservice.create
appname = "financeservice"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on financeservice.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

