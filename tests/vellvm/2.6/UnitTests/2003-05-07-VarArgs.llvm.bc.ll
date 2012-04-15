; ModuleID = '2003-05-07-VarArgs.llvm.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32"
target triple = "i386-pc-linux-gnu"

%struct.DWordS = type { i32, i8 }
%struct.LargeS = type { i32, double, %struct.DWordS*, i32 }
%struct.QuadWordS = type { i32, double }

@.str = private constant [11 x i8] c"string %s\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str1 = private constant [8 x i8] c"int %d\0A\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str2 = private constant [11 x i8] c"double %f\0A\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str3 = private constant [16 x i8] c"long long %lld\0A\00", align 1 ; <[16 x i8]*> [#uses=1]
@.str4 = private constant [9 x i8] c"char %c\0A\00", align 1 ; <[9 x i8]*> [#uses=1]
@.str5 = private constant [18 x i8] c"DWord { %d, %c }\0A\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str6 = private constant [21 x i8] c"QuadWord { %d, %f }\0A\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str7 = private constant [29 x i8] c"LargeS { %d, %f, 0x%d, %d }\0A\00", align 1 ; <[29 x i8]*> [#uses=1]
@.str8 = private constant [11 x i8] c"ssiciiiiis\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str9 = private constant [4 x i8] c"abc\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str10 = private constant [4 x i8] c"def\00", align 1 ; <[4 x i8]*> [#uses=1]
@.str11 = private constant [14 x i8] c"10 args done!\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str12 = private constant [5 x i8] c"ddil\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str13 = private constant [4 x i8] c"DQL\00", align 1 ; <[4 x i8]*> [#uses=1]

define internal void @test(i8* nocapture %fmt, ...) nounwind {
entry:
  %aq = alloca i8*, align 4                       ; <i8**> [#uses=1]
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=18]
  %memtmp = alloca i8*, align 4                   ; <i8**> [#uses=2]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %0 = load i8** %ap, align 4                     ; <i8*> [#uses=1]
  store i8* %0, i8** %memtmp
  %aq2 = bitcast i8** %aq to i8*                  ; <i8*> [#uses=2]
  %memtmp3 = bitcast i8** %memtmp to i8*          ; <i8*> [#uses=1]
  call void @llvm.va_copy(i8* %aq2, i8* %memtmp3)
  call void @llvm.va_end(i8* %aq2)
  %1 = load i8* %fmt, align 1                     ; <i8> [#uses=1]
  %2 = icmp eq i8 %1, 0                           ; <i1> [#uses=1]
  br i1 %2, label %bb14, label %bb

bb:                                               ; preds = %bb13.backedge, %entry
  %indvar = phi i32 [ %tmp, %bb13.backedge ], [ 0, %entry ] ; <i32> [#uses=2]
  %fmt_addr.01 = getelementptr i8* %fmt, i32 %indvar ; <i8*> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %fmt, i32 %tmp     ; <i8*> [#uses=1]
  %3 = load i8* %fmt_addr.01, align 1             ; <i8> [#uses=1]
  %4 = sext i8 %3 to i32                          ; <i32> [#uses=1]
  switch i32 %4, label %bb13.backedge [
    i32 68, label %bb10
    i32 76, label %bb12
    i32 81, label %bb11
    i32 99, label %bb9
    i32 100, label %bb7
    i32 105, label %bb6
    i32 108, label %bb8
    i32 115, label %bb5
  ]

bb5:                                              ; preds = %bb
  %5 = load i8** %ap, align 4                     ; <i8*> [#uses=2]
  %6 = getelementptr inbounds i8* %5, i32 4       ; <i8*> [#uses=1]
  store i8* %6, i8** %ap, align 4
  %7 = bitcast i8* %5 to i8**                     ; <i8**> [#uses=1]
  %8 = load i8** %7, align 4                      ; <i8*> [#uses=1]
  %9 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %8) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb13.backedge:                                    ; preds = %bb12, %bb11, %bb10, %bb9, %bb8, %bb7, %bb6, %bb5, %bb
  %10 = load i8* %scevgep, align 1                ; <i8> [#uses=1]
  %11 = icmp eq i8 %10, 0                         ; <i1> [#uses=1]
  br i1 %11, label %bb14, label %bb

bb6:                                              ; preds = %bb
  %12 = load i8** %ap, align 4                    ; <i8*> [#uses=2]
  %13 = getelementptr inbounds i8* %12, i32 4     ; <i8*> [#uses=1]
  store i8* %13, i8** %ap, align 4
  %14 = bitcast i8* %12 to i32*                   ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4                    ; <i32> [#uses=1]
  %16 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %15) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb7:                                              ; preds = %bb
  %17 = load i8** %ap, align 4                    ; <i8*> [#uses=2]
  %18 = getelementptr inbounds i8* %17, i32 8     ; <i8*> [#uses=1]
  store i8* %18, i8** %ap, align 4
  %19 = bitcast i8* %17 to double*                ; <double*> [#uses=1]
  %20 = load double* %19, align 4                 ; <double> [#uses=1]
  %21 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), double %20) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb8:                                              ; preds = %bb
  %22 = load i8** %ap, align 4                    ; <i8*> [#uses=2]
  %23 = getelementptr inbounds i8* %22, i32 8     ; <i8*> [#uses=1]
  store i8* %23, i8** %ap, align 4
  %24 = bitcast i8* %22 to i64*                   ; <i64*> [#uses=1]
  %25 = load i64* %24, align 4                    ; <i64> [#uses=1]
  %26 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0), i64 %25) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb9:                                              ; preds = %bb
  %27 = load i8** %ap, align 4                    ; <i8*> [#uses=2]
  %28 = getelementptr inbounds i8* %27, i32 4     ; <i8*> [#uses=1]
  store i8* %28, i8** %ap, align 4
  %29 = bitcast i8* %27 to i32*                   ; <i32*> [#uses=1]
  %30 = load i32* %29, align 4                    ; <i32> [#uses=1]
  %31 = trunc i32 %30 to i8                       ; <i8> [#uses=1]
  %32 = sext i8 %31 to i32                        ; <i32> [#uses=1]
  %33 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %32) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb10:                                             ; preds = %bb
  %34 = load i8** %ap, align 4                    ; <i8*> [#uses=3]
  %35 = getelementptr inbounds i8* %34, i32 8     ; <i8*> [#uses=1]
  store i8* %35, i8** %ap, align 4
  %36 = bitcast i8* %34 to i32*                   ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4                    ; <i32> [#uses=1]
  %38 = getelementptr i8* %34, i32 4              ; <i8*> [#uses=1]
  %39 = load i8* %38, align 4                     ; <i8> [#uses=1]
  %40 = sext i8 %39 to i32                        ; <i32> [#uses=1]
  %41 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %37, i32 %40) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb11:                                             ; preds = %bb
  %42 = load i8** %ap, align 4                    ; <i8*> [#uses=3]
  %43 = getelementptr inbounds i8* %42, i32 12    ; <i8*> [#uses=1]
  store i8* %43, i8** %ap, align 4
  %44 = bitcast i8* %42 to i32*                   ; <i32*> [#uses=1]
  %45 = load i32* %44, align 4                    ; <i32> [#uses=1]
  %46 = getelementptr inbounds i8* %42, i32 4     ; <i8*> [#uses=1]
  %47 = bitcast i8* %46 to double*                ; <double*> [#uses=1]
  %48 = load double* %47, align 4                 ; <double> [#uses=1]
  %49 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i32 %45, double %48) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb12:                                             ; preds = %bb
  %50 = load i8** %ap, align 4                    ; <i8*> [#uses=5]
  %51 = getelementptr inbounds i8* %50, i32 20    ; <i8*> [#uses=1]
  store i8* %51, i8** %ap, align 4
  %52 = bitcast i8* %50 to i32*                   ; <i32*> [#uses=1]
  %53 = load i32* %52, align 4                    ; <i32> [#uses=1]
  %54 = getelementptr inbounds i8* %50, i32 4     ; <i8*> [#uses=1]
  %55 = bitcast i8* %54 to double*                ; <double*> [#uses=1]
  %56 = load double* %55, align 4                 ; <double> [#uses=1]
  %57 = getelementptr inbounds i8* %50, i32 12    ; <i8*> [#uses=1]
  %58 = bitcast i8* %57 to %struct.DWordS**       ; <%struct.DWordS**> [#uses=1]
  %59 = load %struct.DWordS** %58, align 4        ; <%struct.DWordS*> [#uses=1]
  %60 = getelementptr inbounds i8* %50, i32 16    ; <i8*> [#uses=1]
  %61 = bitcast i8* %60 to i32*                   ; <i32*> [#uses=1]
  %62 = load i32* %61, align 4                    ; <i32> [#uses=1]
  %63 = icmp ne %struct.DWordS* %59, null         ; <i1> [#uses=1]
  %64 = zext i1 %63 to i32                        ; <i32> [#uses=1]
  %65 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %53, double %56, i32 %64, i32 %62) nounwind ; <i32> [#uses=0]
  br label %bb13.backedge

bb14:                                             ; preds = %bb13.backedge, %entry
  call void @llvm.va_end(i8* %ap1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind {
entry:
  %ls = alloca %struct.LargeS, align 8            ; <%struct.LargeS*> [#uses=5]
  %dw = alloca %struct.DWordS, align 8            ; <%struct.DWordS*> [#uses=4]
  %0 = getelementptr inbounds %struct.DWordS* %dw, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 18, i32* %0, align 8
  %1 = getelementptr inbounds %struct.DWordS* %dw, i32 0, i32 1 ; <i8*> [#uses=1]
  store i8 97, i8* %1, align 4
  %2 = getelementptr inbounds %struct.LargeS* %ls, i32 0, i32 0 ; <i32*> [#uses=1]
  store i32 21, i32* %2, align 8
  %3 = getelementptr inbounds %struct.LargeS* %ls, i32 0, i32 1 ; <double*> [#uses=1]
  store double 2.200000e+01, double* %3, align 4
  %4 = getelementptr inbounds %struct.LargeS* %ls, i32 0, i32 2 ; <%struct.DWordS**> [#uses=1]
  store %struct.DWordS* %dw, %struct.DWordS** %4, align 4
  %5 = getelementptr inbounds %struct.LargeS* %ls, i32 0, i32 3 ; <i32*> [#uses=1]
  store i32 23, i32* %5, align 8
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i32 0, i32 0)) nounwind
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423) nounwind
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), %struct.DWordS* byval align 4 %dw, i32 19, double 2.000000e+01, %struct.LargeS* byval align 4 %ls) nounwind
  ret i32 0
}
