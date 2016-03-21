; ModuleID = './lshrdi-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@zext = internal constant [64 x i64] [i64 -8690466092652643696, i64 4878138990528453960, i64 2439069495264226980, i64 1219534747632113490, i64 609767373816056745, i64 304883686908028372, i64 152441843454014186, i64 76220921727007093, i64 38110460863503546, i64 19055230431751773, i64 9527615215875886, i64 4763807607937943, i64 2381903803968971, i64 1190951901984485, i64 595475950992242, i64 297737975496121, i64 148868987748060, i64 74434493874030, i64 37217246937015, i64 18608623468507, i64 9304311734253, i64 4652155867126, i64 2326077933563, i64 1163038966781, i64 581519483390, i64 290759741695, i64 145379870847, i64 72689935423, i64 36344967711, i64 18172483855, i64 9086241927, i64 4543120963, i64 2271560481, i64 1135780240, i64 567890120, i64 283945060, i64 141972530, i64 70986265, i64 35493132, i64 17746566, i64 8873283, i64 4436641, i64 2218320, i64 1109160, i64 554580, i64 277290, i64 138645, i64 69322, i64 34661, i64 17330, i64 8665, i64 4332, i64 2166, i64 1083, i64 541, i64 270, i64 135, i64 67, i64 33, i64 16, i64 8, i64 4, i64 2, i64 1], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %y = alloca i64, align 8
  %y1 = alloca i64, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 64
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = load i64, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @zext, i32 0, i64 0), align 8
  %7 = load i32, i32* %i, align 4
  %8 = call i64 @variable_shift(i64 %6, i32 %7)
  store i64 %8, i64* %y, align 8
  %9 = load i64, i64* %y, align 8
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [64 x i64], [64 x i64]* @zext, i32 0, i64 %11
  %13 = load i64, i64* %12, align 8
  %14 = icmp ne i64 %9, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %5
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %5
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i32, i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %2

; <label>:20                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %21

; <label>:21                                      ; preds = %36, %20
  %22 = load i32, i32* %i, align 4
  %23 = icmp slt i32 %22, 64
  br i1 %23, label %24, label %39

; <label>:24                                      ; preds = %21
  %25 = load i64, i64* getelementptr inbounds ([64 x i64], [64 x i64]* @zext, i32 0, i64 0), align 8
  %26 = load i32, i32* %i, align 4
  %27 = call i64 @constant_shift(i64 %25, i32 %26)
  store i64 %27, i64* %y1, align 8
  %28 = load i64, i64* %y1, align 8
  %29 = load i32, i32* %i, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [64 x i64], [64 x i64]* @zext, i32 0, i64 %30
  %32 = load i64, i64* %31, align 8
  %33 = icmp ne i64 %28, %32
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %24
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %24
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32, i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %21

; <label>:39                                      ; preds = %21
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %41 = load i32, i32* %1
  ret i32 %41
}

; Function Attrs: nounwind uwtable
define internal i64 @variable_shift(i64 %x, i32 %i) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  store i64 %x, i64* %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load i64, i64* %1, align 8
  %4 = load i32, i32* %2, align 4
  %5 = zext i32 %4 to i64
  %6 = lshr i64 %3, %5
  ret i64 %6
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal i64 @constant_shift(i64 %x, i32 %i) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  store i64 %x, i64* %1, align 8
  store i32 %i, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %196 [
    i32 0, label %4
    i32 1, label %7
    i32 2, label %10
    i32 3, label %13
    i32 4, label %16
    i32 5, label %19
    i32 6, label %22
    i32 7, label %25
    i32 8, label %28
    i32 9, label %31
    i32 10, label %34
    i32 11, label %37
    i32 12, label %40
    i32 13, label %43
    i32 14, label %46
    i32 15, label %49
    i32 16, label %52
    i32 17, label %55
    i32 18, label %58
    i32 19, label %61
    i32 20, label %64
    i32 21, label %67
    i32 22, label %70
    i32 23, label %73
    i32 24, label %76
    i32 25, label %79
    i32 26, label %82
    i32 27, label %85
    i32 28, label %88
    i32 29, label %91
    i32 30, label %94
    i32 31, label %97
    i32 32, label %100
    i32 33, label %103
    i32 34, label %106
    i32 35, label %109
    i32 36, label %112
    i32 37, label %115
    i32 38, label %118
    i32 39, label %121
    i32 40, label %124
    i32 41, label %127
    i32 42, label %130
    i32 43, label %133
    i32 44, label %136
    i32 45, label %139
    i32 46, label %142
    i32 47, label %145
    i32 48, label %148
    i32 49, label %151
    i32 50, label %154
    i32 51, label %157
    i32 52, label %160
    i32 53, label %163
    i32 54, label %166
    i32 55, label %169
    i32 56, label %172
    i32 57, label %175
    i32 58, label %178
    i32 59, label %181
    i32 60, label %184
    i32 61, label %187
    i32 62, label %190
    i32 63, label %193
  ]

