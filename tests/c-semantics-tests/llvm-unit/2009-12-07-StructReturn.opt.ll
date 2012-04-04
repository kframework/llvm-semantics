; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2009-12-07-StructReturn.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.barstruct = type { %struct.foostruct, float }
%struct.foostruct = type { [3 x float] }

@bar_ary = common global [4 x %struct.barstruct] zeroinitializer, align 16
@str = private unnamed_addr constant [50 x i8] c"error: store clobbered memory outside destination\00"

define float* @spooky(i32 %i) nounwind uwtable noinline {
entry:
  %idxprom = sext i32 %i to i64
  %safe = getelementptr inbounds [4 x %struct.barstruct]* @bar_ary, i64 0, i64 %idxprom, i32 1
  store float 1.420000e+02, float* %safe, align 4, !tbaa !0
  ret float* %safe
}

define { <2 x float>, float } @foobify() nounwind uwtable readnone noinline {
entry:
  ret { <2 x float>, float } { <2 x float> <float 4.200000e+01, float 4.200000e+01>, float 4.200000e+01 }
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call float* @spooky(i32 0)
  %call1 = tail call { <2 x float>, float } @foobify()
  %0 = extractvalue { <2 x float>, float } %call1, 0
  %1 = extractvalue { <2 x float>, float } %call1, 1
  %2 = extractelement <2 x float> %0, i32 0
  %3 = extractelement <2 x float> %0, i32 1
  store float %2, float* getelementptr inbounds ([4 x %struct.barstruct]* @bar_ary, i64 0, i64 0, i32 0, i32 0, i64 0), align 16
  store float %3, float* getelementptr inbounds ([4 x %struct.barstruct]* @bar_ary, i64 0, i64 0, i32 0, i32 0, i64 1), align 4
  store float %1, float* getelementptr inbounds ([4 x %struct.barstruct]* @bar_ary, i64 0, i64 0, i32 0, i32 0, i64 2), align 8
  %4 = load float* %call, align 4, !tbaa !0
  %cmp = fcmp une float %4, 1.420000e+02
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([50 x i8]* @str, i64 0, i64 0))
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
