; ModuleID = '2007-03-02-VaCopy.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [11 x i8] c"string %s\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str2 = private constant [4 x i8] c"abc\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal void @testVaCopyArg(i32, ...) nounwind {
entry:
  %aq = alloca i8*, align 4                       ; <i8**> [#uses=3]
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=2]
  %memtmp = alloca i8*, align 4                   ; <i8**> [#uses=2]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=1]
  call void @llvm.va_start(i8* %ap1)
  %1 = load i8** %ap, align 4                     ; <i8*> [#uses=1]
  store i8* %1, i8** %memtmp
  %aq2 = bitcast i8** %aq to i8*                  ; <i8*> [#uses=1]
  %memtmp3 = bitcast i8** %memtmp to i8*          ; <i8*> [#uses=1]
  call void @llvm.va_copy(i8* %aq2, i8* %memtmp3)
  %2 = load i8** %aq, align 4                     ; <i8*> [#uses=2]
  %3 = getelementptr inbounds i8* %2, i32 4       ; <i8*> [#uses=1]
  store i8* %3, i8** %aq, align 4
  %4 = bitcast i8* %2 to i8**                     ; <i8**> [#uses=1]
  %5 = load i8** %4, align 4                      ; <i8*> [#uses=1]
  %6 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %5) nounwind ; <i32> [#uses=0]
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  tail call void (i32, ...)* @testVaCopyArg(i32 undef, i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i32 0)) nounwind
  ret i32 0
}
