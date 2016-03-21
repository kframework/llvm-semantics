; ModuleID = './va-arg-16.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @vafunction(double %dummy1, double %dummy2, ...) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store double %dummy1, double* %1, align 8
  store double %dummy2, double* %2, align 8
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = load double, double* %1, align 8
  %6 = fcmp une double %5, 8.880000e+02
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load double, double* %2, align 8
  %10 = fcmp une double %9, 9.990000e+02
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  call void @abort() #3
  unreachable

; <label>:12                                      ; preds = %8
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 1
  %15 = load i32, i32* %14
  %16 = icmp ule i32 %15, 160
  br i1 %16, label %17, label %23

; <label>:17                                      ; preds = %12
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 3
  %19 = load i8*, i8** %18
  %20 = getelementptr i8, i8* %19, i32 %15
  %21 = bitcast i8* %20 to double*
  %22 = add i32 %15, 16
  store i32 %22, i32* %14
  br label %28

; <label>:23                                      ; preds = %12
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 2
  %25 = load i8*, i8** %24
  %26 = bitcast i8* %25 to double*
  %27 = getelementptr i8, i8* %25, i32 8
  store i8* %27, i8** %24
  br label %28

; <label>:28                                      ; preds = %23, %17
  %29 = phi double* [ %21, %17 ], [ %26, %23 ]
  %30 = load double, double* %29
  %31 = fcmp une double %30, 1.000000e+00
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %28
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %28
  %34 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %34, i32 0, i32 1
  %36 = load i32, i32* %35
  %37 = icmp ule i32 %36, 160
  br i1 %37, label %38, label %44

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %34, i32 0, i32 3
  %40 = load i8*, i8** %39
  %41 = getelementptr i8, i8* %40, i32 %36
  %42 = bitcast i8* %41 to double*
  %43 = add i32 %36, 16
  store i32 %43, i32* %35
  br label %49

; <label>:44                                      ; preds = %33
  %45 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %34, i32 0, i32 2
  %46 = load i8*, i8** %45
  %47 = bitcast i8* %46 to double*
  %48 = getelementptr i8, i8* %46, i32 8
  store i8* %48, i8** %45
  br label %49

; <label>:49                                      ; preds = %44, %38
  %50 = phi double* [ %42, %38 ], [ %47, %44 ]
  %51 = load double, double* %50
  %52 = fcmp une double %51, 2.000000e+00
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %49
  call void @abort() #3
  unreachable

; <label>:54                                      ; preds = %49
  %55 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %56 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %55, i32 0, i32 1
  %57 = load i32, i32* %56
  %58 = icmp ule i32 %57, 160
  br i1 %58, label %59, label %65

; <label>:59                                      ; preds = %54
  %60 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %55, i32 0, i32 3
  %61 = load i8*, i8** %60
  %62 = getelementptr i8, i8* %61, i32 %57
  %63 = bitcast i8* %62 to double*
  %64 = add i32 %57, 16
  store i32 %64, i32* %56
  br label %70

; <label>:65                                      ; preds = %54
  %66 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %55, i32 0, i32 2
  %67 = load i8*, i8** %66
  %68 = bitcast i8* %67 to double*
  %69 = getelementptr i8, i8* %67, i32 8
  store i8* %69, i8** %66
  br label %70

; <label>:70                                      ; preds = %65, %59
  %71 = phi double* [ %63, %59 ], [ %68, %65 ]
  %72 = load double, double* %71
  %73 = fcmp une double %72, 3.000000e+00
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %70
  call void @abort() #3
  unreachable

; <label>:75                                      ; preds = %70
  %76 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %77 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 1
  %78 = load i32, i32* %77
  %79 = icmp ule i32 %78, 160
  br i1 %79, label %80, label %86

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 3
  %82 = load i8*, i8** %81
  %83 = getelementptr i8, i8* %82, i32 %78
  %84 = bitcast i8* %83 to double*
  %85 = add i32 %78, 16
  store i32 %85, i32* %77
  br label %91

; <label>:86                                      ; preds = %75
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 2
  %88 = load i8*, i8** %87
  %89 = bitcast i8* %88 to double*
  %90 = getelementptr i8, i8* %88, i32 8
  store i8* %90, i8** %87
  br label %91

; <label>:91                                      ; preds = %86, %80
  %92 = phi double* [ %84, %80 ], [ %89, %86 ]
  %93 = load double, double* %92
  %94 = fcmp une double %93, 4.000000e+00
  br i1 %94, label %95, label %96

; <label>:95                                      ; preds = %91
  call void @abort() #3
  unreachable

; <label>:96                                      ; preds = %91
  %97 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %98 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %97, i32 0, i32 1
  %99 = load i32, i32* %98
  %100 = icmp ule i32 %99, 160
  br i1 %100, label %101, label %107

; <label>:101                                     ; preds = %96
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %97, i32 0, i32 3
  %103 = load i8*, i8** %102
  %104 = getelementptr i8, i8* %103, i32 %99
  %105 = bitcast i8* %104 to double*
  %106 = add i32 %99, 16
  store i32 %106, i32* %98
  br label %112

; <label>:107                                     ; preds = %96
  %108 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %97, i32 0, i32 2
  %109 = load i8*, i8** %108
  %110 = bitcast i8* %109 to double*
  %111 = getelementptr i8, i8* %109, i32 8
  store i8* %111, i8** %108
  br label %112

