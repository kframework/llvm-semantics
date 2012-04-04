; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030401-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @bar() nounwind uwtable {
entry:
  ret i32 1
}

define void @foo(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %error = alloca i8, align 1
  store i32 %x, i32* %x.addr, align 4
  store i8 0, i8* %error, align 1
  %0 = load i32* %x.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %call = call i32 @bar()
  %tobool = icmp ne i32 %call, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %1 = phi i1 [ true, %entry ], [ %tobool, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  %conv = trunc i32 %lor.ext to i8
  store i8 %conv, i8* %error, align 1
  %tobool1 = icmp ne i8 %conv, 0
  br i1 %tobool1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.end
  %call2 = call i32 @bar()
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.end
  %2 = load i8* %error, align 1
  %tobool3 = icmp ne i8 %2, 0
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i32 1)
  ret i32 0
}
