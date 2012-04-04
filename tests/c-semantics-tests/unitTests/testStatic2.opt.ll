; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testStatic2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.staticInt = internal unnamed_addr global i32 0, align 4

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %rem = srem i32 %x, 2
  %cmp = icmp eq i32 %rem, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load i32* @f.staticInt, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.staticInt, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %retval1.0 = phi i32 [ %inc, %if.then ], [ 2, %entry ]
  ret i32 %retval1.0
}

define i32 @main() nounwind uwtable {
f.exit.9:
  %0 = load i32* @f.staticInt, align 4, !tbaa !0
  %inc.i.9 = add nsw i32 %0, 5
  store i32 %inc.i.9, i32* @f.staticInt, align 4, !tbaa !0
  ret i32 %inc.i.9
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
