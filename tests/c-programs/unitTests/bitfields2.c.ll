; ModuleID = './bitfields2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.x = type { i16, [2 x i8] }

@.str = private unnamed_addr constant [12 x i8] c"i=%d, u=%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"bit.i=%d, bit.u=%d\0A\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"unsigned_result=%d, signed_result=%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"i %% u = %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [27 x i8] c"i %% u != unsigned_result\0A\00", align 1
@.str.5 = private unnamed_addr constant [28 x i8] c"i %% (unsigned int) u = %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [42 x i8] c"i %% (unsigned int) u != unsigned_result\0A\00", align 1
@.str.7 = private unnamed_addr constant [17 x i8] c"i %% bit.u = %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [29 x i8] c"i %% bit.u != signed_result\0A\00", align 1
@.str.9 = private unnamed_addr constant [21 x i8] c"bit.i %% bit.u = %d\0A\00", align 1
@.str.10 = private unnamed_addr constant [33 x i8] c"bit.i %% bit.u != signed_result\0A\00", align 1
@.str.11 = private unnamed_addr constant [32 x i8] c"i %% (unsigned int) bit.u = %d\0A\00", align 1
@.str.12 = private unnamed_addr constant [46 x i8] c"i %% (unsigned int) bit.u != unsigned_result\0A\00", align 1
@.str.13 = private unnamed_addr constant [36 x i8] c"bit.i %% (unsigned int) bit.u = %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [50 x i8] c"bit.i %% (unsigned int) bit.u != unsigned_result\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %bit = alloca %struct.x, align 4
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  %unsigned_result = alloca i32, align 4
  %signed_result = alloca i32, align 4
  store i32 0, i32* %1
  store i32 44, i32* %unsigned_result, align 4
  store i32 -13, i32* %signed_result, align 4
  %2 = bitcast %struct.x* %bit to i16*
  %3 = load i16, i16* %2, align 4
  %4 = and i16 %3, -16257
  %5 = or i16 %4, 7808
  store i16 %5, i16* %2, align 4
  store i32 61, i32* %u, align 4
  %6 = bitcast %struct.x* %bit to i16*
  %7 = load i16, i16* %6, align 4
  %8 = and i16 %7, -128
  %9 = or i16 %8, 115
  store i16 %9, i16* %6, align 4
  store i32 -13, i32* %i, align 4
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %u, align 4
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %10, i32 %11)
  %13 = bitcast %struct.x* %bit to i16*
  %14 = load i16, i16* %13, align 4
  %15 = shl i16 %14, 9
  %16 = ashr i16 %15, 9
  %17 = sext i16 %16 to i32
  %18 = bitcast %struct.x* %bit to i16*
  %19 = load i16, i16* %18, align 4
  %20 = lshr i16 %19, 7
  %21 = and i16 %20, 127
  %22 = zext i16 %21 to i32
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.1, i32 0, i32 0), i32 %17, i32 %22)
  %24 = load i32, i32* %unsigned_result, align 4
  %25 = load i32, i32* %signed_result, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i32 0, i32 0), i32 %24, i32 %25)
  %27 = load i32, i32* %i, align 4
  %28 = load i32, i32* %u, align 4
  %29 = urem i32 %27, %28
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.3, i32 0, i32 0), i32 %29)
  %31 = load i32, i32* %i, align 4
  %32 = load i32, i32* %u, align 4
  %33 = urem i32 %31, %32
  %34 = load i32, i32* %unsigned_result, align 4
  %35 = icmp ne i32 %33, %34
  br i1 %35, label %36, label %38

; <label>:36                                      ; preds = %0
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.4, i32 0, i32 0))
  br label %38

; <label>:38                                      ; preds = %36, %0
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %u, align 4
  %41 = urem i32 %39, %40
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.5, i32 0, i32 0), i32 %41)
  %43 = load i32, i32* %i, align 4
  %44 = load i32, i32* %u, align 4
  %45 = urem i32 %43, %44
  %46 = load i32, i32* %unsigned_result, align 4
  %47 = icmp ne i32 %45, %46
  br i1 %47, label %48, label %50

; <label>:48                                      ; preds = %38
  %49 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.6, i32 0, i32 0))
  br label %50