; <label>:4                                       ; preds = %0
  %5 = load i64, i64* %1, align 8
  %6 = lshr i64 %5, 0
  store i64 %6, i64* %1, align 8
  br label %197

; <label>:7                                       ; preds = %0
  %8 = load i64, i64* %1, align 8
  %9 = lshr i64 %8, 1
  store i64 %9, i64* %1, align 8
  br label %197

; <label>:10                                      ; preds = %0
  %11 = load i64, i64* %1, align 8
  %12 = lshr i64 %11, 2
  store i64 %12, i64* %1, align 8
  br label %197

; <label>:13                                      ; preds = %0
  %14 = load i64, i64* %1, align 8
  %15 = lshr i64 %14, 3
  store i64 %15, i64* %1, align 8
  br label %197

; <label>:16                                      ; preds = %0
  %17 = load i64, i64* %1, align 8
  %18 = lshr i64 %17, 4
  store i64 %18, i64* %1, align 8
  br label %197

; <label>:19                                      ; preds = %0
  %20 = load i64, i64* %1, align 8
  %21 = lshr i64 %20, 5
  store i64 %21, i64* %1, align 8
  br label %197

; <label>:22                                      ; preds = %0
  %23 = load i64, i64* %1, align 8
  %24 = lshr i64 %23, 6
  store i64 %24, i64* %1, align 8
  br label %197

; <label>:25                                      ; preds = %0
  %26 = load i64, i64* %1, align 8
  %27 = lshr i64 %26, 7
  store i64 %27, i64* %1, align 8
  br label %197

; <label>:28                                      ; preds = %0
  %29 = load i64, i64* %1, align 8
  %30 = lshr i64 %29, 8
  store i64 %30, i64* %1, align 8
  br label %197

; <label>:31                                      ; preds = %0
  %32 = load i64, i64* %1, align 8
  %33 = lshr i64 %32, 9
  store i64 %33, i64* %1, align 8
  br label %197

; <label>:34                                      ; preds = %0
  %35 = load i64, i64* %1, align 8
  %36 = lshr i64 %35, 10
  store i64 %36, i64* %1, align 8
  br label %197

; <label>:37                                      ; preds = %0
  %38 = load i64, i64* %1, align 8
  %39 = lshr i64 %38, 11
  store i64 %39, i64* %1, align 8
  br label %197

; <label>:40                                      ; preds = %0
  %41 = load i64, i64* %1, align 8
  %42 = lshr i64 %41, 12
  store i64 %42, i64* %1, align 8
  br label %197

; <label>:43                                      ; preds = %0
  %44 = load i64, i64* %1, align 8
  %45 = lshr i64 %44, 13
  store i64 %45, i64* %1, align 8
  br label %197

; <label>:46                                      ; preds = %0
  %47 = load i64, i64* %1, align 8
  %48 = lshr i64 %47, 14
  store i64 %48, i64* %1, align 8
  br label %197

; <label>:49                                      ; preds = %0
  %50 = load i64, i64* %1, align 8
  %51 = lshr i64 %50, 15
  store i64 %51, i64* %1, align 8
  br label %197

; <label>:52                                      ; preds = %0
  %53 = load i64, i64* %1, align 8
  %54 = lshr i64 %53, 16
  store i64 %54, i64* %1, align 8
  br label %197

; <label>:55                                      ; preds = %0
  %56 = load i64, i64* %1, align 8
  %57 = lshr i64 %56, 17
  store i64 %57, i64* %1, align 8
  br label %197

; <label>:58                                      ; preds = %0
  %59 = load i64, i64* %1, align 8
  %60 = lshr i64 %59, 18
  store i64 %60, i64* %1, align 8
  br label %197

; <label>:61                                      ; preds = %0
  %62 = load i64, i64* %1, align 8
  %63 = lshr i64 %62, 19
  store i64 %63, i64* %1, align 8
  br label %197

; <label>:64                                      ; preds = %0
  %65 = load i64, i64* %1, align 8
  %66 = lshr i64 %65, 20
  store i64 %66, i64* %1, align 8
  br label %197

