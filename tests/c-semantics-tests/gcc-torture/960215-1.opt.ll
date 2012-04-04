; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@C = global x86_fp80 0xK40008000000000000000, align 16
@U = global x86_fp80 0xK3FFF8000000000000000, align 16
@Y2 = global x86_fp80 0xK4000C000000000000000, align 16
@Y1 = global x86_fp80 0xK3FFF8000000000000000, align 16
@X = common global x86_fp80 0xK00000000000000000000, align 16
@Y = common global x86_fp80 0xK00000000000000000000, align 16
@Z = common global x86_fp80 0xK00000000000000000000, align 16
@T = common global x86_fp80 0xK00000000000000000000, align 16
@R = common global x86_fp80 0xK00000000000000000000, align 16
@S = common global x86_fp80 0xK00000000000000000000, align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load x86_fp80* @C, align 16, !tbaa !0
  %1 = load x86_fp80* @U, align 16, !tbaa !0
  %add = fadd x86_fp80 %0, %1
  %2 = load x86_fp80* @Y2, align 16, !tbaa !0
  %mul = fmul x86_fp80 %add, %2
  %sub = fsub x86_fp80 %0, %1
  %sub1 = fsub x86_fp80 %sub, %1
  %add3 = fadd x86_fp80 %add, %1
  %3 = load x86_fp80* @Y1, align 16, !tbaa !0
  %mul5 = fmul x86_fp80 %sub, %3
  %add6 = fadd x86_fp80 %add3, %1
  %sub7 = fsub x86_fp80 %mul, %add6
  store x86_fp80 %sub7, x86_fp80* @X, align 16, !tbaa !0
  %mul8 = fmul x86_fp80 %sub1, %3
  %mul9 = fmul x86_fp80 %add3, %2
  store x86_fp80 %mul9, x86_fp80* @S, align 16, !tbaa !0
  %sub10 = fsub x86_fp80 %mul5, %sub1
  store x86_fp80 %sub10, x86_fp80* @T, align 16, !tbaa !0
  %sub11 = fsub x86_fp80 %1, %sub1
  %add12 = fadd x86_fp80 %sub11, %mul8
  store x86_fp80 %add12, x86_fp80* @Y, align 16, !tbaa !0
  %add14 = fadd x86_fp80 %add6, %1
  %sub15 = fsub x86_fp80 %mul9, %add14
  store x86_fp80 %sub15, x86_fp80* @Z, align 16, !tbaa !0
  %add16 = fadd x86_fp80 %2, %1
  %mul17 = fmul x86_fp80 %add16, %3
  %mul18 = fmul x86_fp80 %2, %3
  %sub19 = fsub x86_fp80 %mul17, %2
  store x86_fp80 %sub19, x86_fp80* @R, align 16, !tbaa !0
  %sub20 = fadd x86_fp80 %mul18, 0xKBFFE8000000000000000
  store x86_fp80 %sub20, x86_fp80* @Y1, align 16, !tbaa !0
  %cmp = fcmp une x86_fp80 %sub15, 0xK4001C000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
