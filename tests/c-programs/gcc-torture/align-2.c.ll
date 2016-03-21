; ModuleID = './align-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a_short = type { i8, i16 }
%struct.a_int = type { i8, i32 }
%struct.b_int = type { i16, i32 }
%struct.a_float = type { i8, float }
%struct.b_float = type { i16, float }
%struct.a_double = type { i8, double }
%struct.b_double = type { i16, double }
%struct.c_double = type { i32, double }
%struct.d_double = type { float, double }
%struct.a_ldouble = type { i8, x86_fp80 }
%struct.b_ldouble = type { i16, x86_fp80 }
%struct.c_ldouble = type { i32, x86_fp80 }
%struct.d_ldouble = type { float, x86_fp80 }
%struct.e_ldouble = type { double, x86_fp80 }

@s_c_s = global %struct.a_short { i8 97, i16 13 }, align 2
@s_c_i = global %struct.a_int { i8 98, i32 14 }, align 4
@s_s_i = global %struct.b_int { i16 15, i32 16 }, align 4
@s_c_f = global %struct.a_float { i8 99, float 1.700000e+01 }, align 4
@s_s_f = global %struct.b_float { i16 18, float 1.900000e+01 }, align 4
@s_c_d = global %struct.a_double { i8 100, double 2.000000e+01 }, align 8
@s_s_d = global %struct.b_double { i16 21, double 2.200000e+01 }, align 8
@s_i_d = global %struct.c_double { i32 23, double 2.400000e+01 }, align 8
@s_f_d = global %struct.d_double { float 2.500000e+01, double 2.600000e+01 }, align 8
@s_c_ld = global %struct.a_ldouble { i8 101, x86_fp80 0xK4003D800000000000000 }, align 16
@s_s_ld = global %struct.b_ldouble { i16 28, x86_fp80 0xK4003E800000000000000 }, align 16
@s_i_ld = global %struct.c_ldouble { i32 30, x86_fp80 0xK4003F800000000000000 }, align 16
@s_f_ld = global %struct.d_ldouble { float 3.200000e+01, x86_fp80 0xK40048400000000000000 }, align 16
@s_d_ld = global %struct.e_ldouble { double 3.400000e+01, x86_fp80 0xK40048C00000000000000 }, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i8, i8* getelementptr inbounds (%struct.a_short, %struct.a_short* @s_c_s, i32 0, i32 0), align 1
  %3 = sext i8 %2 to i32
  %4 = icmp ne i32 %3, 97
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i16, i16* getelementptr inbounds (%struct.a_short, %struct.a_short* @s_c_s, i32 0, i32 1), align 2
  %8 = sext i16 %7 to i32
  %9 = icmp ne i32 %8, 13
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  %12 = load i8, i8* getelementptr inbounds (%struct.a_int, %struct.a_int* @s_c_i, i32 0, i32 0), align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 98
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %11
  %17 = load i32, i32* getelementptr inbounds (%struct.a_int, %struct.a_int* @s_c_i, i32 0, i32 1), align 4
  %18 = icmp ne i32 %17, 14
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  %21 = load i16, i16* getelementptr inbounds (%struct.b_int, %struct.b_int* @s_s_i, i32 0, i32 0), align 2
  %22 = sext i16 %21 to i32
  %23 = icmp ne i32 %22, 15
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %20
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %20
  %26 = load i32, i32* getelementptr inbounds (%struct.b_int, %struct.b_int* @s_s_i, i32 0, i32 1), align 4
  %27 = icmp ne i32 %26, 16
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = load i8, i8* getelementptr inbounds (%struct.a_float, %struct.a_float* @s_c_f, i32 0, i32 0), align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 99
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:34                                      ; preds = %29
  %35 = load float, float* getelementptr inbounds (%struct.a_float, %struct.a_float* @s_c_f, i32 0, i32 1), align 4
  %36 = fpext float %35 to double
  %37 = fcmp une double %36, 1.700000e+01
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %34
  call void @abort() #2
  unreachable

; <label>:39                                      ; preds = %34
  %40 = load i16, i16* getelementptr inbounds (%struct.b_float, %struct.b_float* @s_s_f, i32 0, i32 0), align 2
  %41 = sext i16 %40 to i32
  %42 = icmp ne i32 %41, 18
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %39
  call void @abort() #2
  unreachable

; <label>:44                                      ; preds = %39
  %45 = load float, float* getelementptr inbounds (%struct.b_float, %struct.b_float* @s_s_f, i32 0, i32 1), align 4
  %46 = fpext float %45 to double
  %47 = fcmp une double %46, 1.900000e+01
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %44
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %44
  %50 = load i8, i8* getelementptr inbounds (%struct.a_double, %struct.a_double* @s_c_d, i32 0, i32 0), align 1
  %51 = sext i8 %50 to i32
  %52 = icmp ne i32 %51, 100
  br i1 %52, label %53, label %54

; <label>:53                                      ; preds = %49
  call void @abort() #2
  unreachable

; <label>:54                                      ; preds = %49
  %55 = load double, double* getelementptr inbounds (%struct.a_double, %struct.a_double* @s_c_d, i32 0, i32 1), align 8
  %56 = fcmp une double %55, 2.000000e+01
  br i1 %56, label %57, label %58

; <label>:57                                      ; preds = %54
  call void @abort() #2
  unreachable

; <label>:58                                      ; preds = %54
  %59 = load i16, i16* getelementptr inbounds (%struct.b_double, %struct.b_double* @s_s_d, i32 0, i32 0), align 2
  %60 = sext i16 %59 to i32
  %61 = icmp ne i32 %60, 21
  br i1 %61, label %62, label %63

