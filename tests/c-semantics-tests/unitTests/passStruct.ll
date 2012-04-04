; ModuleID = '/home/david/src/c-semantics/tests/unitTests/passStruct.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
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
  %tmp71 = alloca i24
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
  %6 = load i8* %c, align 1
  %conv = sext i8 %6 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %7 = load i8* %d, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp ne i32 %conv4, 20
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %8 = load i8* %e, align 1
  %conv10 = sext i8 %8 to i32
  %cmp11 = icmp ne i32 %conv10, 30
  br i1 %cmp11, label %if.then13, label %if.end15

if.then13:                                        ; preds = %if.end9
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end15

if.end15:                                         ; preds = %if.then13, %if.end9
  %c16 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %9 = load i8* %c16, align 1
  %conv17 = sext i8 %9 to i32
  %cmp18 = icmp ne i32 %conv17, 11
  br i1 %cmp18, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end15
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end15
  %d23 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %10 = load i8* %d23, align 1
  %conv24 = sext i8 %10 to i32
  %cmp25 = icmp ne i32 %conv24, 21
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.end22
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.end22
  %e30 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %11 = load i8* %e30, align 1
  %conv31 = sext i8 %11 to i32
  %cmp32 = icmp ne i32 %conv31, 31
  br i1 %cmp32, label %if.then34, label %if.end36

if.then34:                                        ; preds = %if.end29
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %if.end36

if.end36:                                         ; preds = %if.then34, %if.end29
  %c37 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %12 = load i8* %c37, align 1
  %conv38 = sext i8 %12 to i32
  %cmp39 = icmp ne i32 %conv38, 12
  br i1 %cmp39, label %if.then41, label %if.end43

if.then41:                                        ; preds = %if.end36
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0))
  br label %if.end43

if.end43:                                         ; preds = %if.then41, %if.end36
  %d44 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %13 = load i8* %d44, align 1
  %conv45 = sext i8 %13 to i32
  %cmp46 = icmp ne i32 %conv45, 22
  br i1 %cmp46, label %if.then48, label %if.end50

if.then48:                                        ; preds = %if.end43
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end50

if.end50:                                         ; preds = %if.then48, %if.end43
  %e51 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %14 = load i8* %e51, align 1
  %conv52 = sext i8 %14 to i32
  %cmp53 = icmp ne i32 %conv52, 32
  br i1 %cmp53, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end50
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str8, i32 0, i32 0))
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end50
  %15 = load i64* %l.addr, align 8
  %cmp58 = icmp ne i64 %15, 123
  br i1 %cmp58, label %if.then60, label %if.end62

if.then60:                                        ; preds = %if.end57
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str9, i32 0, i32 0))
  br label %if.end62

if.end62:                                         ; preds = %if.then60, %if.end57
  %d63 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  store i8 77, i8* %d63, align 1
  %d64 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %16 = load i8* %d64, align 1
  %conv65 = sext i8 %16 to i32
  %cmp66 = icmp ne i32 %conv65, 77
  br i1 %cmp66, label %if.then68, label %if.end70

if.then68:                                        ; preds = %if.end62
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str10, i32 0, i32 0))
  br label %if.end70

if.end70:                                         ; preds = %if.then68, %if.end62
  %17 = bitcast %struct.tiny* %retval to i8*
  %18 = bitcast %struct.tiny* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %17, i8* %18, i64 3, i32 1, i1 false)
  %19 = bitcast i24* %tmp71 to %struct.tiny*
  %20 = load %struct.tiny* %retval
  store %struct.tiny %20, %struct.tiny* %19, align 1
  %21 = load i24* %tmp71
  ret i24 %21
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
  %11 = load i8* %d22, align 1
  %conv = sext i8 %11 to i32
  %cmp = icmp ne i32 %conv, 22
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str11, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %d25 = getelementptr inbounds %struct.tiny* %result, i32 0, i32 1
  %12 = load i8* %d25, align 1
  %conv26 = sext i8 %12 to i32
  %cmp27 = icmp ne i32 %conv26, 77
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0))
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str13, i32 0, i32 0))
  ret i32 0
}
