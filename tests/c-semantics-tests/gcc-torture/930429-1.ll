; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930429-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define i8* @f(i8* %p) nounwind uwtable {
entry:
  %p.addr = alloca i8*, align 8
  %x = alloca i16, align 2
  store i8* %p, i8** %p.addr, align 8
  %0 = load i8** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i8* %0, i32 1
  store i8* %incdec.ptr, i8** %p.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %shl = shl i32 %conv, 16
  %conv1 = trunc i32 %shl to i16
  store i16 %conv1, i16* %x, align 2
  %2 = load i8** %p.addr, align 8
  ret i8* %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([1 x i8]* @.str, i32 0, i32 0), i8** %p, align 8
  %0 = load i8** %p, align 8
  %call = call i8* @f(i8* %0)
  %1 = load i8** %p, align 8
  %add.ptr = getelementptr inbounds i8* %1, i64 1
  %cmp = icmp ne i8* %call, %add.ptr
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
