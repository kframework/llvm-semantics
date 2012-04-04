; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000910-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@list = global [2 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)], align 16

define i32 @main() nounwind uwtable {
entry:
  call void @foo()
  ret i32 0
}

define internal void @foo() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %fmt = alloca i8*, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %conv = sext i32 %0 to i64
  %cmp = icmp ult i64 %conv, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [2 x i8*]* @list, i32 0, i64 %idxprom
  %2 = load i8** %arrayidx, align 8
  store i8* %2, i8** %fmt, align 8
  %3 = load i8** %fmt, align 8
  %call = call i32 @bar(i8* %3)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.inc

if.end:                                           ; preds = %for.body
  %4 = load i32* %i, align 4
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.then
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define internal i32 @bar(i8* %fmt) nounwind uwtable {
entry:
  %fmt.addr = alloca i8*, align 8
  store i8* %fmt, i8** %fmt.addr, align 8
  %0 = load i8** %fmt.addr, align 8
  %call = call i8* @strchr(i8* %0, i32 42) nounwind readonly
  %cmp = icmp ne i8* %call, null
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare i8* @strchr(i8*, i32) nounwind readonly
