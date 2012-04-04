; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"bc\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"de\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@a = global [16 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null, i8* null], align 16
@.str4 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1

define i32 @foo(i8* %x, i8* %y, i64 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8*, align 8
  %n.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  store i8* %x, i8** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i64 %n, i64* %n.addr, align 8
  store i64 0, i64* %j, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64* %i, align 8
  %1 = load i64* %n.addr, align 8
  %cmp = icmp ult i64 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8** %x.addr, align 8
  %3 = load i64* %j, align 8
  %add.ptr = getelementptr inbounds i8* %2, i64 %3
  %4 = load i64* %i, align 8
  %arrayidx = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %4
  %5 = load i8** %arrayidx, align 8
  %6 = load i64* %i, align 8
  %arrayidx1 = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %6
  %7 = load i8** %arrayidx1, align 8
  %call = call i64 @strlen(i8* %7)
  %call2 = call i32 @strncmp(i8* %add.ptr, i8* %5, i64 %call)
  %cmp3 = icmp ne i32 %call2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 2, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  %8 = load i64* %i, align 8
  %arrayidx4 = getelementptr inbounds [16 x i8*]* @a, i32 0, i64 %8
  %9 = load i8** %arrayidx4, align 8
  %call5 = call i64 @strlen(i8* %9)
  %10 = load i64* %j, align 8
  %add = add i64 %10, %call5
  store i64 %add, i64* %j, align 8
  %11 = load i8** %y.addr, align 8
  %tobool = icmp ne i8* %11, null
  br i1 %tobool, label %if.then6, label %if.end9

if.then6:                                         ; preds = %if.end
  %12 = load i8** %y.addr, align 8
  %call7 = call i64 @strlen(i8* %12)
  %13 = load i64* %j, align 8
  %add8 = add i64 %13, %call7
  store i64 %add8, i64* %j, align 8
  br label %if.end9

if.end9:                                          ; preds = %if.then6, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %14 = load i64* %i, align 8
  %inc = add i64 %14, 1
  store i64 %inc, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %15 = load i32* %retval
  ret i32 %15
}

declare i32 @strncmp(i8*, i8*, i64)

declare i64 @strlen(i8*)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i8* null, i64 3)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
