; ModuleID = './pr39501.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define float @float_min1(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = load float* %2, align 4
  %5 = fcmp olt float %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load float* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load float* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi float [ %7, %6 ], [ %9, %8 ]
  ret float %11
}

; Function Attrs: noinline nounwind uwtable
define float @float_min2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = load float* %2, align 4
  %5 = fcmp ole float %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load float* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load float* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi float [ %7, %6 ], [ %9, %8 ]
  ret float %11
}

; Function Attrs: noinline nounwind uwtable
define float @float_max1(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = load float* %2, align 4
  %5 = fcmp ogt float %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load float* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load float* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi float [ %7, %6 ], [ %9, %8 ]
  ret float %11
}

; Function Attrs: noinline nounwind uwtable
define float @float_max2(float %a, float %b) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %a, float* %1, align 4
  store float %b, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = load float* %2, align 4
  %5 = fcmp oge float %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load float* %1, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load float* %2, align 4
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi float [ %7, %6 ], [ %9, %8 ]
  ret float %11
}

; Function Attrs: noinline nounwind uwtable
define double @double_min1(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp olt double %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi double [ %7, %6 ], [ %9, %8 ]
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define double @double_min2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp ole double %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi double [ %7, %6 ], [ %9, %8 ]
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define double @double_max1(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp ogt double %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi double [ %7, %6 ], [ %9, %8 ]
  ret double %11
}

; Function Attrs: noinline nounwind uwtable
define double @double_max2(double %a, double %b) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  store double %a, double* %1, align 8
  store double %b, double* %2, align 8
  %3 = load double* %1, align 8
  %4 = load double* %2, align 8
  %5 = fcmp oge double %3, %4
  br i1 %5, label %6, label %8

; <label>:6                                       ; preds = %0
  %7 = load double* %1, align 8
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load double* %2, align 8
  br label %10

; <label>:10                                      ; preds = %8, %6
  %11 = phi double [ %7, %6 ], [ %9, %8 ]
  ret double %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call float @float_min1(float 0.000000e+00, float -1.000000e+00)
  %3 = fcmp une float %2, -1.000000e+00
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call float @float_min1(float -1.000000e+00, float 0.000000e+00)
  %7 = fcmp une float %6, -1.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call float @float_min1(float 0.000000e+00, float 1.000000e+00)
  %11 = fcmp une float %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call float @float_min1(float 1.000000e+00, float 0.000000e+00)
  %15 = fcmp une float %14, 0.000000e+00
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call float @float_min1(float -1.000000e+00, float 1.000000e+00)
  %19 = fcmp une float %18, -1.000000e+00
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call float @float_min1(float 1.000000e+00, float -1.000000e+00)
  %23 = fcmp une float %22, -1.000000e+00
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call float @float_max1(float 0.000000e+00, float -1.000000e+00)
  %27 = fcmp une float %26, 0.000000e+00
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call float @float_max1(float -1.000000e+00, float 0.000000e+00)
  %31 = fcmp une float %30, 0.000000e+00
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call float @float_max1(float 0.000000e+00, float 1.000000e+00)
  %35 = fcmp une float %34, 1.000000e+00
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call float @float_max1(float 1.000000e+00, float 0.000000e+00)
  %39 = fcmp une float %38, 1.000000e+00
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call float @float_max1(float -1.000000e+00, float 1.000000e+00)
  %43 = fcmp une float %42, 1.000000e+00
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call float @float_max1(float 1.000000e+00, float -1.000000e+00)
  %47 = fcmp une float %46, 1.000000e+00
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #3
  unreachable

; <label>:49                                      ; preds = %45
  %50 = call float @float_min2(float 0.000000e+00, float -1.000000e+00)
  %51 = fcmp une float %50, -1.000000e+00
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %49
  call void @abort() #3
  unreachable

; <label>:53                                      ; preds = %49
  %54 = call float @float_min2(float -1.000000e+00, float 0.000000e+00)
  %55 = fcmp une float %54, -1.000000e+00
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #3
  unreachable

; <label>:57                                      ; preds = %53
  %58 = call float @float_min2(float 0.000000e+00, float 1.000000e+00)
  %59 = fcmp une float %58, 0.000000e+00
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  call void @abort() #3
  unreachable

; <label>:61                                      ; preds = %57
  %62 = call float @float_min2(float 1.000000e+00, float 0.000000e+00)
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:65                                      ; preds = %61
  %66 = call float @float_min2(float -1.000000e+00, float 1.000000e+00)
  %67 = fcmp une float %66, -1.000000e+00
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %65
  %70 = call float @float_min2(float 1.000000e+00, float -1.000000e+00)
  %71 = fcmp une float %70, -1.000000e+00
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  call void @abort() #3
  unreachable

; <label>:73                                      ; preds = %69
  %74 = call float @float_max2(float 0.000000e+00, float -1.000000e+00)
  %75 = fcmp une float %74, 0.000000e+00
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  call void @abort() #3
  unreachable

; <label>:77                                      ; preds = %73
  %78 = call float @float_max2(float -1.000000e+00, float 0.000000e+00)
  %79 = fcmp une float %78, 0.000000e+00
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  call void @abort() #3
  unreachable

; <label>:81                                      ; preds = %77
  %82 = call float @float_max2(float 0.000000e+00, float 1.000000e+00)
  %83 = fcmp une float %82, 1.000000e+00
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %81
  call void @abort() #3
  unreachable

; <label>:85                                      ; preds = %81
  %86 = call float @float_max2(float 1.000000e+00, float 0.000000e+00)
  %87 = fcmp une float %86, 1.000000e+00
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  call void @abort() #3
  unreachable

; <label>:89                                      ; preds = %85
  %90 = call float @float_max2(float -1.000000e+00, float 1.000000e+00)
  %91 = fcmp une float %90, 1.000000e+00
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %89
  call void @abort() #3
  unreachable

; <label>:93                                      ; preds = %89
  %94 = call float @float_max2(float 1.000000e+00, float -1.000000e+00)
  %95 = fcmp une float %94, 1.000000e+00
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %93
  call void @abort() #3
  unreachable

; <label>:97                                      ; preds = %93
  %98 = call double @double_min1(double 0.000000e+00, double -1.000000e+00)
  %99 = fcmp une double %98, -1.000000e+00
  br i1 %99, label %100, label %101

; <label>:100                                     ; preds = %97
  call void @abort() #3
  unreachable

; <label>:101                                     ; preds = %97
  %102 = call double @double_min1(double -1.000000e+00, double 0.000000e+00)
  %103 = fcmp une double %102, -1.000000e+00
  br i1 %103, label %104, label %105

; <label>:104                                     ; preds = %101
  call void @abort() #3
  unreachable

; <label>:105                                     ; preds = %101
  %106 = call double @double_min1(double 0.000000e+00, double 1.000000e+00)
  %107 = fcmp une double %106, 0.000000e+00
  br i1 %107, label %108, label %109

; <label>:108                                     ; preds = %105
  call void @abort() #3
  unreachable

; <label>:109                                     ; preds = %105
  %110 = call double @double_min1(double 1.000000e+00, double 0.000000e+00)
  %111 = fcmp une double %110, 0.000000e+00
  br i1 %111, label %112, label %113

; <label>:112                                     ; preds = %109
  call void @abort() #3
  unreachable

; <label>:113                                     ; preds = %109
  %114 = call double @double_min1(double -1.000000e+00, double 1.000000e+00)
  %115 = fcmp une double %114, -1.000000e+00
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %113
  call void @abort() #3
  unreachable

; <label>:117                                     ; preds = %113
  %118 = call double @double_min1(double 1.000000e+00, double -1.000000e+00)
  %119 = fcmp une double %118, -1.000000e+00
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %117
  call void @abort() #3
  unreachable

; <label>:121                                     ; preds = %117
  %122 = call double @double_max1(double 0.000000e+00, double -1.000000e+00)
  %123 = fcmp une double %122, 0.000000e+00
  br i1 %123, label %124, label %125

; <label>:124                                     ; preds = %121
  call void @abort() #3
  unreachable

; <label>:125                                     ; preds = %121
  %126 = call double @double_max1(double -1.000000e+00, double 0.000000e+00)
  %127 = fcmp une double %126, 0.000000e+00
  br i1 %127, label %128, label %129

; <label>:128                                     ; preds = %125
  call void @abort() #3
  unreachable

; <label>:129                                     ; preds = %125
  %130 = call double @double_max1(double 0.000000e+00, double 1.000000e+00)
  %131 = fcmp une double %130, 1.000000e+00
  br i1 %131, label %132, label %133

; <label>:132                                     ; preds = %129
  call void @abort() #3
  unreachable

; <label>:133                                     ; preds = %129
  %134 = call double @double_max1(double 1.000000e+00, double 0.000000e+00)
  %135 = fcmp une double %134, 1.000000e+00
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %133
  call void @abort() #3
  unreachable

; <label>:137                                     ; preds = %133
  %138 = call double @double_max1(double -1.000000e+00, double 1.000000e+00)
  %139 = fcmp une double %138, 1.000000e+00
  br i1 %139, label %140, label %141

; <label>:140                                     ; preds = %137
  call void @abort() #3
  unreachable

; <label>:141                                     ; preds = %137
  %142 = call double @double_max1(double 1.000000e+00, double -1.000000e+00)
  %143 = fcmp une double %142, 1.000000e+00
  br i1 %143, label %144, label %145

; <label>:144                                     ; preds = %141
  call void @abort() #3
  unreachable

; <label>:145                                     ; preds = %141
  %146 = call double @double_min2(double 0.000000e+00, double -1.000000e+00)
  %147 = fcmp une double %146, -1.000000e+00
  br i1 %147, label %148, label %149

; <label>:148                                     ; preds = %145
  call void @abort() #3
  unreachable

; <label>:149                                     ; preds = %145
  %150 = call double @double_min2(double -1.000000e+00, double 0.000000e+00)
  %151 = fcmp une double %150, -1.000000e+00
  br i1 %151, label %152, label %153

; <label>:152                                     ; preds = %149
  call void @abort() #3
  unreachable

; <label>:153                                     ; preds = %149
  %154 = call double @double_min2(double 0.000000e+00, double 1.000000e+00)
  %155 = fcmp une double %154, 0.000000e+00
  br i1 %155, label %156, label %157

; <label>:156                                     ; preds = %153
  call void @abort() #3
  unreachable

; <label>:157                                     ; preds = %153
  %158 = call double @double_min2(double 1.000000e+00, double 0.000000e+00)
  %159 = fcmp une double %158, 0.000000e+00
  br i1 %159, label %160, label %161

; <label>:160                                     ; preds = %157
  call void @abort() #3
  unreachable

; <label>:161                                     ; preds = %157
  %162 = call double @double_min2(double -1.000000e+00, double 1.000000e+00)
  %163 = fcmp une double %162, -1.000000e+00
  br i1 %163, label %164, label %165

; <label>:164                                     ; preds = %161
  call void @abort() #3
  unreachable

; <label>:165                                     ; preds = %161
  %166 = call double @double_min2(double 1.000000e+00, double -1.000000e+00)
  %167 = fcmp une double %166, -1.000000e+00
  br i1 %167, label %168, label %169

; <label>:168                                     ; preds = %165
  call void @abort() #3
  unreachable

; <label>:169                                     ; preds = %165
  %170 = call double @double_max2(double 0.000000e+00, double -1.000000e+00)
  %171 = fcmp une double %170, 0.000000e+00
  br i1 %171, label %172, label %173

; <label>:172                                     ; preds = %169
  call void @abort() #3
  unreachable

; <label>:173                                     ; preds = %169
  %174 = call double @double_max2(double -1.000000e+00, double 0.000000e+00)
  %175 = fcmp une double %174, 0.000000e+00
  br i1 %175, label %176, label %177

; <label>:176                                     ; preds = %173
  call void @abort() #3
  unreachable

; <label>:177                                     ; preds = %173
  %178 = call double @double_max2(double 0.000000e+00, double 1.000000e+00)
  %179 = fcmp une double %178, 1.000000e+00
  br i1 %179, label %180, label %181

; <label>:180                                     ; preds = %177
  call void @abort() #3
  unreachable

; <label>:181                                     ; preds = %177
  %182 = call double @double_max2(double 1.000000e+00, double 0.000000e+00)
  %183 = fcmp une double %182, 1.000000e+00
  br i1 %183, label %184, label %185

; <label>:184                                     ; preds = %181
  call void @abort() #3
  unreachable

; <label>:185                                     ; preds = %181
  %186 = call double @double_max2(double -1.000000e+00, double 1.000000e+00)
  %187 = fcmp une double %186, 1.000000e+00
  br i1 %187, label %188, label %189

; <label>:188                                     ; preds = %185
  call void @abort() #3
  unreachable

; <label>:189                                     ; preds = %185
  %190 = call double @double_max2(double 1.000000e+00, double -1.000000e+00)
  %191 = fcmp une double %190, 1.000000e+00
  br i1 %191, label %192, label %193

; <label>:192                                     ; preds = %189
  call void @abort() #3
  unreachable

; <label>:193                                     ; preds = %189
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %195 = load i32* %1
  ret i32 %195
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
