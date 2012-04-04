; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20041011-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@gvol = common global [32 x i32] zeroinitializer, align 16
@gull = common global i64 0, align 8

define i64 @t1(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, -2048
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t2(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, -513
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t3(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, -512
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t4(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, -511
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t5(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, -1
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t6(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, 1
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t7(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, 511
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t8(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, 512
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t9(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* %x.addr, align 8
  %add = add i64 %tmp91, 513
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp92 = load i64* %x.addr, align 8
  ret i64 %tmp92
}

define i64 @t10(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* @gull, align 8
  %tmp92 = load i64* %x.addr, align 8
  %add = add i64 %tmp92, %tmp91
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp93 = load i64* %x.addr, align 8
  ret i64 %tmp93
}

define i64 @t11(i32 %n, i64 %x) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca i64, align 8
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %x3 = alloca i32, align 4
  %x4 = alloca i32, align 4
  %x5 = alloca i32, align 4
  %x6 = alloca i32, align 4
  %x7 = alloca i32, align 4
  %x8 = alloca i32, align 4
  %x9 = alloca i32, align 4
  %x10 = alloca i32, align 4
  %x11 = alloca i32, align 4
  %x12 = alloca i32, align 4
  %x13 = alloca i32, align 4
  %x14 = alloca i32, align 4
  %x15 = alloca i32, align 4
  %x16 = alloca i32, align 4
  %x17 = alloca i32, align 4
  %x18 = alloca i32, align 4
  %x19 = alloca i32, align 4
  %x20 = alloca i32, align 4
  %x21 = alloca i32, align 4
  %x22 = alloca i32, align 4
  %x23 = alloca i32, align 4
  %x24 = alloca i32, align 4
  %x25 = alloca i32, align 4
  %x26 = alloca i32, align 4
  %x27 = alloca i32, align 4
  %x28 = alloca i32, align 4
  %x29 = alloca i32, align 4
  %x30 = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i64 %x, i64* %x.addr, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp31 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  store i32 %tmp31, i32* %x1, align 4
  %tmp32 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  store i32 %tmp32, i32* %x2, align 4
  %tmp33 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  store i32 %tmp33, i32* %x3, align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  store i32 %tmp34, i32* %x4, align 4
  %tmp35 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  store i32 %tmp35, i32* %x5, align 4
  %tmp36 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  store i32 %tmp36, i32* %x6, align 4
  %tmp37 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  store i32 %tmp37, i32* %x7, align 4
  %tmp38 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  store i32 %tmp38, i32* %x8, align 4
  %tmp39 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  store i32 %tmp39, i32* %x9, align 4
  %tmp40 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  store i32 %tmp40, i32* %x10, align 4
  %tmp41 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  store i32 %tmp41, i32* %x11, align 4
  %tmp42 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  store i32 %tmp42, i32* %x12, align 4
  %tmp43 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  store i32 %tmp43, i32* %x13, align 4
  %tmp44 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  store i32 %tmp44, i32* %x14, align 4
  %tmp45 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  store i32 %tmp45, i32* %x15, align 4
  %tmp46 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  store i32 %tmp46, i32* %x16, align 4
  %tmp47 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  store i32 %tmp47, i32* %x17, align 4
  %tmp48 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  store i32 %tmp48, i32* %x18, align 4
  %tmp49 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  store i32 %tmp49, i32* %x19, align 4
  %tmp50 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  store i32 %tmp50, i32* %x20, align 4
  %tmp51 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  store i32 %tmp51, i32* %x21, align 4
  %tmp52 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  store i32 %tmp52, i32* %x22, align 4
  %tmp53 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  store i32 %tmp53, i32* %x23, align 4
  %tmp54 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  store i32 %tmp54, i32* %x24, align 4
  %tmp55 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  store i32 %tmp55, i32* %x25, align 4
  %tmp56 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  store i32 %tmp56, i32* %x26, align 4
  %tmp57 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  store i32 %tmp57, i32* %x27, align 4
  %tmp58 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  store i32 %tmp58, i32* %x28, align 4
  %tmp59 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  store i32 %tmp59, i32* %x29, align 4
  %tmp60 = volatile load i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  store i32 %tmp60, i32* %x30, align 4
  %tmp61 = load i32* %x1, align 4
  volatile store i32 %tmp61, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 1), align 4
  %tmp62 = load i32* %x2, align 4
  volatile store i32 %tmp62, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 2), align 4
  %tmp63 = load i32* %x3, align 4
  volatile store i32 %tmp63, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 3), align 4
  %tmp64 = load i32* %x4, align 4
  volatile store i32 %tmp64, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 4), align 4
  %tmp65 = load i32* %x5, align 4
  volatile store i32 %tmp65, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 5), align 4
  %tmp66 = load i32* %x6, align 4
  volatile store i32 %tmp66, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 6), align 4
  %tmp67 = load i32* %x7, align 4
  volatile store i32 %tmp67, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 7), align 4
  %tmp68 = load i32* %x8, align 4
  volatile store i32 %tmp68, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 8), align 4
  %tmp69 = load i32* %x9, align 4
  volatile store i32 %tmp69, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 9), align 4
  %tmp70 = load i32* %x10, align 4
  volatile store i32 %tmp70, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 10), align 4
  %tmp71 = load i32* %x11, align 4
  volatile store i32 %tmp71, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 11), align 4
  %tmp72 = load i32* %x12, align 4
  volatile store i32 %tmp72, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 12), align 4
  %tmp73 = load i32* %x13, align 4
  volatile store i32 %tmp73, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 13), align 4
  %tmp74 = load i32* %x14, align 4
  volatile store i32 %tmp74, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 14), align 4
  %tmp75 = load i32* %x15, align 4
  volatile store i32 %tmp75, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 15), align 4
  %tmp76 = load i32* %x16, align 4
  volatile store i32 %tmp76, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 16), align 4
  %tmp77 = load i32* %x17, align 4
  volatile store i32 %tmp77, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 17), align 4
  %tmp78 = load i32* %x18, align 4
  volatile store i32 %tmp78, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 18), align 4
  %tmp79 = load i32* %x19, align 4
  volatile store i32 %tmp79, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 19), align 4
  %tmp80 = load i32* %x20, align 4
  volatile store i32 %tmp80, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 20), align 4
  %tmp81 = load i32* %x21, align 4
  volatile store i32 %tmp81, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 21), align 4
  %tmp82 = load i32* %x22, align 4
  volatile store i32 %tmp82, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 22), align 4
  %tmp83 = load i32* %x23, align 4
  volatile store i32 %tmp83, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 23), align 4
  %tmp84 = load i32* %x24, align 4
  volatile store i32 %tmp84, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 24), align 4
  %tmp85 = load i32* %x25, align 4
  volatile store i32 %tmp85, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 25), align 4
  %tmp86 = load i32* %x26, align 4
  volatile store i32 %tmp86, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 26), align 4
  %tmp87 = load i32* %x27, align 4
  volatile store i32 %tmp87, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 27), align 4
  %tmp88 = load i32* %x28, align 4
  volatile store i32 %tmp88, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 28), align 4
  %tmp89 = load i32* %x29, align 4
  volatile store i32 %tmp89, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 29), align 4
  %tmp90 = load i32* %x30, align 4
  volatile store i32 %tmp90, i32* getelementptr inbounds ([32 x i32]* @gvol, i32 0, i64 30), align 4
  %tmp91 = load i64* @gull, align 8
  %sub = sub i64 0, %tmp91
  %tmp92 = load i64* %x.addr, align 8
  %add = add i64 %tmp92, %sub
  store i64 %add, i64* %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp93 = load i64* %x.addr, align 8
  ret i64 %tmp93
}

