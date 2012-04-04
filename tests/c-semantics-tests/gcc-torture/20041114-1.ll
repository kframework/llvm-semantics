; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20041114-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4

define void @foo(i32 %var) nounwind uwtable {
entry:
  %var.addr = alloca i32, align 4
  store i32 %var, i32* %var.addr, align 4
  %0 = load i32* %var.addr, align 4
  %cmp = icmp sle i32 %0, 0
  br i1 %cmp, label %if.end, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %var.addr, align 4
  %sub = sub nsw i32 %1, 1
  %conv = zext i32 %sub to i64
  %cmp1 = icmp ult i64 %conv, 4294967295
  br i1 %cmp1, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false
  call void @link_failure()
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false, %entry
  ret void
}

define void @link_failure() nounwind uwtable {
entry:
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load volatile i32* @v, align 4
  call void @foo(i32 %0)
  ret i32 0
}

declare void @abort() noreturn nounwind
