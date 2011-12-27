; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/duffsDevice.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: src=%d, dest=%d\0A\00", align 1

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %count = alloca i32, align 4
  %src = alloca i32*, align 8
  %dest = alloca i32*, align 8
  %origSrc = alloca i32*, align 8
  %origDest = alloca i32*, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %i77 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 101, i32* %count, align 4
  %tmp = load i32* %count, align 4
  %conv = sext i32 %tmp to i64
  %mul = mul i64 %conv, 4
  %call = call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call to i32*
  store i32* %0, i32** %src, align 8
  %tmp2 = load i32* %count, align 4
  %conv3 = sext i32 %tmp2 to i64
  %mul4 = mul i64 %conv3, 4
  %call5 = call noalias i8* @malloc(i64 %mul4) nounwind
  %1 = bitcast i8* %call5 to i32*
  store i32* %1, i32** %dest, align 8
  %tmp7 = load i32** %src, align 8
  store i32* %tmp7, i32** %origSrc, align 8
  %tmp9 = load i32** %dest, align 8
  store i32* %tmp9, i32** %origDest, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp11 = load i32* %i, align 4
  %tmp12 = load i32* %count, align 4
  %cmp = icmp slt i32 %tmp11, %tmp12
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp14 = load i32* %i, align 4
  %mul15 = mul nsw i32 %tmp14, 2
  %add = add nsw i32 %mul15, 1
  %tmp16 = load i32* %i, align 4
  %idxprom = sext i32 %tmp16 to i64
  %tmp17 = load i32** %src, align 8
  %arrayidx = getelementptr inbounds i32* %tmp17, i64 %idxprom
  store i32 %add, i32* %arrayidx
  %tmp18 = load i32* %i, align 4
  %idxprom19 = sext i32 %tmp18 to i64
  %tmp20 = load i32** %dest, align 8
  %arrayidx21 = getelementptr inbounds i32* %tmp20, i64 %idxprom19
  store i32 0, i32* %arrayidx21
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp22 = load i32* %i, align 4
  %inc = add nsw i32 %tmp22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp24 = load i32* %count, align 4
  %add25 = add nsw i32 %tmp24, 7
  %div = sdiv i32 %add25, 8
  store i32 %div, i32* %n, align 4
  %tmp26 = load i32* %count, align 4
  %rem = srem i32 %tmp26, 8
  switch i32 %rem, label %sw.epilog [
    i32 0, label %sw.bb
    i32 7, label %sw.bb31
    i32 6, label %sw.bb37
    i32 5, label %sw.bb43
    i32 4, label %sw.bb49
    i32 3, label %sw.bb55
    i32 2, label %sw.bb61
    i32 1, label %sw.bb67
  ]

sw.bb:                                            ; preds = %for.end
  br label %do.body

do.body:                                          ; preds = %do.cond, %sw.bb
  %tmp27 = load i32** %src, align 8
  %incdec.ptr = getelementptr inbounds i32* %tmp27, i32 1
  store i32* %incdec.ptr, i32** %src, align 8
  %tmp28 = load i32* %tmp27
  %tmp29 = load i32** %dest, align 8
  %incdec.ptr30 = getelementptr inbounds i32* %tmp29, i32 1
  store i32* %incdec.ptr30, i32** %dest, align 8
  store i32 %tmp28, i32* %tmp29
  br label %sw.bb31

sw.bb31:                                          ; preds = %for.end, %do.body
  %tmp32 = load i32** %src, align 8
  %incdec.ptr33 = getelementptr inbounds i32* %tmp32, i32 1
  store i32* %incdec.ptr33, i32** %src, align 8
  %tmp34 = load i32* %tmp32
  %tmp35 = load i32** %dest, align 8
  %incdec.ptr36 = getelementptr inbounds i32* %tmp35, i32 1
  store i32* %incdec.ptr36, i32** %dest, align 8
  store i32 %tmp34, i32* %tmp35
  br label %sw.bb37

sw.bb37:                                          ; preds = %for.end, %sw.bb31
  %tmp38 = load i32** %src, align 8
  %incdec.ptr39 = getelementptr inbounds i32* %tmp38, i32 1
  store i32* %incdec.ptr39, i32** %src, align 8
  %tmp40 = load i32* %tmp38
  %tmp41 = load i32** %dest, align 8
  %incdec.ptr42 = getelementptr inbounds i32* %tmp41, i32 1
  store i32* %incdec.ptr42, i32** %dest, align 8
  store i32 %tmp40, i32* %tmp41
  br label %sw.bb43

