; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a, i32 %b, i32 %c, i1 zeroext %d, i1 zeroext %e, i1 zeroext %f, i8 signext %g) nounwind uwtable {
entry:
  %cmp.not = icmp ne i8 %g, 1
  %d.not = xor i1 %d, true
  %brmerge = or i1 %cmp.not, %d.not
  %e.not = xor i1 %e, true
  %brmerge18 = or i1 %brmerge, %e.not
  %f.not = xor i1 %f, true
  %brmerge19 = or i1 %brmerge18, %f.not
  br i1 %brmerge19, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %add = add i32 %b, %a
  %add17 = add i32 %add, %c
  ret i32 %add17
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
