; ModuleID = '/home/david/src/c-semantics/tests/unitTests/whitebox.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bigstruct = type { i32, i32, i32, i32*, i32, i32, i32, %struct.bigstruct* }

@main.data = private unnamed_addr constant [2 x i32] [i32 1, i32 0], align 4
@.str = private unnamed_addr constant [5 x i8] c"w%d\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"y%d\0A\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"zc%d\0A\00", align 1
@main.pad = internal constant [64 x i32] [i32 128, i32 5, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@main.arrayOfStrings = internal constant [14 x i8*] [i8* getelementptr inbounds ([1 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0), i8* getelementptr inbounds ([27 x i8]* @.str11, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([63 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([81 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str16, i32 0, i32 0)], align 16
@.str3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str4 = private unnamed_addr constant [33 x i8] c"d41d8cd98f00b204e9800998ecf8427e\00", align 1
@.str5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str6 = private unnamed_addr constant [33 x i8] c"0cc175b9c0f1b6a831c399e269772661\00", align 1
@.str7 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str8 = private unnamed_addr constant [33 x i8] c"900150983cd24fb0d6963f7d28e17f72\00", align 1
@.str9 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str10 = private unnamed_addr constant [33 x i8] c"f96b697d7cb7938d525a2f31aaf161d0\00", align 1
@.str11 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str12 = private unnamed_addr constant [33 x i8] c"c3fcd3d76192e4007dfb496cca67e13b\00", align 1
@.str13 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str14 = private unnamed_addr constant [33 x i8] c"d174ab98d277d9f5a5611c2c9f419d9f\00", align 1
@.str15 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str16 = private unnamed_addr constant [33 x i8] c"57edf4a22be3c955ac49da2e2107b67a\00", align 1
@.str17 = private unnamed_addr constant [6 x i8] c"za%d\0A\00", align 1
@.str18 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str19 = private unnamed_addr constant [6 x i8] c"zb%d\0A\00", align 1
@main.fpArray = private unnamed_addr constant [12 x i32 ()*] [i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main, i32 ()* @main], align 16
@.str20 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %pp = alloca i32**, align 8
  %ap = alloca [2 x i32*], align 16
  %app = alloca i32**, align 8
  %data = alloca [2 x i32], align 4
  %s = alloca %struct.bigstruct, align 8
  %ps = alloca %struct.bigstruct*, align 8
  %fpArray = alloca [12 x i32 ()*], align 16
  %multidem = alloca [2 x [2 x [2 x i32]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %kk = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  store i32** %p, i32*** %pp, align 8
  %arrayinit.begin = getelementptr inbounds [2 x i32*]* %ap, i64 0, i64 0
  %0 = load i32** %p, align 8
  store i32* %0, i32** %arrayinit.begin
  %arrayinit.element = getelementptr inbounds i32** %arrayinit.begin, i64 1
  %1 = load i32** %p, align 8
  store i32* %1, i32** %arrayinit.element
  %arraydecay = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  store i32** %arraydecay, i32*** %app, align 8
  %2 = bitcast [2 x i32]* %data to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x i32]* @main.data to i8*), i64 8, i32 4, i1 false)
  %3 = load i32* %x, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %x, align 4
  %4 = load i32** %p, align 8
  %5 = load i32* %4, align 4
  %inc1 = add nsw i32 %5, 1
  store i32 %inc1, i32* %4, align 4
  %6 = load i32*** %pp, align 8
  %7 = load i32** %6, align 8
  %8 = load i32* %7, align 4
  %inc2 = add nsw i32 %8, 1
  store i32 %inc2, i32* %7, align 4
  %9 = load i32* %x, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %9)
  %arraydecay3 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  %arrayidx = getelementptr inbounds [2 x i32]* %data, i32 0, i64 0
  %10 = load i32* %arrayidx, align 4
  %idx.ext = sext i32 %10 to i64
  %add.ptr = getelementptr inbounds i32** %arraydecay3, i64 %idx.ext
  %11 = load i32** %add.ptr, align 8
  %12 = load i32* %11, align 4
  %inc4 = add nsw i32 %12, 1
  store i32 %inc4, i32* %11, align 4
  %arrayidx5 = getelementptr inbounds [2 x i32]* %data, i32 0, i64 1
  %13 = load i32* %arrayidx5, align 4
  %idxprom = sext i32 %13 to i64
  %arrayidx6 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i64 %idxprom
  %14 = load i32** %arrayidx6, align 8
  %15 = load i32* %14, align 4
  %inc7 = add nsw i32 %15, 1
  store i32 %inc7, i32* %14, align 4
  store %struct.bigstruct* %s, %struct.bigstruct** %ps, align 8
  %a = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 0
  store i32 1, i32* %a, align 4
  %b = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 2
  store i32 3, i32* %c, align 4
  %d = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 4
  store i32 4, i32* %d, align 4
  %e = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  store i32 5, i32* %e, align 4
  %f = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  store i32 6, i32* %f, align 4
  %b8 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %p9 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 3
  store i32* %b8, i32** %p9, align 8
  %this = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  store %struct.bigstruct* %s, %struct.bigstruct** %this, align 8
  %16 = load i32* %x, align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %16)
  %this11 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %17 = load %struct.bigstruct** %this11, align 8
  %p12 = getelementptr inbounds %struct.bigstruct* %17, i32 0, i32 3
  %18 = load i32** %p12, align 8
  %19 = load i32* %18, align 4
  %20 = load i32* %x, align 4
  %add = add nsw i32 %20, %19
  store i32 %add, i32* %x, align 4
  %b13 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %21 = load i32* %b13, align 4
  %e14 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  %22 = load i32* %e14, align 4
  %add15 = add nsw i32 %21, %22
  %f16 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  %23 = load i32* %f16, align 4
  %add17 = add nsw i32 %add15, %23
  %24 = load i32* %x, align 4
  %add18 = add nsw i32 %24, %add17
  store i32 %add18, i32* %x, align 4
  %this19 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %25 = load %struct.bigstruct** %this19, align 8
  %p20 = getelementptr inbounds %struct.bigstruct* %25, i32 0, i32 3
  %26 = load i32** %p20, align 8
  %27 = load i32* %26, align 4
  %inc21 = add nsw i32 %27, 1
  store i32 %inc21, i32* %26, align 4
  %b22 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %28 = load i32* %b22, align 4
  %29 = load i32* %x, align 4
  %add23 = add nsw i32 %29, %28
  store i32 %add23, i32* %x, align 4
  %30 = load i32* %x, align 4
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i32 %30)
  %31 = load i32* getelementptr inbounds ([64 x i32]* @main.pad, i32 0, i64 1), align 4
  %idxprom25 = sext i32 %31 to i64
  %arrayidx26 = getelementptr inbounds [64 x i32]* @main.pad, i32 0, i64 %idxprom25
  %32 = load i32* %arrayidx26, align 4
  %33 = load i32* %x, align 4
  %add27 = add nsw i32 %33, %32
  store i32 %add27, i32* %x, align 4
  %34 = load i32* %x, align 4
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str17, i32 0, i32 0), i32 %34)
  %35 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 0), align 8
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %35)
  %36 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %36)
  %37 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 2), align 8
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %37)
  %38 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %arrayidx32 = getelementptr inbounds i8* %38, i64 0
  %39 = load i8* %arrayidx32, align 1
  %conv = sext i8 %39 to i32
  %cmp = icmp eq i32 %conv, 100
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %40 = load i32* %x, align 4
  %inc34 = add nsw i32 %40, 1
  store i32 %inc34, i32* %x, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %41 = load i32* %x, align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str19, i32 0, i32 0), i32 %41)
  %42 = bitcast [12 x i32 ()*]* %fpArray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %42, i8* bitcast ([12 x i32 ()*]* @main.fpArray to i8*), i64 96, i32 16, i1 false)
  %arrayidx36 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx36, i32 0, i64 0
  %arrayidx38 = getelementptr inbounds [2 x i32]* %arrayidx37, i32 0, i64 0
  store i32 1, i32* %arrayidx38, align 4
  %arrayidx39 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx40 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx39, i32 0, i64 0
  %arrayidx41 = getelementptr inbounds [2 x i32]* %arrayidx40, i32 0, i64 1
  store i32 2, i32* %arrayidx41, align 4
  %arrayidx42 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx43 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx42, i32 0, i64 1
  %arrayidx44 = getelementptr inbounds [2 x i32]* %arrayidx43, i32 0, i64 0
  store i32 3, i32* %arrayidx44, align 4
  %arrayidx45 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %arrayidx46 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx45, i32 0, i64 1
  %arrayidx47 = getelementptr inbounds [2 x i32]* %arrayidx46, i32 0, i64 1
  store i32 4, i32* %arrayidx47, align 4
  %arrayidx48 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx49 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx48, i32 0, i64 0
  %arrayidx50 = getelementptr inbounds [2 x i32]* %arrayidx49, i32 0, i64 0
  store i32 5, i32* %arrayidx50, align 4
  %arrayidx51 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx52 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx51, i32 0, i64 0
  %arrayidx53 = getelementptr inbounds [2 x i32]* %arrayidx52, i32 0, i64 1
  store i32 6, i32* %arrayidx53, align 4
  %arrayidx54 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx55 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx54, i32 0, i64 1
  %arrayidx56 = getelementptr inbounds [2 x i32]* %arrayidx55, i32 0, i64 0
  store i32 7, i32* %arrayidx56, align 4
  %arrayidx57 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %arrayidx58 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx57, i32 0, i64 1
  %arrayidx59 = getelementptr inbounds [2 x i32]* %arrayidx58, i32 0, i64 1
  store i32 8, i32* %arrayidx59, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc81, %if.end
  %43 = load i32* %i, align 4
  %cmp60 = icmp slt i32 %43, 2
  br i1 %cmp60, label %for.body, label %for.end83

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc78, %for.body
  %44 = load i32* %j, align 4
  %cmp63 = icmp slt i32 %44, 2
  br i1 %cmp63, label %for.body65, label %for.end80

