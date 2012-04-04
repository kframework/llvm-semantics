; ModuleID = '/home/david/src/c-semantics/tests/unitTests/bitfields2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i8, i8, [2 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"i=%d, u=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"bit.i=%d, bit.u=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [38 x i8] c"unsigned_result=%d, signed_result=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"i %% u = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [27 x i8] c"i %% u != unsigned_result\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"i %% (unsigned int) u = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [42 x i8] c"i %% (unsigned int) u != unsigned_result\0A\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"i %% bit.u = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"i %% bit.u != signed_result\0A\00", align 1
@.str9 = private unnamed_addr constant [21 x i8] c"bit.i %% bit.u = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [33 x i8] c"bit.i %% bit.u != signed_result\0A\00", align 1
@.str11 = private unnamed_addr constant [32 x i8] c"i %% (unsigned int) bit.u = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [46 x i8] c"i %% (unsigned int) bit.u != unsigned_result\0A\00", align 1
@.str13 = private unnamed_addr constant [36 x i8] c"bit.i %% (unsigned int) bit.u = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [50 x i8] c"bit.i %% (unsigned int) bit.u != unsigned_result\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %bit = alloca %struct.x, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  %unsigned_result = alloca i32, align 4
  %signed_result = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 44, i32* %unsigned_result, align 4
  store i32 -13, i32* %signed_result, align 4
  %0 = bitcast %struct.x* %bit to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -16257
  %3 = or i32 %2, 7808
  store i32 %3, i32* %0, align 4
  store i32 61, i32* %u, align 4
  %4 = bitcast %struct.x* %bit to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -128
  %7 = or i32 %6, 115
  store i32 %7, i32* %4, align 4
  store i32 -13, i32* %i, align 4
  %8 = load i32* %i, align 4
  %9 = load i32* %u, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %8, i32 %9)
  %10 = bitcast %struct.x* %bit to i32*
  %11 = load i32* %10, align 4
  %bf.clear = and i32 %11, 127
  %12 = shl i32 %bf.clear, 25
  %bf.val.sext = ashr i32 %12, 25
  %13 = bitcast %struct.x* %bit to i32*
  %14 = load i32* %13, align 4
  %15 = lshr i32 %14, 7
  %bf.clear1 = and i32 %15, 127
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %bf.val.sext, i32 %bf.clear1)
  %16 = load i32* %unsigned_result, align 4
  %17 = load i32* %signed_result, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i32 0, i32 0), i32 %16, i32 %17)
  %18 = load i32* %i, align 4
  %19 = load i32* %u, align 4
  %rem = urem i32 %18, %19
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %rem)
  %20 = load i32* %i, align 4
  %21 = load i32* %u, align 4
  %rem5 = urem i32 %20, %21
  %22 = load i32* %unsigned_result, align 4
  %cmp = icmp ne i32 %rem5, %22
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %23 = load i32* %i, align 4
  %24 = load i32* %u, align 4
  %rem7 = urem i32 %23, %24
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %rem7)
  %25 = load i32* %i, align 4
  %26 = load i32* %u, align 4
  %rem9 = urem i32 %25, %26
  %27 = load i32* %unsigned_result, align 4
  %cmp10 = icmp ne i32 %rem9, %27
  br i1 %cmp10, label %if.then11, label %if.end13

if.then11:                                        ; preds = %if.end
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str6, i32 0, i32 0))
  br label %if.end13

if.end13:                                         ; preds = %if.then11, %if.end
  %28 = load i32* %i, align 4
  %29 = bitcast %struct.x* %bit to i32*
  %30 = load i32* %29, align 4
  %31 = lshr i32 %30, 7
  %bf.clear14 = and i32 %31, 127
  %rem15 = srem i32 %28, %bf.clear14
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 %rem15)
  %32 = load i32* %i, align 4
  %33 = bitcast %struct.x* %bit to i32*
  %34 = load i32* %33, align 4
  %35 = lshr i32 %34, 7
  %bf.clear17 = and i32 %35, 127
  %rem18 = srem i32 %32, %bf.clear17
  %36 = load i32* %signed_result, align 4
  %cmp19 = icmp ne i32 %rem18, %36
  br i1 %cmp19, label %if.then20, label %if.end22

