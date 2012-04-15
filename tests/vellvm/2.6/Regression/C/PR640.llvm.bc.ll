; ModuleID = 'PR640.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [6 x i8] c"ERROR\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str1 = private constant [10 x i8] c"All done.\00", align 1 ; <[10 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %r_addr.i = alloca i32, align 4                 ; <i32*> [#uses=5]
  store i32 1, i32* %r_addr.i
  %r_addr1.i = bitcast i32* %r_addr.i to i8*      ; <i8*> [#uses=2]
  %0 = call i32 (i8*, ...)* @test_stdarg_va(i8* %r_addr1.i, i32 1, i32 1981891429, i32 2, i32* %r_addr.i) nounwind ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, 1                          ; <i1> [#uses=1]
  br i1 %1, label %bb2.i, label %bb

bb2.i:                                            ; preds = %entry
  %2 = call i32 (i8*, ...)* @test_stdarg_builtin_va(i8* %r_addr1.i, i32 1, i32 1981891433, i32 2, i32* %r_addr.i) nounwind ; <i32> [#uses=1]
  %3 = icmp eq i32 %2, 1                          ; <i1> [#uses=1]
  br i1 %3, label %test_stdarg.exit, label %bb

test_stdarg.exit:                                 ; preds = %bb2.i
  %4 = load i32* %r_addr.i, align 4               ; <i32> [#uses=1]
  %5 = and i32 %4, 1                              ; <i32> [#uses=1]
  %phitmp = icmp eq i32 %5, 0                     ; <i1> [#uses=1]
  br i1 %phitmp, label %bb, label %bb1

bb:                                               ; preds = %test_stdarg.exit, %bb2.i, %entry
  %6 = call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 1

bb1:                                              ; preds = %test_stdarg.exit
  %7 = call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 0
}

define internal i32 @test_stdarg_va(i8* %p1, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=6]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %0 = load i8** %ap, align 4                     ; <i8*> [#uses=5]
  %1 = getelementptr inbounds i8* %0, i32 4       ; <i8*> [#uses=2]
  store i8* %1, i8** %ap, align 4
  %2 = bitcast i8* %0 to i32*                     ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=1]
  %4 = getelementptr inbounds i8* %0, i32 8       ; <i8*> [#uses=2]
  store i8* %4, i8** %ap, align 4
  %5 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = getelementptr inbounds i8* %0, i32 12      ; <i8*> [#uses=2]
  store i8* %7, i8** %ap, align 4
  %8 = bitcast i8* %4 to i32*                     ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = getelementptr inbounds i8* %0, i32 16     ; <i8*> [#uses=1]
  store i8* %10, i8** %ap, align 4
  %11 = bitcast i8* %7 to i8**                    ; <i8**> [#uses=1]
  %12 = load i8** %11, align 4                    ; <i8*> [#uses=1]
  call void @llvm.va_end(i8* %ap1)
  %13 = icmp eq i8* %12, %p1                      ; <i1> [#uses=1]
  %14 = icmp eq i32 %3, 1                         ; <i1> [#uses=1]
  %15 = and i1 %13, %14                           ; <i1> [#uses=1]
  br i1 %15, label %bb, label %bb15

bb:                                               ; preds = %entry
  %16 = icmp eq i32 %6, 1981891429                ; <i1> [#uses=1]
  %17 = icmp eq i32 %9, 2                         ; <i1> [#uses=1]
  %18 = and i1 %17, %16                           ; <i1> [#uses=1]
  %retval = zext i1 %18 to i32                    ; <i32> [#uses=1]
  ret i32 %retval

bb15:                                             ; preds = %entry
  ret i32 0
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define internal i32 @test_stdarg_builtin_va(i8* %p1, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=6]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %0 = load i8** %ap, align 4                     ; <i8*> [#uses=5]
  %1 = getelementptr inbounds i8* %0, i32 4       ; <i8*> [#uses=2]
  store i8* %1, i8** %ap, align 4
  %2 = bitcast i8* %0 to i32*                     ; <i32*> [#uses=1]
  %3 = load i32* %2, align 4                      ; <i32> [#uses=1]
  %4 = getelementptr inbounds i8* %0, i32 8       ; <i8*> [#uses=2]
  store i8* %4, i8** %ap, align 4
  %5 = bitcast i8* %1 to i32*                     ; <i32*> [#uses=1]
  %6 = load i32* %5, align 4                      ; <i32> [#uses=1]
  %7 = getelementptr inbounds i8* %0, i32 12      ; <i8*> [#uses=2]
  store i8* %7, i8** %ap, align 4
  %8 = bitcast i8* %4 to i32*                     ; <i32*> [#uses=1]
  %9 = load i32* %8, align 4                      ; <i32> [#uses=1]
  %10 = getelementptr inbounds i8* %0, i32 16     ; <i8*> [#uses=1]
  store i8* %10, i8** %ap, align 4
  %11 = bitcast i8* %7 to i8**                    ; <i8**> [#uses=1]
  %12 = load i8** %11, align 4                    ; <i8*> [#uses=1]
  call void @llvm.va_end(i8* %ap1)
  %13 = icmp eq i8* %12, %p1                      ; <i1> [#uses=1]
  %14 = icmp eq i32 %3, 1                         ; <i1> [#uses=1]
  %15 = and i1 %13, %14                           ; <i1> [#uses=1]
  br i1 %15, label %bb, label %bb15

bb:                                               ; preds = %entry
  %16 = icmp eq i32 %6, 1981891433                ; <i1> [#uses=1]
  %17 = icmp eq i32 %9, 2                         ; <i1> [#uses=1]
  %18 = and i1 %17, %16                           ; <i1> [#uses=1]
  %retval = zext i1 %18 to i32                    ; <i32> [#uses=1]
  ret i32 %retval

bb15:                                             ; preds = %entry
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
