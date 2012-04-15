; ModuleID = 'misr.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.misr_type = type { i32, i32, %struct.misr_type* }

@.str = private constant [4 x i8] c"%hu\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str3 = private constant [42 x i8] c"Structure does not match Register length:\00", align 1 ; <[42 x i8]*> [#uses=1]
@.str4 = private constant [75 x i8] c"reg_len\09#_vect\09prob      #_tms\09struct\09seed1\09seed2\09seed3\09Prob same output\0A \00", align 1 ; <[75 x i8]*> [#uses=1]
@.str5 = private constant [32 x i8] c"%d\09%d\09%.3e %d\09%s\09%d\09%d\09%d\09%.8e\0A\00", align 1 ; <[32 x i8]*> [#uses=1]

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind {
entry:
  %seed = alloca [3 x i16], align 2               ; <[3 x i16]*> [#uses=9]
  %structure = alloca [100 x i8], align 1         ; <[100 x i8]*> [#uses=8]
  %cell_array = alloca %struct.misr_type, align 8 ; <%struct.misr_type*> [#uses=6]
  %0 = icmp sgt i32 %argc, 6                      ; <i1> [#uses=1]
  br i1 %0, label %bb, label %bb3

bb:                                               ; preds = %entry
  %1 = getelementptr inbounds i8** %argv, i32 6   ; <i8**> [#uses=1]
  %2 = load i8** %1, align 4                      ; <i8*> [#uses=1]
  %structure1 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0 ; <i8*> [#uses=1]
  %3 = call i8* @strcpy(i8* noalias %structure1, i8* noalias %2) nounwind ; <i8*> [#uses=0]
  br label %bb6

bb3:                                              ; preds = %bb3, %entry
  %indvar = phi i32 [ %tmp7, %bb3 ], [ 0, %entry ] ; <i32> [#uses=1]
  %tmp7 = add i32 %indvar, 1                      ; <i32> [#uses=3]
  %scevgep = getelementptr [100 x i8]* %structure, i32 0, i32 %tmp7 ; <i8*> [#uses=1]
  store i8 48, i8* %scevgep, align 1
  %exitcond = icmp eq i32 %tmp7, 9                ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb3

bb5:                                              ; preds = %bb3
  %4 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0 ; <i8*> [#uses=1]
  store i8 49, i8* %4, align 1
  %5 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 10 ; <i8*> [#uses=1]
  store i8 0, i8* %5, align 1
  br label %bb6

bb6:                                              ; preds = %bb5, %bb
  %6 = icmp sgt i32 %argc, 7                      ; <i1> [#uses=1]
  br i1 %6, label %bb7, label %bb8

bb7:                                              ; preds = %bb6
  %7 = getelementptr inbounds i8** %argv, i32 7   ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=1]
  %9 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 0 ; <i16*> [#uses=1]
  %10 = call i32 (i8*, i8*, ...)* @sscanf(i8* noalias %8, i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %9) nounwind ; <i32> [#uses=0]
  br label %bb9

bb8:                                              ; preds = %bb6
  %11 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 0 ; <i16*> [#uses=1]
  store i16 1, i16* %11, align 2
  br label %bb9

bb9:                                              ; preds = %bb8, %bb7
  %12 = icmp sgt i32 %argc, 8                     ; <i1> [#uses=1]
  br i1 %12, label %bb10, label %bb11

bb10:                                             ; preds = %bb9
  %13 = getelementptr inbounds i8** %argv, i32 8  ; <i8**> [#uses=1]
  %14 = load i8** %13, align 4                    ; <i8*> [#uses=1]
  %15 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 1 ; <i16*> [#uses=1]
  %16 = call i32 (i8*, i8*, ...)* @sscanf(i8* noalias %14, i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %15) nounwind ; <i32> [#uses=0]
  br label %bb12

bb11:                                             ; preds = %bb9
  %17 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 1 ; <i16*> [#uses=1]
  store i16 0, i16* %17, align 2
  br label %bb12

bb12:                                             ; preds = %bb11, %bb10
  %18 = icmp sgt i32 %argc, 9                     ; <i1> [#uses=1]
  br i1 %18, label %bb13, label %bb14

bb13:                                             ; preds = %bb12
  %19 = getelementptr inbounds i8** %argv, i32 9  ; <i8**> [#uses=1]
  %20 = load i8** %19, align 4                    ; <i8*> [#uses=1]
  %21 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 2 ; <i16*> [#uses=1]
  %22 = call i32 (i8*, i8*, ...)* @sscanf(i8* noalias %20, i8* noalias getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i16* %21) nounwind ; <i32> [#uses=0]
  br label %bb20

bb14:                                             ; preds = %bb12
  %23 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 2 ; <i16*> [#uses=1]
  store i16 0, i16* %23, align 2
  br label %bb20

bb20:                                             ; preds = %bb14, %bb13
  %structure21 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 0 ; <i8*> [#uses=1]
  %24 = call i32 @strlen(i8* %structure21) nounwind readonly ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 10                       ; <i1> [#uses=1]
  br i1 %25, label %bb23, label %bb22

bb22:                                             ; preds = %bb20
  %26 = call i32 @puts(i8* getelementptr inbounds ([42 x i8]* @.str3, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  ret i32 4

bb23:                                             ; preds = %bb20
  %seed24 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 0 ; <i16*> [#uses=2]
  %27 = call i16* @seed48(i16* %seed24) nounwind  ; <i16*> [#uses=0]
  %28 = bitcast %struct.misr_type* %cell_array to i8* ; <i8*> [#uses=1]
  call void @llvm.memset.i32(i8* %28, i8 0, i32 12, i32 8) nounwind
  br label %bb.i

bb.i:                                             ; preds = %bb.i, %bb23
  %i.02.i = phi i32 [ 0, %bb23 ], [ %tmp9, %bb.i ] ; <i32> [#uses=1]
  %present.01.i = phi %struct.misr_type* [ %cell_array, %bb23 ], [ %29, %bb.i ] ; <%struct.misr_type*> [#uses=1]
  %tmp9 = add i32 %i.02.i, 1                      ; <i32> [#uses=2]
  %29 = malloc %struct.misr_type                  ; <%struct.misr_type*> [#uses=5]
  %30 = getelementptr inbounds %struct.misr_type* %29, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 1, i32* %30, align 4
  %31 = getelementptr inbounds %struct.misr_type* %29, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 1, i32* %31
  %32 = getelementptr inbounds %struct.misr_type* %29, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  store %struct.misr_type* null, %struct.misr_type** %32
  %33 = getelementptr inbounds %struct.misr_type* %present.01.i, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  store %struct.misr_type* %29, %struct.misr_type** %33, align 4
  %34 = icmp slt i32 %tmp9, 11                    ; <i1> [#uses=1]
  br i1 %34, label %bb.i, label %bb28.preheader

bb26:                                             ; preds = %bb28.preheader, %simulate.exit
  %num_true.04 = phi i32 [ 0, %bb28.preheader ], [ %105, %simulate.exit ] ; <i32> [#uses=1]
  %i.13 = phi i32 [ 0, %bb28.preheader ], [ %106, %simulate.exit ] ; <i32> [#uses=1]
  %35 = load %struct.misr_type** %107, align 8    ; <%struct.misr_type*> [#uses=1]
  %36 = icmp eq %struct.misr_type* %35, null      ; <i1> [#uses=1]
  br i1 %36, label %bb11.i.preheader, label %bb.i1

bb.i1:                                            ; preds = %bb.i1, %bb26
  %present_addr.01.i = phi %struct.misr_type* [ %41, %bb.i1 ], [ %cell_array, %bb26 ] ; <%struct.misr_type*> [#uses=3]
  %37 = getelementptr inbounds %struct.misr_type* %present_addr.01.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %38 = load i32* %37, align 4                    ; <i32> [#uses=1]
  %39 = getelementptr inbounds %struct.misr_type* %present_addr.01.i, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %38, i32* %39, align 4
  %40 = getelementptr inbounds %struct.misr_type* %present_addr.01.i, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  %41 = load %struct.misr_type** %40, align 4     ; <%struct.misr_type*> [#uses=2]
  %42 = getelementptr inbounds %struct.misr_type* %41, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  %43 = load %struct.misr_type** %42, align 4     ; <%struct.misr_type*> [#uses=1]
  %44 = icmp eq %struct.misr_type* %43, null      ; <i1> [#uses=1]
  br i1 %44, label %bb11.i.preheader, label %bb.i1

bb11.i.preheader:                                 ; preds = %bb19.i, %bb.i1, %bb26
  %h.032.i = phi i32 [ %96, %bb19.i ], [ 0, %bb.i1 ], [ 0, %bb26 ] ; <i32> [#uses=1]
  %45 = call i32 @lrand48() nounwind              ; <i32> [#uses=1]
  br label %bb11.i

bb11.i:                                           ; preds = %bb13.i, %bb11.i.preheader
  %temp.327.i = phi %struct.misr_type* [ %67, %bb13.i ], [ %cell_array, %bb11.i.preheader ] ; <%struct.misr_type*> [#uses=5]
  %savef_free.426.i = phi i32 [ %savef_free.3.i, %bb13.i ], [ 0, %bb11.i.preheader ] ; <i32> [#uses=2]
  %savefaulty.425.i = phi i32 [ %savefaulty.3.i, %bb13.i ], [ 0, %bb11.i.preheader ] ; <i32> [#uses=2]
  %randv.324.i = phi i32 [ %73, %bb13.i ], [ %45, %bb11.i.preheader ] ; <i32> [#uses=2]
  %j.123.i = phi i32 [ %74, %bb13.i ], [ 0, %bb11.i.preheader ] ; <i32> [#uses=2]
  %scevgep44.i = getelementptr [100 x i8]* %structure, i32 0, i32 %j.123.i ; <i8*> [#uses=1]
  %46 = load i8* %scevgep44.i, align 1            ; <i8> [#uses=1]
  %47 = icmp eq i8 %46, 49                        ; <i1> [#uses=1]
  br i1 %47, label %bb12.i, label %bb13.i

bb12.i:                                           ; preds = %bb11.i
  %48 = getelementptr inbounds %struct.misr_type* %temp.327.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4                    ; <i32> [#uses=1]
  %50 = add nsw i32 %49, %savef_free.426.i        ; <i32> [#uses=1]
  %51 = getelementptr inbounds %struct.misr_type* %temp.327.i, i32 0, i32 1 ; <i32*> [#uses=1]
  %52 = load i32* %51, align 4                    ; <i32> [#uses=1]
  %53 = add nsw i32 %52, %savefaulty.425.i        ; <i32> [#uses=1]
  br label %bb13.i

bb13.i:                                           ; preds = %bb12.i, %bb11.i
  %savefaulty.3.i = phi i32 [ %53, %bb12.i ], [ %savefaulty.425.i, %bb11.i ] ; <i32> [#uses=3]
  %savef_free.3.i = phi i32 [ %50, %bb12.i ], [ %savef_free.426.i, %bb11.i ] ; <i32> [#uses=3]
  %54 = getelementptr inbounds %struct.misr_type* %temp.327.i, i32 0, i32 2 ; <%struct.misr_type**> [#uses=2]
  %55 = load %struct.misr_type** %54, align 4     ; <%struct.misr_type*> [#uses=1]
  %56 = getelementptr inbounds %struct.misr_type* %55, i32 0, i32 0 ; <i32*> [#uses=1]
  %57 = load i32* %56, align 4                    ; <i32> [#uses=1]
  %58 = add nsw i32 %57, %randv.324.i             ; <i32> [#uses=1]
  %59 = and i32 %58, 1                            ; <i32> [#uses=1]
  %60 = getelementptr inbounds %struct.misr_type* %temp.327.i, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 %59, i32* %60, align 4
  %61 = call i32 @lrand48() nounwind              ; <i32> [#uses=1]
  %62 = srem i32 %61, 1000                        ; <i32> [#uses=1]
  %63 = sitofp i32 %62 to double                  ; <double> [#uses=1]
  %64 = fdiv double %63, 1.000000e+03             ; <double> [#uses=1]
  %65 = fcmp olt double %64, 2.500000e-01         ; <i1> [#uses=1]
  %66 = zext i1 %65 to i32                        ; <i32> [#uses=1]
  %randv.2.i = xor i32 %66, %randv.324.i          ; <i32> [#uses=2]
  %67 = load %struct.misr_type** %54, align 4     ; <%struct.misr_type*> [#uses=6]
  %68 = getelementptr inbounds %struct.misr_type* %67, i32 0, i32 1 ; <i32*> [#uses=1]
  %69 = load i32* %68, align 4                    ; <i32> [#uses=1]
  %70 = add nsw i32 %randv.2.i, %69               ; <i32> [#uses=1]
  %71 = and i32 %70, 1                            ; <i32> [#uses=1]
  %72 = getelementptr inbounds %struct.misr_type* %temp.327.i, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %71, i32* %72, align 4
  %73 = ashr i32 %randv.2.i, 1                    ; <i32> [#uses=1]
  %74 = add nsw i32 %j.123.i, 1                   ; <i32> [#uses=2]
  %exitcond42.i = icmp eq i32 %74, 9              ; <i1> [#uses=1]
  br i1 %exitcond42.i, label %bb17.i, label %bb11.i

bb17.i:                                           ; preds = %bb13.i
  %75 = call i32 @lrand48() nounwind              ; <i32> [#uses=2]
  %76 = load i8* %108, align 1                    ; <i8> [#uses=1]
  %77 = icmp eq i8 %76, 49                        ; <i1> [#uses=1]
  br i1 %77, label %bb18.i, label %bb19.i

bb18.i:                                           ; preds = %bb17.i
  %78 = getelementptr inbounds %struct.misr_type* %67, i32 0, i32 0 ; <i32*> [#uses=1]
  %79 = load i32* %78, align 4                    ; <i32> [#uses=1]
  %80 = add nsw i32 %79, %savef_free.3.i          ; <i32> [#uses=1]
  %81 = getelementptr inbounds %struct.misr_type* %67, i32 0, i32 1 ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4                    ; <i32> [#uses=1]
  %83 = add nsw i32 %82, %savefaulty.3.i          ; <i32> [#uses=1]
  br label %bb19.i

bb19.i:                                           ; preds = %bb18.i, %bb17.i
  %savefaulty.5.i = phi i32 [ %83, %bb18.i ], [ %savefaulty.3.i, %bb17.i ] ; <i32> [#uses=1]
  %savef_free.5.i = phi i32 [ %80, %bb18.i ], [ %savef_free.3.i, %bb17.i ] ; <i32> [#uses=1]
  %84 = add nsw i32 %savef_free.5.i, %75          ; <i32> [#uses=1]
  %85 = and i32 %84, 1                            ; <i32> [#uses=1]
  %86 = getelementptr inbounds %struct.misr_type* %67, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 %85, i32* %86, align 4
  %87 = call i32 @lrand48() nounwind              ; <i32> [#uses=1]
  %88 = srem i32 %87, 10000                       ; <i32> [#uses=1]
  %89 = sitofp i32 %88 to double                  ; <double> [#uses=1]
  %90 = fdiv double %89, 1.000000e+04             ; <double> [#uses=1]
  %91 = fcmp olt double %90, 2.500000e-01         ; <i1> [#uses=1]
  %92 = zext i1 %91 to i32                        ; <i32> [#uses=1]
  %randv.4.i = xor i32 %92, %75                   ; <i32> [#uses=1]
  %93 = add nsw i32 %randv.4.i, %savefaulty.5.i   ; <i32> [#uses=1]
  %94 = and i32 %93, 1                            ; <i32> [#uses=1]
  %95 = getelementptr inbounds %struct.misr_type* %67, i32 0, i32 1 ; <i32*> [#uses=1]
  store i32 %94, i32* %95, align 4
  %96 = add i32 %h.032.i, 1                       ; <i32> [#uses=2]
  %exitcond45.i = icmp eq i32 %96, 10             ; <i1> [#uses=1]
  br i1 %exitcond45.i, label %bb24.i, label %bb11.i.preheader

bb24.i:                                           ; preds = %bb24.i, %bb19.i
  %temp.43.i = phi %struct.misr_type* [ %103, %bb24.i ], [ %cell_array, %bb19.i ] ; <%struct.misr_type*> [#uses=3]
  %different.12.i = phi i32 [ %different.0.i, %bb24.i ], [ 0, %bb19.i ] ; <i32> [#uses=1]
  %i.11.i = phi i32 [ %104, %bb24.i ], [ 0, %bb19.i ] ; <i32> [#uses=1]
  %97 = getelementptr inbounds %struct.misr_type* %temp.43.i, i32 0, i32 0 ; <i32*> [#uses=1]
  %98 = load i32* %97, align 4                    ; <i32> [#uses=1]
  %99 = getelementptr inbounds %struct.misr_type* %temp.43.i, i32 0, i32 1 ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4                   ; <i32> [#uses=1]
  %101 = icmp eq i32 %98, %100                    ; <i1> [#uses=1]
  %different.0.i = select i1 %101, i32 %different.12.i, i32 1 ; <i32> [#uses=2]
  %102 = getelementptr inbounds %struct.misr_type* %temp.43.i, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  %103 = load %struct.misr_type** %102, align 4   ; <%struct.misr_type*> [#uses=1]
  %104 = add nsw i32 %i.11.i, 1                   ; <i32> [#uses=2]
  %exitcond.i = icmp eq i32 %104, 10              ; <i1> [#uses=1]
  br i1 %exitcond.i, label %simulate.exit, label %bb24.i

simulate.exit:                                    ; preds = %bb24.i
  %105 = add nsw i32 %different.0.i, %num_true.04 ; <i32> [#uses=2]
  %106 = add nsw i32 %i.13, 1                     ; <i32> [#uses=2]
  %exitcond8 = icmp eq i32 %106, 100000           ; <i1> [#uses=1]
  br i1 %exitcond8, label %bb34, label %bb26

bb28.preheader:                                   ; preds = %bb.i
  %107 = getelementptr inbounds %struct.misr_type* %cell_array, i32 0, i32 2 ; <%struct.misr_type**> [#uses=1]
  %108 = getelementptr inbounds [100 x i8]* %structure, i32 0, i32 9 ; <i8*> [#uses=1]
  br label %bb26

bb34:                                             ; preds = %simulate.exit
  %109 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([75 x i8]* @.str4, i32 0, i32 0)) nounwind ; <i32> [#uses=0]
  %110 = sub i32 100000, %105                     ; <i32> [#uses=1]
  %111 = sitofp i32 %110 to double                ; <double> [#uses=1]
  %112 = fdiv double %111, 1.000000e+05           ; <double> [#uses=1]
  %113 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 2 ; <i16*> [#uses=1]
  %114 = load i16* %113, align 2                  ; <i16> [#uses=1]
  %115 = zext i16 %114 to i32                     ; <i32> [#uses=1]
  %116 = getelementptr inbounds [3 x i16]* %seed, i32 0, i32 1 ; <i16*> [#uses=1]
  %117 = load i16* %116, align 2                  ; <i16> [#uses=1]
  %118 = zext i16 %117 to i32                     ; <i32> [#uses=1]
  %119 = load i16* %seed24, align 2               ; <i16> [#uses=1]
  %120 = zext i16 %119 to i32                     ; <i32> [#uses=1]
  %121 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0), i32 10, i32 10, double 2.500000e-01, i32 100000, [100 x i8]* %structure, i32 %120, i32 %118, i32 %115, double %112) nounwind ; <i32> [#uses=0]
  ret i32 0
}

declare i32 @lrand48() nounwind

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

declare i8* @strcpy(i8*, i8* nocapture) nounwind

declare i32 @sscanf(i8* nocapture, i8* nocapture, ...) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @strlen(i8* nocapture) nounwind readonly

declare i16* @seed48(i16*) nounwind
