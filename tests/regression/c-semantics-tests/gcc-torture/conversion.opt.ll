; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/conversion.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define float @u2f(i32 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %u to float
  ret float %conv
}

define double @u2d(i32 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %u to double
  ret double %conv
}

define x86_fp80 @u2ld(i32 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %u to x86_fp80
  ret x86_fp80 %conv
}

define float @s2f(i32 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %s to float
  ret float %conv
}

define double @s2d(i32 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %s to double
  ret double %conv
}

define x86_fp80 @s2ld(i32 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i32 %s to x86_fp80
  ret x86_fp80 %conv
}

define i32 @fnear(float %x, float %y) nounwind uwtable readnone {
entry:
  %sub = fsub float %x, %y
  %cmp = fcmp oeq float %sub, 0.000000e+00
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %div = fdiv float %x, %sub
  %cmp1 = fcmp ogt float %div, 1.000000e+06
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @dnear(double %x, double %y) nounwind uwtable readnone {
entry:
  %sub = fsub double %x, %y
  %cmp = fcmp oeq double %sub, 0.000000e+00
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %div = fdiv double %x, %sub
  %cmp1 = fcmp ogt double %div, 1.000000e+14
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define i32 @ldnear(x86_fp80 %x, x86_fp80 %y) nounwind uwtable readnone {
entry:
  %sub = fsub x86_fp80 %x, %y
  %cmp = fcmp oeq x86_fp80 %sub, 0xK00000000000000000000
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %div = fdiv x86_fp80 %x, %sub
  %cmp1 = fcmp ogt x86_fp80 %div, 0xK40699DC5ADA82B70B800
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

define void @test_integer_to_float() nounwind uwtable {
fnear.exit178:
  ret void
}

define float @ull2f(i64 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i64 %u to float
  ret float %conv
}

define double @ull2d(i64 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i64 %u to double
  ret double %conv
}

define x86_fp80 @ull2ld(i64 %u) nounwind uwtable readnone {
entry:
  %conv = uitofp i64 %u to x86_fp80
  ret x86_fp80 %conv
}

define float @sll2f(i64 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i64 %s to float
  ret float %conv
}

define double @sll2d(i64 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i64 %s to double
  ret double %conv
}

define x86_fp80 @sll2ld(i64 %s) nounwind uwtable readnone {
entry:
  %conv = sitofp i64 %s to x86_fp80
  ret x86_fp80 %conv
}

define void @test_longlong_integer_to_float() nounwind uwtable {
fnear.exit:
  ret void
}

define i32 @f2u(float %f) nounwind uwtable readnone {
entry:
  %conv = fptoui float %f to i32
  ret i32 %conv
}

define i32 @d2u(double %d) nounwind uwtable readnone {
entry:
  %conv = fptoui double %d to i32
  ret i32 %conv
}

define i32 @ld2u(x86_fp80 %d) nounwind uwtable readnone {
entry:
  %conv = fptoui x86_fp80 %d to i32
  ret i32 %conv
}

define i32 @f2s(float %f) nounwind uwtable readnone {
entry:
  %conv = fptosi float %f to i32
  ret i32 %conv
}

define i32 @d2s(double %d) nounwind uwtable readnone {
entry:
  %conv = fptosi double %d to i32
  ret i32 %conv
}

define i32 @ld2s(x86_fp80 %d) nounwind uwtable readnone {
entry:
  %conv = fptosi x86_fp80 %d to i32
  ret i32 %conv
}

define void @test_float_to_integer() nounwind uwtable {
if.end182:
  ret void
}

define i64 @f2ull(float %f) nounwind uwtable readnone {
entry:
  %conv = fptoui float %f to i64
  ret i64 %conv
}

define i64 @d2ull(double %d) nounwind uwtable readnone {
entry:
  %conv = fptoui double %d to i64
  ret i64 %conv
}

define i64 @ld2ull(x86_fp80 %d) nounwind uwtable readnone {
entry:
  %conv = fptoui x86_fp80 %d to i64
  ret i64 %conv
}

define i64 @f2sll(float %f) nounwind uwtable readnone {
entry:
  %conv = fptosi float %f to i64
  ret i64 %conv
}

define i64 @d2sll(double %d) nounwind uwtable readnone {
entry:
  %conv = fptosi double %d to i64
  ret i64 %conv
}

define i64 @ld2sll(x86_fp80 %d) nounwind uwtable readnone {
entry:
  %conv = fptosi x86_fp80 %d to i64
  ret i64 %conv
}

define void @test_float_to_longlong_integer() nounwind uwtable {
if.end172:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
