; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991227-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"\00wrong\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"\00right\0A\00", align 1

define i8* @doit(i32 %flag) nounwind uwtable {
entry:
  %flag.addr = alloca i32, align 4
  store i32 %flag, i32* %flag.addr, align 4
  %0 = load i32* %flag.addr, align 4
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0)
  %add.ptr = getelementptr inbounds i8* %cond, i64 1
  ret i8* %add.ptr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %result = alloca i8*, align 8
  store i32 0, i32* %retval
  %call = call i8* @doit(i32 0)
  store i8* %call, i8** %result, align 8
  %0 = load i8** %result, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 114
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8** %result, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 1
  %3 = load i8* %arrayidx, align 1
  %conv2 = sext i8 %3 to i32
  %cmp3 = icmp eq i32 %conv2, 105
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
