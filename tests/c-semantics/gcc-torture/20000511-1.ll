; ModuleID = './20000511-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(i32 %value, i32 %expect) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %value, i32* %1, align 4
  store i32 %expect, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 0, i32* %1
  store i32 7, i32* %a, align 4
  store i32 6, i32* %b, align 4
  store i32 4, i32* %c, align 4
  store i32 7, i32* %d, align 4
  store i32 2, i32* %e, align 4
  %2 = load i32* %a, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %9, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %b, align 4
  %6 = load i32* %c, align 4
  %7 = srem i32 %5, %6
  %8 = icmp ne i32 %7, 0
  br label %9

; <label>:9                                       ; preds = %4, %0
  %10 = phi i1 [ true, %0 ], [ %8, %4 ]
  %11 = zext i1 %10 to i32
  call void @f(i32 %11, i32 1)
  %12 = load i32* %a, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14                                      ; preds = %9
  %15 = load i32* %b, align 4
  %16 = load i32* %c, align 4
  %17 = srem i32 %15, %16
  br label %19

; <label>:18                                      ; preds = %9
  br label %19

; <label>:19                                      ; preds = %18, %14
  %20 = phi i32 [ %17, %14 ], [ 0, %18 ]
  call void @f(i32 %20, i32 2)
  %21 = load i32* %b, align 4
  %22 = load i32* %c, align 4
  %23 = srem i32 %21, %22
  store i32 %23, i32* %a, align 4
  call void @f(i32 %23, i32 2)
  %24 = load i32* %b, align 4
  %25 = load i32* %c, align 4
  %26 = srem i32 %24, %25
  %27 = load i32* %a, align 4
  %28 = mul nsw i32 %27, %26
  store i32 %28, i32* %a, align 4
  call void @f(i32 %28, i32 4)
  %29 = load i32* %b, align 4
  %30 = load i32* %c, align 4
  %31 = srem i32 %29, %30
  %32 = load i32* %a, align 4
  %33 = sdiv i32 %32, %31
  store i32 %33, i32* %a, align 4
  call void @f(i32 %33, i32 2)
  %34 = load i32* %b, align 4
  %35 = load i32* %c, align 4
  %36 = srem i32 %34, %35
  %37 = load i32* %a, align 4
  %38 = srem i32 %37, %36
  store i32 %38, i32* %a, align 4
  call void @f(i32 %38, i32 0)
  %39 = load i32* %b, align 4
  %40 = load i32* %c, align 4
  %41 = srem i32 %39, %40
  %42 = load i32* %a, align 4
  %43 = add nsw i32 %42, %41
  store i32 %43, i32* %a, align 4
  call void @f(i32 %43, i32 2)
  %44 = load i32* %d, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %54, label %46

; <label>:46                                      ; preds = %19
  %47 = load i32* %c, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %52

; <label>:49                                      ; preds = %46
  %50 = load i32* %e, align 4
  %51 = icmp ne i32 %50, 0
  br label %52

; <label>:52                                      ; preds = %49, %46
  %53 = phi i1 [ false, %46 ], [ %51, %49 ]
  br label %54

; <label>:54                                      ; preds = %52, %19
  %55 = phi i1 [ true, %19 ], [ %53, %52 ]
  %56 = zext i1 %55 to i32
  call void @f(i32 %56, i32 1)
  %57 = load i32* %d, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %68

; <label>:59                                      ; preds = %54
  %60 = load i32* %c, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62                                      ; preds = %59
  %63 = load i32* %e, align 4
  %64 = icmp ne i32 %63, 0
  br label %65

; <label>:65                                      ; preds = %62, %59
  %66 = phi i1 [ false, %59 ], [ %64, %62 ]
  %67 = zext i1 %66 to i32
  br label %69

; <label>:68                                      ; preds = %54
  br label %69

; <label>:69                                      ; preds = %68, %65
  %70 = phi i32 [ %67, %65 ], [ 0, %68 ]
  call void @f(i32 %70, i32 1)
  %71 = load i32* %c, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %76

; <label>:73                                      ; preds = %69
  %74 = load i32* %e, align 4
  %75 = icmp ne i32 %74, 0
  br label %76

; <label>:76                                      ; preds = %73, %69
  %77 = phi i1 [ false, %69 ], [ %75, %73 ]
  %78 = zext i1 %77 to i32
  store i32 %78, i32* %d, align 4
  call void @f(i32 %78, i32 1)
  %79 = load i32* %c, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %84

; <label>:81                                      ; preds = %76
  %82 = load i32* %e, align 4
  %83 = icmp ne i32 %82, 0
  br label %84

; <label>:84                                      ; preds = %81, %76
  %85 = phi i1 [ false, %76 ], [ %83, %81 ]
  %86 = zext i1 %85 to i32
  %87 = load i32* %d, align 4
  %88 = mul nsw i32 %87, %86
  store i32 %88, i32* %d, align 4
  call void @f(i32 %88, i32 1)
  %89 = load i32* %c, align 4
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %94

; <label>:91                                      ; preds = %84
  %92 = load i32* %e, align 4
  %93 = icmp ne i32 %92, 0
  br label %94

; <label>:94                                      ; preds = %91, %84
  %95 = phi i1 [ false, %84 ], [ %93, %91 ]
  %96 = zext i1 %95 to i32
  %97 = load i32* %d, align 4
  %98 = srem i32 %97, %96
  store i32 %98, i32* %d, align 4
  call void @f(i32 %98, i32 0)
  %99 = load i32* %c, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %104

