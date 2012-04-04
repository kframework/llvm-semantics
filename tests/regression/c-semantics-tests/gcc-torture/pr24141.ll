; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24141.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4

define void @g() nounwind uwtable {
entry:
  store i32 1, i32* @i, align 4
  ret void
}

define void @f(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 0, i32* %c, align 4
  %0 = load i32* %a.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %c, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32* %c, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  br label %if.end11

if.end2:                                          ; preds = %if.end
  %2 = load i32* %c, align 4
  %cmp3 = icmp eq i32 %2, 1
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end2
  store i32 0, i32* %c, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end2
  %3 = load i32* %b.addr, align 4
  %cmp6 = icmp eq i32 %3, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end5
  store i32 1, i32* %c, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %if.end5
  %4 = load i32* %c, align 4
  %tobool9 = icmp ne i32 %4, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  call void @g()
  br label %if.end11

if.end11:                                         ; preds = %if.then1, %if.then10, %if.end8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f(i32 1, i32 0)
  %0 = load i32* @i, align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
