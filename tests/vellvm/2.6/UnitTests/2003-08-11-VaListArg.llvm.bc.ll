; ModuleID = '2003-08-11-VaListArg.llvm.bc'
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

define internal fastcc void @test(i8* nocapture %fmt, i8* %ap) nounwind {
entry:
  %ap_addr = alloca i8*, align 4                  ; <i8**> [#uses=18]
  store i8* %ap, i8** %ap_addr
  %0 = load i8* %fmt, align 1                     ; <i8> [#uses=1]
  %1 = icmp eq i8 %0, 0                           ; <i1> [#uses=1]
  br i1 %1, label %bb10, label %bb

bb:                                               ; preds = %bb9.backedge, %entry
  %indvar = phi i32 [ %tmp, %bb9.backedge ], [ 0, %entry ] ; <i32> [#uses=2]
  %fmt_addr.01 = getelementptr i8* %fmt, i32 %indvar ; <i8*> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %fmt, i32 %tmp     ; <i8*> [#uses=1]
  %2 = load i8* %fmt_addr.01, align 1             ; <i8> [#uses=1]
  %3 = sext i8 %2 to i32                          ; <i32> [#uses=1]
  switch i32 %3, label %bb9.backedge [
    i32 68, label %bb6
    i32 76, label %bb8
    i32 81, label %bb7
    i32 99, label %bb5
    i32 100, label %bb3
    i32 105, label %bb2
    i32 108, label %bb4
    i32 115, label %bb1
  ]

bb1:                                              ; preds = %bb
  %4 = load i8** %ap_addr, align 4                ; <i8*> [#uses=2]
  %5 = getelementptr inbounds i8* %4, i32 4       ; <i8*> [#uses=1]
  store i8* %5, i8** %ap_addr, align 4
  %6 = bitcast i8* %4 to i8**                     ; <i8**> [#uses=1]
  %7 = load i8** %6, align 4                      ; <i8*> [#uses=1]
  %8 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %7) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb9.backedge:                                     ; preds = %bb8, %bb7, %bb6, %bb5, %bb4, %bb3, %bb2, %bb1, %bb
  %9 = load i8* %scevgep, align 1                 ; <i8> [#uses=1]
  %10 = icmp eq i8 %9, 0                          ; <i1> [#uses=1]
  br i1 %10, label %bb10, label %bb

bb2:                                              ; preds = %bb
  %11 = load i8** %ap_addr, align 4               ; <i8*> [#uses=2]
  %12 = getelementptr inbounds i8* %11, i32 4     ; <i8*> [#uses=1]
  store i8* %12, i8** %ap_addr, align 4
  %13 = bitcast i8* %11 to i32*                   ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4                    ; <i32> [#uses=1]
  %15 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %14) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb3:                                              ; preds = %bb
  %16 = load i8** %ap_addr, align 4               ; <i8*> [#uses=2]
  %17 = getelementptr inbounds i8* %16, i32 8     ; <i8*> [#uses=1]
  store i8* %17, i8** %ap_addr, align 4
  %18 = bitcast i8* %16 to double*                ; <double*> [#uses=1]
  %19 = load double* %18, align 4                 ; <double> [#uses=1]
  %20 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), double %19) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb4:                                              ; preds = %bb
  %21 = load i8** %ap_addr, align 4               ; <i8*> [#uses=2]
  %22 = getelementptr inbounds i8* %21, i32 8     ; <i8*> [#uses=1]
  store i8* %22, i8** %ap_addr, align 4
  %23 = bitcast i8* %21 to i64*                   ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4                    ; <i64> [#uses=1]
  %25 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0), i64 %24) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb5:                                              ; preds = %bb
  %26 = load i8** %ap_addr, align 4               ; <i8*> [#uses=2]
  %27 = getelementptr inbounds i8* %26, i32 4     ; <i8*> [#uses=1]
  store i8* %27, i8** %ap_addr, align 4
  %28 = bitcast i8* %26 to i32*                   ; <i32*> [#uses=1]
  %29 = load i32* %28, align 4                    ; <i32> [#uses=1]
  %30 = trunc i32 %29 to i8                       ; <i8> [#uses=1]
  %31 = sext i8 %30 to i32                        ; <i32> [#uses=1]
  %32 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %31) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb6:                                              ; preds = %bb
  %33 = load i8** %ap_addr, align 4               ; <i8*> [#uses=3]
  %34 = getelementptr inbounds i8* %33, i32 8     ; <i8*> [#uses=1]
  store i8* %34, i8** %ap_addr, align 4
  %35 = bitcast i8* %33 to i32*                   ; <i32*> [#uses=1]
  %36 = load i32* %35, align 4                    ; <i32> [#uses=1]
  %37 = getelementptr i8* %33, i32 4              ; <i8*> [#uses=1]
  %38 = load i8* %37, align 4                     ; <i8> [#uses=1]
  %39 = sext i8 %38 to i32                        ; <i32> [#uses=1]
  %40 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %36, i32 %39) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb7:                                              ; preds = %bb
  %41 = load i8** %ap_addr, align 4               ; <i8*> [#uses=3]
  %42 = getelementptr inbounds i8* %41, i32 12    ; <i8*> [#uses=1]
  store i8* %42, i8** %ap_addr, align 4
  %43 = bitcast i8* %41 to i32*                   ; <i32*> [#uses=1]
  %44 = load i32* %43, align 4                    ; <i32> [#uses=1]
  %45 = getelementptr inbounds i8* %41, i32 4     ; <i8*> [#uses=1]
  %46 = bitcast i8* %45 to double*                ; <double*> [#uses=1]
  %47 = load double* %46, align 4                 ; <double> [#uses=1]
  %48 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i32 %44, double %47) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb8:                                              ; preds = %bb
  %49 = load i8** %ap_addr, align 4               ; <i8*> [#uses=5]
  %50 = getelementptr inbounds i8* %49, i32 20    ; <i8*> [#uses=1]
  store i8* %50, i8** %ap_addr, align 4
  %51 = bitcast i8* %49 to i32*                   ; <i32*> [#uses=1]
  %52 = load i32* %51, align 4                    ; <i32> [#uses=1]
  %53 = getelementptr inbounds i8* %49, i32 4     ; <i8*> [#uses=1]
  %54 = bitcast i8* %53 to double*                ; <double*> [#uses=1]
  %55 = load double* %54, align 4                 ; <double> [#uses=1]
  %56 = getelementptr inbounds i8* %49, i32 12    ; <i8*> [#uses=1]
  %57 = bitcast i8* %56 to %struct.DWordS**       ; <%struct.DWordS**> [#uses=1]
  %58 = load %struct.DWordS** %57, align 4        ; <%struct.DWordS*> [#uses=1]
  %59 = getelementptr inbounds i8* %49, i32 16    ; <i8*> [#uses=1]
  %60 = bitcast i8* %59 to i32*                   ; <i32*> [#uses=1]
  %61 = load i32* %60, align 4                    ; <i32> [#uses=1]
  %62 = icmp ne %struct.DWordS* %58, null         ; <i1> [#uses=1]
  %63 = zext i1 %62 to i32                        ; <i32> [#uses=1]
  %64 = call i32 (i8*, ...)* @printf(i8* noalias getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %52, double %55, i32 %63, i32 %61) nounwind ; <i32> [#uses=0]
  br label %bb9.backedge

bb10:                                             ; preds = %bb9.backedge, %entry
  %ap_addr11 = bitcast i8** %ap_addr to i8*       ; <i8*> [#uses=1]
  call void @llvm.va_end(i8* %ap_addr11)
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.va_end(i8*) nounwind

define internal void @testVaCopyArg(i8* nocapture %fmt, ...) nounwind {
entry:
  %aq = alloca i8*, align 4                       ; <i8**> [#uses=2]
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=2]
  %memtmp = alloca i8*, align 4                   ; <i8**> [#uses=2]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %0 = load i8** %ap, align 4                     ; <i8*> [#uses=1]
  store i8* %0, i8** %memtmp
  %aq2 = bitcast i8** %aq to i8*                  ; <i8*> [#uses=2]
  %memtmp3 = bitcast i8** %memtmp to i8*          ; <i8*> [#uses=1]
  call void @llvm.va_copy(i8* %aq2, i8* %memtmp3)
  %1 = load i8** %aq, align 4                     ; <i8*> [#uses=1]
  call fastcc void @test(i8* %fmt, i8* %1) nounwind
  call void @llvm.va_end(i8* %aq2)
  call void @llvm.va_end(i8* %ap1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_copy(i8*, i8*) nounwind

define internal void @testVaListArg(i8* nocapture %fmt, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=2]
  %ap1 = bitcast i8** %ap to i8*                  ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1)
  %0 = load i8** %ap, align 4                     ; <i8*> [#uses=1]
  call fastcc void @test(i8* %fmt, i8* %0) nounwind
  call void @llvm.va_end(i8* %ap1)
  ret void
}

define i32 @main() nounwind {
entry:
  %ls = alloca %struct.LargeS, align 8            ; <%struct.LargeS*> [#uses=6]
  %dw = alloca %struct.DWordS, align 8            ; <%struct.DWordS*> [#uses=5]
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
  call void (i8*, ...)* @testVaListArg(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i32 0, i32 0)) nounwind
  call void (i8*, ...)* @testVaCopyArg(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i32 0, i32 0)) nounwind
  call void (i8*, ...)* @testVaListArg(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423) nounwind
  call void (i8*, ...)* @testVaCopyArg(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423) nounwind
  call void (i8*, ...)* @testVaListArg(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), %struct.DWordS* byval align 4 %dw, i32 19, double 2.000000e+01, %struct.LargeS* byval align 4 %ls) nounwind
  call void (i8*, ...)* @testVaCopyArg(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), %struct.DWordS* byval align 4 %dw, i32 19, double 2.000000e+01, %struct.LargeS* byval align 4 %ls) nounwind
  ret i32 0
}
