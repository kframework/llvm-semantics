; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.vector_t = type { float, float }
%struct.struct_list = type { float }

@pos = global [1 x %struct.vector_t] zeroinitializer, align 4
@limit = global [2 x %struct.vector_t] [%struct.vector_t zeroinitializer, %struct.vector_t { float 1.000000e+00, float 1.000000e+00 }], align 16

define void @w(float %x, float %y) nounwind uwtable readnone {
entry:
  ret void
}

define void @f1(float %x, float %y) nounwind uwtable {
entry:
  %cmp = fcmp une float %x, 0.000000e+00
  %cmp1 = fcmp une float %y, 0.000000e+00
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f2(float %x, float %y) nounwind uwtable {
entry:
  %cmp = fcmp une float %x, 1.000000e+00
  %cmp1 = fcmp une float %y, 1.000000e+00
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @gitter(i32 %count, %struct.vector_t* nocapture %pos, %struct.struct_list* nocapture %list, i32* nocapture %nww, %struct.vector_t* nocapture %limit, float %r) nounwind uwtable {
entry:
  %x = getelementptr inbounds %struct.vector_t* %limit, i64 0, i32 0
  %0 = load float* %x, align 4, !tbaa !0
  %y = getelementptr inbounds %struct.vector_t* %limit, i64 0, i32 1
  %1 = load float* %y, align 4, !tbaa !0
  %cmp.i = fcmp une float %0, 0.000000e+00
  %cmp1.i = fcmp une float %1, 0.000000e+00
  %or.cond.i = or i1 %cmp.i, %cmp1.i
  br i1 %or.cond.i, label %if.then.i, label %f1.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit:                                          ; preds = %entry
  %x3 = getelementptr inbounds %struct.vector_t* %limit, i64 1, i32 0
  %2 = load float* %x3, align 4, !tbaa !0
  %y5 = getelementptr inbounds %struct.vector_t* %limit, i64 1, i32 1
  %3 = load float* %y5, align 4, !tbaa !0
  %cmp.i16 = fcmp une float %2, 1.000000e+00
  %cmp1.i17 = fcmp une float %3, 1.000000e+00
  %or.cond.i18 = or i1 %cmp.i16, %cmp1.i17
  br i1 %or.cond.i18, label %if.then.i19, label %f2.exit

if.then.i19:                                      ; preds = %f1.exit
  tail call void @abort() noreturn nounwind
  unreachable

f2.exit:                                          ; preds = %f1.exit
  store i32 0, i32* %nww, align 4, !tbaa !3
  %x7 = getelementptr inbounds %struct.vector_t* %pos, i64 0, i32 0
  %4 = load float* %x7, align 4, !tbaa !0
  %cmp = fcmp ugt float %4, 0.000000e+00
  br i1 %cmp, label %if.end15, label %if.then

if.then:                                          ; preds = %f2.exit
  %conv = fpext float %4 to double
  %conv10 = fpext float %r to double
  %mul = fmul double %conv10, 5.000000e-01
  %cmp11 = fcmp ugt double %conv, %mul
  br i1 %cmp11, label %if.end15, label %if.then13

if.then13:                                        ; preds = %if.then
  %wsx = getelementptr inbounds %struct.struct_list* %list, i64 0, i32 0
  store float 1.000000e+00, float* %wsx, align 4, !tbaa !0
  br label %if.end15

if.end15:                                         ; preds = %if.then, %f2.exit, %if.then13
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 0, i32 0), align 16, !tbaa !0
  %1 = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 0, i32 1), align 4, !tbaa !0
  %cmp.i.i = fcmp une float %0, 0.000000e+00
  %cmp1.i.i = fcmp une float %1, 0.000000e+00
  %or.cond.i.i = or i1 %cmp.i.i, %cmp1.i.i
  br i1 %or.cond.i.i, label %if.then.i.i, label %f1.exit.i

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f1.exit.i:                                        ; preds = %entry
  %2 = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 1, i32 0), align 8, !tbaa !0
  %3 = load float* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i64 0, i64 1, i32 1), align 4, !tbaa !0
  %cmp.i16.i = fcmp une float %2, 1.000000e+00
  %cmp1.i17.i = fcmp une float %3, 1.000000e+00
  %or.cond.i18.i = or i1 %cmp.i16.i, %cmp1.i17.i
  br i1 %or.cond.i18.i, label %if.then.i19.i, label %f2.exit.i

if.then.i19.i:                                    ; preds = %f1.exit.i
  tail call void @abort() noreturn nounwind
  unreachable

f2.exit.i:                                        ; preds = %f1.exit.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
