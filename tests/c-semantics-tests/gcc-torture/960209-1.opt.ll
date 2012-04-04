; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960209-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a_struct = type { i8 }

@yabba = global i32 1, align 4
@an_array = common global [5 x %struct.a_struct] zeroinitializer, align 1
@a_ptr = common global %struct.a_struct* null, align 8

define i32 @f(i32, i64 %b) nounwind uwtable {
entry:
  %.pre = load i32* @yabba, align 4, !tbaa !0
  %phitmp = icmp eq i32 %.pre, 0
  %not.cmp = icmp ne i64 %b, 0
  %. = sext i1 %not.cmp to i32
  br i1 %phitmp, label %if.end24, label %return

if.end24:                                         ; preds = %entry
  %a = zext i32 %0 to i64
  %idxprom = and i64 %a, 255
  %arrayidx = getelementptr inbounds [5 x %struct.a_struct]* @an_array, i64 0, i64 %idxprom
  store %struct.a_struct* %arrayidx, %struct.a_struct** @a_ptr, align 8, !tbaa !3
  br label %return

return:                                           ; preds = %entry, %if.end24
  %retval.0 = phi i32 [ 0, %if.end24 ], [ %., %entry ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %.pre.i = load i32* @yabba, align 4, !tbaa !0
  %phitmp.i = icmp eq i32 %.pre.i, 0
  br i1 %phitmp.i, label %if.end24.i, label %if.end

if.end24.i:                                       ; preds = %entry
  store %struct.a_struct* getelementptr inbounds ([5 x %struct.a_struct]* @an_array, i64 0, i64 1), %struct.a_struct** @a_ptr, align 8, !tbaa !3
  br label %if.end

if.end:                                           ; preds = %if.end24.i, %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