; <label>:62                                      ; preds = %58
  call void @abort() #2
  unreachable

; <label>:63                                      ; preds = %58
  %64 = load double, double* getelementptr inbounds (%struct.b_double, %struct.b_double* @s_s_d, i32 0, i32 1), align 8
  %65 = fcmp une double %64, 2.200000e+01
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %63
  call void @abort() #2
  unreachable

; <label>:67                                      ; preds = %63
  %68 = load i32, i32* getelementptr inbounds (%struct.c_double, %struct.c_double* @s_i_d, i32 0, i32 0), align 4
  %69 = icmp ne i32 %68, 23
  br i1 %69, label %70, label %71

; <label>:70                                      ; preds = %67
  call void @abort() #2
  unreachable

; <label>:71                                      ; preds = %67
  %72 = load double, double* getelementptr inbounds (%struct.c_double, %struct.c_double* @s_i_d, i32 0, i32 1), align 8
  %73 = fcmp une double %72, 2.400000e+01
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %71
  call void @abort() #2
  unreachable

; <label>:75                                      ; preds = %71
  %76 = load float, float* getelementptr inbounds (%struct.d_double, %struct.d_double* @s_f_d, i32 0, i32 0), align 4
  %77 = fpext float %76 to double
  %78 = fcmp une double %77, 2.500000e+01
  br i1 %78, label %79, label %80

; <label>:79                                      ; preds = %75
  call void @abort() #2
  unreachable

; <label>:80                                      ; preds = %75
  %81 = load double, double* getelementptr inbounds (%struct.d_double, %struct.d_double* @s_f_d, i32 0, i32 1), align 8
  %82 = fcmp une double %81, 2.600000e+01
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %80
  call void @abort() #2
  unreachable

; <label>:84                                      ; preds = %80
  %85 = load i8, i8* getelementptr inbounds (%struct.a_ldouble, %struct.a_ldouble* @s_c_ld, i32 0, i32 0), align 1
  %86 = sext i8 %85 to i32
  %87 = icmp ne i32 %86, 101
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %84
  call void @abort() #2
  unreachable

; <label>:89                                      ; preds = %84
  %90 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.a_ldouble, %struct.a_ldouble* @s_c_ld, i32 0, i32 1), align 16
  %91 = fcmp une x86_fp80 %90, 0xK4003D800000000000000
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %89
  call void @abort() #2
  unreachable

; <label>:93                                      ; preds = %89
  %94 = load i16, i16* getelementptr inbounds (%struct.b_ldouble, %struct.b_ldouble* @s_s_ld, i32 0, i32 0), align 2
  %95 = sext i16 %94 to i32
  %96 = icmp ne i32 %95, 28
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %93
  call void @abort() #2
  unreachable

; <label>:98                                      ; preds = %93
  %99 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.b_ldouble, %struct.b_ldouble* @s_s_ld, i32 0, i32 1), align 16
  %100 = fcmp une x86_fp80 %99, 0xK4003E800000000000000
  br i1 %100, label %101, label %102

; <label>:101                                     ; preds = %98
  call void @abort() #2
  unreachable

; <label>:102                                     ; preds = %98
  %103 = load i32, i32* getelementptr inbounds (%struct.c_ldouble, %struct.c_ldouble* @s_i_ld, i32 0, i32 0), align 4
  %104 = icmp ne i32 %103, 30
  br i1 %104, label %105, label %106

; <label>:105                                     ; preds = %102
  call void @abort() #2
  unreachable

; <label>:106                                     ; preds = %102
  %107 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.c_ldouble, %struct.c_ldouble* @s_i_ld, i32 0, i32 1), align 16
  %108 = fcmp une x86_fp80 %107, 0xK4003F800000000000000
  br i1 %108, label %109, label %110

; <label>:109                                     ; preds = %106
  call void @abort() #2
  unreachable

; <label>:110                                     ; preds = %106
  %111 = load float, float* getelementptr inbounds (%struct.d_ldouble, %struct.d_ldouble* @s_f_ld, i32 0, i32 0), align 4
  %112 = fpext float %111 to double
  %113 = fcmp une double %112, 3.200000e+01
  br i1 %113, label %114, label %115

; <label>:114                                     ; preds = %110
  call void @abort() #2
  unreachable

; <label>:115                                     ; preds = %110
  %116 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.d_ldouble, %struct.d_ldouble* @s_f_ld, i32 0, i32 1), align 16
  %117 = fcmp une x86_fp80 %116, 0xK40048400000000000000
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %115
  call void @abort() #2
  unreachable

; <label>:119                                     ; preds = %115
  %120 = load double, double* getelementptr inbounds (%struct.e_ldouble, %struct.e_ldouble* @s_d_ld, i32 0, i32 0), align 8
  %121 = fcmp une double %120, 3.400000e+01
  br i1 %121, label %122, label %123

; <label>:122                                     ; preds = %119
  call void @abort() #2
  unreachable

; <label>:123                                     ; preds = %119
  %124 = load x86_fp80, x86_fp80* getelementptr inbounds (%struct.e_ldouble, %struct.e_ldouble* @s_d_ld, i32 0, i32 1), align 16
  %125 = fcmp une x86_fp80 %124, 0xK40048C00000000000000
  br i1 %125, label %126, label %127

; <label>:126                                     ; preds = %123
  call void @abort() #2
  unreachable

; <label>:127                                     ; preds = %123
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
