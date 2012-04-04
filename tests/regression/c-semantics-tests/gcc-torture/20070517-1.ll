; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070517-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @example(i32 10)
  ret i32 0
}

define internal void @example(i32 %arg) nounwind uwtable {
entry:
  %arg.addr = alloca i32, align 4
  %tmp = alloca i32, align 4
  %kind = alloca i32, align 4
  store i32 %arg, i32* %arg.addr, align 4
  %0 = load i32* %arg.addr, align 4
  %call = call i32 @get_kind(i32 %0)
  store i32 %call, i32* %kind, align 4
  %1 = load i32* %kind, align 4
  %cmp = icmp eq i32 %1, 9
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %kind, align 4
  %cmp2 = icmp eq i32 %2, 10
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %3 = load i32* %kind, align 4
  %cmp4 = icmp eq i32 %3, 5
  br i1 %cmp4, label %if.then, label %if.end13

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  %call5 = call i32 @some_call()
  %cmp6 = icmp eq i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end12

if.then7:                                         ; preds = %if.then
  %4 = load i32* %kind, align 4
  %cmp8 = icmp eq i32 %4, 9
  br i1 %cmp8, label %if.then11, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %if.then7
  %5 = load i32* %kind, align 4
  %cmp10 = icmp eq i32 %5, 10
  br i1 %cmp10, label %if.then11, label %if.else

if.then11:                                        ; preds = %lor.lhs.false9, %if.then7
  %6 = load i32* %arg.addr, align 4
  store i32 %6, i32* %tmp, align 4
  br label %if.end

if.else:                                          ; preds = %lor.lhs.false9
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then11
  br label %if.end12

if.end12:                                         ; preds = %if.end, %if.then
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %lor.lhs.false3
  ret void
}

define internal i32 @get_kind(i32 %v) nounwind uwtable noinline {
entry:
  %v.addr = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %v, i32* %v.addr, align 4
  %0 = load i32* %v.addr, align 4
  store volatile i32 %0, i32* %k, align 4
  %1 = load volatile i32* %k, align 4
  ret i32 %1
}

define internal i32 @some_call() nounwind uwtable noinline {
entry:
  ret i32 0
}

declare void @abort() noreturn nounwind
