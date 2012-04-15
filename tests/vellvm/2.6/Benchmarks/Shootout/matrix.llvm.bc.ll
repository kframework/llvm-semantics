; ModuleID = 'matrix.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [13 x i8] c"%d %d %d %d\0A\00", align 1 ; <[13 x i8]*> [#uses=1]

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %0 = icmp eq i32 %argc, 2                       ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb2

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 1   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %3 = tail call i32 @strtol(i8* noalias nocapture %2, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb, %entry
  %iftmp.19.0 = phi i32 [ %3, %bb ], [ 3000000, %entry ] ; <i32> [#uses=2]
  %4 = malloc [10 x i32*]                         ; <[10 x i32*]*> [#uses=13]
  br label %bb.us.i35

bb.us.i35:                                        ; preds = %bb.us.i35, %bb2
  %i.05.us.i32 = phi i32 [ 0, %bb2 ], [ %6, %bb.us.i35 ] ; <i32> [#uses=3]
  %tmp81 = mul i32 %i.05.us.i32, 10               ; <i32> [#uses=10]
  %scevgep9.i34 = getelementptr [10 x i32*]* %4, i32 0, i32 %i.05.us.i32 ; <i32**> [#uses=1]
  %5 = malloc [10 x i32]                          ; <[10 x i32]*> [#uses=10]
  %.sub48 = getelementptr inbounds [10 x i32]* %5, i32 0, i32 0 ; <i32*> [#uses=2]
  store i32* %.sub48, i32** %scevgep9.i34, align 4
  %count.01.us.i3785 = or i32 %tmp81, 1           ; <i32> [#uses=1]
  store i32 %count.01.us.i3785, i32* %.sub48, align 4
  %count.01.us.i37.1 = add i32 %tmp81, 2          ; <i32> [#uses=1]
  %scevgep.i38.1 = getelementptr [10 x i32]* %5, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.1, i32* %scevgep.i38.1, align 4
  %count.01.us.i37.2 = add i32 %tmp81, 3          ; <i32> [#uses=1]
  %scevgep.i38.2 = getelementptr [10 x i32]* %5, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.2, i32* %scevgep.i38.2, align 4
  %count.01.us.i37.3 = add i32 %tmp81, 4          ; <i32> [#uses=1]
  %scevgep.i38.3 = getelementptr [10 x i32]* %5, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.3, i32* %scevgep.i38.3, align 4
  %count.01.us.i37.4 = add i32 %tmp81, 5          ; <i32> [#uses=1]
  %scevgep.i38.4 = getelementptr [10 x i32]* %5, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.4, i32* %scevgep.i38.4, align 4
  %count.01.us.i37.5 = add i32 %tmp81, 6          ; <i32> [#uses=1]
  %scevgep.i38.5 = getelementptr [10 x i32]* %5, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.5, i32* %scevgep.i38.5, align 4
  %count.01.us.i37.6 = add i32 %tmp81, 7          ; <i32> [#uses=1]
  %scevgep.i38.6 = getelementptr [10 x i32]* %5, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.6, i32* %scevgep.i38.6, align 4
  %count.01.us.i37.7 = add i32 %tmp81, 8          ; <i32> [#uses=1]
  %scevgep.i38.7 = getelementptr [10 x i32]* %5, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.7, i32* %scevgep.i38.7, align 4
  %count.01.us.i37.8 = add i32 %tmp81, 9          ; <i32> [#uses=1]
  %scevgep.i38.8 = getelementptr [10 x i32]* %5, i32 0, i32 8 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.8, i32* %scevgep.i38.8, align 4
  %count.01.us.i37.9 = add i32 %tmp81, 10         ; <i32> [#uses=1]
  %scevgep.i38.9 = getelementptr [10 x i32]* %5, i32 0, i32 9 ; <i32*> [#uses=1]
  store i32 %count.01.us.i37.9, i32* %scevgep.i38.9, align 4
  %6 = add nsw i32 %i.05.us.i32, 1                ; <i32> [#uses=2]
  %exitcond80 = icmp eq i32 %6, 10                ; <i1> [#uses=1]
  br i1 %exitcond80, label %mkmatrix.exit44, label %bb.us.i35

mkmatrix.exit44:                                  ; preds = %bb.us.i35
  %7 = malloc [10 x i32*]                         ; <[10 x i32*]*> [#uses=22]
  br label %bb.us.i22

bb.us.i22:                                        ; preds = %bb.us.i22, %mkmatrix.exit44
  %i.05.us.i19 = phi i32 [ 0, %mkmatrix.exit44 ], [ %9, %bb.us.i22 ] ; <i32> [#uses=3]
  %tmp74 = mul i32 %i.05.us.i19, 10               ; <i32> [#uses=10]
  %scevgep9.i21 = getelementptr [10 x i32*]* %7, i32 0, i32 %i.05.us.i19 ; <i32**> [#uses=1]
  %8 = malloc [10 x i32]                          ; <[10 x i32]*> [#uses=10]
  %.sub46 = getelementptr inbounds [10 x i32]* %8, i32 0, i32 0 ; <i32*> [#uses=2]
  store i32* %.sub46, i32** %scevgep9.i21, align 4
  %count.01.us.i2484 = or i32 %tmp74, 1           ; <i32> [#uses=1]
  store i32 %count.01.us.i2484, i32* %.sub46, align 4
  %count.01.us.i24.1 = add i32 %tmp74, 2          ; <i32> [#uses=1]
  %scevgep.i25.1 = getelementptr [10 x i32]* %8, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.1, i32* %scevgep.i25.1, align 4
  %count.01.us.i24.2 = add i32 %tmp74, 3          ; <i32> [#uses=1]
  %scevgep.i25.2 = getelementptr [10 x i32]* %8, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.2, i32* %scevgep.i25.2, align 4
  %count.01.us.i24.3 = add i32 %tmp74, 4          ; <i32> [#uses=1]
  %scevgep.i25.3 = getelementptr [10 x i32]* %8, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.3, i32* %scevgep.i25.3, align 4
  %count.01.us.i24.4 = add i32 %tmp74, 5          ; <i32> [#uses=1]
  %scevgep.i25.4 = getelementptr [10 x i32]* %8, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.4, i32* %scevgep.i25.4, align 4
  %count.01.us.i24.5 = add i32 %tmp74, 6          ; <i32> [#uses=1]
  %scevgep.i25.5 = getelementptr [10 x i32]* %8, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.5, i32* %scevgep.i25.5, align 4
  %count.01.us.i24.6 = add i32 %tmp74, 7          ; <i32> [#uses=1]
  %scevgep.i25.6 = getelementptr [10 x i32]* %8, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.6, i32* %scevgep.i25.6, align 4
  %count.01.us.i24.7 = add i32 %tmp74, 8          ; <i32> [#uses=1]
  %scevgep.i25.7 = getelementptr [10 x i32]* %8, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.7, i32* %scevgep.i25.7, align 4
  %count.01.us.i24.8 = add i32 %tmp74, 9          ; <i32> [#uses=1]
  %scevgep.i25.8 = getelementptr [10 x i32]* %8, i32 0, i32 8 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.8, i32* %scevgep.i25.8, align 4
  %count.01.us.i24.9 = add i32 %tmp74, 10         ; <i32> [#uses=1]
  %scevgep.i25.9 = getelementptr [10 x i32]* %8, i32 0, i32 9 ; <i32*> [#uses=1]
  store i32 %count.01.us.i24.9, i32* %scevgep.i25.9, align 4
  %9 = add nsw i32 %i.05.us.i19, 1                ; <i32> [#uses=2]
  %exitcond73 = icmp eq i32 %9, 10                ; <i1> [#uses=1]
  br i1 %exitcond73, label %mkmatrix.exit31, label %bb.us.i22

mkmatrix.exit31:                                  ; preds = %bb.us.i22
  %10 = malloc [10 x i32*]                        ; <[10 x i32*]*> [#uses=13]
  br label %bb.us.i

bb.us.i:                                          ; preds = %bb.us.i, %mkmatrix.exit31
  %i.05.us.i = phi i32 [ 0, %mkmatrix.exit31 ], [ %12, %bb.us.i ] ; <i32> [#uses=3]
  %tmp67 = mul i32 %i.05.us.i, 10                 ; <i32> [#uses=10]
  %scevgep9.i = getelementptr [10 x i32*]* %10, i32 0, i32 %i.05.us.i ; <i32**> [#uses=1]
  %11 = malloc [10 x i32]                         ; <[10 x i32]*> [#uses=10]
  %.sub = getelementptr inbounds [10 x i32]* %11, i32 0, i32 0 ; <i32*> [#uses=2]
  store i32* %.sub, i32** %scevgep9.i, align 4
  %count.01.us.i83 = or i32 %tmp67, 1             ; <i32> [#uses=1]
  store i32 %count.01.us.i83, i32* %.sub, align 4
  %count.01.us.i.1 = add i32 %tmp67, 2            ; <i32> [#uses=1]
  %scevgep.i17.1 = getelementptr [10 x i32]* %11, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.1, i32* %scevgep.i17.1, align 4
  %count.01.us.i.2 = add i32 %tmp67, 3            ; <i32> [#uses=1]
  %scevgep.i17.2 = getelementptr [10 x i32]* %11, i32 0, i32 2 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.2, i32* %scevgep.i17.2, align 4
  %count.01.us.i.3 = add i32 %tmp67, 4            ; <i32> [#uses=1]
  %scevgep.i17.3 = getelementptr [10 x i32]* %11, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.3, i32* %scevgep.i17.3, align 4
  %count.01.us.i.4 = add i32 %tmp67, 5            ; <i32> [#uses=1]
  %scevgep.i17.4 = getelementptr [10 x i32]* %11, i32 0, i32 4 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.4, i32* %scevgep.i17.4, align 4
  %count.01.us.i.5 = add i32 %tmp67, 6            ; <i32> [#uses=1]
  %scevgep.i17.5 = getelementptr [10 x i32]* %11, i32 0, i32 5 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.5, i32* %scevgep.i17.5, align 4
  %count.01.us.i.6 = add i32 %tmp67, 7            ; <i32> [#uses=1]
  %scevgep.i17.6 = getelementptr [10 x i32]* %11, i32 0, i32 6 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.6, i32* %scevgep.i17.6, align 4
  %count.01.us.i.7 = add i32 %tmp67, 8            ; <i32> [#uses=1]
  %scevgep.i17.7 = getelementptr [10 x i32]* %11, i32 0, i32 7 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.7, i32* %scevgep.i17.7, align 4
  %count.01.us.i.8 = add i32 %tmp67, 9            ; <i32> [#uses=1]
  %scevgep.i17.8 = getelementptr [10 x i32]* %11, i32 0, i32 8 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.8, i32* %scevgep.i17.8, align 4
  %count.01.us.i.9 = add i32 %tmp67, 10           ; <i32> [#uses=1]
  %scevgep.i17.9 = getelementptr [10 x i32]* %11, i32 0, i32 9 ; <i32*> [#uses=1]
  store i32 %count.01.us.i.9, i32* %scevgep.i17.9, align 4
  %12 = add nsw i32 %i.05.us.i, 1                 ; <i32> [#uses=2]
  %exitcond66 = icmp eq i32 %12, 10               ; <i1> [#uses=1]
  br i1 %exitcond66, label %bb4.loopexit, label %bb.us.i

bb3.preheader.us.i:                               ; preds = %bb5.preheader.i, %bb3.preheader.us.i
  %j.04.us.i = phi i32 [ 0, %bb5.preheader.i ], [ %64, %bb3.preheader.us.i ] ; <i32> [#uses=12]
  %13 = load i32** %scevgep15.i, align 4          ; <i32*> [#uses=10]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = load i32** %scevgep.i15, align 4          ; <i32*> [#uses=1]
  %scevgep10.i = getelementptr i32* %15, i32 %j.04.us.i ; <i32*> [#uses=1]
  %16 = load i32* %scevgep10.i, align 4           ; <i32> [#uses=1]
  %17 = mul i32 %16, %14                          ; <i32> [#uses=1]
  %scevgep8.i.1 = getelementptr i32* %13, i32 1   ; <i32*> [#uses=1]
  %18 = load i32* %scevgep8.i.1, align 4          ; <i32> [#uses=1]
  %19 = load i32** %scevgep.i15.1, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.1 = getelementptr i32* %19, i32 %j.04.us.i ; <i32*> [#uses=1]
  %20 = load i32* %scevgep10.i.1, align 4         ; <i32> [#uses=1]
  %21 = mul i32 %20, %18                          ; <i32> [#uses=1]
  %22 = add nsw i32 %21, %17                      ; <i32> [#uses=1]
  %scevgep8.i.2 = getelementptr i32* %13, i32 2   ; <i32*> [#uses=1]
  %23 = load i32* %scevgep8.i.2, align 4          ; <i32> [#uses=1]
  %24 = load i32** %scevgep.i15.2, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.2 = getelementptr i32* %24, i32 %j.04.us.i ; <i32*> [#uses=1]
  %25 = load i32* %scevgep10.i.2, align 4         ; <i32> [#uses=1]
  %26 = mul i32 %25, %23                          ; <i32> [#uses=1]
  %27 = add nsw i32 %26, %22                      ; <i32> [#uses=1]
  %scevgep8.i.3 = getelementptr i32* %13, i32 3   ; <i32*> [#uses=1]
  %28 = load i32* %scevgep8.i.3, align 4          ; <i32> [#uses=1]
  %29 = load i32** %scevgep.i15.3, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.3 = getelementptr i32* %29, i32 %j.04.us.i ; <i32*> [#uses=1]
  %30 = load i32* %scevgep10.i.3, align 4         ; <i32> [#uses=1]
  %31 = mul i32 %30, %28                          ; <i32> [#uses=1]
  %32 = add nsw i32 %31, %27                      ; <i32> [#uses=1]
  %scevgep8.i.4 = getelementptr i32* %13, i32 4   ; <i32*> [#uses=1]
  %33 = load i32* %scevgep8.i.4, align 4          ; <i32> [#uses=1]
  %34 = load i32** %scevgep.i15.4, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.4 = getelementptr i32* %34, i32 %j.04.us.i ; <i32*> [#uses=1]
  %35 = load i32* %scevgep10.i.4, align 4         ; <i32> [#uses=1]
  %36 = mul i32 %35, %33                          ; <i32> [#uses=1]
  %37 = add nsw i32 %36, %32                      ; <i32> [#uses=1]
  %scevgep8.i.5 = getelementptr i32* %13, i32 5   ; <i32*> [#uses=1]
  %38 = load i32* %scevgep8.i.5, align 4          ; <i32> [#uses=1]
  %39 = load i32** %scevgep.i15.5, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.5 = getelementptr i32* %39, i32 %j.04.us.i ; <i32*> [#uses=1]
  %40 = load i32* %scevgep10.i.5, align 4         ; <i32> [#uses=1]
  %41 = mul i32 %40, %38                          ; <i32> [#uses=1]
  %42 = add nsw i32 %41, %37                      ; <i32> [#uses=1]
  %scevgep8.i.6 = getelementptr i32* %13, i32 6   ; <i32*> [#uses=1]
  %43 = load i32* %scevgep8.i.6, align 4          ; <i32> [#uses=1]
  %44 = load i32** %scevgep.i15.6, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.6 = getelementptr i32* %44, i32 %j.04.us.i ; <i32*> [#uses=1]
  %45 = load i32* %scevgep10.i.6, align 4         ; <i32> [#uses=1]
  %46 = mul i32 %45, %43                          ; <i32> [#uses=1]
  %47 = add nsw i32 %46, %42                      ; <i32> [#uses=1]
  %scevgep8.i.7 = getelementptr i32* %13, i32 7   ; <i32*> [#uses=1]
  %48 = load i32* %scevgep8.i.7, align 4          ; <i32> [#uses=1]
  %49 = load i32** %scevgep.i15.7, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.7 = getelementptr i32* %49, i32 %j.04.us.i ; <i32*> [#uses=1]
  %50 = load i32* %scevgep10.i.7, align 4         ; <i32> [#uses=1]
  %51 = mul i32 %50, %48                          ; <i32> [#uses=1]
  %52 = add nsw i32 %51, %47                      ; <i32> [#uses=1]
  %scevgep8.i.8 = getelementptr i32* %13, i32 8   ; <i32*> [#uses=1]
  %53 = load i32* %scevgep8.i.8, align 4          ; <i32> [#uses=1]
  %54 = load i32** %scevgep.i15.8, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.8 = getelementptr i32* %54, i32 %j.04.us.i ; <i32*> [#uses=1]
  %55 = load i32* %scevgep10.i.8, align 4         ; <i32> [#uses=1]
  %56 = mul i32 %55, %53                          ; <i32> [#uses=1]
  %57 = add nsw i32 %56, %52                      ; <i32> [#uses=1]
  %scevgep8.i.9 = getelementptr i32* %13, i32 9   ; <i32*> [#uses=1]
  %58 = load i32* %scevgep8.i.9, align 4          ; <i32> [#uses=1]
  %59 = load i32** %scevgep.i15.9, align 4        ; <i32*> [#uses=1]
  %scevgep10.i.9 = getelementptr i32* %59, i32 %j.04.us.i ; <i32*> [#uses=1]
  %60 = load i32* %scevgep10.i.9, align 4         ; <i32> [#uses=1]
  %61 = mul i32 %60, %58                          ; <i32> [#uses=1]
  %62 = add nsw i32 %61, %57                      ; <i32> [#uses=1]
  %63 = load i32** %scevgep16.i, align 4          ; <i32*> [#uses=1]
  %scevgep11.i = getelementptr i32* %63, i32 %j.04.us.i ; <i32*> [#uses=1]
  store i32 %62, i32* %scevgep11.i, align 4
  %64 = add nsw i32 %j.04.us.i, 1                 ; <i32> [#uses=2]
  %exitcond59 = icmp eq i32 %64, 10               ; <i1> [#uses=1]
  br i1 %exitcond59, label %bb6.i, label %bb3.preheader.us.i

bb6.i:                                            ; preds = %bb3.preheader.us.i
  %65 = add i32 %i.06.i, 1                        ; <i32> [#uses=2]
  %exitcond60 = icmp eq i32 %65, 10               ; <i1> [#uses=1]
  br i1 %exitcond60, label %mmult.exit, label %bb5.preheader.i

bb5.preheader.i:                                  ; preds = %bb5.preheader.i.preheader, %bb6.i
  %i.06.i = phi i32 [ 0, %bb5.preheader.i.preheader ], [ %65, %bb6.i ] ; <i32> [#uses=3]
  %scevgep15.i = getelementptr [10 x i32*]* %4, i32 0, i32 %i.06.i ; <i32**> [#uses=1]
  %scevgep16.i = getelementptr [10 x i32*]* %10, i32 0, i32 %i.06.i ; <i32**> [#uses=1]
  br label %bb3.preheader.us.i

mmult.exit:                                       ; preds = %bb6.i
  %66 = add i32 %i.050, 1                         ; <i32> [#uses=2]
  %exitcond61 = icmp eq i32 %66, %iftmp.19.0      ; <i1> [#uses=1]
  br i1 %exitcond61, label %bb5, label %bb5.preheader.i.preheader

bb4.loopexit:                                     ; preds = %bb.us.i
  %.sub45 = getelementptr inbounds [10 x i32*]* %10, i32 0, i32 0 ; <i32**> [#uses=1]
  %67 = icmp sgt i32 %iftmp.19.0, 0               ; <i1> [#uses=1]
  br i1 %67, label %bb5.preheader.i.preheader.preheader, label %bb5

bb5.preheader.i.preheader.preheader:              ; preds = %bb4.loopexit
  %scevgep.i15 = getelementptr [10 x i32*]* %7, i32 0, i32 0 ; <i32**> [#uses=1]
  %scevgep.i15.1 = getelementptr [10 x i32*]* %7, i32 0, i32 1 ; <i32**> [#uses=1]
  %scevgep.i15.2 = getelementptr [10 x i32*]* %7, i32 0, i32 2 ; <i32**> [#uses=1]
  %scevgep.i15.3 = getelementptr [10 x i32*]* %7, i32 0, i32 3 ; <i32**> [#uses=1]
  %scevgep.i15.4 = getelementptr [10 x i32*]* %7, i32 0, i32 4 ; <i32**> [#uses=1]
  %scevgep.i15.5 = getelementptr [10 x i32*]* %7, i32 0, i32 5 ; <i32**> [#uses=1]
  %scevgep.i15.6 = getelementptr [10 x i32*]* %7, i32 0, i32 6 ; <i32**> [#uses=1]
  %scevgep.i15.7 = getelementptr [10 x i32*]* %7, i32 0, i32 7 ; <i32**> [#uses=1]
  %scevgep.i15.8 = getelementptr [10 x i32*]* %7, i32 0, i32 8 ; <i32**> [#uses=1]
  %scevgep.i15.9 = getelementptr [10 x i32*]* %7, i32 0, i32 9 ; <i32**> [#uses=1]
  br label %bb5.preheader.i.preheader

bb5.preheader.i.preheader:                        ; preds = %bb5.preheader.i.preheader.preheader, %mmult.exit
  %i.050 = phi i32 [ %66, %mmult.exit ], [ 0, %bb5.preheader.i.preheader.preheader ] ; <i32> [#uses=1]
  br label %bb5.preheader.i

bb5:                                              ; preds = %bb4.loopexit, %mmult.exit
  %68 = getelementptr inbounds [10 x i32*]* %10, i32 0, i32 4 ; <i32**> [#uses=1]
  %69 = load i32** %68, align 4                   ; <i32*> [#uses=2]
  %70 = getelementptr inbounds i32* %69, i32 4    ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4                    ; <i32> [#uses=1]
  %72 = getelementptr inbounds [10 x i32*]* %10, i32 0, i32 3 ; <i32**> [#uses=1]
  %73 = load i32** %72, align 4                   ; <i32*> [#uses=2]
  %74 = getelementptr inbounds i32* %73, i32 2    ; <i32*> [#uses=1]
  %75 = load i32* %74, align 4                    ; <i32> [#uses=1]
  %76 = getelementptr inbounds [10 x i32*]* %10, i32 0, i32 2 ; <i32**> [#uses=1]
  %77 = load i32** %76, align 4                   ; <i32*> [#uses=2]
  %78 = getelementptr inbounds i32* %77, i32 3    ; <i32*> [#uses=1]
  %79 = load i32* %78, align 4                    ; <i32> [#uses=1]
  %80 = load i32** %.sub45, align 4               ; <i32*> [#uses=2]
  %81 = load i32* %80, align 4                    ; <i32> [#uses=1]
  %82 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %81, i32 %79, i32 %75, i32 %71) nounwind ; <i32> [#uses=0]
  %scevgep.i10 = getelementptr [10 x i32*]* %4, i32 0, i32 9 ; <i32**> [#uses=1]
  %83 = load i32** %scevgep.i10, align 4          ; <i32*> [#uses=1]
  free i32* %83
  %scevgep.i10.1 = getelementptr [10 x i32*]* %4, i32 0, i32 8 ; <i32**> [#uses=1]
  %84 = load i32** %scevgep.i10.1, align 4        ; <i32*> [#uses=1]
  free i32* %84
  %scevgep.i10.2 = getelementptr [10 x i32*]* %4, i32 0, i32 7 ; <i32**> [#uses=1]
  %85 = load i32** %scevgep.i10.2, align 4        ; <i32*> [#uses=1]
  free i32* %85
  %scevgep.i10.3 = getelementptr [10 x i32*]* %4, i32 0, i32 6 ; <i32**> [#uses=1]
  %86 = load i32** %scevgep.i10.3, align 4        ; <i32*> [#uses=1]
  free i32* %86
  %scevgep.i10.4 = getelementptr [10 x i32*]* %4, i32 0, i32 5 ; <i32**> [#uses=1]
  %87 = load i32** %scevgep.i10.4, align 4        ; <i32*> [#uses=1]
  free i32* %87
  %scevgep.i10.5 = getelementptr [10 x i32*]* %4, i32 0, i32 4 ; <i32**> [#uses=1]
  %88 = load i32** %scevgep.i10.5, align 4        ; <i32*> [#uses=1]
  free i32* %88
  %scevgep.i10.6 = getelementptr [10 x i32*]* %4, i32 0, i32 3 ; <i32**> [#uses=1]
  %89 = load i32** %scevgep.i10.6, align 4        ; <i32*> [#uses=1]
  free i32* %89
  %scevgep.i10.7 = getelementptr [10 x i32*]* %4, i32 0, i32 2 ; <i32**> [#uses=1]
  %90 = load i32** %scevgep.i10.7, align 4        ; <i32*> [#uses=1]
  free i32* %90
  %scevgep.i10.8 = getelementptr [10 x i32*]* %4, i32 0, i32 1 ; <i32**> [#uses=1]
  %91 = load i32** %scevgep.i10.8, align 4        ; <i32*> [#uses=1]
  free i32* %91
  %scevgep.i10.9 = getelementptr [10 x i32*]* %4, i32 0, i32 0 ; <i32**> [#uses=1]
  %92 = load i32** %scevgep.i10.9, align 4        ; <i32*> [#uses=1]
  free i32* %92
  free [10 x i32*]* %4
  %scevgep.i3 = getelementptr [10 x i32*]* %7, i32 0, i32 9 ; <i32**> [#uses=1]
  %93 = load i32** %scevgep.i3, align 4           ; <i32*> [#uses=1]
  free i32* %93
  %scevgep.i3.1 = getelementptr [10 x i32*]* %7, i32 0, i32 8 ; <i32**> [#uses=1]
  %94 = load i32** %scevgep.i3.1, align 4         ; <i32*> [#uses=1]
  free i32* %94
  %scevgep.i3.2 = getelementptr [10 x i32*]* %7, i32 0, i32 7 ; <i32**> [#uses=1]
  %95 = load i32** %scevgep.i3.2, align 4         ; <i32*> [#uses=1]
  free i32* %95
  %scevgep.i3.3 = getelementptr [10 x i32*]* %7, i32 0, i32 6 ; <i32**> [#uses=1]
  %96 = load i32** %scevgep.i3.3, align 4         ; <i32*> [#uses=1]
  free i32* %96
  %scevgep.i3.4 = getelementptr [10 x i32*]* %7, i32 0, i32 5 ; <i32**> [#uses=1]
  %97 = load i32** %scevgep.i3.4, align 4         ; <i32*> [#uses=1]
  free i32* %97
  %scevgep.i3.5 = getelementptr [10 x i32*]* %7, i32 0, i32 4 ; <i32**> [#uses=1]
  %98 = load i32** %scevgep.i3.5, align 4         ; <i32*> [#uses=1]
  free i32* %98
  %scevgep.i3.6 = getelementptr [10 x i32*]* %7, i32 0, i32 3 ; <i32**> [#uses=1]
  %99 = load i32** %scevgep.i3.6, align 4         ; <i32*> [#uses=1]
  free i32* %99
  %scevgep.i3.7 = getelementptr [10 x i32*]* %7, i32 0, i32 2 ; <i32**> [#uses=1]
  %100 = load i32** %scevgep.i3.7, align 4        ; <i32*> [#uses=1]
  free i32* %100
  %scevgep.i3.8 = getelementptr [10 x i32*]* %7, i32 0, i32 1 ; <i32**> [#uses=1]
  %101 = load i32** %scevgep.i3.8, align 4        ; <i32*> [#uses=1]
  free i32* %101
  %scevgep.i3.9 = getelementptr [10 x i32*]* %7, i32 0, i32 0 ; <i32**> [#uses=1]
  %102 = load i32** %scevgep.i3.9, align 4        ; <i32*> [#uses=1]
  free i32* %102
  free [10 x i32*]* %7
  %scevgep.i = getelementptr [10 x i32*]* %10, i32 0, i32 9 ; <i32**> [#uses=1]
  %103 = load i32** %scevgep.i, align 4           ; <i32*> [#uses=1]
  free i32* %103
  %scevgep.i.1 = getelementptr [10 x i32*]* %10, i32 0, i32 8 ; <i32**> [#uses=1]
  %104 = load i32** %scevgep.i.1, align 4         ; <i32*> [#uses=1]
  free i32* %104
  %scevgep.i.2 = getelementptr [10 x i32*]* %10, i32 0, i32 7 ; <i32**> [#uses=1]
  %105 = load i32** %scevgep.i.2, align 4         ; <i32*> [#uses=1]
  free i32* %105
  %scevgep.i.3 = getelementptr [10 x i32*]* %10, i32 0, i32 6 ; <i32**> [#uses=1]
  %106 = load i32** %scevgep.i.3, align 4         ; <i32*> [#uses=1]
  free i32* %106
  %scevgep.i.4 = getelementptr [10 x i32*]* %10, i32 0, i32 5 ; <i32**> [#uses=1]
  %107 = load i32** %scevgep.i.4, align 4         ; <i32*> [#uses=1]
  free i32* %107
  free i32* %69
  free i32* %73
  free i32* %77
  %scevgep.i.8 = getelementptr [10 x i32*]* %10, i32 0, i32 1 ; <i32**> [#uses=1]
  %108 = load i32** %scevgep.i.8, align 4         ; <i32*> [#uses=1]
  free i32* %108
  free i32* %80
  free [10 x i32*]* %10
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
