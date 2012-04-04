; ModuleID = '/home/david/src/c-semantics/tests/unitTests/zerosInInits.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32*, [2 x i32], %struct.anon.0 }
%struct.anon.0 = type { i32* }

@main.a1 = private unnamed_addr constant [3 x i8] c"\01\00\00", align 1
@main.a2 = private unnamed_addr constant [3 x float] [float 1.000000e+00, float 2.000000e+00, float 0.000000e+00], align 4
@main.a4 = private unnamed_addr constant [3 x i32] [i32 1, i32 0, i32 0], align 4
@main.a5 = private unnamed_addr constant %struct.anon { i32 1, i32* null, [2 x i32] [i32 0, i32 1], %struct.anon.0 zeroinitializer }, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a1 = alloca [3 x i8], align 1
  %a2 = alloca [3 x float], align 4
  %a3 = alloca [3 x i32*], align 16
  %a4 = alloca [3 x i32], align 4
  %a5 = alloca %struct.anon, align 8
  store i32 0, i32* %retval
  %0 = bitcast [3 x i8]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([3 x i8]* @main.a1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %1 = bitcast [3 x float]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([3 x float]* @main.a2 to i8*), i64 12, i32 4, i1 false)
  %arrayinit.begin = getelementptr inbounds [3 x i32*]* %a3, i64 0, i64 0
  %arrayidx = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %2 = bitcast i8* %arrayidx to i32*
  store i32* %2, i32** %arrayinit.begin
  %arrayinit.start = getelementptr inbounds i32** %arrayinit.begin, i64 1
  %arrayinit.end = getelementptr inbounds i32** %arrayinit.begin, i64 3
  br label %arrayinit.body

arrayinit.body:                                   ; preds = %arrayinit.body, %entry
  %arrayinit.cur = phi i32** [ %arrayinit.start, %entry ], [ %arrayinit.next, %arrayinit.body ]
  store i32* null, i32** %arrayinit.cur
  %arrayinit.next = getelementptr inbounds i32** %arrayinit.cur, i64 1
  %arrayinit.done = icmp eq i32** %arrayinit.next, %arrayinit.end
  br i1 %arrayinit.done, label %arrayinit.end1, label %arrayinit.body

arrayinit.end1:                                   ; preds = %arrayinit.body
  %3 = bitcast [3 x i32]* %a4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x i32]* @main.a4 to i8*), i64 12, i32 4, i1 false)
  %4 = bitcast %struct.anon* %a5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast (%struct.anon* @main.a5 to i8*), i64 32, i32 8, i1 false)
  %arrayidx2 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 0
  %5 = load i8* %arrayidx2, align 1
  %conv = sext i8 %5 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %arrayinit.end1
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %arrayinit.end1
  %arrayidx4 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 1
  %6 = load i8* %arrayidx4, align 1
  %conv5 = sext i8 %6 to i32
  %cmp6 = icmp ne i32 %conv5, 0
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i32 2, i32* %retval
  br label %return

if.end9:                                          ; preds = %if.end
  %arrayidx10 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 2
  %7 = load i8* %arrayidx10, align 1
  %conv11 = sext i8 %7 to i32
  %cmp12 = icmp ne i32 %conv11, 0
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  store i32 3, i32* %retval
  br label %return

if.end15:                                         ; preds = %if.end9
  %arrayidx16 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %8 = load float* %arrayidx16, align 4
  %cmp17 = fcmp une float %8, 1.000000e+00
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end15
  store i32 4, i32* %retval
  br label %return

if.end20:                                         ; preds = %if.end15
  %arrayidx21 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %9 = load float* %arrayidx21, align 4
  %conv22 = fpext float %9 to double
  %cmp23 = fcmp une double %conv22, 2.000000e+00
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end20
  store i32 5, i32* %retval
  br label %return

if.end26:                                         ; preds = %if.end20
  %arrayidx27 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %10 = load float* %arrayidx27, align 4
  %cmp28 = fcmp une float %10, 0.000000e+00
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  store i32 6, i32* %retval
  br label %return

if.end31:                                         ; preds = %if.end26
  %arrayidx32 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 0
  %11 = load i32** %arrayidx32, align 8
  %arrayidx33 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %12 = ptrtoint i8* %arrayidx33 to i64
  %13 = inttoptr i64 %12 to i32*
  %cmp34 = icmp ne i32* %11, %13
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end31
  store i32 7, i32* %retval
  br label %return

if.end37:                                         ; preds = %if.end31
  %arrayidx38 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 1
  %14 = load i32** %arrayidx38, align 8
  %cmp39 = icmp ne i32* %14, null
  br i1 %cmp39, label %if.then41, label %if.end42

if.then41:                                        ; preds = %if.end37
  store i32 8, i32* %retval
  br label %return

if.end42:                                         ; preds = %if.end37
  %arrayidx43 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 2
  %15 = load i32** %arrayidx43, align 8
  %cmp44 = icmp ne i32* %15, null
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end42
  store i32 9, i32* %retval
  br label %return

if.end47:                                         ; preds = %if.end42
  %arrayidx48 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 0
  %16 = load i32* %arrayidx48, align 4
  %cmp49 = icmp ne i32 %16, 1
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end47
  store i32 10, i32* %retval
  br label %return

if.end52:                                         ; preds = %if.end47
  %arrayidx53 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 1
  %17 = load i32* %arrayidx53, align 4
  %cmp54 = icmp ne i32 %17, 0
  br i1 %cmp54, label %if.then56, label %if.end57