define i64 @neg(i64 %x) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %tmp = load i64* %x.addr, align 8
  %sub = sub i64 0, %tmp
  ret i64 %sub
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i64 100, i64* @gull, align 8
  %call = call i64 @t1(i32 3, i64 -1)
  %cmp = icmp ne i64 %call, -6145
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @t1(i32 3, i64 4294967295)
  %cmp2 = icmp ne i64 %call1, 4294961151
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i64 @t2(i32 3, i64 -1)
  %cmp6 = icmp ne i64 %call5, -1540
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 @t2(i32 3, i64 4294967295)
  %cmp10 = icmp ne i64 %call9, 4294965756
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @t3(i32 3, i64 -1)
  %cmp14 = icmp ne i64 %call13, -1537
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i64 @t3(i32 3, i64 4294967295)
  %cmp18 = icmp ne i64 %call17, 4294965759
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i64 @t4(i32 3, i64 -1)
  %cmp22 = icmp ne i64 %call21, -1534
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i64 @t4(i32 3, i64 4294967295)
  %cmp26 = icmp ne i64 %call25, 4294965762
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i64 @t5(i32 3, i64 -1)
  %cmp30 = icmp ne i64 %call29, -4
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i64 @t5(i32 3, i64 4294967295)
  %cmp34 = icmp ne i64 %call33, 4294967292
  br i1 %cmp34, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i64 @t6(i32 3, i64 -1)
  %cmp38 = icmp ne i64 %call37, 2
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i64 @t6(i32 3, i64 4294967295)
  %cmp42 = icmp ne i64 %call41, 4294967298
  br i1 %cmp42, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i64 @t7(i32 3, i64 -1)
  %cmp46 = icmp ne i64 %call45, 1532
  br i1 %cmp46, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i64 @t7(i32 3, i64 4294967295)
  %cmp50 = icmp ne i64 %call49, 4294968828
  br i1 %cmp50, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i64 @t8(i32 3, i64 -1)
  %cmp54 = icmp ne i64 %call53, 1535
  br i1 %cmp54, label %if.then55, label %if.end56

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i64 @t8(i32 3, i64 4294967295)
  %cmp58 = icmp ne i64 %call57, 4294968831
  br i1 %cmp58, label %if.then59, label %if.end60

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i64 @t9(i32 3, i64 -1)
  %cmp62 = icmp ne i64 %call61, 1538
  br i1 %cmp62, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i64 @t9(i32 3, i64 4294967295)
  %cmp66 = icmp ne i64 %call65, 4294968834
  br i1 %cmp66, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i64 @t10(i32 3, i64 -1)
  %tmp = load i64* @gull, align 8
  %mul = mul i64 %tmp, 3
  %sub = sub i64 %mul, 1
  %cmp70 = icmp ne i64 %call69, %sub
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i64 @t10(i32 3, i64 4294967295)
  %tmp74 = load i64* @gull, align 8
  %mul75 = mul i64 %tmp74, 3
  %add = add i64 %mul75, 4294967295
  %cmp76 = icmp ne i64 %call73, %add
  br i1 %cmp76, label %if.then77, label %if.end78

