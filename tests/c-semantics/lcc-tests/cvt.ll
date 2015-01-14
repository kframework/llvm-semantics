; ModuleID = './cvt.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [25 x i8] c"%d %d %d %d %u %u %u %u\0A\00", align 1
@c = common global i8 0, align 1
@s = common global i16 0, align 2
@i = common global i32 0, align 4
@l = common global i64 0, align 8
@C = common global i8 0, align 1
@S = common global i16 0, align 2
@I = common global i32 0, align 4
@L = common global i64 0, align 8
@f = common global float 0.000000e+00, align 4
@d = common global double 0.000000e+00, align 8
@D = common global x86_fp80 0xK00000000000000000000, align 16
@p = common global i8* null, align 8
@P = common global void ()* null, align 8

; Function Attrs: nounwind uwtable
define void @print() #0 {
  %1 = load i8* @c, align 1
  %2 = sext i8 %1 to i32
  %3 = load i16* @s, align 2
  %4 = sext i16 %3 to i32
  %5 = load i32* @i, align 4
  %6 = load i64* @l, align 8
  %7 = load i8* @C, align 1
  %8 = zext i8 %7 to i32
  %9 = load i16* @S, align 2
  %10 = zext i16 %9 to i32
  %11 = load i32* @I, align 4
  %12 = load i64* @L, align 8
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %2, i32 %4, i32 %5, i64 %6, i32 %8, i32 %10, i32 %11, i64 %12)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8 1, i8* @c, align 1
  %2 = load i8* @c, align 1
  %3 = sext i8 %2 to i16
  store i16 %3, i16* @s, align 2
  %4 = load i8* @c, align 1
  %5 = sext i8 %4 to i32
  store i32 %5, i32* @i, align 4
  %6 = load i8* @c, align 1
  %7 = sext i8 %6 to i64
  store i64 %7, i64* @l, align 8
  %8 = load i8* @c, align 1
  store i8 %8, i8* @C, align 1
  %9 = load i8* @c, align 1
  %10 = sext i8 %9 to i16
  store i16 %10, i16* @S, align 2
  %11 = load i8* @c, align 1
  %12 = sext i8 %11 to i32
  store i32 %12, i32* @I, align 4
  %13 = load i8* @c, align 1
  %14 = sext i8 %13 to i64
  store i64 %14, i64* @L, align 8
  %15 = load i8* @c, align 1
  %16 = sitofp i8 %15 to float
  store float %16, float* @f, align 4
  %17 = load i8* @c, align 1
  %18 = sitofp i8 %17 to double
  store double %18, double* @d, align 8
  %19 = load i8* @c, align 1
  %20 = sitofp i8 %19 to x86_fp80
  store x86_fp80 %20, x86_fp80* @D, align 16
  call void @print()
  store i16 2, i16* @s, align 2
  %21 = load i16* @s, align 2
  %22 = trunc i16 %21 to i8
  store i8 %22, i8* @c, align 1
  %23 = load i16* @s, align 2
  %24 = sext i16 %23 to i32
  store i32 %24, i32* @i, align 4
  %25 = load i16* @s, align 2
  %26 = sext i16 %25 to i64
  store i64 %26, i64* @l, align 8
  %27 = load i16* @s, align 2
  %28 = trunc i16 %27 to i8
  store i8 %28, i8* @C, align 1
  %29 = load i16* @s, align 2
  store i16 %29, i16* @S, align 2
  %30 = load i16* @s, align 2
  %31 = sext i16 %30 to i32
  store i32 %31, i32* @I, align 4
  %32 = load i16* @s, align 2
  %33 = sext i16 %32 to i64
  store i64 %33, i64* @L, align 8
  %34 = load i16* @s, align 2
  %35 = sitofp i16 %34 to float
  store float %35, float* @f, align 4
  %36 = load i16* @s, align 2
  %37 = sitofp i16 %36 to double
  store double %37, double* @d, align 8
  %38 = load i16* @s, align 2
  %39 = sitofp i16 %38 to x86_fp80
  store x86_fp80 %39, x86_fp80* @D, align 16
  call void @print()
  store i32 3, i32* @i, align 4
  %40 = load i32* @i, align 4
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* @c, align 1
  %42 = load i32* @i, align 4
  %43 = trunc i32 %42 to i16
  store i16 %43, i16* @s, align 2
  %44 = load i32* @i, align 4
  %45 = sext i32 %44 to i64
  store i64 %45, i64* @l, align 8
  %46 = load i32* @i, align 4
  %47 = trunc i32 %46 to i8
  store i8 %47, i8* @C, align 1
  %48 = load i32* @i, align 4
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* @S, align 2
  %50 = load i32* @i, align 4
  store i32 %50, i32* @I, align 4
  %51 = load i32* @i, align 4
  %52 = sext i32 %51 to i64
  store i64 %52, i64* @L, align 8
  %53 = load i32* @i, align 4
  %54 = sitofp i32 %53 to float
  store float %54, float* @f, align 4
  %55 = load i32* @i, align 4
  %56 = sitofp i32 %55 to double
  store double %56, double* @d, align 8
  %57 = load i32* @i, align 4
  %58 = sitofp i32 %57 to x86_fp80
  store x86_fp80 %58, x86_fp80* @D, align 16
  call void @print()
  store i64 4, i64* @l, align 8
  %59 = load i64* @l, align 8
  %60 = trunc i64 %59 to i8
  store i8 %60, i8* @c, align 1
  %61 = load i64* @l, align 8
  %62 = trunc i64 %61 to i16
  store i16 %62, i16* @s, align 2
  %63 = load i64* @l, align 8
  %64 = trunc i64 %63 to i32
  store i32 %64, i32* @i, align 4
  %65 = load i64* @l, align 8
  %66 = trunc i64 %65 to i8
  store i8 %66, i8* @C, align 1
  %67 = load i64* @l, align 8
  %68 = trunc i64 %67 to i16
  store i16 %68, i16* @S, align 2
  %69 = load i64* @l, align 8
  %70 = trunc i64 %69 to i32
  store i32 %70, i32* @I, align 4
  %71 = load i64* @l, align 8
  store i64 %71, i64* @L, align 8
  %72 = load i64* @l, align 8
  %73 = sitofp i64 %72 to float
  store float %73, float* @f, align 4
  %74 = load i64* @l, align 8
  %75 = sitofp i64 %74 to double
  store double %75, double* @d, align 8
  %76 = load i64* @l, align 8
  %77 = sitofp i64 %76 to x86_fp80
  store x86_fp80 %77, x86_fp80* @D, align 16
  call void @print()
  store i8 5, i8* @C, align 1
  %78 = load i8* @C, align 1
  store i8 %78, i8* @c, align 1
  %79 = load i8* @C, align 1
  %80 = zext i8 %79 to i16
  store i16 %80, i16* @s, align 2
  %81 = load i8* @C, align 1
  %82 = zext i8 %81 to i32
  store i32 %82, i32* @i, align 4
  %83 = load i8* @C, align 1
  %84 = zext i8 %83 to i64
  store i64 %84, i64* @l, align 8
  %85 = load i8* @C, align 1
  %86 = zext i8 %85 to i16
  store i16 %86, i16* @S, align 2
  %87 = load i8* @C, align 1
  %88 = zext i8 %87 to i32
  store i32 %88, i32* @I, align 4
  %89 = load i8* @C, align 1
  %90 = zext i8 %89 to i64
  store i64 %90, i64* @L, align 8
  %91 = load i8* @C, align 1
  %92 = uitofp i8 %91 to float
  store float %92, float* @f, align 4
  %93 = load i8* @C, align 1
  %94 = uitofp i8 %93 to double
  store double %94, double* @d, align 8
  %95 = load i8* @C, align 1
  %96 = uitofp i8 %95 to x86_fp80
  store x86_fp80 %96, x86_fp80* @D, align 16
  call void @print()
  store i16 6, i16* @S, align 2
  %97 = load i16* @S, align 2
  %98 = trunc i16 %97 to i8
  store i8 %98, i8* @c, align 1
  %99 = load i16* @S, align 2
  store i16 %99, i16* @s, align 2
  %100 = load i16* @S, align 2
  %101 = zext i16 %100 to i32
  store i32 %101, i32* @i, align 4
  %102 = load i16* @S, align 2
  %103 = zext i16 %102 to i64
  store i64 %103, i64* @l, align 8
  %104 = load i16* @S, align 2
  %105 = trunc i16 %104 to i8
  store i8 %105, i8* @C, align 1
  %106 = load i16* @S, align 2
  %107 = zext i16 %106 to i32
  store i32 %107, i32* @I, align 4
  %108 = load i16* @S, align 2
  %109 = zext i16 %108 to i64
  store i64 %109, i64* @L, align 8
  %110 = load i16* @S, align 2
  %111 = uitofp i16 %110 to float
  store float %111, float* @f, align 4
  %112 = load i16* @S, align 2
  %113 = uitofp i16 %112 to double
  store double %113, double* @d, align 8
  %114 = load i16* @S, align 2
  %115 = uitofp i16 %114 to x86_fp80
  store x86_fp80 %115, x86_fp80* @D, align 16
  call void @print()
  store i32 7, i32* @I, align 4
  %116 = load i32* @I, align 4
  %117 = trunc i32 %116 to i8
  store i8 %117, i8* @c, align 1
  %118 = load i32* @I, align 4
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* @s, align 2
  %120 = load i32* @I, align 4
  store i32 %120, i32* @i, align 4
  %121 = load i32* @I, align 4
  %122 = zext i32 %121 to i64
  store i64 %122, i64* @l, align 8
  %123 = load i32* @I, align 4
  %124 = trunc i32 %123 to i8
  store i8 %124, i8* @C, align 1
  %125 = load i32* @I, align 4
  %126 = trunc i32 %125 to i16
  store i16 %126, i16* @S, align 2
  %127 = load i32* @I, align 4
  %128 = zext i32 %127 to i64
  store i64 %128, i64* @L, align 8
  %129 = load i32* @I, align 4
  %130 = uitofp i32 %129 to float
  store float %130, float* @f, align 4
  %131 = load i32* @I, align 4
  %132 = uitofp i32 %131 to double
  store double %132, double* @d, align 8
  %133 = load i32* @I, align 4
  %134 = uitofp i32 %133 to x86_fp80
  store x86_fp80 %134, x86_fp80* @D, align 16
  call void @print()
  store i64 8, i64* @L, align 8
  %135 = load i64* @L, align 8
  %136 = trunc i64 %135 to i8
  store i8 %136, i8* @c, align 1
  %137 = load i64* @L, align 8
  %138 = trunc i64 %137 to i16
  store i16 %138, i16* @s, align 2
  %139 = load i64* @L, align 8
  %140 = trunc i64 %139 to i32
  store i32 %140, i32* @i, align 4
  %141 = load i64* @L, align 8
  store i64 %141, i64* @l, align 8
  %142 = load i64* @L, align 8
  %143 = trunc i64 %142 to i8
  store i8 %143, i8* @C, align 1
  %144 = load i64* @L, align 8
  %145 = trunc i64 %144 to i16
  store i16 %145, i16* @S, align 2
  %146 = load i16* @S, align 2
  %147 = zext i16 %146 to i32
  store i32 %147, i32* @I, align 4
  %148 = load i64* @L, align 8
  %149 = uitofp i64 %148 to float
  store float %149, float* @f, align 4
  %150 = load i64* @L, align 8
  %151 = uitofp i64 %150 to double
  store double %151, double* @d, align 8
  %152 = load i64* @L, align 8
  %153 = uitofp i64 %152 to x86_fp80
  store x86_fp80 %153, x86_fp80* @D, align 16
  call void @print()
  store float 9.000000e+00, float* @f, align 4
  %154 = load float* @f, align 4
  %155 = fptosi float %154 to i8
  store i8 %155, i8* @c, align 1
  %156 = load float* @f, align 4
  %157 = fptosi float %156 to i16
  store i16 %157, i16* @s, align 2
  %158 = load float* @f, align 4
  %159 = fptosi float %158 to i32
  store i32 %159, i32* @i, align 4
  %160 = load float* @f, align 4
  %161 = fptosi float %160 to i64
  store i64 %161, i64* @l, align 8
  %162 = load float* @f, align 4
  %163 = fptoui float %162 to i8
  store i8 %163, i8* @C, align 1
  %164 = load float* @f, align 4
  %165 = fptoui float %164 to i16
  store i16 %165, i16* @S, align 2
  %166 = load float* @f, align 4
  %167 = fptoui float %166 to i32
  store i32 %167, i32* @I, align 4
  %168 = load float* @f, align 4
  %169 = fptoui float %168 to i64
  store i64 %169, i64* @L, align 8
  %170 = load float* @f, align 4
  %171 = fpext float %170 to double
  store double %171, double* @d, align 8
  %172 = load float* @f, align 4
  %173 = fpext float %172 to x86_fp80
  store x86_fp80 %173, x86_fp80* @D, align 16
  call void @print()
  store double 1.000000e+01, double* @d, align 8
  %174 = load double* @d, align 8
  %175 = fptosi double %174 to i8
  store i8 %175, i8* @c, align 1
  %176 = load double* @d, align 8
  %177 = fptosi double %176 to i16
  store i16 %177, i16* @s, align 2
  %178 = load double* @d, align 8
  %179 = fptosi double %178 to i32
  store i32 %179, i32* @i, align 4
  %180 = load double* @d, align 8
  %181 = fptosi double %180 to i64
  store i64 %181, i64* @l, align 8
  %182 = load double* @d, align 8
  %183 = fptoui double %182 to i8
  store i8 %183, i8* @C, align 1
  %184 = load double* @d, align 8
  %185 = fptoui double %184 to i16
  store i16 %185, i16* @S, align 2
  %186 = load double* @d, align 8
  %187 = fptoui double %186 to i32
  store i32 %187, i32* @I, align 4
  %188 = load double* @d, align 8
  %189 = fptoui double %188 to i64
  store i64 %189, i64* @L, align 8
  %190 = load double* @d, align 8
  %191 = fptrunc double %190 to float
  store float %191, float* @f, align 4
  %192 = load double* @d, align 8
  %193 = fpext double %192 to x86_fp80
  store x86_fp80 %193, x86_fp80* @D, align 16
  call void @print()
  store x86_fp80 0xK4002B000000000000000, x86_fp80* @D, align 16
  %194 = load x86_fp80* @D, align 16
  %195 = fptosi x86_fp80 %194 to i8
  store i8 %195, i8* @c, align 1
  %196 = load x86_fp80* @D, align 16
  %197 = fptosi x86_fp80 %196 to i16
  store i16 %197, i16* @s, align 2
  %198 = load x86_fp80* @D, align 16
  %199 = fptosi x86_fp80 %198 to i32
  store i32 %199, i32* @i, align 4
  %200 = load x86_fp80* @D, align 16
  %201 = fptosi x86_fp80 %200 to i64
  store i64 %201, i64* @l, align 8
  %202 = load x86_fp80* @D, align 16
  %203 = fptoui x86_fp80 %202 to i8
  store i8 %203, i8* @C, align 1
  %204 = load x86_fp80* @D, align 16
  %205 = fptoui x86_fp80 %204 to i16
  store i16 %205, i16* @S, align 2
  %206 = load x86_fp80* @D, align 16
  %207 = fptoui x86_fp80 %206 to i32
  store i32 %207, i32* @I, align 4
  %208 = load x86_fp80* @D, align 16
  %209 = fptoui x86_fp80 %208 to i64
  store i64 %209, i64* @L, align 8
  %210 = load x86_fp80* @D, align 16
  %211 = fptrunc x86_fp80 %210 to float
  store float %211, float* @f, align 4
  %212 = load x86_fp80* @D, align 16
  %213 = fptrunc x86_fp80 %212 to double
  store double %213, double* @d, align 8
  call void @print()
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  store i8* null, i8** @p, align 8
  %214 = load void ()** @P, align 8
  %215 = bitcast void ()* %214 to i8*
  store i8* %215, i8** @p, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  store void ()* null, void ()** @P, align 8
  %216 = load i8** @p, align 8
  %217 = bitcast i8* %216 to void ()*
  store void ()* %217, void ()** @P, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