sw.bb43:                                          ; preds = %for.end, %sw.bb37
  %tmp44 = load i32** %src, align 8
  %incdec.ptr45 = getelementptr inbounds i32* %tmp44, i32 1
  store i32* %incdec.ptr45, i32** %src, align 8
  %tmp46 = load i32* %tmp44
  %tmp47 = load i32** %dest, align 8
  %incdec.ptr48 = getelementptr inbounds i32* %tmp47, i32 1
  store i32* %incdec.ptr48, i32** %dest, align 8
  store i32 %tmp46, i32* %tmp47
  br label %sw.bb49

sw.bb49:                                          ; preds = %for.end, %sw.bb43
  %tmp50 = load i32** %src, align 8
  %incdec.ptr51 = getelementptr inbounds i32* %tmp50, i32 1
  store i32* %incdec.ptr51, i32** %src, align 8
  %tmp52 = load i32* %tmp50
  %tmp53 = load i32** %dest, align 8
  %incdec.ptr54 = getelementptr inbounds i32* %tmp53, i32 1
  store i32* %incdec.ptr54, i32** %dest, align 8
  store i32 %tmp52, i32* %tmp53
  br label %sw.bb55

sw.bb55:                                          ; preds = %for.end, %sw.bb49
  %tmp56 = load i32** %src, align 8
  %incdec.ptr57 = getelementptr inbounds i32* %tmp56, i32 1
  store i32* %incdec.ptr57, i32** %src, align 8
  %tmp58 = load i32* %tmp56
  %tmp59 = load i32** %dest, align 8
  %incdec.ptr60 = getelementptr inbounds i32* %tmp59, i32 1
  store i32* %incdec.ptr60, i32** %dest, align 8
  store i32 %tmp58, i32* %tmp59
  br label %sw.bb61

sw.bb61:                                          ; preds = %for.end, %sw.bb55
  %tmp62 = load i32** %src, align 8
  %incdec.ptr63 = getelementptr inbounds i32* %tmp62, i32 1
  store i32* %incdec.ptr63, i32** %src, align 8
  %tmp64 = load i32* %tmp62
  %tmp65 = load i32** %dest, align 8
  %incdec.ptr66 = getelementptr inbounds i32* %tmp65, i32 1
  store i32* %incdec.ptr66, i32** %dest, align 8
  store i32 %tmp64, i32* %tmp65
  br label %sw.bb67

sw.bb67:                                          ; preds = %for.end, %sw.bb61
  %tmp68 = load i32** %src, align 8
  %incdec.ptr69 = getelementptr inbounds i32* %tmp68, i32 1
  store i32* %incdec.ptr69, i32** %src, align 8
  %tmp70 = load i32* %tmp68
  %tmp71 = load i32** %dest, align 8
  %incdec.ptr72 = getelementptr inbounds i32* %tmp71, i32 1
  store i32* %incdec.ptr72, i32** %dest, align 8
  store i32 %tmp70, i32* %tmp71
  br label %do.cond

do.cond:                                          ; preds = %sw.bb67
  %tmp73 = load i32* %n, align 4
  %dec = add nsw i32 %tmp73, -1
  store i32 %dec, i32* %n, align 4
  %cmp74 = icmp sgt i32 %dec, 0
  br i1 %cmp74, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %sw.epilog

sw.epilog:                                        ; preds = %do.end, %for.end
  store i32 0, i32* %i77, align 4
  br label %for.cond78

for.cond78:                                       ; preds = %for.inc96, %sw.epilog
  %tmp79 = load i32* %i77, align 4
  %tmp80 = load i32* %count, align 4
  %cmp81 = icmp slt i32 %tmp79, %tmp80
  br i1 %cmp81, label %for.body83, label %for.end99

for.body83:                                       ; preds = %for.cond78
  %tmp84 = load i32* %i77, align 4
  %tmp85 = load i32* %i77, align 4
  %idxprom86 = sext i32 %tmp85 to i64
  %tmp87 = load i32** %origSrc, align 8
  %arrayidx88 = getelementptr inbounds i32* %tmp87, i64 %idxprom86
  %tmp89 = load i32* %arrayidx88
  %tmp90 = load i32* %i77, align 4
  %idxprom91 = sext i32 %tmp90 to i64
  %tmp92 = load i32** %origDest, align 8
  %arrayidx93 = getelementptr inbounds i32* %tmp92, i64 %idxprom91
  %tmp94 = load i32* %arrayidx93
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %tmp84, i32 %tmp89, i32 %tmp94)
  br label %for.inc96

for.inc96:                                        ; preds = %for.body83
  %tmp97 = load i32* %i77, align 4
  %inc98 = add nsw i32 %tmp97, 1
  store i32 %inc98, i32* %i77, align 4
  br label %for.cond78

for.end99:                                        ; preds = %for.cond78
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8*, ...)
