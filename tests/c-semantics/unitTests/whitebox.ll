; ModuleID = './whitebox.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

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

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
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
  store i32 0, i32* %1
  store i32 1, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  store i32** %p, i32*** %pp, align 8
  %2 = getelementptr inbounds [2 x i32*]* %ap, i64 0, i64 0
  %3 = load i32** %p, align 8
  store i32* %3, i32** %2
  %4 = getelementptr inbounds i32** %2, i64 1
  %5 = load i32** %p, align 8
  store i32* %5, i32** %4
  %6 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  store i32** %6, i32*** %app, align 8
  %7 = bitcast [2 x i32]* %data to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* bitcast ([2 x i32]* @main.data to i8*), i64 8, i32 4, i1 false)
  %8 = load i32* %x, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %x, align 4
  %10 = load i32** %p, align 8
  %11 = load i32* %10, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %10, align 4
  %13 = load i32*** %pp, align 8
  %14 = load i32** %13, align 8
  %15 = load i32* %14, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %14, align 4
  %17 = load i32* %x, align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 %17)
  %19 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i32 0
  %20 = getelementptr inbounds [2 x i32]* %data, i32 0, i64 0
  %21 = load i32* %20, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32** %19, i64 %22
  %24 = load i32** %23, align 8
  %25 = load i32* %24, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %24, align 4
  %27 = getelementptr inbounds [2 x i32]* %data, i32 0, i64 1
  %28 = load i32* %27, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x i32*]* %ap, i32 0, i64 %29
  %31 = load i32** %30, align 8
  %32 = load i32* %31, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %31, align 4
  store %struct.bigstruct* %s, %struct.bigstruct** %ps, align 8
  %34 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 0
  store i32 1, i32* %34, align 4
  %35 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  store i32 2, i32* %35, align 4
  %36 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 2
  store i32 3, i32* %36, align 4
  %37 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 4
  store i32 4, i32* %37, align 4
  %38 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  store i32 5, i32* %38, align 4
  %39 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  store i32 6, i32* %39, align 4
  %40 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %41 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 3
  store i32* %40, i32** %41, align 8
  %42 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  store %struct.bigstruct* %s, %struct.bigstruct** %42, align 8
  %43 = load i32* %x, align 4
  %44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i32 %43)
  %45 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %46 = load %struct.bigstruct** %45, align 8
  %47 = getelementptr inbounds %struct.bigstruct* %46, i32 0, i32 3
  %48 = load i32** %47, align 8
  %49 = load i32* %48, align 4
  %50 = load i32* %x, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, i32* %x, align 4
  %52 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %53 = load i32* %52, align 4
  %54 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 5
  %55 = load i32* %54, align 4
  %56 = add nsw i32 %53, %55
  %57 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 6
  %58 = load i32* %57, align 4
  %59 = add nsw i32 %56, %58
  %60 = load i32* %x, align 4
  %61 = add nsw i32 %60, %59
  store i32 %61, i32* %x, align 4
  %62 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 7
  %63 = load %struct.bigstruct** %62, align 8
  %64 = getelementptr inbounds %struct.bigstruct* %63, i32 0, i32 3
  %65 = load i32** %64, align 8
  %66 = load i32* %65, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %65, align 4
  %68 = getelementptr inbounds %struct.bigstruct* %s, i32 0, i32 1
  %69 = load i32* %68, align 4
  %70 = load i32* %x, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, i32* %x, align 4
  %72 = load i32* %x, align 4
  %73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i32 %72)
  %74 = load i32* getelementptr inbounds ([64 x i32]* @main.pad, i32 0, i64 1), align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [64 x i32]* @main.pad, i32 0, i64 %75
  %77 = load i32* %76, align 4
  %78 = load i32* %x, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, i32* %x, align 4
  %80 = load i32* %x, align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str17, i32 0, i32 0), i32 %80)
  %82 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 0), align 8
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %82)
  %84 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %84)
  %86 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 2), align 8
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str18, i32 0, i32 0), i8* %86)
  %88 = load i8** getelementptr inbounds ([14 x i8*]* @main.arrayOfStrings, i32 0, i64 1), align 8
  %89 = getelementptr inbounds i8* %88, i64 0
  %90 = load i8* %89, align 1
  %91 = sext i8 %90 to i32
  %92 = icmp eq i32 %91, 100
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %0
  %94 = load i32* %x, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %x, align 4
  br label %96

