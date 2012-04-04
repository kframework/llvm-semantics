; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021120-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gd = common global [32 x double] zeroinitializer, align 16
@gf = common global [32 x float] zeroinitializer, align 16

define void @foo(i32 %n) nounwind uwtable {
entry:
  %0 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16, !tbaa !0
  %1 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8, !tbaa !0
  %2 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16, !tbaa !0
  %3 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8, !tbaa !0
  %4 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16, !tbaa !0
  %5 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8, !tbaa !0
  %6 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16, !tbaa !0
  %7 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8, !tbaa !0
  %8 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16, !tbaa !0
  %9 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8, !tbaa !0
  %10 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16, !tbaa !0
  %11 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8, !tbaa !0
  %12 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16, !tbaa !0
  %13 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8, !tbaa !0
  %14 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16, !tbaa !0
  %15 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8, !tbaa !0
  %16 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16, !tbaa !0
  %17 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8, !tbaa !0
  %18 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16, !tbaa !0
  %19 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8, !tbaa !0
  %20 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16, !tbaa !0
  %21 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8, !tbaa !0
  %22 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16, !tbaa !0
  %23 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8, !tbaa !0
  %24 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16, !tbaa !0
  %25 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8, !tbaa !0
  %26 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16, !tbaa !0
  %27 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8, !tbaa !0
  %28 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16, !tbaa !0
  %29 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8, !tbaa !0
  %30 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16, !tbaa !0
  %31 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8, !tbaa !0
  %cmp319 = icmp sgt i32 %n, 0
  br i1 %cmp319, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %i.0352 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %d00.0351 = phi double [ %add192, %for.body ], [ %0, %entry ]
  %d10.0350 = phi double [ %add194, %for.body ], [ %1, %entry ]
  %d20.0349 = phi double [ %add196, %for.body ], [ %2, %entry ]
  %d30.0348 = phi double [ %add198, %for.body ], [ %3, %entry ]
  %d01.0347 = phi double [ %add200, %for.body ], [ %4, %entry ]
  %d11.0346 = phi double [ %add202, %for.body ], [ %5, %entry ]
  %d21.0345 = phi double [ %add204, %for.body ], [ %6, %entry ]
  %d31.0344 = phi double [ %add206, %for.body ], [ %7, %entry ]
  %d02.0343 = phi double [ %add208, %for.body ], [ %8, %entry ]
  %d12.0342 = phi double [ %add210, %for.body ], [ %9, %entry ]
  %d22.0341 = phi double [ %add212, %for.body ], [ %10, %entry ]
  %d32.0340 = phi double [ %add214, %for.body ], [ %11, %entry ]
  %d03.0339 = phi double [ %add216, %for.body ], [ %12, %entry ]
  %d13.0338 = phi double [ %add218, %for.body ], [ %13, %entry ]
  %d23.0337 = phi double [ %add220, %for.body ], [ %14, %entry ]
  %d33.0336 = phi double [ %add222, %for.body ], [ %15, %entry ]
  %d04.0335 = phi double [ %add224, %for.body ], [ %16, %entry ]
  %d14.0334 = phi double [ %add226, %for.body ], [ %17, %entry ]
  %d24.0333 = phi double [ %add228, %for.body ], [ %18, %entry ]
  %d34.0332 = phi double [ %add230, %for.body ], [ %19, %entry ]
  %d05.0331 = phi double [ %add232, %for.body ], [ %20, %entry ]
  %d15.0330 = phi double [ %add234, %for.body ], [ %21, %entry ]
  %d25.0329 = phi double [ %add236, %for.body ], [ %22, %entry ]
  %d35.0328 = phi double [ %add238, %for.body ], [ %23, %entry ]
  %d06.0327 = phi double [ %add240, %for.body ], [ %24, %entry ]
  %d16.0326 = phi double [ %add242, %for.body ], [ %25, %entry ]
  %d26.0325 = phi double [ %add244, %for.body ], [ %26, %entry ]
  %d36.0324 = phi double [ %add246, %for.body ], [ %27, %entry ]
  %d07.0323 = phi double [ %add248, %for.body ], [ %28, %entry ]
  %d17.0322 = phi double [ %add250, %for.body ], [ %29, %entry ]
  %d27.0321 = phi double [ %add252, %for.body ], [ %30, %entry ]
  %d37.0320 = phi double [ %add254, %for.body ], [ %31, %entry ]
  %32 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 0), align 16, !tbaa !3
  %33 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 1), align 4, !tbaa !3
  %34 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 2), align 8, !tbaa !3
  %35 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 3), align 4, !tbaa !3
  %36 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 4), align 16, !tbaa !3
  %37 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 5), align 4, !tbaa !3
  %38 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 6), align 8, !tbaa !3
  %39 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 7), align 4, !tbaa !3
  %40 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 8), align 16, !tbaa !3
  %41 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 9), align 4, !tbaa !3
  %42 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 10), align 8, !tbaa !3
  %43 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 11), align 4, !tbaa !3
  %44 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 12), align 16, !tbaa !3
  %45 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 13), align 4, !tbaa !3
  %46 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 14), align 8, !tbaa !3
  %47 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 15), align 4, !tbaa !3
  %48 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 16), align 16, !tbaa !3
  %49 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 17), align 4, !tbaa !3
  %50 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 18), align 8, !tbaa !3
  %51 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 19), align 4, !tbaa !3
  %52 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 20), align 16, !tbaa !3
  %53 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 21), align 4, !tbaa !3
  %54 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 22), align 8, !tbaa !3
  %55 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 23), align 4, !tbaa !3
  %56 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 24), align 16, !tbaa !3
  %57 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 25), align 4, !tbaa !3
  %58 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 26), align 8, !tbaa !3
  %59 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 27), align 4, !tbaa !3
  %60 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 28), align 16, !tbaa !3
  %61 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 29), align 4, !tbaa !3
  %62 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 30), align 8, !tbaa !3
  %63 = load volatile float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 31), align 4, !tbaa !3
  %64 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16, !tbaa !0
  %add = fadd double %d00.0351, %64
  %65 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8, !tbaa !0
  %add66 = fadd double %d10.0350, %65
  %66 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16, !tbaa !0
  %add68 = fadd double %d20.0349, %66
  %67 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8, !tbaa !0
  %add70 = fadd double %d30.0348, %67
  %68 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16, !tbaa !0
  %add72 = fadd double %d01.0347, %68
  %69 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8, !tbaa !0
  %add74 = fadd double %d11.0346, %69
  %70 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16, !tbaa !0
  %add76 = fadd double %d21.0345, %70
  %71 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8, !tbaa !0
  %add78 = fadd double %d31.0344, %71
  %72 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16, !tbaa !0
  %add80 = fadd double %d02.0343, %72
  %73 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8, !tbaa !0
  %add82 = fadd double %d12.0342, %73
  %74 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16, !tbaa !0
  %add84 = fadd double %d22.0341, %74
  %75 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8, !tbaa !0
  %add86 = fadd double %d32.0340, %75
  %76 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16, !tbaa !0
  %add88 = fadd double %d03.0339, %76
  %77 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8, !tbaa !0
  %add90 = fadd double %d13.0338, %77
  %78 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16, !tbaa !0
  %add92 = fadd double %d23.0337, %78
  %79 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8, !tbaa !0
  %add94 = fadd double %d33.0336, %79
  %80 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16, !tbaa !0
  %add96 = fadd double %d04.0335, %80
  %81 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8, !tbaa !0
  %add98 = fadd double %d14.0334, %81
  %82 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16, !tbaa !0
  %add100 = fadd double %d24.0333, %82
  %83 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8, !tbaa !0
  %add102 = fadd double %d34.0332, %83
  %84 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16, !tbaa !0
  %add104 = fadd double %d05.0331, %84
  %85 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8, !tbaa !0
  %add106 = fadd double %d15.0330, %85
  %86 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16, !tbaa !0
  %add108 = fadd double %d25.0329, %86
  %87 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8, !tbaa !0
  %add110 = fadd double %d35.0328, %87
  %88 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16, !tbaa !0
  %add112 = fadd double %d06.0327, %88
  %89 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8, !tbaa !0
  %add114 = fadd double %d16.0326, %89
  %90 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16, !tbaa !0
  %add116 = fadd double %d26.0325, %90
  %91 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8, !tbaa !0
  %add118 = fadd double %d36.0324, %91
  %92 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16, !tbaa !0
  %add120 = fadd double %d07.0323, %92
  %93 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8, !tbaa !0
  %add122 = fadd double %d17.0322, %93
  %94 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16, !tbaa !0
  %add124 = fadd double %d27.0321, %94
  %95 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8, !tbaa !0
  %add126 = fadd double %d37.0320, %95
  %96 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16, !tbaa !0
  %add128 = fadd double %add, %96
  %97 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8, !tbaa !0
  %add130 = fadd double %add66, %97
  %98 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16, !tbaa !0
  %add132 = fadd double %add68, %98
  %99 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8, !tbaa !0
  %add134 = fadd double %add70, %99
  %100 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16, !tbaa !0
  %add136 = fadd double %add72, %100
  %101 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8, !tbaa !0
  %add138 = fadd double %add74, %101
  %102 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16, !tbaa !0
  %add140 = fadd double %add76, %102
  %103 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8, !tbaa !0
  %add142 = fadd double %add78, %103
  %104 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16, !tbaa !0
  %add144 = fadd double %add80, %104
  %105 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8, !tbaa !0
  %add146 = fadd double %add82, %105
  %106 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16, !tbaa !0
  %add148 = fadd double %add84, %106
  %107 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8, !tbaa !0
  %add150 = fadd double %add86, %107
  %108 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16, !tbaa !0
  %add152 = fadd double %add88, %108
  %109 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8, !tbaa !0
  %add154 = fadd double %add90, %109
  %110 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16, !tbaa !0
  %add156 = fadd double %add92, %110
  %111 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8, !tbaa !0
  %add158 = fadd double %add94, %111
  %112 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16, !tbaa !0
  %add160 = fadd double %add96, %112
  %113 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8, !tbaa !0
  %add162 = fadd double %add98, %113
  %114 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16, !tbaa !0
  %add164 = fadd double %add100, %114
  %115 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8, !tbaa !0
  %add166 = fadd double %add102, %115
  %116 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16, !tbaa !0
  %add168 = fadd double %add104, %116
  %117 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8, !tbaa !0
  %add170 = fadd double %add106, %117
  %118 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16, !tbaa !0
  %add172 = fadd double %add108, %118
  %119 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8, !tbaa !0
  %add174 = fadd double %add110, %119
  %120 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16, !tbaa !0
  %add176 = fadd double %add112, %120
  %121 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8, !tbaa !0
  %add178 = fadd double %add114, %121
  %122 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16, !tbaa !0
  %add180 = fadd double %add116, %122
  %123 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8, !tbaa !0
  %add182 = fadd double %add118, %123
  %124 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16, !tbaa !0
  %add184 = fadd double %add120, %124
  %125 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8, !tbaa !0
  %add186 = fadd double %add122, %125
  %126 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16, !tbaa !0
  %add188 = fadd double %add124, %126
  %127 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8, !tbaa !0
  %add190 = fadd double %add126, %127
  %128 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16, !tbaa !0
  %add192 = fadd double %add128, %128
  %129 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8, !tbaa !0
  %add194 = fadd double %add130, %129
  %130 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16, !tbaa !0
  %add196 = fadd double %add132, %130
  %131 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8, !tbaa !0
  %add198 = fadd double %add134, %131
  %132 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16, !tbaa !0
  %add200 = fadd double %add136, %132
  %133 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8, !tbaa !0
  %add202 = fadd double %add138, %133
  %134 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16, !tbaa !0
  %add204 = fadd double %add140, %134
  %135 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8, !tbaa !0
  %add206 = fadd double %add142, %135
  %136 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16, !tbaa !0
  %add208 = fadd double %add144, %136
  %137 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8, !tbaa !0
  %add210 = fadd double %add146, %137
  %138 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16, !tbaa !0
  %add212 = fadd double %add148, %138
  %139 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8, !tbaa !0
  %add214 = fadd double %add150, %139
  %140 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16, !tbaa !0
  %add216 = fadd double %add152, %140
  %141 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8, !tbaa !0
  %add218 = fadd double %add154, %141
  %142 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16, !tbaa !0
  %add220 = fadd double %add156, %142
  %143 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8, !tbaa !0
  %add222 = fadd double %add158, %143
  %144 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16, !tbaa !0
  %add224 = fadd double %add160, %144
  %145 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8, !tbaa !0
  %add226 = fadd double %add162, %145
  %146 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16, !tbaa !0
  %add228 = fadd double %add164, %146
  %147 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8, !tbaa !0
  %add230 = fadd double %add166, %147
  %148 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16, !tbaa !0
  %add232 = fadd double %add168, %148
  %149 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8, !tbaa !0
  %add234 = fadd double %add170, %149
  %150 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16, !tbaa !0
  %add236 = fadd double %add172, %150
  %151 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8, !tbaa !0
  %add238 = fadd double %add174, %151
  %152 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16, !tbaa !0
  %add240 = fadd double %add176, %152
  %153 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8, !tbaa !0
  %add242 = fadd double %add178, %153
  %154 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16, !tbaa !0
  %add244 = fadd double %add180, %154
  %155 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8, !tbaa !0
  %add246 = fadd double %add182, %155
  %156 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16, !tbaa !0
  %add248 = fadd double %add184, %156
  %157 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8, !tbaa !0
  %add250 = fadd double %add186, %157
  %158 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16, !tbaa !0
  %add252 = fadd double %add188, %158
  %159 = load volatile double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8, !tbaa !0
  %add254 = fadd double %add190, %159
  store volatile float %32, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 0), align 16, !tbaa !3
  store volatile float %33, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 1), align 4, !tbaa !3
  store volatile float %34, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 2), align 8, !tbaa !3
  store volatile float %35, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 3), align 4, !tbaa !3
  store volatile float %36, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 4), align 16, !tbaa !3
  store volatile float %37, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 5), align 4, !tbaa !3
  store volatile float %38, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 6), align 8, !tbaa !3
  store volatile float %39, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 7), align 4, !tbaa !3
  store volatile float %40, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 8), align 16, !tbaa !3
  store volatile float %41, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 9), align 4, !tbaa !3
  store volatile float %42, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 10), align 8, !tbaa !3
  store volatile float %43, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 11), align 4, !tbaa !3
  store volatile float %44, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 12), align 16, !tbaa !3
  store volatile float %45, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 13), align 4, !tbaa !3
  store volatile float %46, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 14), align 8, !tbaa !3
  store volatile float %47, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 15), align 4, !tbaa !3
  store volatile float %48, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 16), align 16, !tbaa !3
  store volatile float %49, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 17), align 4, !tbaa !3
  store volatile float %50, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 18), align 8, !tbaa !3
  store volatile float %51, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 19), align 4, !tbaa !3
  store volatile float %52, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 20), align 16, !tbaa !3
  store volatile float %53, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 21), align 4, !tbaa !3
  store volatile float %54, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 22), align 8, !tbaa !3
  store volatile float %55, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 23), align 4, !tbaa !3
  store volatile float %56, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 24), align 16, !tbaa !3
  store volatile float %57, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 25), align 4, !tbaa !3
  store volatile float %58, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 26), align 8, !tbaa !3
  store volatile float %59, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 27), align 4, !tbaa !3
  store volatile float %60, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 28), align 16, !tbaa !3
  store volatile float %61, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 29), align 4, !tbaa !3
  store volatile float %62, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 30), align 8, !tbaa !3
  store volatile float %63, float* getelementptr inbounds ([32 x float]* @gf, i64 0, i64 31), align 4, !tbaa !3
  %inc = add nsw i32 %i.0352, 1
  %exitcond = icmp eq i32 %inc, %n
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %d00.0.lcssa = phi double [ %0, %entry ], [ %add192, %for.body ]
  %d10.0.lcssa = phi double [ %1, %entry ], [ %add194, %for.body ]
  %d20.0.lcssa = phi double [ %2, %entry ], [ %add196, %for.body ]
  %d30.0.lcssa = phi double [ %3, %entry ], [ %add198, %for.body ]
  %d01.0.lcssa = phi double [ %4, %entry ], [ %add200, %for.body ]
  %d11.0.lcssa = phi double [ %5, %entry ], [ %add202, %for.body ]
  %d21.0.lcssa = phi double [ %6, %entry ], [ %add204, %for.body ]
  %d31.0.lcssa = phi double [ %7, %entry ], [ %add206, %for.body ]
  %d02.0.lcssa = phi double [ %8, %entry ], [ %add208, %for.body ]
  %d12.0.lcssa = phi double [ %9, %entry ], [ %add210, %for.body ]
  %d22.0.lcssa = phi double [ %10, %entry ], [ %add212, %for.body ]
  %d32.0.lcssa = phi double [ %11, %entry ], [ %add214, %for.body ]
  %d03.0.lcssa = phi double [ %12, %entry ], [ %add216, %for.body ]
  %d13.0.lcssa = phi double [ %13, %entry ], [ %add218, %for.body ]
  %d23.0.lcssa = phi double [ %14, %entry ], [ %add220, %for.body ]
  %d33.0.lcssa = phi double [ %15, %entry ], [ %add222, %for.body ]
  %d04.0.lcssa = phi double [ %16, %entry ], [ %add224, %for.body ]
  %d14.0.lcssa = phi double [ %17, %entry ], [ %add226, %for.body ]
  %d24.0.lcssa = phi double [ %18, %entry ], [ %add228, %for.body ]
  %d34.0.lcssa = phi double [ %19, %entry ], [ %add230, %for.body ]
  %d05.0.lcssa = phi double [ %20, %entry ], [ %add232, %for.body ]
  %d15.0.lcssa = phi double [ %21, %entry ], [ %add234, %for.body ]
  %d25.0.lcssa = phi double [ %22, %entry ], [ %add236, %for.body ]
  %d35.0.lcssa = phi double [ %23, %entry ], [ %add238, %for.body ]
  %d06.0.lcssa = phi double [ %24, %entry ], [ %add240, %for.body ]
  %d16.0.lcssa = phi double [ %25, %entry ], [ %add242, %for.body ]
  %d26.0.lcssa = phi double [ %26, %entry ], [ %add244, %for.body ]
  %d36.0.lcssa = phi double [ %27, %entry ], [ %add246, %for.body ]
  %d07.0.lcssa = phi double [ %28, %entry ], [ %add248, %for.body ]
  %d17.0.lcssa = phi double [ %29, %entry ], [ %add250, %for.body ]
  %d27.0.lcssa = phi double [ %30, %entry ], [ %add252, %for.body ]
  %d37.0.lcssa = phi double [ %31, %entry ], [ %add254, %for.body ]
  store volatile double %d00.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 0), align 16, !tbaa !0
  store volatile double %d10.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 1), align 8, !tbaa !0
  store volatile double %d20.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 2), align 16, !tbaa !0
  store volatile double %d30.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 3), align 8, !tbaa !0
  store volatile double %d01.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 4), align 16, !tbaa !0
  store volatile double %d11.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 5), align 8, !tbaa !0
  store volatile double %d21.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 6), align 16, !tbaa !0
  store volatile double %d31.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 7), align 8, !tbaa !0
  store volatile double %d02.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 8), align 16, !tbaa !0
  store volatile double %d12.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 9), align 8, !tbaa !0
  store volatile double %d22.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 10), align 16, !tbaa !0
  store volatile double %d32.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 11), align 8, !tbaa !0
  store volatile double %d03.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 12), align 16, !tbaa !0
  store volatile double %d13.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 13), align 8, !tbaa !0
  store volatile double %d23.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 14), align 16, !tbaa !0
  store volatile double %d33.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 15), align 8, !tbaa !0
  store volatile double %d04.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 16), align 16, !tbaa !0
  store volatile double %d14.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 17), align 8, !tbaa !0
  store volatile double %d24.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 18), align 16, !tbaa !0
  store volatile double %d34.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 19), align 8, !tbaa !0
  store volatile double %d05.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 20), align 16, !tbaa !0
  store volatile double %d15.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 21), align 8, !tbaa !0
  store volatile double %d25.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 22), align 16, !tbaa !0
  store volatile double %d35.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 23), align 8, !tbaa !0
  store volatile double %d06.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 24), align 16, !tbaa !0
  store volatile double %d16.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 25), align 8, !tbaa !0
  store volatile double %d26.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 26), align 16, !tbaa !0
  store volatile double %d36.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 27), align 8, !tbaa !0
  store volatile double %d07.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 28), align 16, !tbaa !0
  store volatile double %d17.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 29), align 8, !tbaa !0
  store volatile double %d27.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 30), align 16, !tbaa !0
  store volatile double %d37.0.lcssa, double* getelementptr inbounds ([32 x double]* @gd, i64 0, i64 31), align 8, !tbaa !0
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.body ]
  %0 = trunc i64 %indvars.iv23 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds [32 x double]* @gd, i64 0, i64 %indvars.iv23
  store volatile double %conv, double* %arrayidx, align 8, !tbaa !0
  %conv1 = sitofp i32 %0 to float
  %arrayidx3 = getelementptr inbounds [32 x float]* @gf, i64 0, i64 %indvars.iv23
  store volatile float %conv1, float* %arrayidx3, align 4, !tbaa !3
  %indvars.iv.next24 = add i64 %indvars.iv23, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next24 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 32
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  tail call void @foo(i32 1)
  br label %for.cond4

for.cond4:                                        ; preds = %lor.lhs.false, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %lor.lhs.false ], [ 0, %for.end ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp5 = icmp slt i32 %1, 32
  br i1 %cmp5, label %for.body7, label %for.end20

for.body7:                                        ; preds = %for.cond4
  %arrayidx9 = getelementptr inbounds [32 x double]* @gd, i64 0, i64 %indvars.iv
  %2 = load volatile double* %arrayidx9, align 8, !tbaa !0
  %3 = shl nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv10 = sitofp i32 %4 to double
  %cmp11 = fcmp une double %2, %conv10
  br i1 %cmp11, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body7
  %arrayidx14 = getelementptr inbounds [32 x float]* @gf, i64 0, i64 %indvars.iv
  %5 = load volatile float* %arrayidx14, align 4, !tbaa !3
  %conv15 = sitofp i32 %1 to float
  %cmp16 = fcmp une float %5, %conv15
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp16, label %if.then, label %for.cond4

if.then:                                          ; preds = %lor.lhs.false, %for.body7
  tail call void @abort() noreturn nounwind
  unreachable

for.end20:                                        ; preds = %for.cond4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"double", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