if.then77:                                        ; preds = %if.end72
  call void @abort() noreturn
  unreachable

if.end78:                                         ; preds = %if.end72
  %call79 = call i64 @t11(i32 3, i64 -1)
  %tmp80 = load i64* @gull, align 8
  %sub81 = sub i64 0, %tmp80
  %mul82 = mul i64 %sub81, 3
  %sub83 = sub i64 %mul82, 1
  %cmp84 = icmp ne i64 %call79, %sub83
  br i1 %cmp84, label %if.then85, label %if.end86

if.then85:                                        ; preds = %if.end78
  call void @abort() noreturn
  unreachable

if.end86:                                         ; preds = %if.end78
  %call87 = call i64 @t11(i32 3, i64 4294967295)
  %tmp88 = load i64* @gull, align 8
  %sub89 = sub i64 0, %tmp88
  %mul90 = mul i64 %sub89, 3
  %add91 = add i64 %mul90, 4294967295
  %cmp92 = icmp ne i64 %call87, %add91
  br i1 %cmp92, label %if.then93, label %if.end94

if.then93:                                        ; preds = %if.end86
  call void @abort() noreturn
  unreachable

if.end94:                                         ; preds = %if.end86
  %tmp95 = load i64* @gull, align 8
  %call96 = call i64 @neg(i64 %tmp95)
  %cmp97 = icmp ne i64 %call96, -100
  br i1 %cmp97, label %if.then98, label %if.end99

if.then98:                                        ; preds = %if.end94
  call void @abort() noreturn
  unreachable

if.end99:                                         ; preds = %if.end94
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
