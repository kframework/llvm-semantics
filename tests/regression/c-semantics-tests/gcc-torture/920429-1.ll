; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920429-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@j = common global i32 0, align 4
@.str = private unnamed_addr constant [3 x i8] c"ab\00", align 1

define i8* @f(i8* %p) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  %c = alloca i8, align 1
  store i8* %p, i8** %p.addr, align 8
  %0 = load i8** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 8
  %1 = load i8* %0, align 1
  store i8 %1, i8* %c, align 1
  %2 = load i8* %c, align 1
  %conv = zext i8 %2 to i32
  %and = and i32 %conv, 2
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 1, i32 0
  store i32 %cond, i32* @i, align 4
  %3 = load i8* %c, align 1
  %conv1 = zext i8 %3 to i32
  %and2 = and i32 %conv1, 7
  %add = add nsw i32 %and2, 1
  store i32 %add, i32* @j, align 4
  %4 = load i8** %p.addr, align 8
  ret i8* %4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p0 = alloca i8*, align 8
  %p1 = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8** %p0, align 8
  %0 = load i8** %p0, align 8
  %call = call i8* @f(i8* %0)
  store i8* %call, i8** %p1, align 8
  %1 = load i8** %p0, align 8
  %add.ptr = getelementptr inbounds i8* %1, i64 1
  %2 = load i8** %p1, align 8
  %cmp = icmp ne i8* %add.ptr, %2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
