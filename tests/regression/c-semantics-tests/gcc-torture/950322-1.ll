; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950322-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i8* %a) nounwind uwtable {
entry:
  %a.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i8* %a, i8** %a.addr, align 8
  %0 = load i8** %a.addr, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 1
  %1 = load i8* %arrayidx, align 1
  %conv = zext i8 %1 to i32
  store i32 %conv, i32* %j, align 4
  %2 = load i8** %a.addr, align 8
  %arrayidx1 = getelementptr inbounds i8* %2, i64 0
  %3 = load i8* %arrayidx1, align 1
  %conv2 = zext i8 %3 to i32
  %4 = load i32* %j, align 4
  %sub = sub nsw i32 %conv2, %4
  store i32 %sub, i32* %i, align 4
  %5 = load i32* %i, align 4
  %cmp = icmp slt i32 %5, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %x, align 4
  %6 = load i32* %i, align 4
  %sub4 = sub nsw i32 0, %6
  store i32 %sub4, i32* %y, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 0, i32* %x, align 4
  %7 = load i32* %i, align 4
  store i32 %7, i32* %y, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32* %x, align 4
  %9 = load i32* %y, align 4
  %add = add nsw i32 %8, %9
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca [2 x i8], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [2 x i8]* %a, i32 0, i64 0
  store i8 8, i8* %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds [2 x i8]* %a, i32 0, i64 1
  store i8 9, i8* %arrayidx1, align 1
  %arraydecay = getelementptr inbounds [2 x i8]* %a, i32 0, i32 0
  %call = call i32 @f(i8* %arraydecay)
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
