; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/passStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8 }

@.str = private unnamed_addr constant [9 x i8] c"BUG: 10\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"BUG: 20\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"BUG: 30\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"BUG: 11\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"BUG: 21\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"BUG: 31\0A\00", align 1
@.str6 = private unnamed_addr constant [9 x i8] c"BUG: 12\0A\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"BUG: 22\0A\00", align 1
@.str8 = private unnamed_addr constant [9 x i8] c"BUG: 33\0A\00", align 1
@.str9 = private unnamed_addr constant [10 x i8] c"BUG: 123\0A\00", align 1
@.str10 = private unnamed_addr constant [10 x i8] c"BUG: 22b\0A\00", align 1
@.str11 = private unnamed_addr constant [10 x i8] c"BUG: 22c\0A\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"BUG: 22d\0A\00", align 1
@.str13 = private unnamed_addr constant [5 x i8] c"End\0A\00", align 1

define i24 @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %retval = alloca %struct.tiny, align 1
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %tmp = alloca i24
  %y = alloca %struct.tiny, align 4
  %tmp1 = alloca i24
  %z = alloca %struct.tiny, align 4
  %tmp2 = alloca i24
  %l.addr = alloca i64, align 8
  %tmp84 = alloca i24
  store i32 %n, i32* %n.addr, align 4
  store i24 %x.coerce, i24* %tmp
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %0, align 1
  store %struct.tiny %1, %struct.tiny* %x
  store i24 %y.coerce, i24* %tmp1
  %2 = bitcast i24* %tmp1 to %struct.tiny*
  %3 = load %struct.tiny* %2, align 1
  store %struct.tiny %3, %struct.tiny* %y
  store i24 %z.coerce, i24* %tmp2
  %4 = bitcast i24* %tmp2 to %struct.tiny*
  %5 = load %struct.tiny* %4, align 1
  store %struct.tiny %5, %struct.tiny* %z
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %tmp3 = load i8* %c, align 1
  %conv = sext i8 %tmp3 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %tmp5 = load i8* %d, align 1
  %conv6 = sext i8 %tmp5 to i32
  %cmp7 = icmp ne i32 %conv6, 20
  br i1 %cmp7, label %if.then9, label %if.end11

if.then9:                                         ; preds = %if.end
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end11

if.end11:                                         ; preds = %if.then9, %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %tmp12 = load i8* %e, align 1
  %conv13 = sext i8 %tmp12 to i32
  %cmp14 = icmp ne i32 %conv13, 30
  br i1 %cmp14, label %if.then16, label %if.end18

if.then16:                                        ; preds = %if.end11
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end18

if.end18:                                         ; preds = %if.then16, %if.end11
  %c19 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %tmp20 = load i8* %c19, align 1
  %conv21 = sext i8 %tmp20 to i32
  %cmp22 = icmp ne i32 %conv21, 11
  br i1 %cmp22, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end18
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.end18
  %d27 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %tmp28 = load i8* %d27, align 1
  %conv29 = sext i8 %tmp28 to i32
  %cmp30 = icmp ne i32 %conv29, 21
  br i1 %cmp30, label %if.then32, label %if.end34

if.then32:                                        ; preds = %if.end26
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end34

if.end34:                                         ; preds = %if.then32, %if.end26
  %e35 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %tmp36 = load i8* %e35, align 1
  %conv37 = sext i8 %tmp36 to i32
  %cmp38 = icmp ne i32 %conv37, 31
  br i1 %cmp38, label %if.then40, label %if.end42

if.then40:                                        ; preds = %if.end34
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %if.end42

if.end42:                                         ; preds = %if.then40, %if.end34
  %c43 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %tmp44 = load i8* %c43, align 1
  %conv45 = sext i8 %tmp44 to i32
  %cmp46 = icmp ne i32 %conv45, 12
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end42
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end42
  %d51 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %tmp52 = load i8* %d51, align 1
  %conv53 = sext i8 %tmp52 to i32
  %cmp54 = icmp ne i32 %conv53, 22
  br i1 %cmp54, label %if.then56, label %if.end58