; <label>:67                                      ; preds = %0
  %68 = load i64, i64* %1, align 8
  %69 = lshr i64 %68, 21
  store i64 %69, i64* %1, align 8
  br label %197

; <label>:70                                      ; preds = %0
  %71 = load i64, i64* %1, align 8
  %72 = lshr i64 %71, 22
  store i64 %72, i64* %1, align 8
  br label %197

; <label>:73                                      ; preds = %0
  %74 = load i64, i64* %1, align 8
  %75 = lshr i64 %74, 23
  store i64 %75, i64* %1, align 8
  br label %197

; <label>:76                                      ; preds = %0
  %77 = load i64, i64* %1, align 8
  %78 = lshr i64 %77, 24
  store i64 %78, i64* %1, align 8
  br label %197

; <label>:79                                      ; preds = %0
  %80 = load i64, i64* %1, align 8
  %81 = lshr i64 %80, 25
  store i64 %81, i64* %1, align 8
  br label %197

; <label>:82                                      ; preds = %0
  %83 = load i64, i64* %1, align 8
  %84 = lshr i64 %83, 26
  store i64 %84, i64* %1, align 8
  br label %197

; <label>:85                                      ; preds = %0
  %86 = load i64, i64* %1, align 8
  %87 = lshr i64 %86, 27
  store i64 %87, i64* %1, align 8
  br label %197

; <label>:88                                      ; preds = %0
  %89 = load i64, i64* %1, align 8
  %90 = lshr i64 %89, 28
  store i64 %90, i64* %1, align 8
  br label %197

; <label>:91                                      ; preds = %0
  %92 = load i64, i64* %1, align 8
  %93 = lshr i64 %92, 29
  store i64 %93, i64* %1, align 8
  br label %197

; <label>:94                                      ; preds = %0
  %95 = load i64, i64* %1, align 8
  %96 = lshr i64 %95, 30
  store i64 %96, i64* %1, align 8
  br label %197

; <label>:97                                      ; preds = %0
  %98 = load i64, i64* %1, align 8
  %99 = lshr i64 %98, 31
  store i64 %99, i64* %1, align 8
  br label %197

; <label>:100                                     ; preds = %0
  %101 = load i64, i64* %1, align 8
  %102 = lshr i64 %101, 32
  store i64 %102, i64* %1, align 8
  br label %197

; <label>:103                                     ; preds = %0
  %104 = load i64, i64* %1, align 8
  %105 = lshr i64 %104, 33
  store i64 %105, i64* %1, align 8
  br label %197

; <label>:106                                     ; preds = %0
  %107 = load i64, i64* %1, align 8
  %108 = lshr i64 %107, 34
  store i64 %108, i64* %1, align 8
  br label %197

; <label>:109                                     ; preds = %0
  %110 = load i64, i64* %1, align 8
  %111 = lshr i64 %110, 35
  store i64 %111, i64* %1, align 8
  br label %197

; <label>:112                                     ; preds = %0
  %113 = load i64, i64* %1, align 8
  %114 = lshr i64 %113, 36
  store i64 %114, i64* %1, align 8
  br label %197

; <label>:115                                     ; preds = %0
  %116 = load i64, i64* %1, align 8
  %117 = lshr i64 %116, 37
  store i64 %117, i64* %1, align 8
  br label %197

; <label>:118                                     ; preds = %0
  %119 = load i64, i64* %1, align 8
  %120 = lshr i64 %119, 38
  store i64 %120, i64* %1, align 8
  br label %197

; <label>:121                                     ; preds = %0
  %122 = load i64, i64* %1, align 8
  %123 = lshr i64 %122, 39
  store i64 %123, i64* %1, align 8
  br label %197

; <label>:124                                     ; preds = %0
  %125 = load i64, i64* %1, align 8
  %126 = lshr i64 %125, 40
  store i64 %126, i64* %1, align 8
  br label %197

; <label>:127                                     ; preds = %0
  %128 = load i64, i64* %1, align 8
  %129 = lshr i64 %128, 41
  store i64 %129, i64* %1, align 8
  br label %197

; <label>:130                                     ; preds = %0
  %131 = load i64, i64* %1, align 8
  %132 = lshr i64 %131, 42
  store i64 %132, i64* %1, align 8
  br label %197

; <label>:133                                     ; preds = %0
  %134 = load i64, i64* %1, align 8
  %135 = lshr i64 %134, 43
  store i64 %135, i64* %1, align 8
  br label %197

