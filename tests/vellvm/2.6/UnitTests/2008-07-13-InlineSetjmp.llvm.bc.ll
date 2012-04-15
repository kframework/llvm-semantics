; ModuleID = '2008-07-13-InlineSetjmp.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [6 x i32], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [32 x i32] }

@g = internal global [1 x %struct.__jmp_buf_tag] zeroinitializer, align 32 ; <[1 x %struct.__jmp_buf_tag]*> [#uses=1]
@.str = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

declare void @longjmp(%struct.__jmp_buf_tag*, i32) noreturn nounwind

define internal fastcc void @b(i32* nocapture %x) nounwind {
entry:
  %0 = tail call i32 @_setjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @g, i32 0, i32 0)) nounwind ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, 0                          ; <i1> [#uses=1]
  br i1 %1, label %bb, label %return

bb:                                               ; preds = %entry
  store i32 10, i32* %x, align 4
  tail call void @longjmp(%struct.__jmp_buf_tag* getelementptr inbounds ([1 x %struct.__jmp_buf_tag]* @g, i32 0, i32 0), i32 1) noreturn nounwind
  unreachable

return:                                           ; preds = %entry
  ret void
}

declare i32 @_setjmp(%struct.__jmp_buf_tag*) nounwind

define i32 @main() nounwind {
entry:
  %a = alloca i32, align 4                        ; <i32*> [#uses=3]
  store i32 1, i32* %a, align 4
  call fastcc void @b(i32* %a) nounwind
  %0 = load i32* %a, align 4                      ; <i32> [#uses=1]
  %1 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