; <label>:112                                     ; preds = %107, %101
  %113 = phi double* [ %105, %101 ], [ %110, %107 ]
  %114 = load double, double* %113
  %115 = fcmp une double %114, 5.000000e+00
  br i1 %115, label %116, label %117

; <label>:116                                     ; preds = %112
  call void @abort() #3
  unreachable

; <label>:117                                     ; preds = %112
  %118 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %119 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %118, i32 0, i32 1
  %120 = load i32, i32* %119
  %121 = icmp ule i32 %120, 160
  br i1 %121, label %122, label %128

; <label>:122                                     ; preds = %117
  %123 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %118, i32 0, i32 3
  %124 = load i8*, i8** %123
  %125 = getelementptr i8, i8* %124, i32 %120
  %126 = bitcast i8* %125 to double*
  %127 = add i32 %120, 16
  store i32 %127, i32* %119
  br label %133

; <label>:128                                     ; preds = %117
  %129 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %118, i32 0, i32 2
  %130 = load i8*, i8** %129
  %131 = bitcast i8* %130 to double*
  %132 = getelementptr i8, i8* %130, i32 8
  store i8* %132, i8** %129
  br label %133

; <label>:133                                     ; preds = %128, %122
  %134 = phi double* [ %126, %122 ], [ %131, %128 ]
  %135 = load double, double* %134
  %136 = fcmp une double %135, 6.000000e+00
  br i1 %136, label %137, label %138

; <label>:137                                     ; preds = %133
  call void @abort() #3
  unreachable

; <label>:138                                     ; preds = %133
  %139 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %140 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %139, i32 0, i32 1
  %141 = load i32, i32* %140
  %142 = icmp ule i32 %141, 160
  br i1 %142, label %143, label %149

; <label>:143                                     ; preds = %138
  %144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %139, i32 0, i32 3
  %145 = load i8*, i8** %144
  %146 = getelementptr i8, i8* %145, i32 %141
  %147 = bitcast i8* %146 to double*
  %148 = add i32 %141, 16
  store i32 %148, i32* %140
  br label %154

; <label>:149                                     ; preds = %138
  %150 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %139, i32 0, i32 2
  %151 = load i8*, i8** %150
  %152 = bitcast i8* %151 to double*
  %153 = getelementptr i8, i8* %151, i32 8
  store i8* %153, i8** %150
  br label %154

; <label>:154                                     ; preds = %149, %143
  %155 = phi double* [ %147, %143 ], [ %152, %149 ]
  %156 = load double, double* %155
  %157 = fcmp une double %156, 7.000000e+00
  br i1 %157, label %158, label %159

; <label>:158                                     ; preds = %154
  call void @abort() #3
  unreachable

; <label>:159                                     ; preds = %154
  %160 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %161 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %160, i32 0, i32 1
  %162 = load i32, i32* %161
  %163 = icmp ule i32 %162, 160
  br i1 %163, label %164, label %170

; <label>:164                                     ; preds = %159
  %165 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %160, i32 0, i32 3
  %166 = load i8*, i8** %165
  %167 = getelementptr i8, i8* %166, i32 %162
  %168 = bitcast i8* %167 to double*
  %169 = add i32 %162, 16
  store i32 %169, i32* %161
  br label %175

; <label>:170                                     ; preds = %159
  %171 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %160, i32 0, i32 2
  %172 = load i8*, i8** %171
  %173 = bitcast i8* %172 to double*
  %174 = getelementptr i8, i8* %172, i32 8
  store i8* %174, i8** %171
  br label %175

; <label>:175                                     ; preds = %170, %164
  %176 = phi double* [ %168, %164 ], [ %173, %170 ]
  %177 = load double, double* %176
  %178 = fcmp une double %177, 8.000000e+00
  br i1 %178, label %179, label %180

; <label>:179                                     ; preds = %175
  call void @abort() #3
  unreachable

; <label>:180                                     ; preds = %175
  %181 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %182 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %181, i32 0, i32 1
  %183 = load i32, i32* %182
  %184 = icmp ule i32 %183, 160
  br i1 %184, label %185, label %191

; <label>:185                                     ; preds = %180
  %186 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %181, i32 0, i32 3
  %187 = load i8*, i8** %186
  %188 = getelementptr i8, i8* %187, i32 %183
  %189 = bitcast i8* %188 to double*
  %190 = add i32 %183, 16
  store i32 %190, i32* %182
  br label %196

; <label>:191                                     ; preds = %180
  %192 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %181, i32 0, i32 2
  %193 = load i8*, i8** %192
  %194 = bitcast i8* %193 to double*
  %195 = getelementptr i8, i8* %193, i32 8
  store i8* %195, i8** %192
  br label %196

; <label>:196                                     ; preds = %191, %185
  %197 = phi double* [ %189, %185 ], [ %194, %191 ]
  %198 = load double, double* %197
  %199 = fcmp une double %198, 9.000000e+00
  br i1 %199, label %200, label %201

; <label>:200                                     ; preds = %196
  call void @abort() #3
  unreachable

; <label>:201                                     ; preds = %196
  %202 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %203 = bitcast %struct.__va_list_tag* %202 to i8*
  call void @llvm.va_end(i8* %203)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (double, double, ...) @vafunction(double 8.880000e+02, double 9.990000e+02, double 1.000000e+00, double 2.000000e+00, double 3.000000e+00, double 4.000000e+00, double 5.000000e+00, double 6.000000e+00, double 7.000000e+00, double 8.000000e+00, double 9.000000e+00)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
