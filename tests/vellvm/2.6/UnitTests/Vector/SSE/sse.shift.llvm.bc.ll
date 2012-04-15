; ModuleID = 'sse.shift.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [21 x i8] c"%08x %08x %08x %08x\0A\00", align 1 ; <[21 x i8]*> [#uses=1]

declare <4 x i32> @llvm.x86.sse2.pcmpeq.d(<4 x i32>, <4 x i32>) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  %0 = tail call <4 x i32> @llvm.x86.sse2.pcmpeq.d(<4 x i32> zeroinitializer, <4 x i32> zeroinitializer) nounwind readnone ; <<4 x i32>> [#uses=1]
  %1 = bitcast <4 x i32> %0 to <8 x i16>          ; <<8 x i16>> [#uses=2]
  %2 = tail call <8 x i16> @llvm.x86.sse2.psrli.w(<8 x i16> %1, i32 8) nounwind readnone ; <<8 x i16>> [#uses=1]
  %tmp8 = bitcast <8 x i16> %2 to <4 x i32>       ; <<4 x i32>> [#uses=4]
  %tmp1 = extractelement <4 x i32> %tmp8, i32 3   ; <i32> [#uses=1]
  %tmp3 = extractelement <4 x i32> %tmp8, i32 2   ; <i32> [#uses=1]
  %tmp5 = extractelement <4 x i32> %tmp8, i32 1   ; <i32> [#uses=1]
  %tmp7 = extractelement <4 x i32> %tmp8, i32 0   ; <i32> [#uses=1]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %tmp7, i32 %tmp5, i32 %tmp3, i32 %tmp1) nounwind ; <i32> [#uses=0]
  %4 = tail call <8 x i16> @llvm.x86.sse2.pslli.w(<8 x i16> %1, i32 8) nounwind readnone ; <<8 x i16>> [#uses=1]
  %tmp18 = bitcast <8 x i16> %4 to <4 x i32>      ; <<4 x i32>> [#uses=4]
  %tmp10 = extractelement <4 x i32> %tmp18, i32 3 ; <i32> [#uses=1]
  %tmp12 = extractelement <4 x i32> %tmp18, i32 2 ; <i32> [#uses=1]
  %tmp14 = extractelement <4 x i32> %tmp18, i32 1 ; <i32> [#uses=1]
  %tmp16 = extractelement <4 x i32> %tmp18, i32 0 ; <i32> [#uses=1]
  %5 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %tmp16, i32 %tmp14, i32 %tmp12, i32 %tmp10) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare <8 x i16> @llvm.x86.sse2.psrli.w(<8 x i16>, i32) nounwind readnone

declare <8 x i16> @llvm.x86.sse2.pslli.w(<8 x i16>, i32) nounwind readnone