; <label>:101                                     ; preds = %94
  %102 = load i32* %e, align 4
  %103 = icmp ne i32 %102, 0
  br label %104

; <label>:104                                     ; preds = %101, %94
  %105 = phi i1 [ false, %94 ], [ %103, %101 ]
  %106 = zext i1 %105 to i32
  %107 = load i32* %d, align 4
  %108 = add nsw i32 %107, %106
  store i32 %108, i32* %d, align 4
  call void @f(i32 %108, i32 1)
  %109 = load i32* %c, align 4
  %110 = icmp ne i32 %109, 0
  br i1 %110, label %111, label %114

; <label>:111                                     ; preds = %104
  %112 = load i32* %e, align 4
  %113 = icmp ne i32 %112, 0
  br label %114

; <label>:114                                     ; preds = %111, %104
  %115 = phi i1 [ false, %104 ], [ %113, %111 ]
  %116 = zext i1 %115 to i32
  %117 = load i32* %d, align 4
  %118 = sub nsw i32 %117, %116
  store i32 %118, i32* %d, align 4
  call void @f(i32 %118, i32 0)
  %119 = load i32* %d, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %127, label %121

; <label>:121                                     ; preds = %114
  %122 = load i32* %c, align 4
  %123 = icmp ne i32 %122, 0
  br i1 %123, label %127, label %124

; <label>:124                                     ; preds = %121
  %125 = load i32* %e, align 4
  %126 = icmp ne i32 %125, 0
  br label %127

; <label>:127                                     ; preds = %124, %121, %114
  %128 = phi i1 [ true, %121 ], [ true, %114 ], [ %126, %124 ]
  %129 = zext i1 %128 to i32
  call void @f(i32 %129, i32 1)
  %130 = load i32* %d, align 4
  %131 = icmp ne i32 %130, 0
  br i1 %131, label %132, label %141

; <label>:132                                     ; preds = %127
  %133 = load i32* %c, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %138, label %135

; <label>:135                                     ; preds = %132
  %136 = load i32* %e, align 4
  %137 = icmp ne i32 %136, 0
  br label %138

; <label>:138                                     ; preds = %135, %132
  %139 = phi i1 [ true, %132 ], [ %137, %135 ]
  %140 = zext i1 %139 to i32
  br label %142

; <label>:141                                     ; preds = %127
  br label %142

; <label>:142                                     ; preds = %141, %138
  %143 = phi i32 [ %140, %138 ], [ 0, %141 ]
  call void @f(i32 %143, i32 0)
  %144 = load i32* %c, align 4
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %149, label %146

; <label>:146                                     ; preds = %142
  %147 = load i32* %e, align 4
  %148 = icmp ne i32 %147, 0
  br label %149

; <label>:149                                     ; preds = %146, %142
  %150 = phi i1 [ true, %142 ], [ %148, %146 ]
  %151 = zext i1 %150 to i32
  store i32 %151, i32* %d, align 4
  call void @f(i32 %151, i32 1)
  %152 = load i32* %c, align 4
  %153 = icmp ne i32 %152, 0
  br i1 %153, label %157, label %154

; <label>:154                                     ; preds = %149
  %155 = load i32* %e, align 4
  %156 = icmp ne i32 %155, 0
  br label %157

; <label>:157                                     ; preds = %154, %149
  %158 = phi i1 [ true, %149 ], [ %156, %154 ]
  %159 = zext i1 %158 to i32
  %160 = load i32* %d, align 4
  %161 = mul nsw i32 %160, %159
  store i32 %161, i32* %d, align 4
  call void @f(i32 %161, i32 1)
  %162 = load i32* %c, align 4
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %167, label %164

; <label>:164                                     ; preds = %157
  %165 = load i32* %e, align 4
  %166 = icmp ne i32 %165, 0
  br label %167

; <label>:167                                     ; preds = %164, %157
  %168 = phi i1 [ true, %157 ], [ %166, %164 ]
  %169 = zext i1 %168 to i32
  %170 = load i32* %d, align 4
  %171 = srem i32 %170, %169
  store i32 %171, i32* %d, align 4
  call void @f(i32 %171, i32 0)
  %172 = load i32* %c, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %177, label %174

; <label>:174                                     ; preds = %167
  %175 = load i32* %e, align 4
  %176 = icmp ne i32 %175, 0
  br label %177

; <label>:177                                     ; preds = %174, %167
  %178 = phi i1 [ true, %167 ], [ %176, %174 ]
  %179 = zext i1 %178 to i32
  %180 = load i32* %d, align 4
  %181 = add nsw i32 %180, %179
  store i32 %181, i32* %d, align 4
  call void @f(i32 %181, i32 1)
  %182 = load i32* %c, align 4
  %183 = icmp ne i32 %182, 0
  br i1 %183, label %187, label %184

; <label>:184                                     ; preds = %177
  %185 = load i32* %e, align 4
  %186 = icmp ne i32 %185, 0
  br label %187

; <label>:187                                     ; preds = %184, %177
  %188 = phi i1 [ true, %177 ], [ %186, %184 ]
  %189 = zext i1 %188 to i32
  %190 = load i32* %d, align 4
  %191 = sub nsw i32 %190, %189
  store i32 %191, i32* %d, align 4
  call void @f(i32 %191, i32 0)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %193 = load i32* %1
  ret i32 %193
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
