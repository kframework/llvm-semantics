; ModuleID = '2003-07-09-SignedArgs.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [36 x i8] c"getUnknown():\09%d %d %d %d %d %d %d\0A\00", align 1 ; <[36 x i8]*> [#uses=1]
@.str1 = private constant [31 x i8] c"getShort():\09%d %d %d %d %d %d\0A\00", align 1 ; <[31 x i8]*> [#uses=1]
@.str2 = private constant [4 x i8] c"%d\0A\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal i32 @getUnknown(i32, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=8]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %1 = load i8** %ap, align 4                     ; <i8*> [#uses=7]
  %2 = getelementptr inbounds i8* %1, i32 4       ; <i8*> [#uses=2]
  store i8* %2, i8** %ap, align 4
  %3 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4                      ; <i32> [#uses=1]
  %5 = trunc i32 %4 to i8                         ; <i8> [#uses=1]
  %6 = getelementptr inbounds i8* %1, i32 8       ; <i8*> [#uses=2]
  store i8* %6, i8** %ap, align 4
  %7 = bitcast i8* %2 to i32*                     ; <i32*> [#uses=1]
  %8 = load i32* %7, align 4                      ; <i32> [#uses=1]
  %9 = trunc i32 %8 to i8                         ; <i8> [#uses=1]
  %10 = getelementptr inbounds i8* %1, i32 12     ; <i8*> [#uses=2]
  store i8* %10, i8** %ap, align 4
  %11 = bitcast i8* %6 to i32*                    ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4                    ; <i32> [#uses=1]
  %13 = trunc i32 %12 to i16                      ; <i16> [#uses=1]
  %14 = getelementptr inbounds i8* %1, i32 16     ; <i8*> [#uses=2]
  store i8* %14, i8** %ap, align 4
  %15 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=1]
  %16 = load i32* %15, align 4                    ; <i32> [#uses=1]
  %17 = trunc i32 %16 to i16                      ; <i16> [#uses=1]
  %18 = getelementptr inbounds i8* %1, i32 20     ; <i8*> [#uses=2]
  store i8* %18, i8** %ap, align 4
  %19 = bitcast i8* %14 to i32*                   ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4                    ; <i32> [#uses=1]
  %21 = trunc i32 %20 to i16                      ; <i16> [#uses=1]
  %22 = getelementptr inbounds i8* %1, i32 24     ; <i8*> [#uses=1]
  store i8* %22, i8** %ap, align 4
  %23 = bitcast i8* %18 to i32*                   ; <i32*> [#uses=1]
  %24 = load i32* %23, align 4                    ; <i32> [#uses=2]
  call void @llvm.va_end(i8* %ap1)
  %25 = sext i16 %21 to i32                       ; <i32> [#uses=2]
  %26 = sext i16 %17 to i32                       ; <i32> [#uses=2]
  %27 = sext i16 %13 to i32                       ; <i32> [#uses=2]
  %28 = sext i8 %9 to i32                         ; <i32> [#uses=2]
  %29 = sext i8 %5 to i32                         ; <i32> [#uses=2]
  %30 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([36 x i8]* @.str, i32 0, i32 0), i32 -128, i32 %29, i32 %28, i32 %27, i32 %26, i32 %25, i32 %24) nounwind ; <i32> [#uses=0]
  %31 = add nsw i32 %29, -128                     ; <i32> [#uses=1]
  %32 = add nsw i32 %31, %28                      ; <i32> [#uses=1]
  %33 = add nsw i32 %32, %27                      ; <i32> [#uses=1]
  %34 = add nsw i32 %33, %24                      ; <i32> [#uses=1]
  %35 = add nsw i32 %34, %26                      ; <i32> [#uses=1]
  %36 = add nsw i32 %35, %25                      ; <i32> [#uses=1]
  ret i32 %36
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  %0 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 1, i32 1, i32 1, i32 1, i32 1, i32 1) nounwind ; <i32> [#uses=0]
  %1 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 -128, i32 116, i32 116, i32 -3852, i32 -31232, i32 -1708916736) nounwind ; <i32> [#uses=0]
  %2 = tail call i32 (i32, ...)* @getUnknown(i32 undef, i32 116, i32 116, i32 -3852, i32 -31232, i32 30556, i32 -1708916736) nounwind ; <i32> [#uses=1]
  %3 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0), i32 %2) nounwind ; <i32> [#uses=0]
  ret i32 0
}