; <label>:136                                     ; preds = %0
  %137 = load i64, i64* %1, align 8
  %138 = lshr i64 %137, 44
  store i64 %138, i64* %1, align 8
  br label %197

; <label>:139                                     ; preds = %0
  %140 = load i64, i64* %1, align 8
  %141 = lshr i64 %140, 45
  store i64 %141, i64* %1, align 8
  br label %197

; <label>:142                                     ; preds = %0
  %143 = load i64, i64* %1, align 8
  %144 = lshr i64 %143, 46
  store i64 %144, i64* %1, align 8
  br label %197

; <label>:145                                     ; preds = %0
  %146 = load i64, i64* %1, align 8
  %147 = lshr i64 %146, 47
  store i64 %147, i64* %1, align 8
  br label %197

; <label>:148                                     ; preds = %0
  %149 = load i64, i64* %1, align 8
  %150 = lshr i64 %149, 48
  store i64 %150, i64* %1, align 8
  br label %197

; <label>:151                                     ; preds = %0
  %152 = load i64, i64* %1, align 8
  %153 = lshr i64 %152, 49
  store i64 %153, i64* %1, align 8
  br label %197

; <label>:154                                     ; preds = %0
  %155 = load i64, i64* %1, align 8
  %156 = lshr i64 %155, 50
  store i64 %156, i64* %1, align 8
  br label %197

; <label>:157                                     ; preds = %0
  %158 = load i64, i64* %1, align 8
  %159 = lshr i64 %158, 51
  store i64 %159, i64* %1, align 8
  br label %197

; <label>:160                                     ; preds = %0
  %161 = load i64, i64* %1, align 8
  %162 = lshr i64 %161, 52
  store i64 %162, i64* %1, align 8
  br label %197

; <label>:163                                     ; preds = %0
  %164 = load i64, i64* %1, align 8
  %165 = lshr i64 %164, 53
  store i64 %165, i64* %1, align 8
  br label %197

; <label>:166                                     ; preds = %0
  %167 = load i64, i64* %1, align 8
  %168 = lshr i64 %167, 54
  store i64 %168, i64* %1, align 8
  br label %197

; <label>:169                                     ; preds = %0
  %170 = load i64, i64* %1, align 8
  %171 = lshr i64 %170, 55
  store i64 %171, i64* %1, align 8
  br label %197

; <label>:172                                     ; preds = %0
  %173 = load i64, i64* %1, align 8
  %174 = lshr i64 %173, 56
  store i64 %174, i64* %1, align 8
  br label %197

; <label>:175                                     ; preds = %0
  %176 = load i64, i64* %1, align 8
  %177 = lshr i64 %176, 57
  store i64 %177, i64* %1, align 8
  br label %197

; <label>:178                                     ; preds = %0
  %179 = load i64, i64* %1, align 8
  %180 = lshr i64 %179, 58
  store i64 %180, i64* %1, align 8
  br label %197

; <label>:181                                     ; preds = %0
  %182 = load i64, i64* %1, align 8
  %183 = lshr i64 %182, 59
  store i64 %183, i64* %1, align 8
  br label %197

; <label>:184                                     ; preds = %0
  %185 = load i64, i64* %1, align 8
  %186 = lshr i64 %185, 60
  store i64 %186, i64* %1, align 8
  br label %197

; <label>:187                                     ; preds = %0
  %188 = load i64, i64* %1, align 8
  %189 = lshr i64 %188, 61
  store i64 %189, i64* %1, align 8
  br label %197

; <label>:190                                     ; preds = %0
  %191 = load i64, i64* %1, align 8
  %192 = lshr i64 %191, 62
  store i64 %192, i64* %1, align 8
  br label %197

; <label>:193                                     ; preds = %0
  %194 = load i64, i64* %1, align 8
  %195 = lshr i64 %194, 63
  store i64 %195, i64* %1, align 8
  br label %197

; <label>:196                                     ; preds = %0
  call void @abort() #2
  unreachable

; <label>:197                                     ; preds = %193, %190, %187, %184, %181, %178, %175, %172, %169, %166, %163, %160, %157, %154, %151, %148, %145, %142, %139, %136, %133, %130, %127, %124, %121, %118, %115, %112, %109, %106, %103, %100, %97, %94, %91, %88, %85, %82, %79, %76, %73, %70, %67, %64, %61, %58, %55, %52, %49, %46, %43, %40, %37, %34, %31, %28, %25, %22, %19, %16, %13, %10, %7, %4
  %198 = load i64, i64* %1, align 8
  ret i64 %198
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
