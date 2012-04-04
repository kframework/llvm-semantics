; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000121-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define void @big(i64 %u) nounwind uwtable {
entry:
  %u.addr = alloca i64, align 8
  store i64 %u, i64* %u.addr, align 8
  ret void
}

define void @doit(i32 %a, i32 %b, i8* %id) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %id.addr = alloca i8*, align 8
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i8* %id, i8** %id.addr, align 8
  %0 = load i8** %id.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i64
  call void @big(i64 %conv)
  %2 = load i32* %a.addr, align 4
  %conv1 = zext i32 %2 to i64
  call void @big(i64 %conv1)
  %3 = load i32* %b.addr, align 4
  %conv2 = zext i32 %3 to i64
  call void @big(i64 %conv2)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @doit(i32 1, i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  ret i32 0
}