; <label>:96                                      ; preds = %93, %0
  %97 = load i32* %x, align 4
  %98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str19, i32 0, i32 0), i32 %97)
  %99 = bitcast [12 x i32 ()*]* %fpArray to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %99, i8* bitcast ([12 x i32 ()*]* @main.fpArray to i8*), i64 96, i32 16, i1 false)
  %100 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %101 = getelementptr inbounds [2 x [2 x i32]]* %100, i32 0, i64 0
  %102 = getelementptr inbounds [2 x i32]* %101, i32 0, i64 0
  store i32 1, i32* %102, align 4
  %103 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %104 = getelementptr inbounds [2 x [2 x i32]]* %103, i32 0, i64 0
  %105 = getelementptr inbounds [2 x i32]* %104, i32 0, i64 1
  store i32 2, i32* %105, align 4
  %106 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %107 = getelementptr inbounds [2 x [2 x i32]]* %106, i32 0, i64 1
  %108 = getelementptr inbounds [2 x i32]* %107, i32 0, i64 0
  store i32 3, i32* %108, align 4
  %109 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 0
  %110 = getelementptr inbounds [2 x [2 x i32]]* %109, i32 0, i64 1
  %111 = getelementptr inbounds [2 x i32]* %110, i32 0, i64 1
  store i32 4, i32* %111, align 4
  %112 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %113 = getelementptr inbounds [2 x [2 x i32]]* %112, i32 0, i64 0
  %114 = getelementptr inbounds [2 x i32]* %113, i32 0, i64 0
  store i32 5, i32* %114, align 4
  %115 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %116 = getelementptr inbounds [2 x [2 x i32]]* %115, i32 0, i64 0
  %117 = getelementptr inbounds [2 x i32]* %116, i32 0, i64 1
  store i32 6, i32* %117, align 4
  %118 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %119 = getelementptr inbounds [2 x [2 x i32]]* %118, i32 0, i64 1
  %120 = getelementptr inbounds [2 x i32]* %119, i32 0, i64 0
  store i32 7, i32* %120, align 4
  %121 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 1
  %122 = getelementptr inbounds [2 x [2 x i32]]* %121, i32 0, i64 1
  %123 = getelementptr inbounds [2 x i32]* %122, i32 0, i64 1
  store i32 8, i32* %123, align 4
  store i32 0, i32* %i, align 4
  br label %124

; <label>:124                                     ; preds = %156, %96
  %125 = load i32* %i, align 4
  %126 = icmp slt i32 %125, 2
  br i1 %126, label %127, label %159

; <label>:127                                     ; preds = %124
  store i32 0, i32* %j, align 4
  br label %128

; <label>:128                                     ; preds = %152, %127
  %129 = load i32* %j, align 4
  %130 = icmp slt i32 %129, 2
  br i1 %130, label %131, label %155

; <label>:131                                     ; preds = %128
  store i32 0, i32* %kk, align 4
  br label %132

; <label>:132                                     ; preds = %148, %131
  %133 = load i32* %kk, align 4
  %134 = icmp slt i32 %133, 2
  br i1 %134, label %135, label %151

; <label>:135                                     ; preds = %132
  %136 = load i32* %kk, align 4
  %137 = sext i32 %136 to i64
  %138 = load i32* %j, align 4
  %139 = sext i32 %138 to i64
  %140 = load i32* %i, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [2 x [2 x [2 x i32]]]* %multidem, i32 0, i64 %141
  %143 = getelementptr inbounds [2 x [2 x i32]]* %142, i32 0, i64 %139
  %144 = getelementptr inbounds [2 x i32]* %143, i32 0, i64 %137
  %145 = load i32* %144, align 4
  %146 = load i32* %x, align 4
  %147 = add nsw i32 %146, %145
  store i32 %147, i32* %x, align 4
  br label %148

; <label>:148                                     ; preds = %135
  %149 = load i32* %kk, align 4
  %150 = add nsw i32 %149, 1
  store i32 %150, i32* %kk, align 4
  br label %132

; <label>:151                                     ; preds = %132
  br label %152

; <label>:152                                     ; preds = %151
  %153 = load i32* %j, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, i32* %j, align 4
  br label %128

; <label>:155                                     ; preds = %128
  br label %156

; <label>:156                                     ; preds = %155
  %157 = load i32* %i, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %i, align 4
  br label %124

; <label>:159                                     ; preds = %124
  store i32 0, i32* %y, align 4
  %160 = load i32* %y, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, i32* %y, align 4
  %162 = load i32* %y, align 4
  %163 = add nsw i32 %162, 3
  store i32 %163, i32* %y, align 4
  %164 = load i32* %y, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, i32* %y, align 4
  %166 = load i32* %x, align 4
  %167 = add nsw i32 %166, %165
  store i32 %167, i32* %x, align 4
  %168 = load i32* %x, align 4
  %169 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str20, i32 0, i32 0), i32 %168)
  %170 = load i32* %x, align 4
  ret i32 %170
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
