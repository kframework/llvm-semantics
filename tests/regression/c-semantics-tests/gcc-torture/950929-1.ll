; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950929-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i8* %p) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  store i8* %p, i8** %p.addr, align 8
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i8, align 1
  %c2 = alloca i8, align 1
  %i = alloca i32, align 4
  %pc = alloca i8*, align 8
  %pc2 = alloca i8*, align 8
  %pi = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  store i8* %c, i8** %pc, align 8
  store i8* %c2, i8** %pc2, align 8
  store i32* %i, i32** %pi, align 8
  %0 = load i8** %pc2, align 8
  store i8 1, i8* %0, align 1
  %1 = load i32** %pi, align 8
  store i32 1, i32* %1, align 4
  %2 = load i32** %pi, align 8
  %3 = load i32* %2, align 4
  %4 = load i8** %pc2, align 8
  %5 = load i8* %4, align 1
  %conv = sext i8 %5 to i32
  %and = and i32 %conv, %3
  %conv1 = trunc i32 %and to i8
  store i8 %conv1, i8* %4, align 1
  %6 = load i8** %pc2, align 8
  %call = call i32 @f(i8* %6)
  %7 = load i8** %pc2, align 8
  store i8 1, i8* %7, align 1
  %8 = load i32** %pi, align 8
  %9 = load i32* %8, align 4
  %10 = load i8** %pc2, align 8
  %11 = load i8* %10, align 1
  %conv2 = sext i8 %11 to i32
  %and3 = and i32 %conv2, %9
  %conv4 = trunc i32 %and3 to i8
  store i8 %conv4, i8* %10, align 1
  %12 = load i8** %pc2, align 8
  %13 = load i8* %12, align 1
  %conv5 = sext i8 %13 to i32
  %cmp = icmp ne i32 %conv5, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %14 = load i32* %retval
  ret i32 %14
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