for.body65:                                       ; preds = %for.cond62
  store i32 0, i32* %kk, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc, %for.body65
  %45 = load i32* %kk, align 4
  %cmp67 = icmp slt i32 %45, 2
  br i1 %cmp67, label %for.body69, label %for.end

for.body69:                                       ; preds = %for.cond66
  %46 = load i32* %kk, align 4
  %idxprom70 = sext i32 %46 to i64
  %47 = load i32* %j, align 4
  %idxprom71 = sext i32 %47 to i64
  %48 = load i32* %i, align 4
  %idxprom72 = sext i32 %48 to i64
  %arrayidx73 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 %idxprom72
  %arrayidx74 = getelementptr inbounds [2 x [2 x i32]]* %arrayidx73, i32 0, i64 %idxprom71
  %arrayidx75 = getelementptr inbounds [2 x i32]* %arrayidx74, i32 0, i64 %idxprom70
  %49 = load i32* %arrayidx75, align 4
  %50 = load i32* %x, align 4
  %add76 = add nsw i32 %50, %49
  store i32 %add76, i32* %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body69
  %51 = load i32* %kk, align 4
  %inc77 = add nsw i32 %51, 1
  store i32 %inc77, i32* %kk, align 4
  br label %for.cond66

for.end:                                          ; preds = %for.cond66
  br label %for.inc78