; <label>:50                                      ; preds = %48, %38
  %51 = load i32, i32* %i, align 4
  %52 = bitcast %struct.x* %bit to i16*
  %53 = load i16, i16* %52, align 4
  %54 = lshr i16 %53, 7
  %55 = and i16 %54, 127
  %56 = zext i16 %55 to i32
  %57 = srem i32 %51, %56
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.7, i32 0, i32 0), i32 %57)
  %59 = load i32, i32* %i, align 4
  %60 = bitcast %struct.x* %bit to i16*
  %61 = load i16, i16* %60, align 4
  %62 = lshr i16 %61, 7
  %63 = and i16 %62, 127
  %64 = zext i16 %63 to i32
  %65 = srem i32 %59, %64
  %66 = load i32, i32* %signed_result, align 4
  %67 = icmp ne i32 %65, %66
  br i1 %67, label %68, label %70

; <label>:68                                      ; preds = %50
  %69 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.8, i32 0, i32 0))
  br label %70

; <label>:70                                      ; preds = %68, %50
  %71 = bitcast %struct.x* %bit to i16*
  %72 = load i16, i16* %71, align 4
  %73 = shl i16 %72, 9
  %74 = ashr i16 %73, 9
  %75 = sext i16 %74 to i32
  %76 = bitcast %struct.x* %bit to i16*
  %77 = load i16, i16* %76, align 4
  %78 = lshr i16 %77, 7
  %79 = and i16 %78, 127
  %80 = zext i16 %79 to i32
  %81 = srem i32 %75, %80
  %82 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.9, i32 0, i32 0), i32 %81)
  %83 = bitcast %struct.x* %bit to i16*
  %84 = load i16, i16* %83, align 4
  %85 = shl i16 %84, 9
  %86 = ashr i16 %85, 9
  %87 = sext i16 %86 to i32
  %88 = bitcast %struct.x* %bit to i16*
  %89 = load i16, i16* %88, align 4
  %90 = lshr i16 %89, 7
  %91 = and i16 %90, 127
  %92 = zext i16 %91 to i32
  %93 = srem i32 %87, %92
  %94 = load i32, i32* %signed_result, align 4
  %95 = icmp ne i32 %93, %94
  br i1 %95, label %96, label %98

; <label>:96                                      ; preds = %70
  %97 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.10, i32 0, i32 0))
  br label %98

; <label>:98                                      ; preds = %96, %70
  %99 = load i32, i32* %i, align 4
  %100 = bitcast %struct.x* %bit to i16*
  %101 = load i16, i16* %100, align 4
  %102 = lshr i16 %101, 7
  %103 = and i16 %102, 127
  %104 = zext i16 %103 to i32
  %105 = urem i32 %99, %104
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.11, i32 0, i32 0), i32 %105)
  %107 = load i32, i32* %i, align 4
  %108 = bitcast %struct.x* %bit to i16*
  %109 = load i16, i16* %108, align 4
  %110 = lshr i16 %109, 7
  %111 = and i16 %110, 127
  %112 = zext i16 %111 to i32
  %113 = urem i32 %107, %112
  %114 = load i32, i32* %unsigned_result, align 4
  %115 = icmp ne i32 %113, %114
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %98
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.12, i32 0, i32 0))
  br label %118

; <label>:118                                     ; preds = %116, %98
  %119 = bitcast %struct.x* %bit to i16*
  %120 = load i16, i16* %119, align 4
  %121 = shl i16 %120, 9
  %122 = ashr i16 %121, 9
  %123 = sext i16 %122 to i32
  %124 = bitcast %struct.x* %bit to i16*
  %125 = load i16, i16* %124, align 4
  %126 = lshr i16 %125, 7
  %127 = and i16 %126, 127
  %128 = zext i16 %127 to i32
  %129 = urem i32 %123, %128
  %130 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.13, i32 0, i32 0), i32 %129)
  %131 = bitcast %struct.x* %bit to i16*
  %132 = load i16, i16* %131, align 4
  %133 = shl i16 %132, 9
  %134 = ashr i16 %133, 9
  %135 = sext i16 %134 to i32
  %136 = bitcast %struct.x* %bit to i16*
  %137 = load i16, i16* %136, align 4
  %138 = lshr i16 %137, 7
  %139 = and i16 %138, 127
  %140 = zext i16 %139 to i32
  %141 = urem i32 %135, %140
  %142 = load i32, i32* %unsigned_result, align 4
  %143 = icmp ne i32 %141, %142
  br i1 %143, label %144, label %146

; <label>:144                                     ; preds = %118
  %145 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.14, i32 0, i32 0))
  br label %146

; <label>:146                                     ; preds = %144, %118
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
