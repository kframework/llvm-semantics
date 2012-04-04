; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030920-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"\7F\FF\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %hicount = alloca i32, align 4
  %c = alloca i8*, align 8
  %str = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %hicount, align 4
  store i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8** %str, align 8
  %0 = load i8** %str, align 8
  store i8* %0, i8** %c, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i8** %c, align 8
  %2 = load i8* %1, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i8** %c, align 8
  %4 = load i8* %3, align 1
  %conv = zext i8 %4 to i32
  %cmp = icmp ult i32 %conv, 128
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %for.body
  %5 = load i32* %hicount, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %hicount, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i8** %c, align 8
  %incdec.ptr = getelementptr inbounds i8* %6, i32 1
  store i8* %incdec.ptr, i8** %c, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i32* %hicount, align 4
  %cmp2 = icmp ne i32 %7, 1
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind
