; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960513-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define x86_fp80 @f(x86_fp80 %d, i32 %i) nounwind uwtable readnone {
entry:
  %sub = fsub x86_fp80 0xK80000000000000000000, %d
  %cmp = icmp eq i32 %i, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %mul = fmul x86_fp80 %d, 0xKC0008000000000000000
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %d.addr.0 = phi x86_fp80 [ %mul, %if.then ], [ %sub, %entry ]
  %mul1 = fmul x86_fp80 %d.addr.0, %sub
  %sub2 = fsub x86_fp80 %d.addr.0, %mul1
  %mul3 = fmul x86_fp80 %sub2, %sub
  %sub4 = fsub x86_fp80 %sub2, %mul3
  %mul5 = fmul x86_fp80 %sub4, %sub
  %sub6 = fsub x86_fp80 %sub4, %mul5
  %mul7 = fmul x86_fp80 %sub6, %sub
  %sub8 = fsub x86_fp80 %sub6, %mul7
  %mul9 = fmul x86_fp80 %sub8, %sub
  %sub10 = fsub x86_fp80 %sub8, %mul9
  ret x86_fp80 %sub10
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
