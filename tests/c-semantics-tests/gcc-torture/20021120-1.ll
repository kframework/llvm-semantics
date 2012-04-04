; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021120-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gd = common global [32 x double] zeroinitializer, align 16
@gf = common global [32 x float] zeroinitializer, align 16

define void @foo(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %d00 = alloca double, align 8
  %d10 = alloca double, align 8
  %d20 = alloca double, align 8
  %d30 = alloca double, align 8
  %d01 = alloca double, align 8
  %d11 = alloca double, align 8
  %d21 = alloca double, align 8
  %d31 = alloca double, align 8
  %d02 = alloca double, align 8
  %d12 = alloca double, align 8
  %d22 = alloca double, align 8
  %d32 = alloca double, align 8
  %d03 = alloca double, align 8
  %d13 = alloca double, align 8
  %d23 = alloca double, align 8
  %d33 = alloca double, align 8
  %d04 = alloca double, align 8
  %d14 = alloca double, align 8
  %d24 = alloca double, align 8
  %d34 = alloca double, align 8
  %d05 = alloca double, align 8
  %d15 = alloca double, align 8
  %d25 = alloca double, align 8
  %d35 = alloca double, align 8
  %d06 = alloca double, align 8
  %d16 = alloca double, align 8
  %d26 = alloca double, align 8
  %d36 = alloca double, align 8
  %d07 = alloca double, align 8
  %d17 = alloca double, align 8
  %d27 = alloca double, align 8
  %d37 = alloca double, align 8
  %f00 = alloca float, align 4
  %f10 = alloca float, align 4
  %f20 = alloca float, align 4
  %f30 = alloca float, align 4
  %f01 = alloca float, align 4
  %f11 = alloca float, align 4
  %f21 = alloca float, align 4
  %f31 = alloca float, align 4
  %f02 = alloca float, align 4
  %f12 = alloca float, align 4
  %f22 = alloca float, align 4
  %f32 = alloca float, align 4
  %f03 = alloca float, align 4
  %f13 = alloca float, align 4
  %f23 = alloca float, align 4
  %f33 = alloca float, align 4
  %f04 = alloca float, align 4
  %f14 = alloca float, align 4
  %f24 = alloca float, align 4
  %f34 = alloca float, align 4
  %f05 = alloca float, align 4
  %f15 = alloca float, align 4
  %f25 = alloca float, align 4
  %f35 = alloca float, align 4
  %f06 = alloca float, align 4
  %f16 = alloca float, align 4
  %f26 = alloca float, align 4
  %f36 = alloca float, align 4
  %f07 = alloca float, align 4
  %f17 = alloca float, align 4
  %f27 = alloca float, align 4
  %f37 = alloca float, align 4
  %pd = alloca double*, align 8
  %pf = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %0 = load double** %pd, align 8
  %incdec.ptr = getelementptr inbounds double* %0, i32 1
  store double* %incdec.ptr, double** %pd, align 8
  %1 = load volatile double* %0, align 8
  store double %1, double* %d00, align 8
  %2 = load double** %pd, align 8
  %incdec.ptr1 = getelementptr inbounds double* %2, i32 1
  store double* %incdec.ptr1, double** %pd, align 8
  %3 = load volatile double* %2, align 8
  store double %3, double* %d10, align 8
  %4 = load double** %pd, align 8
  %incdec.ptr2 = getelementptr inbounds double* %4, i32 1
  store double* %incdec.ptr2, double** %pd, align 8
  %5 = load volatile double* %4, align 8
  store double %5, double* %d20, align 8
  %6 = load double** %pd, align 8
  %incdec.ptr3 = getelementptr inbounds double* %6, i32 1
  store double* %incdec.ptr3, double** %pd, align 8
  %7 = load volatile double* %6, align 8
  store double %7, double* %d30, align 8
  %8 = load double** %pd, align 8
  %incdec.ptr4 = getelementptr inbounds double* %8, i32 1
  store double* %incdec.ptr4, double** %pd, align 8
  %9 = load volatile double* %8, align 8
  store double %9, double* %d01, align 8
  %10 = load double** %pd, align 8
  %incdec.ptr5 = getelementptr inbounds double* %10, i32 1
  store double* %incdec.ptr5, double** %pd, align 8
  %11 = load volatile double* %10, align 8
  store double %11, double* %d11, align 8
  %12 = load double** %pd, align 8
  %incdec.ptr6 = getelementptr inbounds double* %12, i32 1
  store double* %incdec.ptr6, double** %pd, align 8
  %13 = load volatile double* %12, align 8
  store double %13, double* %d21, align 8
  %14 = load double** %pd, align 8
  %incdec.ptr7 = getelementptr inbounds double* %14, i32 1
  store double* %incdec.ptr7, double** %pd, align 8
  %15 = load volatile double* %14, align 8
  store double %15, double* %d31, align 8
  %16 = load double** %pd, align 8
  %incdec.ptr8 = getelementptr inbounds double* %16, i32 1
  store double* %incdec.ptr8, double** %pd, align 8
  %17 = load volatile double* %16, align 8
  store double %17, double* %d02, align 8
  %18 = load double** %pd, align 8
  %incdec.ptr9 = getelementptr inbounds double* %18, i32 1
  store double* %incdec.ptr9, double** %pd, align 8
  %19 = load volatile double* %18, align 8
  store double %19, double* %d12, align 8
  %20 = load double** %pd, align 8
  %incdec.ptr10 = getelementptr inbounds double* %20, i32 1
  store double* %incdec.ptr10, double** %pd, align 8
  %21 = load volatile double* %20, align 8
  store double %21, double* %d22, align 8
  %22 = load double** %pd, align 8
  %incdec.ptr11 = getelementptr inbounds double* %22, i32 1
  store double* %incdec.ptr11, double** %pd, align 8
  %23 = load volatile double* %22, align 8
  store double %23, double* %d32, align 8
  %24 = load double** %pd, align 8
  %incdec.ptr12 = getelementptr inbounds double* %24, i32 1
  store double* %incdec.ptr12, double** %pd, align 8
  %25 = load volatile double* %24, align 8
  store double %25, double* %d03, align 8
  %26 = load double** %pd, align 8
  %incdec.ptr13 = getelementptr inbounds double* %26, i32 1
  store double* %incdec.ptr13, double** %pd, align 8
  %27 = load volatile double* %26, align 8
  store double %27, double* %d13, align 8
  %28 = load double** %pd, align 8
  %incdec.ptr14 = getelementptr inbounds double* %28, i32 1
  store double* %incdec.ptr14, double** %pd, align 8
  %29 = load volatile double* %28, align 8
  store double %29, double* %d23, align 8
  %30 = load double** %pd, align 8
  %incdec.ptr15 = getelementptr inbounds double* %30, i32 1
  store double* %incdec.ptr15, double** %pd, align 8
  %31 = load volatile double* %30, align 8
  store double %31, double* %d33, align 8
  %32 = load double** %pd, align 8
  %incdec.ptr16 = getelementptr inbounds double* %32, i32 1
  store double* %incdec.ptr16, double** %pd, align 8
  %33 = load volatile double* %32, align 8
  store double %33, double* %d04, align 8
  %34 = load double** %pd, align 8
  %incdec.ptr17 = getelementptr inbounds double* %34, i32 1
  store double* %incdec.ptr17, double** %pd, align 8
  %35 = load volatile double* %34, align 8
  store double %35, double* %d14, align 8
  %36 = load double** %pd, align 8
  %incdec.ptr18 = getelementptr inbounds double* %36, i32 1
  store double* %incdec.ptr18, double** %pd, align 8
  %37 = load volatile double* %36, align 8
  store double %37, double* %d24, align 8
  %38 = load double** %pd, align 8
  %incdec.ptr19 = getelementptr inbounds double* %38, i32 1
  store double* %incdec.ptr19, double** %pd, align 8
  %39 = load volatile double* %38, align 8
  store double %39, double* %d34, align 8
  %40 = load double** %pd, align 8
  %incdec.ptr20 = getelementptr inbounds double* %40, i32 1
  store double* %incdec.ptr20, double** %pd, align 8
  %41 = load volatile double* %40, align 8
  store double %41, double* %d05, align 8
  %42 = load double** %pd, align 8
  %incdec.ptr21 = getelementptr inbounds double* %42, i32 1
  store double* %incdec.ptr21, double** %pd, align 8
  %43 = load volatile double* %42, align 8
  store double %43, double* %d15, align 8
  %44 = load double** %pd, align 8
  %incdec.ptr22 = getelementptr inbounds double* %44, i32 1
  store double* %incdec.ptr22, double** %pd, align 8
  %45 = load volatile double* %44, align 8
  store double %45, double* %d25, align 8
  %46 = load double** %pd, align 8
  %incdec.ptr23 = getelementptr inbounds double* %46, i32 1
  store double* %incdec.ptr23, double** %pd, align 8
  %47 = load volatile double* %46, align 8
  store double %47, double* %d35, align 8
  %48 = load double** %pd, align 8
  %incdec.ptr24 = getelementptr inbounds double* %48, i32 1
  store double* %incdec.ptr24, double** %pd, align 8
  %49 = load volatile double* %48, align 8
  store double %49, double* %d06, align 8
  %50 = load double** %pd, align 8
  %incdec.ptr25 = getelementptr inbounds double* %50, i32 1
  store double* %incdec.ptr25, double** %pd, align 8
  %51 = load volatile double* %50, align 8
  store double %51, double* %d16, align 8
  %52 = load double** %pd, align 8
  %incdec.ptr26 = getelementptr inbounds double* %52, i32 1
  store double* %incdec.ptr26, double** %pd, align 8
  %53 = load volatile double* %52, align 8
  store double %53, double* %d26, align 8
  %54 = load double** %pd, align 8
  %incdec.ptr27 = getelementptr inbounds double* %54, i32 1
  store double* %incdec.ptr27, double** %pd, align 8
  %55 = load volatile double* %54, align 8
  store double %55, double* %d36, align 8
  %56 = load double** %pd, align 8
  %incdec.ptr28 = getelementptr inbounds double* %56, i32 1
  store double* %incdec.ptr28, double** %pd, align 8
  %57 = load volatile double* %56, align 8
  store double %57, double* %d07, align 8
  %58 = load double** %pd, align 8
  %incdec.ptr29 = getelementptr inbounds double* %58, i32 1
  store double* %incdec.ptr29, double** %pd, align 8
  %59 = load volatile double* %58, align 8
  store double %59, double* %d17, align 8
  %60 = load double** %pd, align 8
  %incdec.ptr30 = getelementptr inbounds double* %60, i32 1
  store double* %incdec.ptr30, double** %pd, align 8
  %61 = load volatile double* %60, align 8
  store double %61, double* %d27, align 8
  %62 = load double** %pd, align 8
  %incdec.ptr31 = getelementptr inbounds double* %62, i32 1
  store double* %incdec.ptr31, double** %pd, align 8
  %63 = load volatile double* %62, align 8
  store double %63, double* %d37, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %64 = load i32* %i, align 4
  %65 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %64, %65
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store float* getelementptr inbounds ([32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %66 = load float** %pf, align 8
  %incdec.ptr32 = getelementptr inbounds float* %66, i32 1
  store float* %incdec.ptr32, float** %pf, align 8
  %67 = load volatile float* %66, align 4
  store float %67, float* %f00, align 4
  %68 = load float** %pf, align 8
  %incdec.ptr33 = getelementptr inbounds float* %68, i32 1
  store float* %incdec.ptr33, float** %pf, align 8
  %69 = load volatile float* %68, align 4
  store float %69, float* %f10, align 4
  %70 = load float** %pf, align 8
  %incdec.ptr34 = getelementptr inbounds float* %70, i32 1
  store float* %incdec.ptr34, float** %pf, align 8
  %71 = load volatile float* %70, align 4
  store float %71, float* %f20, align 4
  %72 = load float** %pf, align 8
  %incdec.ptr35 = getelementptr inbounds float* %72, i32 1
  store float* %incdec.ptr35, float** %pf, align 8
  %73 = load volatile float* %72, align 4
  store float %73, float* %f30, align 4
  %74 = load float** %pf, align 8
  %incdec.ptr36 = getelementptr inbounds float* %74, i32 1
  store float* %incdec.ptr36, float** %pf, align 8
  %75 = load volatile float* %74, align 4
  store float %75, float* %f01, align 4
  %76 = load float** %pf, align 8
  %incdec.ptr37 = getelementptr inbounds float* %76, i32 1
  store float* %incdec.ptr37, float** %pf, align 8
  %77 = load volatile float* %76, align 4
  store float %77, float* %f11, align 4
  %78 = load float** %pf, align 8
  %incdec.ptr38 = getelementptr inbounds float* %78, i32 1
  store float* %incdec.ptr38, float** %pf, align 8
  %79 = load volatile float* %78, align 4
  store float %79, float* %f21, align 4
  %80 = load float** %pf, align 8
  %incdec.ptr39 = getelementptr inbounds float* %80, i32 1
  store float* %incdec.ptr39, float** %pf, align 8
  %81 = load volatile float* %80, align 4
  store float %81, float* %f31, align 4
  %82 = load float** %pf, align 8
  %incdec.ptr40 = getelementptr inbounds float* %82, i32 1
  store float* %incdec.ptr40, float** %pf, align 8
  %83 = load volatile float* %82, align 4
  store float %83, float* %f02, align 4
  %84 = load float** %pf, align 8
  %incdec.ptr41 = getelementptr inbounds float* %84, i32 1
  store float* %incdec.ptr41, float** %pf, align 8
  %85 = load volatile float* %84, align 4
  store float %85, float* %f12, align 4
  %86 = load float** %pf, align 8
  %incdec.ptr42 = getelementptr inbounds float* %86, i32 1
  store float* %incdec.ptr42, float** %pf, align 8
  %87 = load volatile float* %86, align 4
  store float %87, float* %f22, align 4
  %88 = load float** %pf, align 8
  %incdec.ptr43 = getelementptr inbounds float* %88, i32 1
  store float* %incdec.ptr43, float** %pf, align 8
  %89 = load volatile float* %88, align 4
  store float %89, float* %f32, align 4
  %90 = load float** %pf, align 8
  %incdec.ptr44 = getelementptr inbounds float* %90, i32 1
  store float* %incdec.ptr44, float** %pf, align 8
  %91 = load volatile float* %90, align 4
  store float %91, float* %f03, align 4
  %92 = load float** %pf, align 8
  %incdec.ptr45 = getelementptr inbounds float* %92, i32 1
  store float* %incdec.ptr45, float** %pf, align 8
  %93 = load volatile float* %92, align 4
  store float %93, float* %f13, align 4
  %94 = load float** %pf, align 8
  %incdec.ptr46 = getelementptr inbounds float* %94, i32 1
  store float* %incdec.ptr46, float** %pf, align 8
  %95 = load volatile float* %94, align 4
  store float %95, float* %f23, align 4
  %96 = load float** %pf, align 8
  %incdec.ptr47 = getelementptr inbounds float* %96, i32 1
  store float* %incdec.ptr47, float** %pf, align 8
  %97 = load volatile float* %96, align 4
  store float %97, float* %f33, align 4
  %98 = load float** %pf, align 8
  %incdec.ptr48 = getelementptr inbounds float* %98, i32 1
  store float* %incdec.ptr48, float** %pf, align 8
  %99 = load volatile float* %98, align 4
  store float %99, float* %f04, align 4
  %100 = load float** %pf, align 8
  %incdec.ptr49 = getelementptr inbounds float* %100, i32 1
  store float* %incdec.ptr49, float** %pf, align 8
  %101 = load volatile float* %100, align 4
  store float %101, float* %f14, align 4
  %102 = load float** %pf, align 8
  %incdec.ptr50 = getelementptr inbounds float* %102, i32 1
  store float* %incdec.ptr50, float** %pf, align 8
  %103 = load volatile float* %102, align 4
  store float %103, float* %f24, align 4
  %104 = load float** %pf, align 8
  %incdec.ptr51 = getelementptr inbounds float* %104, i32 1
  store float* %incdec.ptr51, float** %pf, align 8
  %105 = load volatile float* %104, align 4
  store float %105, float* %f34, align 4
  %106 = load float** %pf, align 8
  %incdec.ptr52 = getelementptr inbounds float* %106, i32 1
  store float* %incdec.ptr52, float** %pf, align 8
  %107 = load volatile float* %106, align 4
  store float %107, float* %f05, align 4
  %108 = load float** %pf, align 8
  %incdec.ptr53 = getelementptr inbounds float* %108, i32 1
  store float* %incdec.ptr53, float** %pf, align 8
  %109 = load volatile float* %108, align 4
  store float %109, float* %f15, align 4
  %110 = load float** %pf, align 8
  %incdec.ptr54 = getelementptr inbounds float* %110, i32 1
  store float* %incdec.ptr54, float** %pf, align 8
  %111 = load volatile float* %110, align 4
  store float %111, float* %f25, align 4
  %112 = load float** %pf, align 8
  %incdec.ptr55 = getelementptr inbounds float* %112, i32 1
  store float* %incdec.ptr55, float** %pf, align 8
  %113 = load volatile float* %112, align 4
  store float %113, float* %f35, align 4
  %114 = load float** %pf, align 8
  %incdec.ptr56 = getelementptr inbounds float* %114, i32 1
  store float* %incdec.ptr56, float** %pf, align 8
  %115 = load volatile float* %114, align 4
  store float %115, float* %f06, align 4
  %116 = load float** %pf, align 8
  %incdec.ptr57 = getelementptr inbounds float* %116, i32 1
  store float* %incdec.ptr57, float** %pf, align 8
  %117 = load volatile float* %116, align 4
  store float %117, float* %f16, align 4
  %118 = load float** %pf, align 8
  %incdec.ptr58 = getelementptr inbounds float* %118, i32 1
  store float* %incdec.ptr58, float** %pf, align 8
  %119 = load volatile float* %118, align 4
  store float %119, float* %f26, align 4
  %120 = load float** %pf, align 8
  %incdec.ptr59 = getelementptr inbounds float* %120, i32 1
  store float* %incdec.ptr59, float** %pf, align 8
  %121 = load volatile float* %120, align 4
  store float %121, float* %f36, align 4
  %122 = load float** %pf, align 8
  %incdec.ptr60 = getelementptr inbounds float* %122, i32 1
  store float* %incdec.ptr60, float** %pf, align 8
  %123 = load volatile float* %122, align 4
  store float %123, float* %f07, align 4
  %124 = load float** %pf, align 8
  %incdec.ptr61 = getelementptr inbounds float* %124, i32 1
  store float* %incdec.ptr61, float** %pf, align 8
  %125 = load volatile float* %124, align 4
  store float %125, float* %f17, align 4
  %126 = load float** %pf, align 8
  %incdec.ptr62 = getelementptr inbounds float* %126, i32 1
  store float* %incdec.ptr62, float** %pf, align 8
  %127 = load volatile float* %126, align 4
  store float %127, float* %f27, align 4
  %128 = load float** %pf, align 8
  %incdec.ptr63 = getelementptr inbounds float* %128, i32 1
  store float* %incdec.ptr63, float** %pf, align 8
  %129 = load volatile float* %128, align 4
  store float %129, float* %f37, align 4
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %130 = load double** %pd, align 8
  %incdec.ptr64 = getelementptr inbounds double* %130, i32 1
  store double* %incdec.ptr64, double** %pd, align 8
  %131 = load volatile double* %130, align 8
  %132 = load double* %d00, align 8
  %add = fadd double %132, %131
  store double %add, double* %d00, align 8
  %133 = load double** %pd, align 8
  %incdec.ptr65 = getelementptr inbounds double* %133, i32 1
  store double* %incdec.ptr65, double** %pd, align 8
  %134 = load volatile double* %133, align 8
  %135 = load double* %d10, align 8
  %add66 = fadd double %135, %134
  store double %add66, double* %d10, align 8
  %136 = load double** %pd, align 8
  %incdec.ptr67 = getelementptr inbounds double* %136, i32 1
  store double* %incdec.ptr67, double** %pd, align 8
  %137 = load volatile double* %136, align 8
  %138 = load double* %d20, align 8
  %add68 = fadd double %138, %137
  store double %add68, double* %d20, align 8
  %139 = load double** %pd, align 8
  %incdec.ptr69 = getelementptr inbounds double* %139, i32 1
  store double* %incdec.ptr69, double** %pd, align 8
  %140 = load volatile double* %139, align 8
  %141 = load double* %d30, align 8
  %add70 = fadd double %141, %140
  store double %add70, double* %d30, align 8
  %142 = load double** %pd, align 8
  %incdec.ptr71 = getelementptr inbounds double* %142, i32 1
  store double* %incdec.ptr71, double** %pd, align 8
  %143 = load volatile double* %142, align 8
  %144 = load double* %d01, align 8
  %add72 = fadd double %144, %143
  store double %add72, double* %d01, align 8
  %145 = load double** %pd, align 8
  %incdec.ptr73 = getelementptr inbounds double* %145, i32 1
  store double* %incdec.ptr73, double** %pd, align 8
  %146 = load volatile double* %145, align 8
  %147 = load double* %d11, align 8
  %add74 = fadd double %147, %146
  store double %add74, double* %d11, align 8
  %148 = load double** %pd, align 8
  %incdec.ptr75 = getelementptr inbounds double* %148, i32 1
  store double* %incdec.ptr75, double** %pd, align 8
  %149 = load volatile double* %148, align 8
  %150 = load double* %d21, align 8
  %add76 = fadd double %150, %149
  store double %add76, double* %d21, align 8
  %151 = load double** %pd, align 8
  %incdec.ptr77 = getelementptr inbounds double* %151, i32 1
  store double* %incdec.ptr77, double** %pd, align 8
  %152 = load volatile double* %151, align 8
  %153 = load double* %d31, align 8
  %add78 = fadd double %153, %152
  store double %add78, double* %d31, align 8
  %154 = load double** %pd, align 8
  %incdec.ptr79 = getelementptr inbounds double* %154, i32 1
  store double* %incdec.ptr79, double** %pd, align 8
  %155 = load volatile double* %154, align 8
  %156 = load double* %d02, align 8
  %add80 = fadd double %156, %155
  store double %add80, double* %d02, align 8
  %157 = load double** %pd, align 8
  %incdec.ptr81 = getelementptr inbounds double* %157, i32 1
  store double* %incdec.ptr81, double** %pd, align 8
  %158 = load volatile double* %157, align 8
  %159 = load double* %d12, align 8
  %add82 = fadd double %159, %158
  store double %add82, double* %d12, align 8
  %160 = load double** %pd, align 8
  %incdec.ptr83 = getelementptr inbounds double* %160, i32 1
  store double* %incdec.ptr83, double** %pd, align 8
  %161 = load volatile double* %160, align 8
  %162 = load double* %d22, align 8
  %add84 = fadd double %162, %161
  store double %add84, double* %d22, align 8
  %163 = load double** %pd, align 8
  %incdec.ptr85 = getelementptr inbounds double* %163, i32 1
  store double* %incdec.ptr85, double** %pd, align 8
  %164 = load volatile double* %163, align 8
  %165 = load double* %d32, align 8
  %add86 = fadd double %165, %164
  store double %add86, double* %d32, align 8
  %166 = load double** %pd, align 8
  %incdec.ptr87 = getelementptr inbounds double* %166, i32 1
  store double* %incdec.ptr87, double** %pd, align 8
  %167 = load volatile double* %166, align 8
  %168 = load double* %d03, align 8
  %add88 = fadd double %168, %167
  store double %add88, double* %d03, align 8
  %169 = load double** %pd, align 8
  %incdec.ptr89 = getelementptr inbounds double* %169, i32 1
  store double* %incdec.ptr89, double** %pd, align 8
  %170 = load volatile double* %169, align 8
  %171 = load double* %d13, align 8
  %add90 = fadd double %171, %170
  store double %add90, double* %d13, align 8
  %172 = load double** %pd, align 8
  %incdec.ptr91 = getelementptr inbounds double* %172, i32 1
  store double* %incdec.ptr91, double** %pd, align 8
  %173 = load volatile double* %172, align 8
  %174 = load double* %d23, align 8
  %add92 = fadd double %174, %173
  store double %add92, double* %d23, align 8
  %175 = load double** %pd, align 8
  %incdec.ptr93 = getelementptr inbounds double* %175, i32 1
  store double* %incdec.ptr93, double** %pd, align 8
  %176 = load volatile double* %175, align 8
  %177 = load double* %d33, align 8
  %add94 = fadd double %177, %176
  store double %add94, double* %d33, align 8
  %178 = load double** %pd, align 8
  %incdec.ptr95 = getelementptr inbounds double* %178, i32 1
  store double* %incdec.ptr95, double** %pd, align 8
  %179 = load volatile double* %178, align 8
  %180 = load double* %d04, align 8
  %add96 = fadd double %180, %179
  store double %add96, double* %d04, align 8
  %181 = load double** %pd, align 8
  %incdec.ptr97 = getelementptr inbounds double* %181, i32 1
  store double* %incdec.ptr97, double** %pd, align 8
  %182 = load volatile double* %181, align 8
  %183 = load double* %d14, align 8
  %add98 = fadd double %183, %182
  store double %add98, double* %d14, align 8
  %184 = load double** %pd, align 8
  %incdec.ptr99 = getelementptr inbounds double* %184, i32 1
  store double* %incdec.ptr99, double** %pd, align 8
  %185 = load volatile double* %184, align 8
  %186 = load double* %d24, align 8
  %add100 = fadd double %186, %185
  store double %add100, double* %d24, align 8
  %187 = load double** %pd, align 8
  %incdec.ptr101 = getelementptr inbounds double* %187, i32 1
  store double* %incdec.ptr101, double** %pd, align 8
  %188 = load volatile double* %187, align 8
  %189 = load double* %d34, align 8
  %add102 = fadd double %189, %188
  store double %add102, double* %d34, align 8
  %190 = load double** %pd, align 8
  %incdec.ptr103 = getelementptr inbounds double* %190, i32 1
  store double* %incdec.ptr103, double** %pd, align 8
  %191 = load volatile double* %190, align 8
  %192 = load double* %d05, align 8
  %add104 = fadd double %192, %191
  store double %add104, double* %d05, align 8
  %193 = load double** %pd, align 8
  %incdec.ptr105 = getelementptr inbounds double* %193, i32 1
  store double* %incdec.ptr105, double** %pd, align 8
  %194 = load volatile double* %193, align 8
  %195 = load double* %d15, align 8
  %add106 = fadd double %195, %194
  store double %add106, double* %d15, align 8
  %196 = load double** %pd, align 8
  %incdec.ptr107 = getelementptr inbounds double* %196, i32 1
  store double* %incdec.ptr107, double** %pd, align 8
  %197 = load volatile double* %196, align 8
  %198 = load double* %d25, align 8
  %add108 = fadd double %198, %197
  store double %add108, double* %d25, align 8
  %199 = load double** %pd, align 8
  %incdec.ptr109 = getelementptr inbounds double* %199, i32 1
  store double* %incdec.ptr109, double** %pd, align 8
  %200 = load volatile double* %199, align 8
  %201 = load double* %d35, align 8
  %add110 = fadd double %201, %200
  store double %add110, double* %d35, align 8
  %202 = load double** %pd, align 8
  %incdec.ptr111 = getelementptr inbounds double* %202, i32 1
  store double* %incdec.ptr111, double** %pd, align 8
  %203 = load volatile double* %202, align 8
  %204 = load double* %d06, align 8
  %add112 = fadd double %204, %203
  store double %add112, double* %d06, align 8
  %205 = load double** %pd, align 8
  %incdec.ptr113 = getelementptr inbounds double* %205, i32 1
  store double* %incdec.ptr113, double** %pd, align 8
  %206 = load volatile double* %205, align 8
  %207 = load double* %d16, align 8
  %add114 = fadd double %207, %206
  store double %add114, double* %d16, align 8
  %208 = load double** %pd, align 8
  %incdec.ptr115 = getelementptr inbounds double* %208, i32 1
  store double* %incdec.ptr115, double** %pd, align 8
  %209 = load volatile double* %208, align 8
  %210 = load double* %d26, align 8
  %add116 = fadd double %210, %209
  store double %add116, double* %d26, align 8
  %211 = load double** %pd, align 8
  %incdec.ptr117 = getelementptr inbounds double* %211, i32 1
  store double* %incdec.ptr117, double** %pd, align 8
  %212 = load volatile double* %211, align 8
  %213 = load double* %d36, align 8
  %add118 = fadd double %213, %212
  store double %add118, double* %d36, align 8
  %214 = load double** %pd, align 8
  %incdec.ptr119 = getelementptr inbounds double* %214, i32 1
  store double* %incdec.ptr119, double** %pd, align 8
  %215 = load volatile double* %214, align 8
  %216 = load double* %d07, align 8
  %add120 = fadd double %216, %215
  store double %add120, double* %d07, align 8
  %217 = load double** %pd, align 8
  %incdec.ptr121 = getelementptr inbounds double* %217, i32 1
  store double* %incdec.ptr121, double** %pd, align 8
  %218 = load volatile double* %217, align 8
  %219 = load double* %d17, align 8
  %add122 = fadd double %219, %218
  store double %add122, double* %d17, align 8
  %220 = load double** %pd, align 8
  %incdec.ptr123 = getelementptr inbounds double* %220, i32 1
  store double* %incdec.ptr123, double** %pd, align 8
  %221 = load volatile double* %220, align 8
  %222 = load double* %d27, align 8
  %add124 = fadd double %222, %221
  store double %add124, double* %d27, align 8
  %223 = load double** %pd, align 8
  %incdec.ptr125 = getelementptr inbounds double* %223, i32 1
  store double* %incdec.ptr125, double** %pd, align 8
  %224 = load volatile double* %223, align 8
  %225 = load double* %d37, align 8
  %add126 = fadd double %225, %224
  store double %add126, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %226 = load double** %pd, align 8
  %incdec.ptr127 = getelementptr inbounds double* %226, i32 1
  store double* %incdec.ptr127, double** %pd, align 8
  %227 = load volatile double* %226, align 8
  %228 = load double* %d00, align 8
  %add128 = fadd double %228, %227
  store double %add128, double* %d00, align 8
  %229 = load double** %pd, align 8
  %incdec.ptr129 = getelementptr inbounds double* %229, i32 1
  store double* %incdec.ptr129, double** %pd, align 8
  %230 = load volatile double* %229, align 8
  %231 = load double* %d10, align 8
  %add130 = fadd double %231, %230
  store double %add130, double* %d10, align 8
  %232 = load double** %pd, align 8
  %incdec.ptr131 = getelementptr inbounds double* %232, i32 1
  store double* %incdec.ptr131, double** %pd, align 8
  %233 = load volatile double* %232, align 8
  %234 = load double* %d20, align 8
  %add132 = fadd double %234, %233
  store double %add132, double* %d20, align 8
  %235 = load double** %pd, align 8
  %incdec.ptr133 = getelementptr inbounds double* %235, i32 1
  store double* %incdec.ptr133, double** %pd, align 8
  %236 = load volatile double* %235, align 8
  %237 = load double* %d30, align 8
  %add134 = fadd double %237, %236
  store double %add134, double* %d30, align 8
  %238 = load double** %pd, align 8
  %incdec.ptr135 = getelementptr inbounds double* %238, i32 1
  store double* %incdec.ptr135, double** %pd, align 8
  %239 = load volatile double* %238, align 8
  %240 = load double* %d01, align 8
  %add136 = fadd double %240, %239
  store double %add136, double* %d01, align 8
  %241 = load double** %pd, align 8
  %incdec.ptr137 = getelementptr inbounds double* %241, i32 1
  store double* %incdec.ptr137, double** %pd, align 8
  %242 = load volatile double* %241, align 8
  %243 = load double* %d11, align 8
  %add138 = fadd double %243, %242
  store double %add138, double* %d11, align 8
  %244 = load double** %pd, align 8
  %incdec.ptr139 = getelementptr inbounds double* %244, i32 1
  store double* %incdec.ptr139, double** %pd, align 8
  %245 = load volatile double* %244, align 8
  %246 = load double* %d21, align 8
  %add140 = fadd double %246, %245
  store double %add140, double* %d21, align 8
  %247 = load double** %pd, align 8
  %incdec.ptr141 = getelementptr inbounds double* %247, i32 1
  store double* %incdec.ptr141, double** %pd, align 8
  %248 = load volatile double* %247, align 8
  %249 = load double* %d31, align 8
  %add142 = fadd double %249, %248
  store double %add142, double* %d31, align 8
  %250 = load double** %pd, align 8
  %incdec.ptr143 = getelementptr inbounds double* %250, i32 1
  store double* %incdec.ptr143, double** %pd, align 8
  %251 = load volatile double* %250, align 8
  %252 = load double* %d02, align 8
  %add144 = fadd double %252, %251
  store double %add144, double* %d02, align 8
  %253 = load double** %pd, align 8
  %incdec.ptr145 = getelementptr inbounds double* %253, i32 1
  store double* %incdec.ptr145, double** %pd, align 8
  %254 = load volatile double* %253, align 8
  %255 = load double* %d12, align 8
  %add146 = fadd double %255, %254
  store double %add146, double* %d12, align 8
  %256 = load double** %pd, align 8
  %incdec.ptr147 = getelementptr inbounds double* %256, i32 1
  store double* %incdec.ptr147, double** %pd, align 8
  %257 = load volatile double* %256, align 8
  %258 = load double* %d22, align 8
  %add148 = fadd double %258, %257
  store double %add148, double* %d22, align 8
  %259 = load double** %pd, align 8
  %incdec.ptr149 = getelementptr inbounds double* %259, i32 1
  store double* %incdec.ptr149, double** %pd, align 8
  %260 = load volatile double* %259, align 8
  %261 = load double* %d32, align 8
  %add150 = fadd double %261, %260
  store double %add150, double* %d32, align 8
  %262 = load double** %pd, align 8
  %incdec.ptr151 = getelementptr inbounds double* %262, i32 1
  store double* %incdec.ptr151, double** %pd, align 8
  %263 = load volatile double* %262, align 8
  %264 = load double* %d03, align 8
  %add152 = fadd double %264, %263
  store double %add152, double* %d03, align 8
  %265 = load double** %pd, align 8
  %incdec.ptr153 = getelementptr inbounds double* %265, i32 1
  store double* %incdec.ptr153, double** %pd, align 8
  %266 = load volatile double* %265, align 8
  %267 = load double* %d13, align 8
  %add154 = fadd double %267, %266
  store double %add154, double* %d13, align 8
  %268 = load double** %pd, align 8
  %incdec.ptr155 = getelementptr inbounds double* %268, i32 1
  store double* %incdec.ptr155, double** %pd, align 8
  %269 = load volatile double* %268, align 8
  %270 = load double* %d23, align 8
  %add156 = fadd double %270, %269
  store double %add156, double* %d23, align 8
  %271 = load double** %pd, align 8
  %incdec.ptr157 = getelementptr inbounds double* %271, i32 1
  store double* %incdec.ptr157, double** %pd, align 8
  %272 = load volatile double* %271, align 8
  %273 = load double* %d33, align 8
  %add158 = fadd double %273, %272
  store double %add158, double* %d33, align 8
  %274 = load double** %pd, align 8
  %incdec.ptr159 = getelementptr inbounds double* %274, i32 1
  store double* %incdec.ptr159, double** %pd, align 8
  %275 = load volatile double* %274, align 8
  %276 = load double* %d04, align 8
  %add160 = fadd double %276, %275
  store double %add160, double* %d04, align 8
  %277 = load double** %pd, align 8
  %incdec.ptr161 = getelementptr inbounds double* %277, i32 1
  store double* %incdec.ptr161, double** %pd, align 8
  %278 = load volatile double* %277, align 8
  %279 = load double* %d14, align 8
  %add162 = fadd double %279, %278
  store double %add162, double* %d14, align 8
  %280 = load double** %pd, align 8
  %incdec.ptr163 = getelementptr inbounds double* %280, i32 1
  store double* %incdec.ptr163, double** %pd, align 8
  %281 = load volatile double* %280, align 8
  %282 = load double* %d24, align 8
  %add164 = fadd double %282, %281
  store double %add164, double* %d24, align 8
  %283 = load double** %pd, align 8
  %incdec.ptr165 = getelementptr inbounds double* %283, i32 1
  store double* %incdec.ptr165, double** %pd, align 8
  %284 = load volatile double* %283, align 8
  %285 = load double* %d34, align 8
  %add166 = fadd double %285, %284
  store double %add166, double* %d34, align 8
  %286 = load double** %pd, align 8
  %incdec.ptr167 = getelementptr inbounds double* %286, i32 1
  store double* %incdec.ptr167, double** %pd, align 8
  %287 = load volatile double* %286, align 8
  %288 = load double* %d05, align 8
  %add168 = fadd double %288, %287
  store double %add168, double* %d05, align 8
  %289 = load double** %pd, align 8
  %incdec.ptr169 = getelementptr inbounds double* %289, i32 1
  store double* %incdec.ptr169, double** %pd, align 8
  %290 = load volatile double* %289, align 8
  %291 = load double* %d15, align 8
  %add170 = fadd double %291, %290
  store double %add170, double* %d15, align 8
  %292 = load double** %pd, align 8
  %incdec.ptr171 = getelementptr inbounds double* %292, i32 1
  store double* %incdec.ptr171, double** %pd, align 8
  %293 = load volatile double* %292, align 8
  %294 = load double* %d25, align 8
  %add172 = fadd double %294, %293
  store double %add172, double* %d25, align 8
  %295 = load double** %pd, align 8
  %incdec.ptr173 = getelementptr inbounds double* %295, i32 1
  store double* %incdec.ptr173, double** %pd, align 8
  %296 = load volatile double* %295, align 8
  %297 = load double* %d35, align 8
  %add174 = fadd double %297, %296
  store double %add174, double* %d35, align 8
  %298 = load double** %pd, align 8
  %incdec.ptr175 = getelementptr inbounds double* %298, i32 1
  store double* %incdec.ptr175, double** %pd, align 8
  %299 = load volatile double* %298, align 8
  %300 = load double* %d06, align 8
  %add176 = fadd double %300, %299
  store double %add176, double* %d06, align 8
  %301 = load double** %pd, align 8
  %incdec.ptr177 = getelementptr inbounds double* %301, i32 1
  store double* %incdec.ptr177, double** %pd, align 8
  %302 = load volatile double* %301, align 8
  %303 = load double* %d16, align 8
  %add178 = fadd double %303, %302
  store double %add178, double* %d16, align 8
  %304 = load double** %pd, align 8
  %incdec.ptr179 = getelementptr inbounds double* %304, i32 1
  store double* %incdec.ptr179, double** %pd, align 8
  %305 = load volatile double* %304, align 8
  %306 = load double* %d26, align 8
  %add180 = fadd double %306, %305
  store double %add180, double* %d26, align 8
  %307 = load double** %pd, align 8
  %incdec.ptr181 = getelementptr inbounds double* %307, i32 1
  store double* %incdec.ptr181, double** %pd, align 8
  %308 = load volatile double* %307, align 8
  %309 = load double* %d36, align 8
  %add182 = fadd double %309, %308
  store double %add182, double* %d36, align 8
  %310 = load double** %pd, align 8
  %incdec.ptr183 = getelementptr inbounds double* %310, i32 1
  store double* %incdec.ptr183, double** %pd, align 8
  %311 = load volatile double* %310, align 8
  %312 = load double* %d07, align 8
  %add184 = fadd double %312, %311
  store double %add184, double* %d07, align 8
  %313 = load double** %pd, align 8
  %incdec.ptr185 = getelementptr inbounds double* %313, i32 1
  store double* %incdec.ptr185, double** %pd, align 8
  %314 = load volatile double* %313, align 8
  %315 = load double* %d17, align 8
  %add186 = fadd double %315, %314
  store double %add186, double* %d17, align 8
  %316 = load double** %pd, align 8
  %incdec.ptr187 = getelementptr inbounds double* %316, i32 1
  store double* %incdec.ptr187, double** %pd, align 8
  %317 = load volatile double* %316, align 8
  %318 = load double* %d27, align 8
  %add188 = fadd double %318, %317
  store double %add188, double* %d27, align 8
  %319 = load double** %pd, align 8
  %incdec.ptr189 = getelementptr inbounds double* %319, i32 1
  store double* %incdec.ptr189, double** %pd, align 8
  %320 = load volatile double* %319, align 8
  %321 = load double* %d37, align 8
  %add190 = fadd double %321, %320
  store double %add190, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %322 = load double** %pd, align 8
  %incdec.ptr191 = getelementptr inbounds double* %322, i32 1
  store double* %incdec.ptr191, double** %pd, align 8
  %323 = load volatile double* %322, align 8
  %324 = load double* %d00, align 8
  %add192 = fadd double %324, %323
  store double %add192, double* %d00, align 8
  %325 = load double** %pd, align 8
  %incdec.ptr193 = getelementptr inbounds double* %325, i32 1
  store double* %incdec.ptr193, double** %pd, align 8
  %326 = load volatile double* %325, align 8
  %327 = load double* %d10, align 8
  %add194 = fadd double %327, %326
  store double %add194, double* %d10, align 8
  %328 = load double** %pd, align 8
  %incdec.ptr195 = getelementptr inbounds double* %328, i32 1
  store double* %incdec.ptr195, double** %pd, align 8
  %329 = load volatile double* %328, align 8
  %330 = load double* %d20, align 8
  %add196 = fadd double %330, %329
  store double %add196, double* %d20, align 8
  %331 = load double** %pd, align 8
  %incdec.ptr197 = getelementptr inbounds double* %331, i32 1
  store double* %incdec.ptr197, double** %pd, align 8
  %332 = load volatile double* %331, align 8
  %333 = load double* %d30, align 8
  %add198 = fadd double %333, %332
  store double %add198, double* %d30, align 8
  %334 = load double** %pd, align 8
  %incdec.ptr199 = getelementptr inbounds double* %334, i32 1
  store double* %incdec.ptr199, double** %pd, align 8
  %335 = load volatile double* %334, align 8
  %336 = load double* %d01, align 8
  %add200 = fadd double %336, %335
  store double %add200, double* %d01, align 8
  %337 = load double** %pd, align 8
  %incdec.ptr201 = getelementptr inbounds double* %337, i32 1
  store double* %incdec.ptr201, double** %pd, align 8
  %338 = load volatile double* %337, align 8
  %339 = load double* %d11, align 8
  %add202 = fadd double %339, %338
  store double %add202, double* %d11, align 8
  %340 = load double** %pd, align 8
  %incdec.ptr203 = getelementptr inbounds double* %340, i32 1
  store double* %incdec.ptr203, double** %pd, align 8
  %341 = load volatile double* %340, align 8
  %342 = load double* %d21, align 8
  %add204 = fadd double %342, %341
  store double %add204, double* %d21, align 8
  %343 = load double** %pd, align 8
  %incdec.ptr205 = getelementptr inbounds double* %343, i32 1
  store double* %incdec.ptr205, double** %pd, align 8
  %344 = load volatile double* %343, align 8
  %345 = load double* %d31, align 8
  %add206 = fadd double %345, %344
  store double %add206, double* %d31, align 8
  %346 = load double** %pd, align 8
  %incdec.ptr207 = getelementptr inbounds double* %346, i32 1
  store double* %incdec.ptr207, double** %pd, align 8
  %347 = load volatile double* %346, align 8
  %348 = load double* %d02, align 8
  %add208 = fadd double %348, %347
  store double %add208, double* %d02, align 8
  %349 = load double** %pd, align 8
  %incdec.ptr209 = getelementptr inbounds double* %349, i32 1
  store double* %incdec.ptr209, double** %pd, align 8
  %350 = load volatile double* %349, align 8
  %351 = load double* %d12, align 8
  %add210 = fadd double %351, %350
  store double %add210, double* %d12, align 8
  %352 = load double** %pd, align 8
  %incdec.ptr211 = getelementptr inbounds double* %352, i32 1
  store double* %incdec.ptr211, double** %pd, align 8
  %353 = load volatile double* %352, align 8
  %354 = load double* %d22, align 8
  %add212 = fadd double %354, %353
  store double %add212, double* %d22, align 8
  %355 = load double** %pd, align 8
  %incdec.ptr213 = getelementptr inbounds double* %355, i32 1
  store double* %incdec.ptr213, double** %pd, align 8
  %356 = load volatile double* %355, align 8
  %357 = load double* %d32, align 8
  %add214 = fadd double %357, %356
  store double %add214, double* %d32, align 8
  %358 = load double** %pd, align 8
  %incdec.ptr215 = getelementptr inbounds double* %358, i32 1
  store double* %incdec.ptr215, double** %pd, align 8
  %359 = load volatile double* %358, align 8
  %360 = load double* %d03, align 8
  %add216 = fadd double %360, %359
  store double %add216, double* %d03, align 8
  %361 = load double** %pd, align 8
  %incdec.ptr217 = getelementptr inbounds double* %361, i32 1
  store double* %incdec.ptr217, double** %pd, align 8
  %362 = load volatile double* %361, align 8
  %363 = load double* %d13, align 8
  %add218 = fadd double %363, %362
  store double %add218, double* %d13, align 8
  %364 = load double** %pd, align 8
  %incdec.ptr219 = getelementptr inbounds double* %364, i32 1
  store double* %incdec.ptr219, double** %pd, align 8
  %365 = load volatile double* %364, align 8
  %366 = load double* %d23, align 8
  %add220 = fadd double %366, %365
  store double %add220, double* %d23, align 8
  %367 = load double** %pd, align 8
  %incdec.ptr221 = getelementptr inbounds double* %367, i32 1
  store double* %incdec.ptr221, double** %pd, align 8
  %368 = load volatile double* %367, align 8
  %369 = load double* %d33, align 8
  %add222 = fadd double %369, %368
  store double %add222, double* %d33, align 8
  %370 = load double** %pd, align 8
  %incdec.ptr223 = getelementptr inbounds double* %370, i32 1
  store double* %incdec.ptr223, double** %pd, align 8
  %371 = load volatile double* %370, align 8
  %372 = load double* %d04, align 8
  %add224 = fadd double %372, %371
  store double %add224, double* %d04, align 8
  %373 = load double** %pd, align 8
  %incdec.ptr225 = getelementptr inbounds double* %373, i32 1
  store double* %incdec.ptr225, double** %pd, align 8
  %374 = load volatile double* %373, align 8
  %375 = load double* %d14, align 8
  %add226 = fadd double %375, %374
  store double %add226, double* %d14, align 8
  %376 = load double** %pd, align 8
  %incdec.ptr227 = getelementptr inbounds double* %376, i32 1
  store double* %incdec.ptr227, double** %pd, align 8
  %377 = load volatile double* %376, align 8
  %378 = load double* %d24, align 8
  %add228 = fadd double %378, %377
  store double %add228, double* %d24, align 8
  %379 = load double** %pd, align 8
  %incdec.ptr229 = getelementptr inbounds double* %379, i32 1
  store double* %incdec.ptr229, double** %pd, align 8
  %380 = load volatile double* %379, align 8
  %381 = load double* %d34, align 8
  %add230 = fadd double %381, %380
  store double %add230, double* %d34, align 8
  %382 = load double** %pd, align 8
  %incdec.ptr231 = getelementptr inbounds double* %382, i32 1
  store double* %incdec.ptr231, double** %pd, align 8
  %383 = load volatile double* %382, align 8
  %384 = load double* %d05, align 8
  %add232 = fadd double %384, %383
  store double %add232, double* %d05, align 8
  %385 = load double** %pd, align 8
  %incdec.ptr233 = getelementptr inbounds double* %385, i32 1
  store double* %incdec.ptr233, double** %pd, align 8
  %386 = load volatile double* %385, align 8
  %387 = load double* %d15, align 8
  %add234 = fadd double %387, %386
  store double %add234, double* %d15, align 8
  %388 = load double** %pd, align 8
  %incdec.ptr235 = getelementptr inbounds double* %388, i32 1
  store double* %incdec.ptr235, double** %pd, align 8
  %389 = load volatile double* %388, align 8
  %390 = load double* %d25, align 8
  %add236 = fadd double %390, %389
  store double %add236, double* %d25, align 8
  %391 = load double** %pd, align 8
  %incdec.ptr237 = getelementptr inbounds double* %391, i32 1
  store double* %incdec.ptr237, double** %pd, align 8
  %392 = load volatile double* %391, align 8
  %393 = load double* %d35, align 8
  %add238 = fadd double %393, %392
  store double %add238, double* %d35, align 8
  %394 = load double** %pd, align 8
  %incdec.ptr239 = getelementptr inbounds double* %394, i32 1
  store double* %incdec.ptr239, double** %pd, align 8
  %395 = load volatile double* %394, align 8
  %396 = load double* %d06, align 8
  %add240 = fadd double %396, %395
  store double %add240, double* %d06, align 8
  %397 = load double** %pd, align 8
  %incdec.ptr241 = getelementptr inbounds double* %397, i32 1
  store double* %incdec.ptr241, double** %pd, align 8
  %398 = load volatile double* %397, align 8
  %399 = load double* %d16, align 8
  %add242 = fadd double %399, %398
  store double %add242, double* %d16, align 8
  %400 = load double** %pd, align 8
  %incdec.ptr243 = getelementptr inbounds double* %400, i32 1
  store double* %incdec.ptr243, double** %pd, align 8
  %401 = load volatile double* %400, align 8
  %402 = load double* %d26, align 8
  %add244 = fadd double %402, %401
  store double %add244, double* %d26, align 8
  %403 = load double** %pd, align 8
  %incdec.ptr245 = getelementptr inbounds double* %403, i32 1
  store double* %incdec.ptr245, double** %pd, align 8
  %404 = load volatile double* %403, align 8
  %405 = load double* %d36, align 8
  %add246 = fadd double %405, %404
  store double %add246, double* %d36, align 8
  %406 = load double** %pd, align 8
  %incdec.ptr247 = getelementptr inbounds double* %406, i32 1
  store double* %incdec.ptr247, double** %pd, align 8
  %407 = load volatile double* %406, align 8
  %408 = load double* %d07, align 8
  %add248 = fadd double %408, %407
  store double %add248, double* %d07, align 8
  %409 = load double** %pd, align 8
  %incdec.ptr249 = getelementptr inbounds double* %409, i32 1
  store double* %incdec.ptr249, double** %pd, align 8
  %410 = load volatile double* %409, align 8
  %411 = load double* %d17, align 8
  %add250 = fadd double %411, %410
  store double %add250, double* %d17, align 8
  %412 = load double** %pd, align 8
  %incdec.ptr251 = getelementptr inbounds double* %412, i32 1
  store double* %incdec.ptr251, double** %pd, align 8
  %413 = load volatile double* %412, align 8
  %414 = load double* %d27, align 8
  %add252 = fadd double %414, %413
  store double %add252, double* %d27, align 8
  %415 = load double** %pd, align 8
  %incdec.ptr253 = getelementptr inbounds double* %415, i32 1
  store double* %incdec.ptr253, double** %pd, align 8
  %416 = load volatile double* %415, align 8
  %417 = load double* %d37, align 8
  %add254 = fadd double %417, %416
  store double %add254, double* %d37, align 8
  store float* getelementptr inbounds ([32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %418 = load float* %f00, align 4
  %419 = load float** %pf, align 8
  %incdec.ptr255 = getelementptr inbounds float* %419, i32 1
  store float* %incdec.ptr255, float** %pf, align 8
  store volatile float %418, float* %419, align 4
  %420 = load float* %f10, align 4
  %421 = load float** %pf, align 8
  %incdec.ptr256 = getelementptr inbounds float* %421, i32 1
  store float* %incdec.ptr256, float** %pf, align 8
  store volatile float %420, float* %421, align 4
  %422 = load float* %f20, align 4
  %423 = load float** %pf, align 8
  %incdec.ptr257 = getelementptr inbounds float* %423, i32 1
  store float* %incdec.ptr257, float** %pf, align 8
  store volatile float %422, float* %423, align 4
  %424 = load float* %f30, align 4
  %425 = load float** %pf, align 8
  %incdec.ptr258 = getelementptr inbounds float* %425, i32 1
  store float* %incdec.ptr258, float** %pf, align 8
  store volatile float %424, float* %425, align 4
  %426 = load float* %f01, align 4
  %427 = load float** %pf, align 8
  %incdec.ptr259 = getelementptr inbounds float* %427, i32 1
  store float* %incdec.ptr259, float** %pf, align 8
  store volatile float %426, float* %427, align 4
  %428 = load float* %f11, align 4
  %429 = load float** %pf, align 8
  %incdec.ptr260 = getelementptr inbounds float* %429, i32 1
  store float* %incdec.ptr260, float** %pf, align 8
  store volatile float %428, float* %429, align 4
  %430 = load float* %f21, align 4
  %431 = load float** %pf, align 8
  %incdec.ptr261 = getelementptr inbounds float* %431, i32 1
  store float* %incdec.ptr261, float** %pf, align 8
  store volatile float %430, float* %431, align 4
  %432 = load float* %f31, align 4
  %433 = load float** %pf, align 8
  %incdec.ptr262 = getelementptr inbounds float* %433, i32 1
  store float* %incdec.ptr262, float** %pf, align 8
  store volatile float %432, float* %433, align 4
  %434 = load float* %f02, align 4
  %435 = load float** %pf, align 8
  %incdec.ptr263 = getelementptr inbounds float* %435, i32 1
  store float* %incdec.ptr263, float** %pf, align 8
  store volatile float %434, float* %435, align 4
  %436 = load float* %f12, align 4
  %437 = load float** %pf, align 8
  %incdec.ptr264 = getelementptr inbounds float* %437, i32 1
  store float* %incdec.ptr264, float** %pf, align 8
  store volatile float %436, float* %437, align 4
  %438 = load float* %f22, align 4
  %439 = load float** %pf, align 8
  %incdec.ptr265 = getelementptr inbounds float* %439, i32 1
  store float* %incdec.ptr265, float** %pf, align 8
  store volatile float %438, float* %439, align 4
  %440 = load float* %f32, align 4
  %441 = load float** %pf, align 8
  %incdec.ptr266 = getelementptr inbounds float* %441, i32 1
  store float* %incdec.ptr266, float** %pf, align 8
  store volatile float %440, float* %441, align 4
  %442 = load float* %f03, align 4
  %443 = load float** %pf, align 8
  %incdec.ptr267 = getelementptr inbounds float* %443, i32 1
  store float* %incdec.ptr267, float** %pf, align 8
  store volatile float %442, float* %443, align 4
  %444 = load float* %f13, align 4
  %445 = load float** %pf, align 8
  %incdec.ptr268 = getelementptr inbounds float* %445, i32 1
  store float* %incdec.ptr268, float** %pf, align 8
  store volatile float %444, float* %445, align 4
  %446 = load float* %f23, align 4
  %447 = load float** %pf, align 8
  %incdec.ptr269 = getelementptr inbounds float* %447, i32 1
  store float* %incdec.ptr269, float** %pf, align 8
  store volatile float %446, float* %447, align 4
  %448 = load float* %f33, align 4
  %449 = load float** %pf, align 8
  %incdec.ptr270 = getelementptr inbounds float* %449, i32 1
  store float* %incdec.ptr270, float** %pf, align 8
  store volatile float %448, float* %449, align 4
  %450 = load float* %f04, align 4
  %451 = load float** %pf, align 8
  %incdec.ptr271 = getelementptr inbounds float* %451, i32 1
  store float* %incdec.ptr271, float** %pf, align 8
  store volatile float %450, float* %451, align 4
  %452 = load float* %f14, align 4
  %453 = load float** %pf, align 8
  %incdec.ptr272 = getelementptr inbounds float* %453, i32 1
  store float* %incdec.ptr272, float** %pf, align 8
  store volatile float %452, float* %453, align 4
  %454 = load float* %f24, align 4
  %455 = load float** %pf, align 8
  %incdec.ptr273 = getelementptr inbounds float* %455, i32 1
  store float* %incdec.ptr273, float** %pf, align 8
  store volatile float %454, float* %455, align 4
  %456 = load float* %f34, align 4
  %457 = load float** %pf, align 8
  %incdec.ptr274 = getelementptr inbounds float* %457, i32 1
  store float* %incdec.ptr274, float** %pf, align 8
  store volatile float %456, float* %457, align 4
  %458 = load float* %f05, align 4
  %459 = load float** %pf, align 8
  %incdec.ptr275 = getelementptr inbounds float* %459, i32 1
  store float* %incdec.ptr275, float** %pf, align 8
  store volatile float %458, float* %459, align 4
  %460 = load float* %f15, align 4
  %461 = load float** %pf, align 8
  %incdec.ptr276 = getelementptr inbounds float* %461, i32 1
  store float* %incdec.ptr276, float** %pf, align 8
  store volatile float %460, float* %461, align 4
  %462 = load float* %f25, align 4
  %463 = load float** %pf, align 8
  %incdec.ptr277 = getelementptr inbounds float* %463, i32 1
  store float* %incdec.ptr277, float** %pf, align 8
  store volatile float %462, float* %463, align 4
  %464 = load float* %f35, align 4
  %465 = load float** %pf, align 8
  %incdec.ptr278 = getelementptr inbounds float* %465, i32 1
  store float* %incdec.ptr278, float** %pf, align 8
  store volatile float %464, float* %465, align 4
  %466 = load float* %f06, align 4
  %467 = load float** %pf, align 8
  %incdec.ptr279 = getelementptr inbounds float* %467, i32 1
  store float* %incdec.ptr279, float** %pf, align 8
  store volatile float %466, float* %467, align 4
  %468 = load float* %f16, align 4
  %469 = load float** %pf, align 8
  %incdec.ptr280 = getelementptr inbounds float* %469, i32 1
  store float* %incdec.ptr280, float** %pf, align 8
  store volatile float %468, float* %469, align 4
  %470 = load float* %f26, align 4
  %471 = load float** %pf, align 8
  %incdec.ptr281 = getelementptr inbounds float* %471, i32 1
  store float* %incdec.ptr281, float** %pf, align 8
  store volatile float %470, float* %471, align 4
  %472 = load float* %f36, align 4
  %473 = load float** %pf, align 8
  %incdec.ptr282 = getelementptr inbounds float* %473, i32 1
  store float* %incdec.ptr282, float** %pf, align 8
  store volatile float %472, float* %473, align 4
  %474 = load float* %f07, align 4
  %475 = load float** %pf, align 8
  %incdec.ptr283 = getelementptr inbounds float* %475, i32 1
  store float* %incdec.ptr283, float** %pf, align 8
  store volatile float %474, float* %475, align 4
  %476 = load float* %f17, align 4
  %477 = load float** %pf, align 8
  %incdec.ptr284 = getelementptr inbounds float* %477, i32 1
  store float* %incdec.ptr284, float** %pf, align 8
  store volatile float %476, float* %477, align 4
  %478 = load float* %f27, align 4
  %479 = load float** %pf, align 8
  %incdec.ptr285 = getelementptr inbounds float* %479, i32 1
  store float* %incdec.ptr285, float** %pf, align 8
  store volatile float %478, float* %479, align 4
  %480 = load float* %f37, align 4
  %481 = load float** %pf, align 8
  %incdec.ptr286 = getelementptr inbounds float* %481, i32 1
  store float* %incdec.ptr286, float** %pf, align 8
  store volatile float %480, float* %481, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %482 = load i32* %i, align 4
  %inc = add nsw i32 %482, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %483 = load double* %d00, align 8
  %484 = load double** %pd, align 8
  %incdec.ptr287 = getelementptr inbounds double* %484, i32 1
  store double* %incdec.ptr287, double** %pd, align 8
  store volatile double %483, double* %484, align 8
  %485 = load double* %d10, align 8
  %486 = load double** %pd, align 8
  %incdec.ptr288 = getelementptr inbounds double* %486, i32 1
  store double* %incdec.ptr288, double** %pd, align 8
  store volatile double %485, double* %486, align 8
  %487 = load double* %d20, align 8
  %488 = load double** %pd, align 8
  %incdec.ptr289 = getelementptr inbounds double* %488, i32 1
  store double* %incdec.ptr289, double** %pd, align 8
  store volatile double %487, double* %488, align 8
  %489 = load double* %d30, align 8
  %490 = load double** %pd, align 8
  %incdec.ptr290 = getelementptr inbounds double* %490, i32 1
  store double* %incdec.ptr290, double** %pd, align 8
  store volatile double %489, double* %490, align 8
  %491 = load double* %d01, align 8
  %492 = load double** %pd, align 8
  %incdec.ptr291 = getelementptr inbounds double* %492, i32 1
  store double* %incdec.ptr291, double** %pd, align 8
  store volatile double %491, double* %492, align 8
  %493 = load double* %d11, align 8
  %494 = load double** %pd, align 8
  %incdec.ptr292 = getelementptr inbounds double* %494, i32 1
  store double* %incdec.ptr292, double** %pd, align 8
  store volatile double %493, double* %494, align 8
  %495 = load double* %d21, align 8
  %496 = load double** %pd, align 8
  %incdec.ptr293 = getelementptr inbounds double* %496, i32 1
  store double* %incdec.ptr293, double** %pd, align 8
  store volatile double %495, double* %496, align 8
  %497 = load double* %d31, align 8
  %498 = load double** %pd, align 8
  %incdec.ptr294 = getelementptr inbounds double* %498, i32 1
  store double* %incdec.ptr294, double** %pd, align 8
  store volatile double %497, double* %498, align 8
  %499 = load double* %d02, align 8
  %500 = load double** %pd, align 8
  %incdec.ptr295 = getelementptr inbounds double* %500, i32 1
  store double* %incdec.ptr295, double** %pd, align 8
  store volatile double %499, double* %500, align 8
  %501 = load double* %d12, align 8
  %502 = load double** %pd, align 8
  %incdec.ptr296 = getelementptr inbounds double* %502, i32 1
  store double* %incdec.ptr296, double** %pd, align 8
  store volatile double %501, double* %502, align 8
  %503 = load double* %d22, align 8
  %504 = load double** %pd, align 8
  %incdec.ptr297 = getelementptr inbounds double* %504, i32 1
  store double* %incdec.ptr297, double** %pd, align 8
  store volatile double %503, double* %504, align 8
  %505 = load double* %d32, align 8
  %506 = load double** %pd, align 8
  %incdec.ptr298 = getelementptr inbounds double* %506, i32 1
  store double* %incdec.ptr298, double** %pd, align 8
  store volatile double %505, double* %506, align 8
  %507 = load double* %d03, align 8
  %508 = load double** %pd, align 8
  %incdec.ptr299 = getelementptr inbounds double* %508, i32 1
  store double* %incdec.ptr299, double** %pd, align 8
  store volatile double %507, double* %508, align 8
  %509 = load double* %d13, align 8
  %510 = load double** %pd, align 8
  %incdec.ptr300 = getelementptr inbounds double* %510, i32 1
  store double* %incdec.ptr300, double** %pd, align 8
  store volatile double %509, double* %510, align 8
  %511 = load double* %d23, align 8
  %512 = load double** %pd, align 8
  %incdec.ptr301 = getelementptr inbounds double* %512, i32 1
  store double* %incdec.ptr301, double** %pd, align 8
  store volatile double %511, double* %512, align 8
  %513 = load double* %d33, align 8
  %514 = load double** %pd, align 8
  %incdec.ptr302 = getelementptr inbounds double* %514, i32 1
  store double* %incdec.ptr302, double** %pd, align 8
  store volatile double %513, double* %514, align 8
  %515 = load double* %d04, align 8
  %516 = load double** %pd, align 8
  %incdec.ptr303 = getelementptr inbounds double* %516, i32 1
  store double* %incdec.ptr303, double** %pd, align 8
  store volatile double %515, double* %516, align 8
  %517 = load double* %d14, align 8
  %518 = load double** %pd, align 8
  %incdec.ptr304 = getelementptr inbounds double* %518, i32 1
  store double* %incdec.ptr304, double** %pd, align 8
  store volatile double %517, double* %518, align 8
  %519 = load double* %d24, align 8
  %520 = load double** %pd, align 8
  %incdec.ptr305 = getelementptr inbounds double* %520, i32 1
  store double* %incdec.ptr305, double** %pd, align 8
  store volatile double %519, double* %520, align 8
  %521 = load double* %d34, align 8
  %522 = load double** %pd, align 8
  %incdec.ptr306 = getelementptr inbounds double* %522, i32 1
  store double* %incdec.ptr306, double** %pd, align 8
  store volatile double %521, double* %522, align 8
  %523 = load double* %d05, align 8
  %524 = load double** %pd, align 8
  %incdec.ptr307 = getelementptr inbounds double* %524, i32 1
  store double* %incdec.ptr307, double** %pd, align 8
  store volatile double %523, double* %524, align 8
  %525 = load double* %d15, align 8
  %526 = load double** %pd, align 8
  %incdec.ptr308 = getelementptr inbounds double* %526, i32 1
  store double* %incdec.ptr308, double** %pd, align 8
  store volatile double %525, double* %526, align 8
  %527 = load double* %d25, align 8
  %528 = load double** %pd, align 8
  %incdec.ptr309 = getelementptr inbounds double* %528, i32 1
  store double* %incdec.ptr309, double** %pd, align 8
  store volatile double %527, double* %528, align 8
  %529 = load double* %d35, align 8
  %530 = load double** %pd, align 8
  %incdec.ptr310 = getelementptr inbounds double* %530, i32 1
  store double* %incdec.ptr310, double** %pd, align 8
  store volatile double %529, double* %530, align 8
  %531 = load double* %d06, align 8
  %532 = load double** %pd, align 8
  %incdec.ptr311 = getelementptr inbounds double* %532, i32 1
  store double* %incdec.ptr311, double** %pd, align 8
  store volatile double %531, double* %532, align 8
  %533 = load double* %d16, align 8
  %534 = load double** %pd, align 8
  %incdec.ptr312 = getelementptr inbounds double* %534, i32 1
  store double* %incdec.ptr312, double** %pd, align 8
  store volatile double %533, double* %534, align 8
  %535 = load double* %d26, align 8
  %536 = load double** %pd, align 8
  %incdec.ptr313 = getelementptr inbounds double* %536, i32 1
  store double* %incdec.ptr313, double** %pd, align 8
  store volatile double %535, double* %536, align 8
  %537 = load double* %d36, align 8
  %538 = load double** %pd, align 8
  %incdec.ptr314 = getelementptr inbounds double* %538, i32 1
  store double* %incdec.ptr314, double** %pd, align 8
  store volatile double %537, double* %538, align 8
  %539 = load double* %d07, align 8
  %540 = load double** %pd, align 8
  %incdec.ptr315 = getelementptr inbounds double* %540, i32 1
  store double* %incdec.ptr315, double** %pd, align 8
  store volatile double %539, double* %540, align 8
  %541 = load double* %d17, align 8
  %542 = load double** %pd, align 8
  %incdec.ptr316 = getelementptr inbounds double* %542, i32 1
  store double* %incdec.ptr316, double** %pd, align 8
  store volatile double %541, double* %542, align 8
  %543 = load double* %d27, align 8
  %544 = load double** %pd, align 8
  %incdec.ptr317 = getelementptr inbounds double* %544, i32 1
  store double* %incdec.ptr317, double** %pd, align 8
  store volatile double %543, double* %544, align 8
  %545 = load double* %d37, align 8
  %546 = load double** %pd, align 8
  %incdec.ptr318 = getelementptr inbounds double* %546, i32 1
  store double* %incdec.ptr318, double** %pd, align 8
  store volatile double %545, double* %546, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sitofp i32 %1 to double
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [32 x double]* @gd, i32 0, i64 %idxprom
  store volatile double %conv, double* %arrayidx, align 8
  %3 = load i32* %i, align 4
  %conv1 = sitofp i32 %3 to float
  %4 = load i32* %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds [32 x float]* @gf, i32 0, i64 %idxprom2
  store volatile float %conv1, float* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @foo(i32 1)
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc18, %for.end
  %6 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %6, 32
  br i1 %cmp5, label %for.body7, label %for.end20

for.body7:                                        ; preds = %for.cond4
  %7 = load i32* %i, align 4
  %idxprom8 = sext i32 %7 to i64
  %arrayidx9 = getelementptr inbounds [32 x double]* @gd, i32 0, i64 %idxprom8
  %8 = load volatile double* %arrayidx9, align 8
  %9 = load i32* %i, align 4
  %mul = mul nsw i32 %9, 4
  %conv10 = sitofp i32 %mul to double
  %cmp11 = fcmp une double %8, %conv10
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body7
  %10 = load i32* %i, align 4
  %idxprom13 = sext i32 %10 to i64
  %arrayidx14 = getelementptr inbounds [32 x float]* @gf, i32 0, i64 %idxprom13
  %11 = load volatile float* %arrayidx14, align 4
  %12 = load i32* %i, align 4
  %conv15 = sitofp i32 %12 to float
  %cmp16 = fcmp une float %11, %conv15
  br i1 %cmp16, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body7
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc18

for.inc18:                                        ; preds = %if.end
  %13 = load i32* %i, align 4
  %inc19 = add nsw i32 %13, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond4

for.end20:                                        ; preds = %for.cond4
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %14 = load i32* %retval
  ret i32 %14
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
