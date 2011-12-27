; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.block = type { i64, i64, %struct.symbol*, %struct.block*, i8, i32, [1 x %struct.symbol] }
%struct.blockvector = type { i32, [2 x %struct.block*] }
%struct.symbol = type { i32, i8* }
%struct.symtab = type { %struct.blockvector* }

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

define %struct.blockvector* @blockvector_for_pc_sect(i64 %pc, %struct.symtab* %symtab) nounwind uwtable {
entry:
  %retval = alloca %struct.blockvector*, align 8
  %pc.addr = alloca i64, align 8
  %symtab.addr = alloca %struct.symtab*, align 8
  %b = alloca %struct.block*, align 8
  %bot = alloca i32, align 4
  %top = alloca i32, align 4
  %half = alloca i32, align 4
  %bl = alloca %struct.blockvector*, align 8
  store i64 %pc, i64* %pc.addr, align 8
  store %struct.symtab* %symtab, %struct.symtab** %symtab.addr, align 8
  %tmp = load %struct.symtab** %symtab.addr, align 8
  %blockvector = getelementptr inbounds %struct.symtab* %tmp, i32 0, i32 0
  %tmp1 = load %struct.blockvector** %blockvector, align 8
  store %struct.blockvector* %tmp1, %struct.blockvector** %bl, align 8
  %tmp2 = load %struct.blockvector** %bl, align 8
  %block = getelementptr inbounds %struct.blockvector* %tmp2, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x %struct.block*]* %block, i32 0, i64 0
  %tmp3 = load %struct.block** %arrayidx, align 8
  store %struct.block* %tmp3, %struct.block** %b, align 8
  store i32 0, i32* %bot, align 4
  %tmp4 = load %struct.blockvector** %bl, align 8
  %nblocks = getelementptr inbounds %struct.blockvector* %tmp4, i32 0, i32 0
  %tmp5 = load i32* %nblocks, align 4
  store i32 %tmp5, i32* %top, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp6 = load i32* %top, align 4
  %tmp7 = load i32* %bot, align 4
  %sub = sub nsw i32 %tmp6, %tmp7
  %cmp = icmp sgt i32 %sub, 1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp8 = load i32* %top, align 4
  %tmp9 = load i32* %bot, align 4
  %sub10 = sub nsw i32 %tmp8, %tmp9
  %add = add nsw i32 %sub10, 1
  %shr = ashr i32 %add, 1
  store i32 %shr, i32* %half, align 4
  %tmp11 = load i32* %bot, align 4
  %tmp12 = load i32* %half, align 4
  %add13 = add nsw i32 %tmp11, %tmp12
  %idxprom = sext i32 %add13 to i64
  %tmp14 = load %struct.blockvector** %bl, align 8
  %block15 = getelementptr inbounds %struct.blockvector* %tmp14, i32 0, i32 1
  %arrayidx16 = getelementptr inbounds [2 x %struct.block*]* %block15, i32 0, i64 %idxprom
  %tmp17 = load %struct.block** %arrayidx16, align 8
  store %struct.block* %tmp17, %struct.block** %b, align 8
  %tmp18 = load %struct.block** %b, align 8
  %startaddr = getelementptr inbounds %struct.block* %tmp18, i32 0, i32 0
  %tmp19 = load i64* %startaddr, align 8
  %tmp20 = load i64* %pc.addr, align 8
  %cmp21 = icmp ule i64 %tmp19, %tmp20
  br i1 %cmp21, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %tmp22 = load i32* %half, align 4
  %tmp23 = load i32* %bot, align 4
  %add24 = add nsw i32 %tmp23, %tmp22
  store i32 %add24, i32* %bot, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %tmp25 = load i32* %bot, align 4
  %tmp26 = load i32* %half, align 4
  %add27 = add nsw i32 %tmp25, %tmp26
  store i32 %add27, i32* %top, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %while.cond28

