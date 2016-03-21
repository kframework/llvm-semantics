; ModuleID = './va-arg-6.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %n, ...) #0 {
  %1 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  store i32 %n, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32, i32* %20
  %22 = icmp ne i32 %21, 10
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %19
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %19
  %25 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 0
  %27 = load i32, i32* %26
  %28 = icmp ule i32 %27, 40
  br i1 %28, label %29, label %35

; <label>:29                                      ; preds = %24
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 3
  %31 = load i8*, i8** %30
  %32 = getelementptr i8, i8* %31, i32 %27
  %33 = bitcast i8* %32 to i64*
  %34 = add i32 %27, 8
  store i32 %34, i32* %26
  br label %40

; <label>:35                                      ; preds = %24
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %25, i32 0, i32 2
  %37 = load i8*, i8** %36
  %38 = bitcast i8* %37 to i64*
  %39 = getelementptr i8, i8* %37, i32 8
  store i8* %39, i8** %36
  br label %40

; <label>:40                                      ; preds = %35, %29
  %41 = phi i64* [ %33, %29 ], [ %38, %35 ]
  %42 = load i64, i64* %41
  %43 = icmp ne i64 %42, 10000000000
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %40
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %40
  %46 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 0
  %48 = load i32, i32* %47
  %49 = icmp ule i32 %48, 40
  br i1 %49, label %50, label %56

; <label>:50                                      ; preds = %45
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 3
  %52 = load i8*, i8** %51
  %53 = getelementptr i8, i8* %52, i32 %48
  %54 = bitcast i8* %53 to i32*
  %55 = add i32 %48, 8
  store i32 %55, i32* %47
  br label %61

; <label>:56                                      ; preds = %45
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %46, i32 0, i32 2
  %58 = load i8*, i8** %57
  %59 = bitcast i8* %58 to i32*
  %60 = getelementptr i8, i8* %58, i32 8
  store i8* %60, i8** %57
  br label %61

; <label>:61                                      ; preds = %56, %50
  %62 = phi i32* [ %54, %50 ], [ %59, %56 ]
  %63 = load i32, i32* %62
  %64 = icmp ne i32 %63, 11
  br i1 %64, label %65, label %66

; <label>:65                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:66                                      ; preds = %61
  %67 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %68 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %67, i32 0, i32 2
  %69 = load i8*, i8** %68
  %70 = getelementptr i8, i8* %69, i64 15
  %71 = ptrtoint i8* %70 to i64
  %72 = and i64 %71, -16
  %73 = inttoptr i64 %72 to i8*
  %74 = bitcast i8* %73 to x86_fp80*
  %75 = getelementptr i8, i8* %73, i32 16
  store i8* %75, i8** %68
  %76 = load x86_fp80, x86_fp80* %74
  %77 = fcmp une x86_fp80 %76, 0xK4000C8F5C28F5C28F5C3
  br i1 %77, label %78, label %79

; <label>:78                                      ; preds = %66
  call void @abort() #3
  unreachable

; <label>:79                                      ; preds = %66
  %80 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 0
  %82 = load i32, i32* %81
  %83 = icmp ule i32 %82, 40
  br i1 %83, label %84, label %90

; <label>:84                                      ; preds = %79
  %85 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 3
  %86 = load i8*, i8** %85
  %87 = getelementptr i8, i8* %86, i32 %82
  %88 = bitcast i8* %87 to i32*
  %89 = add i32 %82, 8
  store i32 %89, i32* %81
  br label %95

; <label>:90                                      ; preds = %79
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 2
  %92 = load i8*, i8** %91
  %93 = bitcast i8* %92 to i32*
  %94 = getelementptr i8, i8* %92, i32 8
  store i8* %94, i8** %91
  br label %95

; <label>:95                                      ; preds = %90, %84
  %96 = phi i32* [ %88, %84 ], [ %93, %90 ]
  %97 = load i32, i32* %96
  %98 = icmp ne i32 %97, 12
  br i1 %98, label %99, label %100

; <label>:99                                      ; preds = %95
  call void @abort() #3
  unreachable

; <label>:100                                     ; preds = %95
  %101 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %102 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 0
  %103 = load i32, i32* %102
  %104 = icmp ule i32 %103, 40
  br i1 %104, label %105, label %111

; <label>:105                                     ; preds = %100
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 3
  %107 = load i8*, i8** %106
  %108 = getelementptr i8, i8* %107, i32 %103
  %109 = bitcast i8* %108 to i32*
  %110 = add i32 %103, 8
  store i32 %110, i32* %102
  br label %116