if.then56:                                        ; preds = %if.end50
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end58

if.end58:                                         ; preds = %if.then56, %if.end50
  %e59 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %tmp60 = load i8* %e59, align 1
  %conv61 = sext i8 %tmp60 to i32
  %cmp62 = icmp ne i32 %conv61, 32
  br i1 %cmp62, label %if.then64, label %if.end66

if.then64:                                        ; preds = %if.end58
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end66

if.end66:                                         ; preds = %if.then64, %if.end58
  %tmp67 = load i64* %l.addr, align 8
  %cmp68 = icmp ne i64 %tmp67, 123
  br i1 %cmp68, label %if.then70, label %if.end72

if.then70:                                        ; preds = %if.end66
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i32 0, i32 0))
  br label %if.end72

if.end72:                                         ; preds = %if.then70, %if.end66
  %d73 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  store i8 77, i8* %d73, align 1
  %d74 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %tmp75 = load i8* %d74, align 1
  %conv76 = sext i8 %tmp75 to i32
  %cmp77 = icmp ne i32 %conv76, 77
  br i1 %cmp77, label %if.then79, label %if.end81

if.then79:                                        ; preds = %if.end72
  %call80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0))
  br label %if.end81

if.end81:                                         ; preds = %if.then79, %if.end72
  %tmp82 = bitcast %struct.tiny* %retval to i8*
  %tmp83 = bitcast %struct.tiny* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp82, i8* %tmp83, i64 3, i32 1, i1 false)
  %6 = bitcast i24* %tmp84 to %struct.tiny*
  %7 = load %struct.tiny* %retval
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i24* %tmp84
  ret i24 %8
}

declare i32 @printf(i8*, ...)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %result = alloca %struct.tiny, align 1
  %tmp = alloca i24
  %tmp18 = alloca i24
  %tmp19 = alloca i24
  %tmp20 = alloca i24
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %e = getelementptr inbounds %struct.tiny* %arrayidx10, i32 0, i32 2
  store i8 30, i8* %e, align 1
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %e12 = getelementptr inbounds %struct.tiny* %arrayidx11, i32 0, i32 2
  store i8 31, i8* %e12, align 1
  %arrayidx13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %e14 = getelementptr inbounds %struct.tiny* %arrayidx13, i32 0, i32 2
  store i8 32, i8* %e14, align 1
  %arrayidx15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx17 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %arrayidx15
  store %struct.tiny %1, %struct.tiny* %0, align 1
  %2 = load i24* %tmp
  %3 = bitcast i24* %tmp18 to %struct.tiny*
  %4 = load %struct.tiny* %arrayidx16
  store %struct.tiny %4, %struct.tiny* %3, align 1
  %5 = load i24* %tmp18
  %6 = bitcast i24* %tmp19 to %struct.tiny*
  %7 = load %struct.tiny* %arrayidx17
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i24* %tmp19
  %call = call i24 @f(i32 3, i24 %2, i24 %5, i24 %8, i64 123)
  store i24 %call, i24* %tmp20
  %9 = bitcast i24* %tmp20 to %struct.tiny*
  %10 = load %struct.tiny* %9, align 1
  store %struct.tiny %10, %struct.tiny* %result
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d22 = getelementptr inbounds %struct.tiny* %arrayidx21, i32 0, i32 1
  %tmp23 = load i8* %d22, align 1
  %conv = sext i8 %tmp23 to i32
  %cmp = icmp ne i32 %conv, 22
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str11, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %d26 = getelementptr inbounds %struct.tiny* %result, i32 0, i32 1
  %tmp27 = load i8* %d26, align 1
  %conv28 = sext i8 %tmp27 to i32
  %cmp29 = icmp ne i32 %conv28, 77
  br i1 %cmp29, label %if.then31, label %if.end33

if.then31:                                        ; preds = %if.end
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0))
  br label %if.end33

if.end33:                                         ; preds = %if.then31, %if.end
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str13, i32 0, i32 0))
  ret i32 0
}
