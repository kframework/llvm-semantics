; ModuleID = 'whetstone.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private constant [44 x i8] c"%7ld %7ld %7ld %12.4e %12.4e %12.4e %12.4e\0A\00", align 1 ; <[44 x i8]*> [#uses=1]
@.str1 = private constant [3 x i8] c"-c\00", align 1 ; <[3 x i8]*> [#uses=1]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=1]
@.str2 = private constant [28 x i8] c"usage: whetdc [-c] [loops]\0A\00", align 1 ; <[28 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  br label %bb7

bb:                                               ; preds = %bb7
  %scevgep = getelementptr i8** %argv, i32 %indvar119 ; <i8**> [#uses=1]
  %0 = load i8** %scevgep, align 4                ; <i8*> [#uses=3]
  %1 = tail call i32 @strncmp(i8* %0, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32 2) nounwind readonly ; <i32> [#uses=1]
  %2 = icmp eq i32 %1, 0                          ; <i1> [#uses=1]
  br i1 %2, label %bb6, label %bb1

bb1:                                              ; preds = %bb
  %3 = load i8* %0, align 1                       ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 99                          ; <i1> [#uses=1]
  br i1 %4, label %bb6, label %bb3

bb3:                                              ; preds = %bb1
  %5 = tail call i32 @strtol(i8* noalias nocapture %0, i8** noalias null, i32 10) nounwind readonly ; <i32> [#uses=2]
  %6 = icmp sgt i32 %5, 0                         ; <i1> [#uses=1]
  br i1 %6, label %bb6, label %bb5

bb5:                                              ; preds = %bb3
  %7 = load %struct._IO_FILE** @stderr, align 4   ; <%struct._IO_FILE*> [#uses=1]
  %8 = bitcast %struct._IO_FILE* %7 to i8*        ; <i8*> [#uses=1]
  %9 = tail call i32 @fwrite(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0), i32 1, i32 27, i8* %8) nounwind ; <i32> [#uses=0]
  ret i32 1

bb6:                                              ; preds = %bb3, %bb1, %bb
  %loopstart.0 = phi i32 [ %loopstart.1, %bb ], [ %loopstart.1, %bb1 ], [ %5, %bb3 ] ; <i32> [#uses=1]
  %continuous.0 = phi i32 [ 1, %bb ], [ 1, %bb1 ], [ %continuous.1, %bb3 ] ; <i32> [#uses=1]
  %phitmp = add i32 %indvar119, 1                 ; <i32> [#uses=1]
  br label %bb7

bb7:                                              ; preds = %bb6, %entry
  %indvar119 = phi i32 [ 1, %entry ], [ %phitmp, %bb6 ] ; <i32> [#uses=3]
  %loopstart.1 = phi i32 [ 100000, %entry ], [ %loopstart.0, %bb6 ] ; <i32> [#uses=10]
  %continuous.1 = phi i32 [ 0, %entry ], [ %continuous.0, %bb6 ] ; <i32> [#uses=2]
  %10 = icmp slt i32 %indvar119, %argc            ; <i1> [#uses=1]
  br i1 %10, label %bb, label %LCONT.loopexit

LCONT.loopexit:                                   ; preds = %bb7
  %11 = mul i32 %loopstart.1, 12                  ; <i32> [#uses=6]
  %12 = mul i32 %loopstart.1, 14                  ; <i32> [#uses=4]
  %13 = mul i32 %loopstart.1, 345                 ; <i32> [#uses=3]
  %14 = mul i32 %loopstart.1, 210                 ; <i32> [#uses=3]
  %15 = shl i32 %loopstart.1, 5                   ; <i32> [#uses=3]
  %16 = mul i32 %loopstart.1, 899                 ; <i32> [#uses=3]
  %17 = mul i32 %loopstart.1, 616                 ; <i32> [#uses=3]
  %18 = mul i32 %loopstart.1, 93                  ; <i32> [#uses=3]
  %19 = icmp slt i32 %11, 1                       ; <i1> [#uses=1]
  %20 = icmp slt i32 %12, 1                       ; <i1> [#uses=1]
  %21 = icmp slt i32 %13, 1                       ; <i1> [#uses=1]
  %22 = icmp slt i32 %14, 1                       ; <i1> [#uses=1]
  %23 = icmp slt i32 %15, 1                       ; <i1> [#uses=1]
  %24 = icmp slt i32 %16, 1                       ; <i1> [#uses=1]
  %25 = icmp slt i32 %17, 1                       ; <i1> [#uses=1]
  %26 = icmp slt i32 %18, 1                       ; <i1> [#uses=1]
  %27 = icmp eq i32 %continuous.1, 0              ; <i1> [#uses=1]
  br label %LCONT

LCONT:                                            ; preds = %bb64, %LCONT.loopexit
  %28 = tail call i32 @time(i32* null) nounwind   ; <i32> [#uses=0]
  %29 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 0, i32 0, i32 0, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) nounwind ; <i32> [#uses=0]
  br i1 %19, label %bb15, label %bb13

bb13:                                             ; preds = %bb13, %LCONT
  %indvar = phi i32 [ %indvar.next, %bb13 ], [ 0, %LCONT ] ; <i32> [#uses=2]
  %.tmp16.0 = phi double [ %45, %bb13 ], [ -1.000000e+00, %LCONT ] ; <double> [#uses=4]
  %.tmp15.0 = phi double [ %41, %bb13 ], [ -1.000000e+00, %LCONT ] ; <double> [#uses=3]
  %.tmp14.0 = phi double [ %37, %bb13 ], [ -1.000000e+00, %LCONT ] ; <double> [#uses=2]
  %.tmp.0 = phi double [ %33, %bb13 ], [ 1.000000e+00, %LCONT ] ; <double> [#uses=1]
  %30 = fadd double %.tmp.0, %.tmp14.0            ; <double> [#uses=1]
  %31 = fadd double %30, %.tmp15.0                ; <double> [#uses=1]
  %32 = fsub double %31, %.tmp16.0                ; <double> [#uses=1]
  %33 = fmul double %32, 4.999750e-01             ; <double> [#uses=6]
  %34 = fadd double %33, %.tmp14.0                ; <double> [#uses=1]
  %35 = fsub double %34, %.tmp15.0                ; <double> [#uses=1]
  %36 = fadd double %35, %.tmp16.0                ; <double> [#uses=1]
  %37 = fmul double %36, 4.999750e-01             ; <double> [#uses=5]
  %38 = fsub double %33, %37                      ; <double> [#uses=1]
  %39 = fadd double %38, %.tmp15.0                ; <double> [#uses=1]
  %40 = fadd double %39, %.tmp16.0                ; <double> [#uses=1]
  %41 = fmul double %40, 4.999750e-01             ; <double> [#uses=4]
  %42 = fsub double %37, %33                      ; <double> [#uses=1]
  %43 = fadd double %42, %41                      ; <double> [#uses=1]
  %44 = fadd double %43, %.tmp16.0                ; <double> [#uses=1]
  %45 = fmul double %44, 4.999750e-01             ; <double> [#uses=3]
  %tmp81 = add i32 %indvar, 2                     ; <i32> [#uses=1]
  %46 = icmp sgt i32 %tmp81, %11                  ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %46, label %bb15, label %bb13

bb15:                                             ; preds = %bb13, %LCONT
  %E1.1.0 = phi double [ 1.000000e+00, %LCONT ], [ %33, %bb13 ] ; <double> [#uses=2]
  %E1.2.0 = phi double [ -1.000000e+00, %LCONT ], [ %37, %bb13 ] ; <double> [#uses=2]
  %E1.3.0 = phi double [ -1.000000e+00, %LCONT ], [ %41, %bb13 ] ; <double> [#uses=2]
  %E1.4.0 = phi double [ -1.000000e+00, %LCONT ], [ %45, %bb13 ] ; <double> [#uses=2]
  %47 = phi double [ 1.000000e+00, %LCONT ], [ %33, %bb13 ] ; <double> [#uses=1]
  %48 = phi double [ -1.000000e+00, %LCONT ], [ %37, %bb13 ] ; <double> [#uses=1]
  %49 = phi double [ -1.000000e+00, %LCONT ], [ %41, %bb13 ] ; <double> [#uses=1]
  %50 = phi double [ -1.000000e+00, %LCONT ], [ %45, %bb13 ] ; <double> [#uses=1]
  %51 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %12, i32 %11, double %47, double %48, double %49, double %50) nounwind ; <i32> [#uses=0]
  br i1 %20, label %bb20, label %bb18

bb18:                                             ; preds = %PA.exit, %bb15
  %indvar86 = phi i32 [ %indvar.next87, %PA.exit ], [ 0, %bb15 ] ; <i32> [#uses=2]
  %.tmp38.0 = phi double [ %77, %PA.exit ], [ %E1.4.0, %bb15 ] ; <double> [#uses=4]
  %.tmp37.0 = phi double [ %73, %PA.exit ], [ %E1.3.0, %bb15 ] ; <double> [#uses=3]
  %.tmp36.0 = phi double [ %69, %PA.exit ], [ %E1.2.0, %bb15 ] ; <double> [#uses=2]
  %.tmp.043 = phi double [ %65, %PA.exit ], [ %E1.1.0, %bb15 ] ; <double> [#uses=1]
  %tmp88 = add i32 %indvar86, 2                   ; <i32> [#uses=1]
  br label %L10.i

L10.i:                                            ; preds = %L10.i, %bb18
  %52 = phi double [ %.tmp38.0, %bb18 ], [ %77, %L10.i ] ; <double> [#uses=1]
  %53 = phi double [ %.tmp38.0, %bb18 ], [ %77, %L10.i ] ; <double> [#uses=1]
  %54 = phi double [ %.tmp37.0, %bb18 ], [ %73, %L10.i ] ; <double> [#uses=1]
  %55 = phi double [ %.tmp38.0, %bb18 ], [ %77, %L10.i ] ; <double> [#uses=1]
  %56 = phi double [ %.tmp37.0, %bb18 ], [ %73, %L10.i ] ; <double> [#uses=1]
  %57 = phi double [ %.tmp36.0, %bb18 ], [ %69, %L10.i ] ; <double> [#uses=1]
  %58 = phi double [ %.tmp38.0, %bb18 ], [ %77, %L10.i ] ; <double> [#uses=1]
  %59 = phi double [ %.tmp37.0, %bb18 ], [ %73, %L10.i ] ; <double> [#uses=1]
  %60 = phi double [ %.tmp36.0, %bb18 ], [ %69, %L10.i ] ; <double> [#uses=1]
  %61 = phi double [ %.tmp.043, %bb18 ], [ %65, %L10.i ] ; <double> [#uses=1]
  %indvar.i = phi i32 [ 0, %bb18 ], [ %indvar.next.i, %L10.i ] ; <i32> [#uses=1]
  %62 = fadd double %61, %60                      ; <double> [#uses=1]
  %63 = fadd double %62, %59                      ; <double> [#uses=1]
  %64 = fsub double %63, %58                      ; <double> [#uses=1]
  %65 = fmul double %64, 4.999750e-01             ; <double> [#uses=6]
  %66 = fadd double %65, %57                      ; <double> [#uses=1]
  %67 = fsub double %66, %56                      ; <double> [#uses=1]
  %68 = fadd double %67, %55                      ; <double> [#uses=1]
  %69 = fmul double %68, 4.999750e-01             ; <double> [#uses=6]
  %70 = fsub double %65, %69                      ; <double> [#uses=1]
  %71 = fadd double %70, %54                      ; <double> [#uses=1]
  %72 = fadd double %71, %53                      ; <double> [#uses=1]
  %73 = fmul double %72, 4.999750e-01             ; <double> [#uses=6]
  %74 = fsub double %69, %65                      ; <double> [#uses=1]
  %75 = fadd double %74, %73                      ; <double> [#uses=1]
  %76 = fadd double %75, %52                      ; <double> [#uses=1]
  %77 = fdiv double %76, 2.000000e+00             ; <double> [#uses=6]
  %indvar.next.i = add i32 %indvar.i, 1           ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next.i, 6       ; <i1> [#uses=1]
  br i1 %exitcond, label %PA.exit, label %L10.i

PA.exit:                                          ; preds = %L10.i
  %78 = icmp sgt i32 %tmp88, %12                  ; <i1> [#uses=1]
  %indvar.next87 = add i32 %indvar86, 1           ; <i32> [#uses=1]
  br i1 %78, label %bb20, label %bb18

bb20:                                             ; preds = %PA.exit, %bb15
  %E1.1.1 = phi double [ %E1.1.0, %bb15 ], [ %65, %PA.exit ] ; <double> [#uses=2]
  %E1.2.1 = phi double [ %E1.2.0, %bb15 ], [ %69, %PA.exit ] ; <double> [#uses=2]
  %E1.3.1 = phi double [ %E1.3.0, %bb15 ], [ %73, %PA.exit ] ; <double> [#uses=2]
  %E1.4.1 = phi double [ %E1.4.0, %bb15 ], [ %77, %PA.exit ] ; <double> [#uses=3]
  %79 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %12, i32 %11, i32 %11, double %E1.1.1, double %E1.2.1, double %E1.3.1, double %E1.4.1) nounwind ; <i32> [#uses=0]
  br i1 %21, label %bb34, label %bb23

bb23:                                             ; preds = %bb23, %bb20
  %indvar89 = phi i32 [ %indvar.next90, %bb23 ], [ 0, %bb20 ] ; <i32> [#uses=2]
  %J.tmp.0 = phi i32 [ %tmp127, %bb23 ], [ 1, %bb20 ] ; <i32> [#uses=1]
  %tmp127 = xor i32 %J.tmp.0, 1                   ; <i32> [#uses=2]
  %tmp91 = add i32 %indvar89, 2                   ; <i32> [#uses=1]
  %80 = icmp sgt i32 %tmp91, %13                  ; <i1> [#uses=1]
  %indvar.next90 = add i32 %indvar89, 1           ; <i32> [#uses=1]
  br i1 %80, label %bb34, label %bb23

bb34:                                             ; preds = %bb23, %bb20
  %81 = phi i32 [ 1, %bb20 ], [ %tmp127, %bb23 ]  ; <i32> [#uses=2]
  %82 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %13, i32 %81, i32 %81, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) nounwind ; <i32> [#uses=0]
  br i1 %22, label %bb39, label %bb37

bb37:                                             ; preds = %bb37, %bb34
  %indvar95 = phi i32 [ %indvar.next96, %bb37 ], [ 0, %bb34 ] ; <i32> [#uses=2]
  %tmp97 = add i32 %indvar95, 2                   ; <i32> [#uses=1]
  %83 = icmp sgt i32 %tmp97, %14                  ; <i1> [#uses=1]
  %indvar.next96 = add i32 %indvar95, 1           ; <i32> [#uses=1]
  br i1 %83, label %bb39, label %bb37

bb39:                                             ; preds = %bb37, %bb34
  %E1.1.2 = phi double [ %E1.1.1, %bb34 ], [ 6.000000e+00, %bb37 ] ; <double> [#uses=1]
  %E1.2.2 = phi double [ %E1.2.1, %bb34 ], [ 6.000000e+00, %bb37 ] ; <double> [#uses=1]
  %84 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %14, i32 1, i32 2, double %E1.1.2, double %E1.2.2, double %E1.3.1, double %E1.4.1) nounwind ; <i32> [#uses=0]
  br i1 %23, label %bb44, label %bb42

bb42:                                             ; preds = %bb42, %bb39
  %indvar100 = phi i32 [ %indvar.next101, %bb42 ], [ 0, %bb39 ] ; <i32> [#uses=2]
  %X.055 = phi double [ %97, %bb42 ], [ 5.000000e-01, %bb39 ] ; <double> [#uses=4]
  %Y.054 = phi double [ %110, %bb42 ], [ 5.000000e-01, %bb39 ] ; <double> [#uses=6]
  %85 = tail call double @sin(double %X.055) nounwind readonly ; <double> [#uses=1]
  %86 = fmul double %85, 2.000000e+00             ; <double> [#uses=1]
  %87 = tail call double @cos(double %X.055) nounwind readonly ; <double> [#uses=1]
  %88 = fmul double %86, %87                      ; <double> [#uses=1]
  %89 = fadd double %X.055, %Y.054                ; <double> [#uses=1]
  %90 = tail call double @cos(double %89) nounwind readonly ; <double> [#uses=1]
  %91 = fsub double %X.055, %Y.054                ; <double> [#uses=1]
  %92 = tail call double @cos(double %91) nounwind readonly ; <double> [#uses=1]
  %93 = fadd double %90, %92                      ; <double> [#uses=1]
  %94 = fadd double %93, -1.000000e+00            ; <double> [#uses=1]
  %95 = fdiv double %88, %94                      ; <double> [#uses=1]
  %96 = tail call double @atan(double %95) nounwind readonly ; <double> [#uses=1]
  %97 = fmul double %96, 4.999750e-01             ; <double> [#uses=4]
  %98 = tail call double @sin(double %Y.054) nounwind readonly ; <double> [#uses=1]
  %99 = fmul double %98, 2.000000e+00             ; <double> [#uses=1]
  %100 = tail call double @cos(double %Y.054) nounwind readonly ; <double> [#uses=1]
  %101 = fmul double %99, %100                    ; <double> [#uses=1]
  %102 = fadd double %97, %Y.054                  ; <double> [#uses=1]
  %103 = tail call double @cos(double %102) nounwind readonly ; <double> [#uses=1]
  %104 = fsub double %97, %Y.054                  ; <double> [#uses=1]
  %105 = tail call double @cos(double %104) nounwind readonly ; <double> [#uses=1]
  %106 = fadd double %103, %105                   ; <double> [#uses=1]
  %107 = fadd double %106, -1.000000e+00          ; <double> [#uses=1]
  %108 = fdiv double %101, %107                   ; <double> [#uses=1]
  %109 = tail call double @atan(double %108) nounwind readonly ; <double> [#uses=1]
  %110 = fmul double %109, 4.999750e-01           ; <double> [#uses=2]
  %tmp102 = add i32 %indvar100, 2                 ; <i32> [#uses=1]
  %111 = icmp sgt i32 %tmp102, %15                ; <i1> [#uses=1]
  %indvar.next101 = add i32 %indvar100, 1         ; <i32> [#uses=1]
  br i1 %111, label %bb44, label %bb42

bb44:                                             ; preds = %bb42, %bb39
  %X.0.lcssa = phi double [ 5.000000e-01, %bb39 ], [ %97, %bb42 ] ; <double> [#uses=2]
  %Y.0.lcssa = phi double [ 5.000000e-01, %bb39 ], [ %110, %bb42 ] ; <double> [#uses=2]
  %112 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %15, i32 1, i32 2, double %X.0.lcssa, double %X.0.lcssa, double %Y.0.lcssa, double %Y.0.lcssa) nounwind ; <i32> [#uses=0]
  br i1 %24, label %bb49, label %bb47

bb47:                                             ; preds = %bb47, %bb44
  %indvar103 = phi i32 [ %indvar.next104, %bb47 ], [ 0, %bb44 ] ; <i32> [#uses=2]
  %tmp105 = add i32 %indvar103, 2                 ; <i32> [#uses=1]
  %113 = icmp sgt i32 %tmp105, %16                ; <i1> [#uses=1]
  %indvar.next104 = add i32 %indvar103, 1         ; <i32> [#uses=1]
  br i1 %113, label %bb49, label %bb47

bb49:                                             ; preds = %bb47, %bb44
  %Z.0.lcssa = phi double [ 1.000000e+00, %bb44 ], [ 0x3FEFFF7CEDE74EAE, %bb47 ] ; <double> [#uses=2]
  %114 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %16, i32 1, i32 2, double 1.000000e+00, double 1.000000e+00, double %Z.0.lcssa, double %Z.0.lcssa) nounwind ; <i32> [#uses=0]
  br i1 %25, label %bb54, label %bb52

bb52:                                             ; preds = %bb52, %bb49
  %115 = phi double [ %116, %bb52 ], [ 3.000000e+00, %bb49 ] ; <double> [#uses=2]
  %116 = phi double [ %115, %bb52 ], [ 2.000000e+00, %bb49 ] ; <double> [#uses=3]
  %indvar106 = phi i32 [ %indvar.next107, %bb52 ], [ 0, %bb49 ] ; <i32> [#uses=2]
  %tmp108 = add i32 %indvar106, 2                 ; <i32> [#uses=1]
  %117 = icmp sgt i32 %tmp108, %17                ; <i1> [#uses=1]
  %indvar.next107 = add i32 %indvar106, 1         ; <i32> [#uses=1]
  br i1 %117, label %bb54, label %bb52

bb54:                                             ; preds = %bb52, %bb49
  %E1.1.3 = phi double [ 1.000000e+00, %bb49 ], [ %116, %bb52 ] ; <double> [#uses=1]
  %E1.2.3 = phi double [ 2.000000e+00, %bb49 ], [ %115, %bb52 ] ; <double> [#uses=1]
  %E1.3.2 = phi double [ 3.000000e+00, %bb49 ], [ %116, %bb52 ] ; <double> [#uses=1]
  %118 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %17, i32 1, i32 2, double %E1.1.3, double %E1.2.3, double %E1.3.2, double %E1.4.1) nounwind ; <i32> [#uses=0]
  %119 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 0, i32 2, i32 3, double 1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00) nounwind ; <i32> [#uses=0]
  br i1 %26, label %bb64, label %bb62

bb62:                                             ; preds = %bb62, %bb54
  %indvar110 = phi i32 [ %indvar.next111, %bb62 ], [ 0, %bb54 ] ; <i32> [#uses=2]
  %X.172 = phi double [ %123, %bb62 ], [ 7.500000e-01, %bb54 ] ; <double> [#uses=1]
  %120 = tail call double @llvm.log.f64(double %X.172) ; <double> [#uses=1]
  %121 = fdiv double %120, 5.002500e-01           ; <double> [#uses=1]
  %122 = tail call double @llvm.exp.f64(double %121) ; <double> [#uses=1]
  %123 = tail call double @llvm.sqrt.f64(double %122) ; <double> [#uses=2]
  %tmp112 = add i32 %indvar110, 2                 ; <i32> [#uses=1]
  %124 = icmp sgt i32 %tmp112, %18                ; <i1> [#uses=1]
  %indvar.next111 = add i32 %indvar110, 1         ; <i32> [#uses=1]
  br i1 %124, label %bb64, label %bb62

bb64:                                             ; preds = %bb62, %bb54
  %X.1.lcssa = phi double [ 7.500000e-01, %bb54 ], [ %123, %bb62 ] ; <double> [#uses=4]
  %125 = tail call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([44 x i8]* @.str, i32 0, i32 0), i32 %18, i32 2, i32 3, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa, double %X.1.lcssa) nounwind ; <i32> [#uses=0]
  %126 = tail call i32 @time(i32* null) nounwind  ; <i32> [#uses=0]
  %127 = tail call i32 @putchar(i32 10) nounwind  ; <i32> [#uses=0]
  br i1 %27, label %bb69, label %LCONT

bb69:                                             ; preds = %bb64
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @strtol(i8* noalias, i8** noalias nocapture, i32) nounwind

declare i32 @strncmp(i8* nocapture, i8* nocapture, i32) nounwind readonly

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

declare i32 @time(i32*) nounwind

declare double @sin(double) nounwind readonly

declare double @cos(double) nounwind readonly

declare double @atan(double) nounwind readonly

declare double @llvm.log.f64(double) nounwind readonly

declare double @llvm.exp.f64(double) nounwind readonly

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i32 @putchar(i32) nounwind