if.then56:                                        ; preds = %if.end52
  store i32 11, i32* %retval
  br label %return

if.end57:                                         ; preds = %if.end52
  %arrayidx58 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 2
  %18 = load i32* %arrayidx58, align 4
  %cmp59 = icmp ne i32 %18, 0
  br i1 %cmp59, label %if.then61, label %if.end62

if.then61:                                        ; preds = %if.end57
  store i32 12, i32* %retval
  br label %return

if.end62:                                         ; preds = %if.end57
  %arrayidx63 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %19 = load float* %arrayidx63, align 4
  %cmp64 = fcmp une float %19, 1.000000e+00
  br i1 %cmp64, label %if.then66, label %if.end67

if.then66:                                        ; preds = %if.end62
  store i32 13, i32* %retval
  br label %return

if.end67:                                         ; preds = %if.end62
  %arrayidx68 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %20 = load float* %arrayidx68, align 4
  %cmp69 = fcmp une float %20, 2.000000e+00
  br i1 %cmp69, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end67
  store i32 14, i32* %retval
  br label %return

if.end72:                                         ; preds = %if.end67
  %arrayidx73 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %21 = load float* %arrayidx73, align 4
  %conv74 = fpext float %21 to double
  %cmp75 = fcmp une double %conv74, 0.000000e+00
  br i1 %cmp75, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end72
  store i32 15, i32* %retval
  br label %return

if.end78:                                         ; preds = %if.end72
  %a = getelementptr inbounds %struct.anon* %a5, i32 0, i32 0
  %22 = load i32* %a, align 4
  %conv79 = sitofp i32 %22 to float
  %cmp80 = fcmp une float %conv79, 1.000000e+00
  br i1 %cmp80, label %if.then82, label %if.end83

if.then82:                                        ; preds = %if.end78
  store i32 16, i32* %retval
  br label %return

if.end83:                                         ; preds = %if.end78
  %a84 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 0
  %23 = load i32* %a84, align 4
  %cmp85 = icmp ne i32 %23, 1
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end83
  store i32 17, i32* %retval
  br label %return

if.end88:                                         ; preds = %if.end83
  %b = getelementptr inbounds %struct.anon* %a5, i32 0, i32 1
  %24 = load i32** %b, align 8
  %cmp89 = icmp ne i32* %24, null
  br i1 %cmp89, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  store i32 18, i32* %retval
  br label %return

if.end92:                                         ; preds = %if.end88
  %b93 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 1
  %25 = load i32** %b93, align 8
  %cmp94 = icmp ne i32* %25, null
  br i1 %cmp94, label %if.then96, label %if.end97

if.then96:                                        ; preds = %if.end92
  store i32 19, i32* %retval
  br label %return

if.end97:                                         ; preds = %if.end92
  %c = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %arrayidx98 = getelementptr inbounds [2 x i32]* %c, i32 0, i64 0
  %26 = load i32* %arrayidx98, align 4
  %conv99 = sitofp i32 %26 to double
  %cmp100 = fcmp une double %conv99, 0.000000e+00
  br i1 %cmp100, label %if.then102, label %if.end103

if.then102:                                       ; preds = %if.end97
  store i32 21, i32* %retval
  br label %return

if.end103:                                        ; preds = %if.end97
  %c104 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %arrayidx105 = getelementptr inbounds [2 x i32]* %c104, i32 0, i64 0
  %27 = load i32* %arrayidx105, align 4
  %cmp106 = icmp ne i32 %27, 0
  br i1 %cmp106, label %if.then108, label %if.end109

if.then108:                                       ; preds = %if.end103
  store i32 22, i32* %retval
  br label %return

if.end109:                                        ; preds = %if.end103
  %c110 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %arrayidx111 = getelementptr inbounds [2 x i32]* %c110, i32 0, i64 1
  %28 = load i32* %arrayidx111, align 4
  %cmp112 = icmp ne i32 %28, 1
  br i1 %cmp112, label %if.then114, label %if.end115

if.then114:                                       ; preds = %if.end109
  store i32 23, i32* %retval
  br label %return

if.end115:                                        ; preds = %if.end109
  %d = getelementptr inbounds %struct.anon* %a5, i32 0, i32 3
  %da = getelementptr inbounds %struct.anon.0* %d, i32 0, i32 0
  %29 = load i32** %da, align 8
  %cmp116 = icmp ne i32* %29, null
  br i1 %cmp116, label %if.then118, label %if.end119

if.then118:                                       ; preds = %if.end115
  store i32 24, i32* %retval
  br label %return

if.end119:                                        ; preds = %if.end115
  %d120 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 3
  %da121 = getelementptr inbounds %struct.anon.0* %d120, i32 0, i32 0
  %30 = load i32** %da121, align 8
  %cmp122 = icmp ne i32* %30, null
  br i1 %cmp122, label %if.then124, label %if.end125

if.then124:                                       ; preds = %if.end119
  store i32 25, i32* %retval
  br label %return

if.end125:                                        ; preds = %if.end119
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end125, %if.then124, %if.then118, %if.then114, %if.then108, %if.then102, %if.then96, %if.then91, %if.then87, %if.then82, %if.then77, %if.then71, %if.then66, %if.then61, %if.then56, %if.then51, %if.then46, %if.then41, %if.then36, %if.then30, %if.then25, %if.then19, %if.then14, %if.then8, %if.then
  %31 = load i32* %retval
  ret i32 %31
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