while.cond28:                                     ; preds = %if.end44, %while.end
  %tmp29 = load i32* %bot, align 4
  %cmp30 = icmp sge i32 %tmp29, 0
  br i1 %cmp30, label %while.body31, label %while.end46

while.body31:                                     ; preds = %while.cond28
  %tmp32 = load i32* %bot, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load %struct.blockvector** %bl, align 8
  %block35 = getelementptr inbounds %struct.blockvector* %tmp34, i32 0, i32 1
  %arrayidx36 = getelementptr inbounds [2 x %struct.block*]* %block35, i32 0, i64 %idxprom33
  %tmp37 = load %struct.block** %arrayidx36, align 8
  store %struct.block* %tmp37, %struct.block** %b, align 8
  %tmp38 = load %struct.block** %b, align 8
  %endaddr = getelementptr inbounds %struct.block* %tmp38, i32 0, i32 1
  %tmp39 = load i64* %endaddr, align 8
  %tmp40 = load i64* %pc.addr, align 8
  %cmp41 = icmp ugt i64 %tmp39, %tmp40
  br i1 %cmp41, label %if.then42, label %if.end44

if.then42:                                        ; preds = %while.body31
  %tmp43 = load %struct.blockvector** %bl, align 8
  store %struct.blockvector* %tmp43, %struct.blockvector** %retval
  br label %return

if.end44:                                         ; preds = %while.body31
  %tmp45 = load i32* %bot, align 4
  %dec = add nsw i32 %tmp45, -1
  store i32 %dec, i32* %bot, align 4
  br label %while.cond28

while.end46:                                      ; preds = %while.cond28
  store %struct.blockvector* null, %struct.blockvector** %retval
  br label %return

return:                                           ; preds = %while.end46, %if.then42
  %0 = load %struct.blockvector** %retval
  ret %struct.blockvector* %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.block, align 8
  %b = alloca %struct.block, align 8
  %bv = alloca %struct.blockvector, align 8
  %s = alloca %struct.symtab, align 8
  %ret = alloca %struct.blockvector*, align 8
  store i32 0, i32* %retval
  %tmp = bitcast %struct.block* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 56, i32 8, i1 false)
  %0 = bitcast i8* %tmp to %struct.block*
  %1 = getelementptr %struct.block* %0, i32 0, i32 1
  store i64 65536, i64* %1
  %2 = getelementptr %struct.block* %0, i32 0, i32 4
  store i8 1, i8* %2
  %3 = getelementptr %struct.block* %0, i32 0, i32 5
  store i32 20, i32* %3
  %tmp2 = bitcast %struct.block* %b to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 56, i32 8, i1 false)
  %4 = bitcast i8* %tmp2 to %struct.block*
  %5 = getelementptr %struct.block* %4, i32 0, i32 0
  store i64 65536, i64* %5
  %6 = getelementptr %struct.block* %4, i32 0, i32 1
  store i64 131072, i64* %6
  %7 = getelementptr %struct.block* %4, i32 0, i32 4
  store i8 1, i8* %7
  %8 = getelementptr %struct.block* %4, i32 0, i32 5
  store i32 20, i32* %8
  %nblocks = getelementptr inbounds %struct.blockvector* %bv, i32 0, i32 0
  store i32 2, i32* %nblocks, align 4
  %block = getelementptr inbounds %struct.blockvector* %bv, i32 0, i32 1
  %.array = getelementptr inbounds [2 x %struct.block*]* %block, i32 0, i32 0
  store %struct.block* %a, %struct.block** %.array
  %.array4 = getelementptr inbounds [2 x %struct.block*]* %block, i32 0, i32 1
  store %struct.block* %b, %struct.block** %.array4
  %blockvector = getelementptr inbounds %struct.symtab* %s, i32 0, i32 0
  store %struct.blockvector* %bv, %struct.blockvector** %blockvector, align 8
  %call = call %struct.blockvector* @blockvector_for_pc_sect(i64 1280, %struct.symtab* %s)
  store %struct.blockvector* %call, %struct.blockvector** %ret, align 8
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