if.then20:                                        ; preds = %if.end13
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end13
  %37 = bitcast %struct.x* %bit to i32*
  %38 = load i32* %37, align 4
  %bf.clear23 = and i32 %38, 127
  %39 = shl i32 %bf.clear23, 25
  %bf.val.sext24 = ashr i32 %39, 25
  %40 = bitcast %struct.x* %bit to i32*
  %41 = load i32* %40, align 4
  %42 = lshr i32 %41, 7
  %bf.clear25 = and i32 %42, 127
  %rem26 = srem i32 %bf.val.sext24, %bf.clear25
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str9, i32 0, i32 0), i32 %rem26)
  %43 = bitcast %struct.x* %bit to i32*
  %44 = load i32* %43, align 4
  %bf.clear28 = and i32 %44, 127
  %45 = shl i32 %bf.clear28, 25
  %bf.val.sext29 = ashr i32 %45, 25
  %46 = bitcast %struct.x* %bit to i32*
  %47 = load i32* %46, align 4
  %48 = lshr i32 %47, 7
  %bf.clear30 = and i32 %48, 127
  %rem31 = srem i32 %bf.val.sext29, %bf.clear30
  %49 = load i32* %signed_result, align 4
  %cmp32 = icmp ne i32 %rem31, %49
  br i1 %cmp32, label %if.then33, label %if.end35

if.then33:                                        ; preds = %if.end22
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0))
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %if.end22
  %50 = load i32* %i, align 4
  %51 = bitcast %struct.x* %bit to i32*
  %52 = load i32* %51, align 4
  %53 = lshr i32 %52, 7
  %bf.clear36 = and i32 %53, 127
  %rem37 = urem i32 %50, %bf.clear36
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str11, i32 0, i32 0), i32 %rem37)
  %54 = load i32* %i, align 4
  %55 = bitcast %struct.x* %bit to i32*
  %56 = load i32* %55, align 4
  %57 = lshr i32 %56, 7
  %bf.clear39 = and i32 %57, 127
  %rem40 = urem i32 %54, %bf.clear39
  %58 = load i32* %unsigned_result, align 4
  %cmp41 = icmp ne i32 %rem40, %58
  br i1 %cmp41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %if.end35
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str12, i32 0, i32 0))
  br label %if.end44

if.end44:                                         ; preds = %if.then42, %if.end35
  %59 = bitcast %struct.x* %bit to i32*
  %60 = load i32* %59, align 4
  %bf.clear45 = and i32 %60, 127
  %61 = shl i32 %bf.clear45, 25
  %bf.val.sext46 = ashr i32 %61, 25
  %62 = bitcast %struct.x* %bit to i32*
  %63 = load i32* %62, align 4
  %64 = lshr i32 %63, 7
  %bf.clear47 = and i32 %64, 127
  %rem48 = urem i32 %bf.val.sext46, %bf.clear47
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str13, i32 0, i32 0), i32 %rem48)
  %65 = bitcast %struct.x* %bit to i32*
  %66 = load i32* %65, align 4
  %bf.clear50 = and i32 %66, 127
  %67 = shl i32 %bf.clear50, 25
  %bf.val.sext51 = ashr i32 %67, 25
  %68 = bitcast %struct.x* %bit to i32*
  %69 = load i32* %68, align 4
  %70 = lshr i32 %69, 7
  %bf.clear52 = and i32 %70, 127
  %rem53 = urem i32 %bf.val.sext51, %bf.clear52
  %71 = load i32* %unsigned_result, align 4
  %cmp54 = icmp ne i32 %rem53, %71
  br i1 %cmp54, label %if.then55, label %if.end57

if.then55:                                        ; preds = %if.end44
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str14, i32 0, i32 0))
  br label %if.end57

if.end57:                                         ; preds = %if.then55, %if.end44
  ret i32 0
}

declare i32 @printf(i8*, ...)
