; ModuleID = 'huffbench.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private constant [33 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345\00", align 1 ; <[33 x i8]*> [#uses=1]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=3]
@.str1 = private constant [26 x i8] c"error: bit code overflow\0A\00", align 1 ; <[26 x i8]*> [#uses=1]
@.str2 = private constant [33 x i8] c"error: file has only one value!\0A\00", align 1 ; <[33 x i8]*> [#uses=1]
@.str3 = private constant [23 x i8] c"error: no compression\0A\00", align 1 ; <[23 x i8]*> [#uses=1]
@stdout = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=2]
@.str5 = private constant [3 x i8] c"%f\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str6 = private constant [35 x i8] c"\0Ahuffbench (Std. C) run time: %f\0A\0A\00", align 1 ; <[35 x i8]*> [#uses=1]

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %outc.i = alloca [256 x i8], align 1            ; <[256 x i8]*> [#uses=5]
  %heap2.i = alloca [256 x i32], align 4          ; <[256 x i32]*> [#uses=10]
  %clen.i = alloca [256 x i8], align 1            ; <[256 x i8]*> [#uses=4]
  %code.i = alloca [256 x i32], align 4           ; <[256 x i32]*> [#uses=4]
  %link.i = alloca [512 x i32], align 4           ; <[512 x i32]*> [#uses=6]
  %heap.i = alloca [256 x i32], align 4           ; <[256 x i32]*> [#uses=20]
  %freq.i = alloca [512 x i32], align 4           ; <[512 x i32]*> [#uses=18]
  %0 = icmp sgt i32 %argc, 1                      ; <i1> [#uses=1]
  br i1 %0, label %bb20.preheader, label %bb21

bb20.preheader:                                   ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  br label %bb20

bb3:                                              ; preds = %bb20
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=4]
  %3 = load i8* %2, align 1                       ; <i8> [#uses=2]
  %4 = zext i8 %3 to i32                          ; <i32> [#uses=1]
  %5 = add i32 %4, -45                            ; <i32> [#uses=1]
  %6 = icmp eq i8 %3, 45                          ; <i1> [#uses=1]
  br i1 %6, label %bb6, label %bb17

bb6:                                              ; preds = %bb3
  %7 = getelementptr inbounds i8* %2, i32 1       ; <i8*> [#uses=1]
  %8 = load i8* %7, align 1                       ; <i8> [#uses=2]
  %9 = zext i8 %8 to i32                          ; <i32> [#uses=1]
  %10 = add i32 %9, -103                          ; <i32> [#uses=1]
  %11 = icmp eq i8 %8, 103                        ; <i1> [#uses=1]
  br i1 %11, label %bb10, label %bb17

bb10:                                             ; preds = %bb6
  %12 = getelementptr inbounds i8* %2, i32 2      ; <i8*> [#uses=1]
  %13 = load i8* %12, align 1                     ; <i8> [#uses=2]
  %14 = zext i8 %13 to i32                        ; <i32> [#uses=1]
  %15 = add i32 %14, -97                          ; <i32> [#uses=1]
  %16 = icmp eq i8 %13, 97                        ; <i1> [#uses=1]
  br i1 %16, label %bb14, label %bb17

bb14:                                             ; preds = %bb10
  %17 = getelementptr inbounds i8* %2, i32 3      ; <i8*> [#uses=1]
  %18 = load i8* %17, align 1                     ; <i8> [#uses=1]
  %19 = zext i8 %18 to i32                        ; <i32> [#uses=1]
  br label %bb17

bb17:                                             ; preds = %bb14, %bb10, %bb6, %bb3
  %__result.0 = phi i32 [ %19, %bb14 ], [ %5, %bb3 ], [ %10, %bb6 ], [ %15, %bb10 ] ; <i32> [#uses=1]
  %20 = icmp eq i32 %__result.0, 0                ; <i1> [#uses=1]
  br i1 %20, label %bb21, label %bb19

bb19:                                             ; preds = %bb17
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb20

bb20:                                             ; preds = %bb19, %bb20.preheader
  %indvar = phi i32 [ 1, %bb20.preheader ], [ %phitmp, %bb19 ] ; <i32> [#uses=2]
  %21 = icmp slt i32 %indvar, %argc               ; <i1> [#uses=1]
  br i1 %21, label %bb3, label %bb21

bb21:                                             ; preds = %bb20, %bb17, %entry
  %ga_testing.0 = phi i8 [ 0, %entry ], [ 0, %bb20 ], [ 1, %bb17 ] ; <i8> [#uses=1]
  %22 = malloc [10000000 x i8]                    ; <[10000000 x i8]*> [#uses=5]
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb21
  %23 = phi i32 [ 1325, %bb21 ], [ %34, %bb.i ]   ; <i32> [#uses=1]
  %i.01.i = phi i32 [ 0, %bb21 ], [ %37, %bb.i ]  ; <i32> [#uses=2]
  %ptr.02.i = getelementptr [10000000 x i8]* %22, i32 0, i32 %i.01.i ; <i8*> [#uses=1]
  %24 = xor i32 %23, 123459876                    ; <i32> [#uses=2]
  %25 = sdiv i32 %24, 127773                      ; <i32> [#uses=2]
  %26 = mul i32 %25, 127773                       ; <i32> [#uses=1]
  %27 = sub i32 %24, %26                          ; <i32> [#uses=1]
  %28 = mul i32 %27, 16807                        ; <i32> [#uses=1]
  %29 = mul i32 %25, 2836                         ; <i32> [#uses=1]
  %30 = sub i32 %28, %29                          ; <i32> [#uses=3]
  %31 = add nsw i32 %30, 2147483647               ; <i32> [#uses=1]
  %32 = icmp slt i32 %30, 0                       ; <i1> [#uses=1]
  %..i.i = select i1 %32, i32 %31, i32 %30        ; <i32> [#uses=2]
  %33 = srem i32 %..i.i, 32                       ; <i32> [#uses=1]
  %34 = xor i32 %..i.i, 123459876                 ; <i32> [#uses=1]
  %35 = getelementptr inbounds [33 x i8]* @.str, i32 0, i32 %33 ; <i8*> [#uses=1]
  %36 = load i8* %35, align 1                     ; <i8> [#uses=1]
  store i8 %36, i8* %ptr.02.i, align 1
  %37 = add nsw i32 %i.01.i, 1                    ; <i32> [#uses=2]
  %exitcond2 = icmp eq i32 %37, 10000000          ; <i1> [#uses=1]
  br i1 %exitcond2, label %bb23.loopexit, label %bb.i

bb22:                                             ; preds = %bb23.loopexit, %compdecomp.exit
  %i.11 = phi i32 [ 0, %bb23.loopexit ], [ %233, %compdecomp.exit ] ; <i32> [#uses=1]
  %38 = malloc [10000001 x i8]                    ; <[10000001 x i8]*> [#uses=5]
  %.sub.i = getelementptr inbounds [10000001 x i8]* %38, i32 0, i32 0 ; <i8*> [#uses=1]
  call void @llvm.memset.i32(i8* %.sub.i, i8 0, i32 10000001, i32 4) nounwind
  call void @llvm.memset.i32(i8* %freq12.i, i8 0, i32 2048, i32 4) nounwind
  call void @llvm.memset.i32(i8* %heap34.i, i8 0, i32 1024, i32 4) nounwind
  call void @llvm.memset.i32(i8* %link56.i, i8 0, i32 2048, i32 4) nounwind
  call void @llvm.memset.i32(i8* %code78.i, i8 0, i32 1024, i32 4) nounwind
  call void @llvm.memset.i32(i8* %clen9.i, i8 0, i32 256, i32 1) nounwind
  br label %bb.i1

bb.i1:                                            ; preds = %bb.i1, %bb22
  %i.075.i = phi i32 [ 0, %bb22 ], [ %44, %bb.i1 ] ; <i32> [#uses=2]
  %dptr.074.i = getelementptr [10000000 x i8]* %22, i32 0, i32 %i.075.i ; <i8*> [#uses=1]
  %39 = load i8* %dptr.074.i, align 1             ; <i8> [#uses=1]
  %40 = zext i8 %39 to i32                        ; <i32> [#uses=1]
  %41 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %40 ; <i32*> [#uses=2]
  %42 = load i32* %41, align 4                    ; <i32> [#uses=1]
  %43 = add i32 %42, 1                            ; <i32> [#uses=1]
  store i32 %43, i32* %41, align 4
  %44 = add i32 %i.075.i, 1                       ; <i32> [#uses=2]
  %exitcond150.i = icmp eq i32 %44, 10000000      ; <i1> [#uses=1]
  br i1 %exitcond150.i, label %bb12.i, label %bb.i1

bb12.i:                                           ; preds = %bb14.i, %bb.i1
  %45 = phi i32 [ %50, %bb14.i ], [ 0, %bb.i1 ]   ; <i32> [#uses=3]
  %n.170.i = phi i32 [ %n.0.i, %bb14.i ], [ 0, %bb.i1 ] ; <i32> [#uses=3]
  %scevgep149.i = getelementptr [512 x i32]* %freq.i, i32 0, i32 %45 ; <i32*> [#uses=1]
  %46 = load i32* %scevgep149.i, align 4          ; <i32> [#uses=1]
  %47 = icmp eq i32 %46, 0                        ; <i1> [#uses=1]
  br i1 %47, label %bb14.i, label %bb13.i

bb13.i:                                           ; preds = %bb12.i
  %48 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %n.170.i ; <i32*> [#uses=1]
  store i32 %45, i32* %48, align 4
  %49 = add i32 %n.170.i, 1                       ; <i32> [#uses=1]
  br label %bb14.i

bb14.i:                                           ; preds = %bb13.i, %bb12.i
  %n.0.i = phi i32 [ %49, %bb13.i ], [ %n.170.i, %bb12.i ] ; <i32> [#uses=11]
  %50 = add i32 %45, 1                            ; <i32> [#uses=2]
  %exitcond148.i = icmp eq i32 %50, 256           ; <i1> [#uses=1]
  br i1 %exitcond148.i, label %bb20.loopexit.i, label %bb12.i

bb.nph69.i:                                       ; preds = %bb20.loopexit.i
  %51 = sdiv i32 %n.0.i, 2                        ; <i32> [#uses=1]
  %tmp145.i = add i32 %n.0.i, -1                  ; <i32> [#uses=1]
  br label %bb17.i

bb17.i:                                           ; preds = %heap_adjust.exit.i, %bb.nph69.i
  %indvar140.i = phi i32 [ 0, %bb.nph69.i ], [ %indvar.next141.i, %heap_adjust.exit.i ] ; <i32> [#uses=3]
  %i.268.i = sub i32 %n.0.i, %indvar140.i         ; <i32> [#uses=1]
  %tmp146.i = sub i32 %tmp145.i, %indvar140.i     ; <i32> [#uses=1]
  %scevgep147.i = getelementptr [256 x i32]* %heap.i, i32 0, i32 %tmp146.i ; <i32*> [#uses=1]
  %52 = load i32* %scevgep147.i, align 4          ; <i32> [#uses=2]
  %53 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %52 ; <i32*> [#uses=1]
  br label %bb5.i.i

bb.i.i:                                           ; preds = %bb5.i.i
  %54 = shl i32 %k_addr.0.i.i, 1                  ; <i32> [#uses=5]
  %55 = icmp slt i32 %54, %n.0.i                  ; <i1> [#uses=1]
  br i1 %55, label %bb1.i.i, label %bb3.i.i

bb1.i.i:                                          ; preds = %bb.i.i
  %.sum.i.i = add i32 %54, -1                     ; <i32> [#uses=1]
  %56 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum.i.i ; <i32*> [#uses=1]
  %57 = load i32* %56, align 4                    ; <i32> [#uses=1]
  %58 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %57 ; <i32*> [#uses=1]
  %59 = load i32* %58, align 4                    ; <i32> [#uses=1]
  %60 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %54 ; <i32*> [#uses=1]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %61 ; <i32*> [#uses=1]
  %63 = load i32* %62, align 4                    ; <i32> [#uses=1]
  %64 = icmp ugt i32 %59, %63                     ; <i1> [#uses=1]
  %65 = zext i1 %64 to i32                        ; <i32> [#uses=1]
  %..i.i2 = or i32 %65, %54                       ; <i32> [#uses=1]
  br label %bb3.i.i

bb3.i.i:                                          ; preds = %bb1.i.i, %bb.i.i
  %j.0.i.i = phi i32 [ %..i.i2, %bb1.i.i ], [ %54, %bb.i.i ] ; <i32> [#uses=2]
  %66 = load i32* %53, align 4                    ; <i32> [#uses=1]
  %.sum3.i.i = add i32 %j.0.i.i, -1               ; <i32> [#uses=1]
  %67 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum3.i.i ; <i32*> [#uses=1]
  %68 = load i32* %67, align 4                    ; <i32> [#uses=2]
  %69 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %68 ; <i32*> [#uses=1]
  %70 = load i32* %69, align 4                    ; <i32> [#uses=1]
  %71 = icmp ult i32 %66, %70                     ; <i1> [#uses=1]
  br i1 %71, label %heap_adjust.exit.i, label %bb4.i.i

bb4.i.i:                                          ; preds = %bb3.i.i
  %.sum1.i.i = add i32 %k_addr.0.i.i, -1          ; <i32> [#uses=1]
  %72 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum1.i.i ; <i32*> [#uses=1]
  store i32 %68, i32* %72, align 4
  br label %bb5.i.i

bb5.i.i:                                          ; preds = %bb4.i.i, %bb17.i
  %k_addr.0.i.i = phi i32 [ %i.268.i, %bb17.i ], [ %j.0.i.i, %bb4.i.i ] ; <i32> [#uses=4]
  %73 = icmp slt i32 %51, %k_addr.0.i.i           ; <i1> [#uses=1]
  br i1 %73, label %heap_adjust.exit.i, label %bb.i.i

heap_adjust.exit.i:                               ; preds = %bb5.i.i, %bb3.i.i
  %.sum4.i.i = add i32 %k_addr.0.i.i, -1          ; <i32> [#uses=1]
  %74 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum4.i.i ; <i32*> [#uses=1]
  store i32 %52, i32* %74, align 4
  %indvar.next141.i = add i32 %indvar140.i, 1     ; <i32> [#uses=2]
  %exitcond142.i = icmp eq i32 %indvar.next141.i, %n.0.i ; <i1> [#uses=1]
  br i1 %exitcond142.i, label %bb26.loopexit.i, label %bb17.i

bb20.loopexit.i:                                  ; preds = %bb14.i
  %75 = icmp eq i32 %n.0.i, 0                     ; <i1> [#uses=1]
  br i1 %75, label %bb26.loopexit.i, label %bb.nph69.i

bb.nph66.i:                                       ; preds = %bb26.loopexit.i
  %tmp129.i = add i32 %n.0.i, -1                  ; <i32> [#uses=2]
  %sum.i = add i32 %n.0.i, 255                    ; <i32> [#uses=2]
  br label %bb21.i

bb21.i:                                           ; preds = %heap_adjust.exit14.i, %bb.nph66.i
  %indvar127.i = phi i32 [ 0, %bb.nph66.i ], [ %indvar.next128.i, %heap_adjust.exit14.i ] ; <i32> [#uses=4]
  %tmp133.i = sub i32 %indvar127.i, %sum.i        ; <i32> [#uses=1]
  %tmp135.i = sub i32 %tmp129.i, %indvar127.i     ; <i32> [#uses=4]
  %tmp137.i = sub i32 %sum.i, %indvar127.i        ; <i32> [#uses=4]
  %scevgep138.i = getelementptr [256 x i32]* %heap.i, i32 0, i32 %tmp135.i ; <i32*> [#uses=1]
  %scevgep139.i = getelementptr [512 x i32]* %freq.i, i32 0, i32 %tmp137.i ; <i32*> [#uses=1]
  %76 = load i32* %234, align 4                   ; <i32> [#uses=2]
  %77 = load i32* %scevgep138.i, align 4          ; <i32> [#uses=3]
  store i32 %77, i32* %234, align 4
  %78 = sdiv i32 %tmp135.i, 2                     ; <i32> [#uses=2]
  %79 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %77 ; <i32*> [#uses=1]
  br label %bb5.i25.i

bb.i15.i:                                         ; preds = %bb5.i25.i
  %80 = shl i32 %k_addr.0.i24.i, 1                ; <i32> [#uses=5]
  %81 = icmp slt i32 %80, %tmp135.i               ; <i1> [#uses=1]
  br i1 %81, label %bb1.i18.i, label %bb3.i21.i

bb1.i18.i:                                        ; preds = %bb.i15.i
  %.sum.i16.i = add i32 %80, -1                   ; <i32> [#uses=1]
  %82 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum.i16.i ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4                    ; <i32> [#uses=1]
  %84 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %83 ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4                    ; <i32> [#uses=1]
  %86 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %80 ; <i32*> [#uses=1]
  %87 = load i32* %86, align 4                    ; <i32> [#uses=1]
  %88 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %87 ; <i32*> [#uses=1]
  %89 = load i32* %88, align 4                    ; <i32> [#uses=1]
  %90 = icmp ugt i32 %85, %89                     ; <i1> [#uses=1]
  %91 = zext i1 %90 to i32                        ; <i32> [#uses=1]
  %..i17.i = or i32 %91, %80                      ; <i32> [#uses=1]
  br label %bb3.i21.i

bb3.i21.i:                                        ; preds = %bb1.i18.i, %bb.i15.i
  %j.0.i19.i = phi i32 [ %..i17.i, %bb1.i18.i ], [ %80, %bb.i15.i ] ; <i32> [#uses=2]
  %92 = load i32* %79, align 4                    ; <i32> [#uses=1]
  %.sum3.i20.i = add i32 %j.0.i19.i, -1           ; <i32> [#uses=1]
  %93 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum3.i20.i ; <i32*> [#uses=1]
  %94 = load i32* %93, align 4                    ; <i32> [#uses=2]
  %95 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %94 ; <i32*> [#uses=1]
  %96 = load i32* %95, align 4                    ; <i32> [#uses=1]
  %97 = icmp ult i32 %92, %96                     ; <i1> [#uses=1]
  br i1 %97, label %heap_adjust.exit27.i, label %bb4.i23.i

bb4.i23.i:                                        ; preds = %bb3.i21.i
  %.sum1.i22.i = add i32 %k_addr.0.i24.i, -1      ; <i32> [#uses=1]
  %98 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum1.i22.i ; <i32*> [#uses=1]
  store i32 %94, i32* %98, align 4
  br label %bb5.i25.i

bb5.i25.i:                                        ; preds = %bb4.i23.i, %bb21.i
  %k_addr.0.i24.i = phi i32 [ 1, %bb21.i ], [ %j.0.i19.i, %bb4.i23.i ] ; <i32> [#uses=4]
  %99 = icmp slt i32 %78, %k_addr.0.i24.i         ; <i1> [#uses=1]
  br i1 %99, label %heap_adjust.exit27.i, label %bb.i15.i

heap_adjust.exit27.i:                             ; preds = %bb5.i25.i, %bb3.i21.i
  %.sum4.i26.i = add i32 %k_addr.0.i24.i, -1      ; <i32> [#uses=1]
  %100 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum4.i26.i ; <i32*> [#uses=1]
  store i32 %77, i32* %100, align 4
  %101 = load i32* %234, align 4                  ; <i32> [#uses=2]
  %102 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %101 ; <i32*> [#uses=1]
  %103 = load i32* %102, align 4                  ; <i32> [#uses=1]
  %104 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %76 ; <i32*> [#uses=1]
  %105 = load i32* %104, align 4                  ; <i32> [#uses=1]
  %106 = add i32 %105, %103                       ; <i32> [#uses=2]
  store i32 %106, i32* %scevgep139.i, align 4
  %107 = getelementptr inbounds [512 x i32]* %link.i, i32 0, i32 %76 ; <i32*> [#uses=1]
  store i32 %tmp137.i, i32* %107, align 4
  %108 = getelementptr inbounds [512 x i32]* %link.i, i32 0, i32 %101 ; <i32*> [#uses=1]
  store i32 %tmp133.i, i32* %108, align 4
  store i32 %tmp137.i, i32* %234, align 4
  br label %bb5.i12.i

bb.i2.i:                                          ; preds = %bb5.i12.i
  %109 = shl i32 %k_addr.0.i11.i, 1               ; <i32> [#uses=5]
  %110 = icmp slt i32 %109, %tmp135.i             ; <i1> [#uses=1]
  br i1 %110, label %bb1.i5.i, label %bb3.i8.i

bb1.i5.i:                                         ; preds = %bb.i2.i
  %.sum.i3.i = add i32 %109, -1                   ; <i32> [#uses=1]
  %111 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum.i3.i ; <i32*> [#uses=1]
  %112 = load i32* %111, align 4                  ; <i32> [#uses=1]
  %113 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %112 ; <i32*> [#uses=1]
  %114 = load i32* %113, align 4                  ; <i32> [#uses=1]
  %115 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %109 ; <i32*> [#uses=1]
  %116 = load i32* %115, align 4                  ; <i32> [#uses=1]
  %117 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %116 ; <i32*> [#uses=1]
  %118 = load i32* %117, align 4                  ; <i32> [#uses=1]
  %119 = icmp ugt i32 %114, %118                  ; <i1> [#uses=1]
  %120 = zext i1 %119 to i32                      ; <i32> [#uses=1]
  %..i4.i = or i32 %120, %109                     ; <i32> [#uses=1]
  br label %bb3.i8.i

bb3.i8.i:                                         ; preds = %bb1.i5.i, %bb.i2.i
  %j.0.i6.i = phi i32 [ %..i4.i, %bb1.i5.i ], [ %109, %bb.i2.i ] ; <i32> [#uses=2]
  %.sum3.i7.i = add i32 %j.0.i6.i, -1             ; <i32> [#uses=1]
  %121 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum3.i7.i ; <i32*> [#uses=1]
  %122 = load i32* %121, align 4                  ; <i32> [#uses=2]
  %123 = getelementptr inbounds [512 x i32]* %freq.i, i32 0, i32 %122 ; <i32*> [#uses=1]
  %124 = load i32* %123, align 4                  ; <i32> [#uses=1]
  %125 = icmp ult i32 %106, %124                  ; <i1> [#uses=1]
  br i1 %125, label %heap_adjust.exit14.i, label %bb4.i10.i

bb4.i10.i:                                        ; preds = %bb3.i8.i
  %.sum1.i9.i = add i32 %k_addr.0.i11.i, -1       ; <i32> [#uses=1]
  %126 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum1.i9.i ; <i32*> [#uses=1]
  store i32 %122, i32* %126, align 4
  br label %bb5.i12.i

bb5.i12.i:                                        ; preds = %bb4.i10.i, %heap_adjust.exit27.i
  %k_addr.0.i11.i = phi i32 [ 1, %heap_adjust.exit27.i ], [ %j.0.i6.i, %bb4.i10.i ] ; <i32> [#uses=4]
  %127 = icmp slt i32 %78, %k_addr.0.i11.i        ; <i1> [#uses=1]
  br i1 %127, label %heap_adjust.exit14.i, label %bb.i2.i

heap_adjust.exit14.i:                             ; preds = %bb5.i12.i, %bb3.i8.i
  %.sum4.i13.i = add i32 %k_addr.0.i11.i, -1      ; <i32> [#uses=1]
  %128 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 %.sum4.i13.i ; <i32*> [#uses=1]
  store i32 %tmp137.i, i32* %128, align 4
  %indvar.next128.i = add i32 %indvar127.i, 1     ; <i32> [#uses=2]
  %exitcond130.i = icmp eq i32 %indvar.next128.i, %tmp129.i ; <i1> [#uses=1]
  br i1 %exitcond130.i, label %bb27.i, label %bb21.i

bb26.loopexit.i:                                  ; preds = %bb20.loopexit.i, %heap_adjust.exit.i
  %129 = icmp ugt i32 %n.0.i, 1                   ; <i1> [#uses=1]
  br i1 %129, label %bb.nph66.i, label %bb27.i

bb27.i:                                           ; preds = %bb26.loopexit.i, %heap_adjust.exit14.i
  %n.2.lcssa.i = phi i32 [ %n.0.i, %bb26.loopexit.i ], [ 1, %heap_adjust.exit14.i ] ; <i32> [#uses=1]
  %130 = add i32 %n.2.lcssa.i, 256                ; <i32> [#uses=1]
  %131 = getelementptr inbounds [512 x i32]* %link.i, i32 0, i32 %130 ; <i32*> [#uses=1]
  store i32 0, i32* %131, align 4
  br label %bb28.i

bb28.i:                                           ; preds = %bb39.i, %bb27.i
  %maxi.161.i = phi i32 [ 0, %bb27.i ], [ %maxi.0.i, %bb39.i ] ; <i32> [#uses=3]
  %maxx.260.i = phi i32 [ 0, %bb27.i ], [ %maxx.1.i, %bb39.i ] ; <i32> [#uses=3]
  %m.059.i = phi i32 [ 0, %bb27.i ], [ %143, %bb39.i ] ; <i32> [#uses=5]
  %scevgep122.i = getelementptr [512 x i32]* %freq.i, i32 0, i32 %m.059.i ; <i32*> [#uses=1]
  %scevgep123.i = getelementptr [256 x i32]* %code.i, i32 0, i32 %m.059.i ; <i32*> [#uses=2]
  %scevgep125.i = getelementptr [256 x i8]* %clen.i, i32 0, i32 %m.059.i ; <i8*> [#uses=2]
  %132 = load i32* %scevgep122.i, align 4         ; <i32> [#uses=1]
  %133 = icmp eq i32 %132, 0                      ; <i1> [#uses=1]
  br i1 %133, label %bb29.i, label %bb34.preheader.i

bb34.preheader.i:                                 ; preds = %bb28.i
  %l.1.in53.i = getelementptr [512 x i32]* %link.i, i32 0, i32 %m.059.i ; <i32*> [#uses=1]
  %l.154.i = load i32* %l.1.in53.i                ; <i32> [#uses=2]
  %134 = icmp eq i32 %l.154.i, 0                  ; <i1> [#uses=1]
  br i1 %134, label %bb35.i, label %bb31.i

bb29.i:                                           ; preds = %bb28.i
  store i32 0, i32* %scevgep123.i, align 4
  store i8 0, i8* %scevgep125.i, align 1
  br label %bb39.i

bb31.i:                                           ; preds = %bb31.i, %bb34.preheader.i
  %l.155.i = phi i32 [ %l.1.i, %bb31.i ], [ %l.154.i, %bb34.preheader.i ] ; <i32> [#uses=3]
  %i.352.i = phi i32 [ %tmp120.i, %bb31.i ], [ 0, %bb34.preheader.i ] ; <i32> [#uses=1]
  %j.051.i = phi i32 [ %137, %bb31.i ], [ 1, %bb34.preheader.i ] ; <i32> [#uses=2]
  %x.149.i = phi i32 [ %x.0.i, %bb31.i ], [ 0, %bb34.preheader.i ] ; <i32> [#uses=1]
  %tmp120.i = add i32 %i.352.i, 1                 ; <i32> [#uses=2]
  %135 = icmp slt i32 %l.155.i, 0                 ; <i1> [#uses=2]
  %136 = select i1 %135, i32 %j.051.i, i32 0      ; <i32> [#uses=1]
  %x.0.i = add i32 %136, %x.149.i                 ; <i32> [#uses=2]
  %137 = shl i32 %j.051.i, 1                      ; <i32> [#uses=1]
  %138 = sub i32 0, %l.155.i                      ; <i32> [#uses=1]
  %l.0.i = select i1 %135, i32 %138, i32 %l.155.i ; <i32> [#uses=1]
  %l.1.in.i = getelementptr inbounds [512 x i32]* %link.i, i32 0, i32 %l.0.i ; <i32*> [#uses=1]
  %l.1.i = load i32* %l.1.in.i                    ; <i32> [#uses=2]
  %139 = icmp eq i32 %l.1.i, 0                    ; <i1> [#uses=1]
  br i1 %139, label %bb35.i, label %bb31.i

bb35.i:                                           ; preds = %bb31.i, %bb34.preheader.i
  %i.3.lcssa.i = phi i32 [ 0, %bb34.preheader.i ], [ %tmp120.i, %bb31.i ] ; <i32> [#uses=3]
  %x.1.lcssa.i = phi i32 [ 0, %bb34.preheader.i ], [ %x.0.i, %bb31.i ] ; <i32> [#uses=3]
  store i32 %x.1.lcssa.i, i32* %scevgep123.i, align 4
  %140 = trunc i32 %i.3.lcssa.i to i8             ; <i8> [#uses=1]
  store i8 %140, i8* %scevgep125.i, align 1
  %141 = icmp ugt i32 %x.1.lcssa.i, %maxx.260.i   ; <i1> [#uses=1]
  %maxx.0.i = select i1 %141, i32 %x.1.lcssa.i, i32 %maxx.260.i ; <i32> [#uses=2]
  %142 = icmp ugt i32 %i.3.lcssa.i, %maxi.161.i   ; <i1> [#uses=1]
  br i1 %142, label %bb38.i, label %bb39.i

bb38.i:                                           ; preds = %bb35.i
  br label %bb39.i

bb39.i:                                           ; preds = %bb38.i, %bb35.i, %bb29.i
  %maxx.1.i = phi i32 [ %maxx.260.i, %bb29.i ], [ %maxx.0.i, %bb38.i ], [ %maxx.0.i, %bb35.i ] ; <i32> [#uses=2]
  %maxi.0.i = phi i32 [ %maxi.161.i, %bb29.i ], [ %i.3.lcssa.i, %bb38.i ], [ %maxi.161.i, %bb35.i ] ; <i32> [#uses=2]
  %143 = add i32 %m.059.i, 1                      ; <i32> [#uses=2]
  %exitcond121.i = icmp eq i32 %143, 256          ; <i1> [#uses=1]
  br i1 %exitcond121.i, label %bb41.i, label %bb28.i

bb41.i:                                           ; preds = %bb39.i
  %144 = icmp ugt i32 %maxi.0.i, 32               ; <i1> [#uses=1]
  br i1 %144, label %bb42.i, label %bb43.i

bb42.i:                                           ; preds = %bb41.i
  %145 = load %struct._IO_FILE** @stderr, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %146 = bitcast %struct._IO_FILE* %145 to i8*    ; <i8*> [#uses=1]
  %147 = call i32 @fwrite(i8* getelementptr inbounds ([26 x i8]* @.str1, i32 0, i32 0), i32 1, i32 25, i8* %146) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb43.i:                                           ; preds = %bb41.i
  %148 = icmp eq i32 %maxx.1.i, 0                 ; <i1> [#uses=1]
  br i1 %148, label %bb44.i, label %bb57.i

bb44.i:                                           ; preds = %bb43.i
  %149 = load %struct._IO_FILE** @stderr, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %150 = bitcast %struct._IO_FILE* %149 to i8*    ; <i8*> [#uses=1]
  %151 = call i32 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str2, i32 0, i32 0), i32 1, i32 32, i8* %150) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb46.i:                                           ; preds = %bb57.i
  %dptr.1.i = getelementptr [10000000 x i8]* %22, i32 0, i32 %177 ; <i8*> [#uses=1]
  %152 = load i8* %dptr.1.i, align 1              ; <i8> [#uses=1]
  %153 = zext i8 %152 to i32                      ; <i32> [#uses=2]
  %154 = getelementptr inbounds [256 x i8]* %clen.i, i32 0, i32 %153 ; <i8*> [#uses=1]
  %155 = load i8* %154, align 1                   ; <i8> [#uses=1]
  %156 = zext i8 %155 to i32                      ; <i32> [#uses=2]
  %157 = add i32 %156, -1                         ; <i32> [#uses=1]
  %158 = shl i32 1, %157                          ; <i32> [#uses=1]
  %159 = getelementptr inbounds [256 x i32]* %code.i, i32 0, i32 %153 ; <i32*> [#uses=1]
  br label %bb55.i

bb47.i:                                           ; preds = %bb55.i
  %160 = icmp eq i32 %bit.1.i, 7                  ; <i1> [#uses=1]
  br i1 %160, label %bb48.i, label %bb51.i

bb48.i:                                           ; preds = %bb47.i
  %161 = getelementptr inbounds [10000001 x i8]* %38, i32 0, i32 %comp_len.1.i ; <i8*> [#uses=1]
  store i8 %bout.1.i, i8* %161, align 1
  %162 = add i32 %comp_len.1.i, 1                 ; <i32> [#uses=2]
  %163 = icmp eq i32 %162, 10000000               ; <i1> [#uses=1]
  br i1 %163, label %bb49.i, label %bb52.i

bb49.i:                                           ; preds = %bb48.i
  %164 = load %struct._IO_FILE** @stderr, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %165 = bitcast %struct._IO_FILE* %164 to i8*    ; <i8*> [#uses=1]
  %166 = call i32 @fwrite(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 1, i32 22, i8* %165) nounwind ; <i32> [#uses=0]
  call void @exit(i32 1) noreturn nounwind
  unreachable

bb51.i:                                           ; preds = %bb47.i
  %167 = add i32 %bit.1.i, 1                      ; <i32> [#uses=1]
  %168 = shl i8 %bout.1.i, 1                      ; <i8> [#uses=1]
  br label %bb52.i

bb52.i:                                           ; preds = %bb51.i, %bb48.i
  %comp_len.0.i = phi i32 [ %comp_len.1.i, %bb51.i ], [ %162, %bb48.i ] ; <i32> [#uses=1]
  %bout.0.i = phi i8 [ %168, %bb51.i ], [ 0, %bb48.i ] ; <i8> [#uses=1]
  %bit.0.i = phi i32 [ %167, %bb51.i ], [ 0, %bb48.i ] ; <i32> [#uses=1]
  %169 = load i32* %159, align 4                  ; <i32> [#uses=1]
  %170 = and i32 %169, %mask.0.i                  ; <i32> [#uses=1]
  %not..i = icmp ne i32 %170, 0                   ; <i1> [#uses=1]
  %171 = zext i1 %not..i to i8                    ; <i8> [#uses=1]
  %bout.3.i = or i8 %171, %bout.0.i               ; <i8> [#uses=1]
  %172 = lshr i32 %mask.0.i, 1                    ; <i32> [#uses=1]
  %173 = add i32 %174, 1                          ; <i32> [#uses=1]
  br label %bb55.i

bb55.i:                                           ; preds = %bb52.i, %bb46.i
  %mask.0.i = phi i32 [ %158, %bb46.i ], [ %172, %bb52.i ] ; <i32> [#uses=2]
  %comp_len.1.i = phi i32 [ %comp_len.2.i, %bb46.i ], [ %comp_len.0.i, %bb52.i ] ; <i32> [#uses=4]
  %bout.1.i = phi i8 [ %bout.2.i, %bb46.i ], [ %bout.3.i, %bb52.i ] ; <i8> [#uses=3]
  %bit.1.i = phi i32 [ %bit.2.i, %bb46.i ], [ %bit.0.i, %bb52.i ] ; <i32> [#uses=3]
  %174 = phi i32 [ 0, %bb46.i ], [ %173, %bb52.i ] ; <i32> [#uses=2]
  %175 = icmp ugt i32 %156, %174                  ; <i1> [#uses=1]
  br i1 %175, label %bb47.i, label %bb56.i

bb56.i:                                           ; preds = %bb55.i
  %176 = add i32 %177, 1                          ; <i32> [#uses=1]
  br label %bb57.i

bb57.i:                                           ; preds = %bb56.i, %bb43.i
  %comp_len.2.i = phi i32 [ %comp_len.1.i, %bb56.i ], [ 0, %bb43.i ] ; <i32> [#uses=2]
  %bout.2.i = phi i8 [ %bout.1.i, %bb56.i ], [ 0, %bb43.i ] ; <i8> [#uses=2]
  %bit.2.i = phi i32 [ %bit.1.i, %bb56.i ], [ -1, %bb43.i ] ; <i32> [#uses=2]
  %177 = phi i32 [ %176, %bb56.i ], [ 0, %bb43.i ] ; <i32> [#uses=3]
  %178 = icmp ult i32 %177, 10000000              ; <i1> [#uses=1]
  br i1 %178, label %bb46.i, label %bb58.i

bb58.i:                                           ; preds = %bb57.i
  %179 = sext i8 %bout.2.i to i32                 ; <i32> [#uses=1]
  %180 = sub i32 7, %bit.2.i                      ; <i32> [#uses=1]
  %181 = shl i32 %179, %180                       ; <i32> [#uses=1]
  %182 = trunc i32 %181 to i8                     ; <i8> [#uses=1]
  %183 = getelementptr inbounds [10000001 x i8]* %38, i32 0, i32 %comp_len.2.i ; <i8*> [#uses=1]
  store i8 %182, i8* %183, align 1
  call void @llvm.memset.i32(i8* %heap25960.i, i8 0, i32 1024, i32 4) nounwind
  br label %bb62.i

bb62.i:                                           ; preds = %bb69.i, %bb58.i
  %j.241.i = phi i32 [ 0, %bb58.i ], [ %199, %bb69.i ] ; <i32> [#uses=6]
  %tmp107.i = trunc i32 %j.241.i to i8            ; <i8> [#uses=1]
  %scevgep108.i = getelementptr [256 x i32]* %code.i, i32 0, i32 %j.241.i ; <i32*> [#uses=1]
  %scevgep109.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %j.241.i ; <i32*> [#uses=1]
  %scevgep110.i = getelementptr [256 x i8]* %clen.i, i32 0, i32 %j.241.i ; <i8*> [#uses=1]
  %optr.040.i = getelementptr [256 x i8]* %outc.i, i32 0, i32 %j.241.i ; <i8*> [#uses=1]
  store i8 %tmp107.i, i8* %optr.040.i, align 1
  %184 = load i32* %scevgep108.i, align 4         ; <i32> [#uses=2]
  %185 = load i8* %scevgep110.i, align 1          ; <i8> [#uses=2]
  %186 = zext i8 %185 to i32                      ; <i32> [#uses=4]
  %187 = or i32 %186, %184                        ; <i32> [#uses=1]
  %188 = icmp eq i32 %187, 0                      ; <i1> [#uses=1]
  br i1 %188, label %bb69.i, label %bb63.i

bb63.i:                                           ; preds = %bb62.i
  %189 = add i32 %186, -1                         ; <i32> [#uses=1]
  %190 = shl i32 1, %189                          ; <i32> [#uses=1]
  %191 = icmp eq i8 %185, 0                       ; <i1> [#uses=1]
  br i1 %191, label %bb68.i, label %bb.nph38.i

bb.nph38.i:                                       ; preds = %bb63.i
  %tmp104.i = icmp ugt i32 %186, 1                ; <i1> [#uses=1]
  %umax.i = select i1 %tmp104.i, i32 %186, i32 1  ; <i32> [#uses=1]
  br label %bb64.i

bb64.i:                                           ; preds = %bb64.i, %bb.nph38.i
  %i.537.i = phi i32 [ 0, %bb.nph38.i ], [ %198, %bb64.i ] ; <i32> [#uses=1]
  %mask.136.i = phi i32 [ %190, %bb.nph38.i ], [ %197, %bb64.i ] ; <i32> [#uses=2]
  %k.035.i = phi i32 [ 0, %bb.nph38.i ], [ %..i, %bb64.i ] ; <i32> [#uses=1]
  %192 = shl i32 %k.035.i, 1                      ; <i32> [#uses=2]
  %193 = or i32 %192, 1                           ; <i32> [#uses=1]
  %194 = and i32 %184, %mask.136.i                ; <i32> [#uses=1]
  %195 = add i32 %192, 2                          ; <i32> [#uses=1]
  %196 = icmp eq i32 %194, 0                      ; <i1> [#uses=1]
  %..i = select i1 %196, i32 %193, i32 %195       ; <i32> [#uses=2]
  %197 = lshr i32 %mask.136.i, 1                  ; <i32> [#uses=1]
  %198 = add i32 %i.537.i, 1                      ; <i32> [#uses=2]
  %exitcond105.i = icmp eq i32 %198, %umax.i      ; <i1> [#uses=1]
  br i1 %exitcond105.i, label %bb68.i, label %bb64.i

bb68.i:                                           ; preds = %bb64.i, %bb63.i
  %k.0.lcssa.i = phi i32 [ 0, %bb63.i ], [ %..i, %bb64.i ] ; <i32> [#uses=1]
  store i32 %k.0.lcssa.i, i32* %scevgep109.i, align 4
  br label %bb69.i

bb69.i:                                           ; preds = %bb68.i, %bb62.i
  %199 = add i32 %j.241.i, 1                      ; <i32> [#uses=2]
  %exitcond106.i = icmp eq i32 %199, 256          ; <i1> [#uses=1]
  br i1 %exitcond106.i, label %bb72.i, label %bb62.i

bb72.i:                                           ; preds = %bb76.i, %bb69.i
  %200 = phi i32 [ %tmp93.i, %bb76.i ], [ 0, %bb69.i ] ; <i32> [#uses=2]
  %tmp93.i = add i32 %200, 1                      ; <i32> [#uses=6]
  %scevgep101.i = getelementptr [256 x i8]* %outc.i, i32 0, i32 %tmp93.i ; <i8*> [#uses=1]
  %scevgep102.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %tmp93.i ; <i32*> [#uses=1]
  %201 = load i32* %scevgep102.i, align 4         ; <i32> [#uses=2]
  %202 = load i8* %scevgep101.i, align 1          ; <i8> [#uses=1]
  br label %bb74.i

bb73.i:                                           ; preds = %bb75.i
  store i32 %205, i32* %scevgep99.i, align 4
  %203 = load i8* %scevgep96.i, align 1           ; <i8> [#uses=1]
  store i8 %203, i8* %scevgep97.i, align 1
  %indvar.next89.i = add i32 %indvar88.i, 1       ; <i32> [#uses=1]
  br label %bb74.i

bb74.i:                                           ; preds = %bb73.i, %bb72.i
  %indvar88.i = phi i32 [ 0, %bb72.i ], [ %indvar.next89.i, %bb73.i ] ; <i32> [#uses=4]
  %j.3.i = sub i32 %tmp93.i, %indvar88.i          ; <i32> [#uses=2]
  %tmp95.i = sub i32 %200, %indvar88.i            ; <i32> [#uses=2]
  %scevgep96.i = getelementptr [256 x i8]* %outc.i, i32 0, i32 %tmp95.i ; <i8*> [#uses=1]
  %scevgep97.i = getelementptr [256 x i8]* %outc.i, i32 0, i32 %j.3.i ; <i8*> [#uses=2]
  %scevgep99.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %j.3.i ; <i32*> [#uses=2]
  %204 = icmp eq i32 %indvar88.i, %tmp93.i        ; <i1> [#uses=1]
  br i1 %204, label %bb76.i, label %bb75.i

bb75.i:                                           ; preds = %bb74.i
  %scevgep98.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %tmp95.i ; <i32*> [#uses=1]
  %205 = load i32* %scevgep98.i, align 4          ; <i32> [#uses=2]
  %206 = icmp ugt i32 %205, %201                  ; <i1> [#uses=1]
  br i1 %206, label %bb73.i, label %bb76.i

bb76.i:                                           ; preds = %bb75.i, %bb74.i
  store i32 %201, i32* %scevgep99.i, align 4
  store i8 %202, i8* %scevgep97.i, align 1
  %exitcond.i = icmp eq i32 %tmp93.i, 255         ; <i1> [#uses=1]
  br i1 %exitcond.i, label %bb80.loopexit.i, label %bb72.i

bb79.i:                                           ; preds = %bb80.loopexit.i, %bb79.i
  %j.430.i = phi i32 [ %tmp86.i, %bb79.i ], [ 0, %bb80.loopexit.i ] ; <i32> [#uses=1]
  %tmp86.i = add i32 %j.430.i, 1                  ; <i32> [#uses=3]
  %scevgep87.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %tmp86.i ; <i32*> [#uses=1]
  %207 = load i32* %scevgep87.i, align 4          ; <i32> [#uses=1]
  %208 = icmp eq i32 %207, 0                      ; <i1> [#uses=1]
  br i1 %208, label %bb79.i, label %bb91.loopexit.i

bb80.loopexit.i:                                  ; preds = %bb76.i
  %209 = load i32* %235, align 4                  ; <i32> [#uses=1]
  %210 = icmp eq i32 %209, 0                      ; <i1> [#uses=1]
  br i1 %210, label %bb79.i, label %bb91.loopexit.i

bb82.i:                                           ; preds = %bb91.i
  %211 = shl i32 %k.2.i, 1                        ; <i32> [#uses=2]
  %212 = or i32 %211, 1                           ; <i32> [#uses=1]
  %213 = load i8* %cptr.0.ph.i, align 1           ; <i8> [#uses=1]
  %214 = zext i8 %213 to i32                      ; <i32> [#uses=1]
  %215 = and i32 %214, %mask.2.i                  ; <i32> [#uses=1]
  %216 = add i32 %211, 2                          ; <i32> [#uses=1]
  %217 = icmp eq i32 %215, 0                      ; <i1> [#uses=1]
  %.1.i = select i1 %217, i32 %212, i32 %216      ; <i32> [#uses=4]
  %218 = getelementptr inbounds [256 x i32]* %heap2.i, i32 0, i32 %i.8.i ; <i32*> [#uses=1]
  %219 = load i32* %218, align 4                  ; <i32> [#uses=1]
  %220 = icmp ult i32 %219, %.1.i                 ; <i1> [#uses=1]
  br i1 %220, label %bb.nph.i, label %bb86.i

bb.nph.i:                                         ; preds = %bb82.i
  %tmp.i = add i32 %i.8.i, 1                      ; <i32> [#uses=1]
  br label %bb84.i

bb84.i:                                           ; preds = %bb84.i, %bb.nph.i
  %indvar.i = phi i32 [ 0, %bb.nph.i ], [ %indvar.next.i, %bb84.i ] ; <i32> [#uses=2]
  %tmp81.i = add i32 %indvar.i, %tmp.i            ; <i32> [#uses=2]
  %scevgep.i = getelementptr [256 x i32]* %heap2.i, i32 0, i32 %tmp81.i ; <i32*> [#uses=1]
  %221 = load i32* %scevgep.i, align 4            ; <i32> [#uses=1]
  %222 = icmp ult i32 %221, %.1.i                 ; <i1> [#uses=1]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=1]
  br i1 %222, label %bb84.i, label %bb86.i

bb86.i:                                           ; preds = %bb84.i, %bb82.i
  %i.7.lcssa.i = phi i32 [ %i.8.i, %bb82.i ], [ %tmp81.i, %bb84.i ] ; <i32> [#uses=3]
  %223 = getelementptr inbounds [256 x i32]* %heap2.i, i32 0, i32 %i.7.lcssa.i ; <i32*> [#uses=1]
  %224 = load i32* %223, align 4                  ; <i32> [#uses=1]
  %225 = icmp eq i32 %224, %.1.i                  ; <i1> [#uses=1]
  br i1 %225, label %bb87.i, label %bb88.i

bb87.i:                                           ; preds = %bb86.i
  %226 = getelementptr inbounds [256 x i8]* %outc.i, i32 0, i32 %i.7.lcssa.i ; <i8*> [#uses=1]
  %227 = load i8* %226, align 1                   ; <i8> [#uses=1]
  store i8 %227, i8* %dptr.3.i, align 1
  %228 = getelementptr inbounds i8* %dptr.3.i, i32 1 ; <i8*> [#uses=1]
  %229 = add i32 %n.4.i, 1                        ; <i32> [#uses=1]
  br label %bb88.i

bb88.i:                                           ; preds = %bb87.i, %bb86.i
  %k.4.i = phi i32 [ 0, %bb87.i ], [ %.1.i, %bb86.i ] ; <i32> [#uses=2]
  %dptr.2.i = phi i8* [ %228, %bb87.i ], [ %dptr.3.i, %bb86.i ] ; <i8*> [#uses=2]
  %n.3.i = phi i32 [ %229, %bb87.i ], [ %n.4.i, %bb86.i ] ; <i32> [#uses=2]
  %i.9.i = phi i32 [ %j.4.lcssa.i, %bb87.i ], [ %i.7.lcssa.i, %bb86.i ] ; <i32> [#uses=2]
  %230 = icmp ugt i32 %mask.2.i, 1                ; <i1> [#uses=1]
  br i1 %230, label %bb89.i, label %bb90.i

bb89.i:                                           ; preds = %bb88.i
  %231 = lshr i32 %mask.2.i, 1                    ; <i32> [#uses=1]
  br label %bb91.i

bb90.i:                                           ; preds = %bb88.i
  %indvar.next83.i = add i32 %indvar82.i, 1       ; <i32> [#uses=1]
  br label %bb91.outer.i

bb91.loopexit.i:                                  ; preds = %bb80.loopexit.i, %bb79.i
  %j.4.lcssa.i = phi i32 [ 0, %bb80.loopexit.i ], [ %tmp86.i, %bb79.i ] ; <i32> [#uses=2]
  br label %bb91.outer.i

bb91.outer.i:                                     ; preds = %bb91.loopexit.i, %bb90.i
  %indvar82.i = phi i32 [ 0, %bb91.loopexit.i ], [ %indvar.next83.i, %bb90.i ] ; <i32> [#uses=2]
  %k.2.ph.i = phi i32 [ %k.4.i, %bb90.i ], [ 0, %bb91.loopexit.i ] ; <i32> [#uses=1]
  %dptr.3.ph.i = phi i8* [ %dptr.2.i, %bb90.i ], [ %.sub, %bb91.loopexit.i ] ; <i8*> [#uses=1]
  %n.4.ph.i = phi i32 [ %n.3.i, %bb90.i ], [ 0, %bb91.loopexit.i ] ; <i32> [#uses=1]
  %i.8.ph.i = phi i32 [ %i.9.i, %bb90.i ], [ %j.4.lcssa.i, %bb91.loopexit.i ] ; <i32> [#uses=1]
  %cptr.0.ph.i = getelementptr [10000001 x i8]* %38, i32 0, i32 %indvar82.i ; <i8*> [#uses=1]
  br label %bb91.i

bb91.i:                                           ; preds = %bb91.outer.i, %bb89.i
  %k.2.i = phi i32 [ %k.4.i, %bb89.i ], [ %k.2.ph.i, %bb91.outer.i ] ; <i32> [#uses=1]
  %dptr.3.i = phi i8* [ %dptr.2.i, %bb89.i ], [ %dptr.3.ph.i, %bb91.outer.i ] ; <i8*> [#uses=3]
  %mask.2.i = phi i32 [ %231, %bb89.i ], [ 128, %bb91.outer.i ] ; <i32> [#uses=3]
  %n.4.i = phi i32 [ %n.3.i, %bb89.i ], [ %n.4.ph.i, %bb91.outer.i ] ; <i32> [#uses=3]
  %i.8.i = phi i32 [ %i.9.i, %bb89.i ], [ %i.8.ph.i, %bb91.outer.i ] ; <i32> [#uses=3]
  %232 = icmp ult i32 %n.4.i, 10000000            ; <i1> [#uses=1]
  br i1 %232, label %bb82.i, label %compdecomp.exit

compdecomp.exit:                                  ; preds = %bb91.i
  free [10000001 x i8]* %38
  %233 = add nsw i32 %i.11, 1                     ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %233, 30                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb24, label %bb22

bb23.loopexit:                                    ; preds = %bb.i
  %.sub = getelementptr inbounds [10000000 x i8]* %22, i32 0, i32 0 ; <i8*> [#uses=1]
  %freq12.i = bitcast [512 x i32]* %freq.i to i8* ; <i8*> [#uses=1]
  %heap34.i = bitcast [256 x i32]* %heap.i to i8* ; <i8*> [#uses=1]
  %link56.i = bitcast [512 x i32]* %link.i to i8* ; <i8*> [#uses=1]
  %code78.i = bitcast [256 x i32]* %code.i to i8* ; <i8*> [#uses=1]
  %clen9.i = getelementptr inbounds [256 x i8]* %clen.i, i32 0, i32 0 ; <i8*> [#uses=1]
  %234 = getelementptr inbounds [256 x i32]* %heap.i, i32 0, i32 0 ; <i32*> [#uses=4]
  %heap25960.i = bitcast [256 x i32]* %heap2.i to i8* ; <i8*> [#uses=1]
  %235 = getelementptr inbounds [256 x i32]* %heap2.i, i32 0, i32 0 ; <i32*> [#uses=1]
  br label %bb22

bb24:                                             ; preds = %compdecomp.exit
  free [10000000 x i8]* %22
  %toBool25 = icmp eq i8 %ga_testing.0, 0         ; <i1> [#uses=1]
  %236 = load %struct._IO_FILE** @stdout, align 4 ; <%struct._IO_FILE*> [#uses=2]
  br i1 %toBool25, label %bb27, label %bb26

bb26:                                             ; preds = %bb24
  %237 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %236, i8* noalias getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), double 0.000000e+00) nounwind ; <i32> [#uses=0]
  br label %bb28

bb27:                                             ; preds = %bb24
  %238 = tail call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* noalias %236, i8* noalias getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0), double 0.000000e+00) nounwind ; <i32> [#uses=0]
  br label %bb28

bb28:                                             ; preds = %bb27, %bb26
  %239 = load %struct._IO_FILE** @stdout, align 4 ; <%struct._IO_FILE*> [#uses=1]
  %240 = tail call i32 @fflush(%struct._IO_FILE* %239) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @fprintf(%struct._IO_FILE* noalias nocapture, i8* noalias nocapture, ...) nounwind

declare i32 @fflush(%struct._IO_FILE* nocapture) nounwind
