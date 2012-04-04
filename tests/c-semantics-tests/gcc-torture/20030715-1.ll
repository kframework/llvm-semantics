; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030715-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"inetd\00", align 1
@ap_standalone = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"standalone\00", align 1
@.str2 = private unnamed_addr constant [50 x i8] c"ServerType must be either 'inetd' or 'standalone'\00", align 1

define i8* @ap_check_cmd_context(i8* %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  ret i8* null
}

define i8* @server_type(i8* %a, i8* %b, i8* %arg) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %a.addr = alloca i8*, align 8
  %b.addr = alloca i8*, align 8
  %arg.addr = alloca i8*, align 8
  %err = alloca i8*, align 8
  store i8* %a, i8** %a.addr, align 8
  store i8* %b, i8** %b.addr, align 8
  store i8* %arg, i8** %arg.addr, align 8
  %0 = load i8** %a.addr, align 8
  %call = call i8* @ap_check_cmd_context(i8* %0, i32 31)
  store i8* %call, i8** %err, align 8
  %1 = load i8** %err, align 8
  %tobool = icmp ne i8* %1, null
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8** %err, align 8
  store i8* %2, i8** %retval
  br label %return

if.end:                                           ; preds = %entry
  %3 = load i8** %arg.addr, align 8
  %call1 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.else, label %if.then3

if.then3:                                         ; preds = %if.end
  store i32 0, i32* @ap_standalone, align 4
  br label %if.end9

if.else:                                          ; preds = %if.end
  %4 = load i8** %arg.addr, align 8
  %call4 = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0))
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.else7, label %if.then6

if.then6:                                         ; preds = %if.else
  store i32 1, i32* @ap_standalone, align 4
  br label %if.end8

if.else7:                                         ; preds = %if.else
  store i8* getelementptr inbounds ([50 x i8]* @.str2, i32 0, i32 0), i8** %retval
  br label %return

if.end8:                                          ; preds = %if.then6
  br label %if.end9

if.end9:                                          ; preds = %if.end8, %if.then3
  store i8* null, i8** %retval
  br label %return

return:                                           ; preds = %if.end9, %if.else7, %if.then
  %5 = load i8** %retval
  ret i8* %5
}

declare i32 @strcmp(i8*, i8*)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i8* @server_type(i8* null, i8* null, i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0))
  ret i32 0
}