for.inc78:                                        ; preds = %for.end
  %52 = load i32* %j, align 4
  %inc79 = add nsw i32 %52, 1
  store i32 %inc79, i32* %j, align 4
  br label %for.cond62

for.end80:                                        ; preds = %for.cond62
  br label %for.inc81

for.inc81:                                        ; preds = %for.end80
  %53 = load i32* %i, align 4
  %inc82 = add nsw i32 %53, 1
  store i32 %inc82, i32* %i, align 4
  br label %for.cond

for.end83:                                        ; preds = %for.cond
  store i32 0, i32* %y, align 4
  %54 = load i32* %y, align 4
  %inc84 = add nsw i32 %54, 1
  store i32 %inc84, i32* %y, align 4
  %55 = load i32* %y, align 4
  %add85 = add nsw i32 %55, 3
  store i32 %add85, i32* %y, align 4
  %56 = load i32* %y, align 4
  %inc86 = add nsw i32 %56, 1
  store i32 %inc86, i32* %y, align 4
  %57 = load i32* %x, align 4
  %add87 = add nsw i32 %57, %inc86
  store i32 %add87, i32* %x, align 4
  %58 = load i32* %x, align 4
  %call88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i32 %58)
  %59 = load i32* %x, align 4
  ret i32 %59
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8*, ...)
