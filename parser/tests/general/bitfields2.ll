; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/bitfields2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %i, align 4
  %tmp1 = load i32* %u, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0), i32 %tmp, i32 %tmp1)
  %8 = bitcast %struct.x* %bit to i32*
  %9 = load i32* %8, align 4
  %bf.clear = and i32 %9, 127
  %10 = shl i32 %bf.clear, 25
  %bf.val.sext = ashr i32 %10, 25
  %11 = bitcast %struct.x* %bit to i32*
  %12 = load i32* %11, align 4
  %13 = lshr i32 %12, 7
  %bf.clear2 = and i32 %13, 127
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %bf.val.sext, i32 %bf.clear2)
  %tmp4 = load i32* %unsigned_result, align 4
  %tmp5 = load i32* %signed_result, align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i32 0, i32 0), i32 %tmp4, i32 %tmp5)
  %tmp7 = load i32* %i, align 4
  %tmp8 = load i32* %u, align 4
  %rem = urem i32 %tmp7, %tmp8
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0), i32 %rem)
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %u, align 4
  %rem12 = urem i32 %tmp10, %tmp11
  %tmp13 = load i32* %unsigned_result, align 4
  %cmp = icmp ne i32 %rem12, %tmp13
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp15 = load i32* %i, align 4
  %tmp16 = load i32* %u, align 4
  %rem17 = urem i32 %tmp15, %tmp16
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i32 0, i32 0), i32 %rem17)
  %tmp19 = load i32* %i, align 4
  %tmp20 = load i32* %u, align 4
  %rem21 = urem i32 %tmp19, %tmp20
  %tmp22 = load i32* %unsigned_result, align 4
  %cmp23 = icmp ne i32 %rem21, %tmp22
  br i1 %cmp23, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str6, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.end
  %tmp27 = load i32* %i, align 4
  %14 = bitcast %struct.x* %bit to i32*
  %15 = load i32* %14, align 4
  %16 = lshr i32 %15, 7
  %bf.clear28 = and i32 %16, 127
  %rem29 = srem i32 %tmp27, %bf.clear28
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str7, i32 0, i32 0), i32 %rem29)
  %tmp31 = load i32* %i, align 4
  %17 = bitcast %struct.x* %bit to i32*
  %18 = load i32* %17, align 4
  %19 = lshr i32 %18, 7
  %bf.clear32 = and i32 %19, 127
  %rem33 = srem i32 %tmp31, %bf.clear32
  %tmp34 = load i32* %signed_result, align 4
  %cmp35 = icmp ne i32 %rem33, %tmp34
  br i1 %cmp35, label %if.then36, label %if.end38

if.then36:                                        ; preds = %if.end26
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i32 0, i32 0))
  br label %if.end38

if.end38:                                         ; preds = %if.then36, %if.end26
  %20 = bitcast %struct.x* %bit to i32*
  %21 = load i32* %20, align 4
  %bf.clear39 = and i32 %21, 127
  %22 = shl i32 %bf.clear39, 25
  %bf.val.sext40 = ashr i32 %22, 25
  %23 = bitcast %struct.x* %bit to i32*
  %24 = load i32* %23, align 4
  %25 = lshr i32 %24, 7
  %bf.clear41 = and i32 %25, 127
  %rem42 = srem i32 %bf.val.sext40, %bf.clear41
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str9, i32 0, i32 0), i32 %rem42)
  %26 = bitcast %struct.x* %bit to i32*
  %27 = load i32* %26, align 4
  %bf.clear44 = and i32 %27, 127
  %28 = shl i32 %bf.clear44, 25
  %bf.val.sext45 = ashr i32 %28, 25
  %29 = bitcast %struct.x* %bit to i32*
  %30 = load i32* %29, align 4
  %31 = lshr i32 %30, 7
  %bf.clear46 = and i32 %31, 127
  %rem47 = srem i32 %bf.val.sext45, %bf.clear46
  %tmp48 = load i32* %signed_result, align 4
  %cmp49 = icmp ne i32 %rem47, %tmp48
  br i1 %cmp49, label %if.then50, label %if.end52

if.then50:                                        ; preds = %if.end38
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0))
  br label %if.end52

if.end52:                                         ; preds = %if.then50, %if.end38
  %tmp53 = load i32* %i, align 4
  %32 = bitcast %struct.x* %bit to i32*
  %33 = load i32* %32, align 4
  %34 = lshr i32 %33, 7
  %bf.clear54 = and i32 %34, 127
  %rem55 = urem i32 %tmp53, %bf.clear54
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str11, i32 0, i32 0), i32 %rem55)
  %tmp57 = load i32* %i, align 4
  %35 = bitcast %struct.x* %bit to i32*
  %36 = load i32* %35, align 4
  %37 = lshr i32 %36, 7
  %bf.clear58 = and i32 %37, 127
  %rem59 = urem i32 %tmp57, %bf.clear58
  %tmp60 = load i32* %unsigned_result, align 4
  %cmp61 = icmp ne i32 %rem59, %tmp60
  br i1 %cmp61, label %if.then62, label %if.end64

if.then62:                                        ; preds = %if.end52
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([46 x i8]* @.str12, i32 0, i32 0))
  br label %if.end64

if.end64:                                         ; preds = %if.then62, %if.end52
  %38 = bitcast %struct.x* %bit to i32*
  %39 = load i32* %38, align 4
  %bf.clear65 = and i32 %39, 127
  %40 = shl i32 %bf.clear65, 25
  %bf.val.sext66 = ashr i32 %40, 25
  %41 = bitcast %struct.x* %bit to i32*
  %42 = load i32* %41, align 4
  %43 = lshr i32 %42, 7
  %bf.clear67 = and i32 %43, 127
  %rem68 = urem i32 %bf.val.sext66, %bf.clear67
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str13, i32 0, i32 0), i32 %rem68)
  %44 = bitcast %struct.x* %bit to i32*
  %45 = load i32* %44, align 4
  %bf.clear70 = and i32 %45, 127
  %46 = shl i32 %bf.clear70, 25
  %bf.val.sext71 = ashr i32 %46, 25
  %47 = bitcast %struct.x* %bit to i32*
  %48 = load i32* %47, align 4
  %49 = lshr i32 %48, 7
  %bf.clear72 = and i32 %49, 127
  %rem73 = urem i32 %bf.val.sext71, %bf.clear72
  %tmp74 = load i32* %unsigned_result, align 4
  %cmp75 = icmp ne i32 %rem73, %tmp74
  br i1 %cmp75, label %if.then76, label %if.end78

if.then76:                                        ; preds = %if.end64
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str14, i32 0, i32 0))
  br label %if.end78

if.end78:                                         ; preds = %if.then76, %if.end64
  ret i32 0
}

declare i32 @printf(i8*, ...)
