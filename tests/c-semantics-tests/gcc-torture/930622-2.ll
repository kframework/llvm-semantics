; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930622-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define x86_fp80 @ll_to_ld(i64 %n) nounwind uwtable {
entry:
  %n.addr = alloca i64, align 8
  store i64 %n, i64* %n.addr, align 8
  %0 = load i64* %n.addr, align 8
  %conv = sitofp i64 %0 to x86_fp80
  ret x86_fp80 %conv
}

define i64 @ld_to_ll(x86_fp80 %n) nounwind uwtable {
entry:
  %n.addr = alloca x86_fp80, align 16
  store x86_fp80 %n, x86_fp80* %n.addr, align 16
  %0 = load x86_fp80* %n.addr, align 16
  %conv = fptosi x86_fp80 %0 to i64
  ret i64 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i64, align 8
  store i32 0, i32* %retval
  %call = call x86_fp80 @ll_to_ld(i64 10)
  %cmp = fcmp une x86_fp80 %call, 0xK4002A000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @ld_to_ll(x86_fp80 0xK4002A000000000000000)
  %cmp2 = icmp ne i64 %call1, 10
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
