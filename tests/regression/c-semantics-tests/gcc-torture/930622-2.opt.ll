; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930622-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define x86_fp80 @ll_to_ld(i64 %n) nounwind uwtable readnone {
entry:
  %conv = sitofp i64 %n to x86_fp80
  ret x86_fp80 %conv
}

define i64 @ld_to_ll(x86_fp80 %n) nounwind uwtable readnone {
entry:
  %conv = fptosi x86_fp80 %n to i64
  ret i64 %conv
}

define i32 @main() noreturn nounwind uwtable {
if.end4:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