; <label>:111                                     ; preds = %100
  %112 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %101, i32 0, i32 2
  %113 = load i8*, i8** %112
  %114 = bitcast i8* %113 to i32*
  %115 = getelementptr i8, i8* %113, i32 8
  store i8* %115, i8** %112
  br label %116

; <label>:116                                     ; preds = %111, %105
  %117 = phi i32* [ %109, %105 ], [ %114, %111 ]
  %118 = load i32, i32* %117
  %119 = icmp ne i32 %118, 13
  br i1 %119, label %120, label %121

; <label>:120                                     ; preds = %116
  call void @abort() #3
  unreachable

; <label>:121                                     ; preds = %116
  %122 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %123 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %122, i32 0, i32 0
  %124 = load i32, i32* %123
  %125 = icmp ule i32 %124, 40
  br i1 %125, label %126, label %132

; <label>:126                                     ; preds = %121
  %127 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %122, i32 0, i32 3
  %128 = load i8*, i8** %127
  %129 = getelementptr i8, i8* %128, i32 %124
  %130 = bitcast i8* %129 to i64*
  %131 = add i32 %124, 8
  store i32 %131, i32* %123
  br label %137

; <label>:132                                     ; preds = %121
  %133 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %122, i32 0, i32 2
  %134 = load i8*, i8** %133
  %135 = bitcast i8* %134 to i64*
  %136 = getelementptr i8, i8* %134, i32 8
  store i8* %136, i8** %133
  br label %137

; <label>:137                                     ; preds = %132, %126
  %138 = phi i64* [ %130, %126 ], [ %135, %132 ]
  %139 = load i64, i64* %138
  %140 = icmp ne i64 %139, 20000000000
  br i1 %140, label %141, label %142

; <label>:141                                     ; preds = %137
  call void @abort() #3
  unreachable

; <label>:142                                     ; preds = %137
  %143 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %144 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 0
  %145 = load i32, i32* %144
  %146 = icmp ule i32 %145, 40
  br i1 %146, label %147, label %153

; <label>:147                                     ; preds = %142
  %148 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 3
  %149 = load i8*, i8** %148
  %150 = getelementptr i8, i8* %149, i32 %145
  %151 = bitcast i8* %150 to i32*
  %152 = add i32 %145, 8
  store i32 %152, i32* %144
  br label %158

; <label>:153                                     ; preds = %142
  %154 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %143, i32 0, i32 2
  %155 = load i8*, i8** %154
  %156 = bitcast i8* %155 to i32*
  %157 = getelementptr i8, i8* %155, i32 8
  store i8* %157, i8** %154
  br label %158

; <label>:158                                     ; preds = %153, %147
  %159 = phi i32* [ %151, %147 ], [ %156, %153 ]
  %160 = load i32, i32* %159
  %161 = icmp ne i32 %160, 14
  br i1 %161, label %162, label %163

; <label>:162                                     ; preds = %158
  call void @abort() #3
  unreachable

; <label>:163                                     ; preds = %158
  %164 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %165 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %164, i32 0, i32 1
  %166 = load i32, i32* %165
  %167 = icmp ule i32 %166, 160
  br i1 %167, label %168, label %174

; <label>:168                                     ; preds = %163
  %169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %164, i32 0, i32 3
  %170 = load i8*, i8** %169
  %171 = getelementptr i8, i8* %170, i32 %166
  %172 = bitcast i8* %171 to double*
  %173 = add i32 %166, 16
  store i32 %173, i32* %165
  br label %179

; <label>:174                                     ; preds = %163
  %175 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %164, i32 0, i32 2
  %176 = load i8*, i8** %175
  %177 = bitcast i8* %176 to double*
  %178 = getelementptr i8, i8* %176, i32 8
  store i8* %178, i8** %175
  br label %179

; <label>:179                                     ; preds = %174, %168
  %180 = phi double* [ %172, %168 ], [ %177, %174 ]
  %181 = load double, double* %180
  %182 = fcmp une double %181, 2.720000e+00
  br i1 %182, label %183, label %184

; <label>:183                                     ; preds = %179
  call void @abort() #3
  unreachable

; <label>:184                                     ; preds = %179
  %185 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %186 = bitcast %struct.__va_list_tag* %185 to i8*
  call void @llvm.va_end(i8* %186)
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
  call void (i32, ...) @f(i32 4, i32 10, i64 10000000000, i32 11, x86_fp80 0xK4000C8F5C28F5C28F5C3, i32 12, i32 13, i64 20000000000, i32 14, double 2.720000e+00)
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
