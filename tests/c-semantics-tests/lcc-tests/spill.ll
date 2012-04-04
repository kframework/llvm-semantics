; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/spill.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [10 x double] zeroinitializer, align 16
@b = common global [10 x double] zeroinitializer, align 16
@k = common global i32 0, align 4
@m = common global i32 0, align 4
@A = common global double* null, align 8
@j = common global i32 0, align 4
@n = common global i32 0, align 4
@B = common global double* null, align 8
@x = common global double 0.000000e+00, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  ret i32 0
}

define i32 @f() nounwind uwtable {
entry:
  %call = call i32 @f()
  %call1 = call i32 @f()
  %add = add nsw i32 %call, %call1
  ret i32 %add
}

define void @f2(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %call = call i32 @f()
  %0 = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call1 = call i32 @f()
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call1, %cond.true ], [ 1, %cond.false ]
  %add = add nsw i32 %call, %cond
  store i32 %add, i32* %i.addr, align 4
  ret void
}

define void @f3(i32 %i, i32* %p) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %p.addr = alloca i32*, align 8
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %r3 = alloca i32, align 4
  %r4 = alloca i32, align 4
  %r5 = alloca i32, align 4
  %r6 = alloca i32, align 4
  %r7 = alloca i32, align 4
  %r8 = alloca i32, align 4
  %r9 = alloca i32, align 4
  %r10 = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32* %p, i32** %p.addr, align 8
  store i32 0, i32* %r1, align 4
  store i32 0, i32* %r2, align 4
  store i32 0, i32* %r3, align 4
  store i32 0, i32* %r4, align 4
  store i32 0, i32* %r5, align 4
  store i32 0, i32* %r6, align 4
  store i32 0, i32* %r7, align 4
  store i32 0, i32* %r8, align 4
  store i32 0, i32* %r9, align 4
  store i32 0, i32* %r10, align 4
  %0 = load i32* %i.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %call = call i32 @f()
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 0, %cond.false ]
  %1 = load i32** %p.addr, align 8
  %incdec.ptr = getelementptr inbounds i32* %1, i32 1
  store i32* %incdec.ptr, i32** %p.addr, align 8
  store i32 %cond, i32* %1, align 4
  ret void
}

define void @f4() nounwind uwtable {
entry:
  %r6 = alloca i32, align 4
  %r7 = alloca i32, align 4
  %r8 = alloca i32, align 4
  %r9 = alloca i32, align 4
  %r10 = alloca i32, align 4
  %r11 = alloca i32, align 4
  store i32 0, i32* %r6, align 4
  store i32 0, i32* %r7, align 4
  store i32 0, i32* %r8, align 4
  store i32 0, i32* %r9, align 4
  store i32 0, i32* %r10, align 4
  store i32 0, i32* %r11, align 4
  %0 = load i32* @i, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [10 x double]* @a, i32 0, i64 %idxprom
  %1 = load double* %arrayidx, align 8
  %2 = load i32* @i, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [10 x double]* @b, i32 0, i64 %idxprom1
  %3 = load double* %arrayidx2, align 8
  %add = fadd double %1, %3
  %tobool = fcmp une double %add, 0.000000e+00
  br i1 %tobool, label %land.lhs.true, label %land.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i32* @i, align 4
  %tobool3 = icmp ne i32 %4, 0
  br i1 %tobool3, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %land.lhs.true
  %5 = load i32* @i, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [10 x double]* @a, i32 0, i64 %idxprom4
  %6 = load double* %arrayidx5, align 8
  %7 = load i32* @i, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [10 x double]* @b, i32 0, i64 %idxprom6
  %8 = load double* %arrayidx7, align 8
  %sub = fsub double %6, %8
  %tobool8 = fcmp une double %sub, 0.000000e+00
  br label %land.end

land.end:                                         ; preds = %land.rhs, %land.lhs.true, %entry
  %9 = phi i1 [ false, %land.lhs.true ], [ false, %entry ], [ %tobool8, %land.rhs ]
  %land.ext = zext i1 %9 to i32
  store i32 %land.ext, i32* @i, align 4
  ret void
}

define void @f5() nounwind uwtable {
entry:
  %0 = load i32* @k, align 4
  %1 = load i32* @m, align 4
  %mul = mul nsw i32 %0, %1
  %idxprom = sext i32 %mul to i64
  %2 = load double** @A, align 8
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %3 = load double* %arrayidx, align 8
  %4 = load i32* @j, align 4
  %5 = load i32* @m, align 4
  %mul1 = mul nsw i32 %4, %5
  %idxprom2 = sext i32 %mul1 to i64
  %6 = load double** @A, align 8
  %arrayidx3 = getelementptr inbounds double* %6, i64 %idxprom2
  %7 = load double* %arrayidx3, align 8
  %mul4 = fmul double %3, %7
  %8 = load i32* @k, align 4
  %9 = load i32* @n, align 4
  %mul5 = mul nsw i32 %8, %9
  %idxprom6 = sext i32 %mul5 to i64
  %10 = load double** @B, align 8
  %arrayidx7 = getelementptr inbounds double* %10, i64 %idxprom6
  %11 = load double* %arrayidx7, align 8
  %12 = load i32* @j, align 4
  %13 = load i32* @n, align 4
  %mul8 = mul nsw i32 %12, %13
  %idxprom9 = sext i32 %mul8 to i64
  %14 = load double** @B, align 8
  %arrayidx10 = getelementptr inbounds double* %14, i64 %idxprom9
  %15 = load double* %arrayidx10, align 8
  %mul11 = fmul double %11, %15
  %add = fadd double %mul4, %mul11
  store double %add, double* @x, align 8
  %16 = load i32* @k, align 4
  %17 = load i32* @m, align 4
  %mul12 = mul nsw i32 %16, %17
  %idxprom13 = sext i32 %mul12 to i64
  %18 = load double** @A, align 8
  %arrayidx14 = getelementptr inbounds double* %18, i64 %idxprom13
  %19 = load double* %arrayidx14, align 8
  %20 = load i32* @j, align 4
  %21 = load i32* @n, align 4
  %mul15 = mul nsw i32 %20, %21
  %idxprom16 = sext i32 %mul15 to i64
  %22 = load double** @B, align 8
  %arrayidx17 = getelementptr inbounds double* %22, i64 %idxprom16
  %23 = load double* %arrayidx17, align 8
  %mul18 = fmul double %19, %23
  %24 = load i32* @k, align 4
  %25 = load i32* @n, align 4
  %mul19 = mul nsw i32 %24, %25
  %idxprom20 = sext i32 %mul19 to i64
  %26 = load double** @B, align 8
  %arrayidx21 = getelementptr inbounds double* %26, i64 %idxprom20
  %27 = load double* %arrayidx21, align 8
  %28 = load i32* @j, align 4
  %29 = load i32* @m, align 4
  %mul22 = mul nsw i32 %28, %29
  %idxprom23 = sext i32 %mul22 to i64
  %30 = load double** @A, align 8
  %arrayidx24 = getelementptr inbounds double* %30, i64 %idxprom23
  %31 = load double* %arrayidx24, align 8
  %mul25 = fmul double %27, %31
  %sub = fsub double %mul18, %mul25
  store double %sub, double* @x, align 8
  ret void
}
