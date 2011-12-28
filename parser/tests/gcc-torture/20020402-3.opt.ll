; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-3.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.block = type { i64, i64, %struct.symbol*, %struct.block*, i8, i32, [1 x %struct.symbol] }
%struct.blockvector = type { i32, [2 x %struct.block*] }
%struct.symbol = type { i32, i8* }
%struct.symtab = type { %struct.blockvector* }

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define %struct.blockvector* @blockvector_for_pc_sect(i64 %pc, %struct.symtab* nocapture %symtab) nounwind uwtable readonly {
entry:
  %blockvector = getelementptr inbounds %struct.symtab* %symtab, i64 0, i32 0
  %tmp1 = load %struct.blockvector** %blockvector, align 8
  %nblocks = getelementptr inbounds %struct.blockvector* %tmp1, i64 0, i32 0
  %tmp5 = load i32* %nblocks, align 4
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %while.body, %entry
  %add273.ph = phi i32 [ %tmp5, %entry ], [ %add13, %while.body ]
  %dec2.ph = phi i32 [ 0, %entry ], [ %dec2, %while.body ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.outer, %while.body
  %dec2 = phi i32 [ %add13, %while.body ], [ %dec2.ph, %while.cond.outer ]
  %sub = sub nsw i32 %add273.ph, %dec2
  %cmp = icmp sgt i32 %sub, 1
  br i1 %cmp, label %while.body, label %while.cond28.preheader

while.cond28.preheader:                           ; preds = %while.cond
  %tmp6 = zext i32 %dec2 to i64
  %tmp9 = sext i32 %dec2 to i64
  br label %while.cond28

while.body:                                       ; preds = %while.cond
  %add = add nsw i32 %sub, 1
  %shr = ashr i32 %add, 1
  %add13 = add nsw i32 %shr, %dec2
  %idxprom = sext i32 %add13 to i64
  %arrayidx16 = getelementptr inbounds %struct.blockvector* %tmp1, i64 0, i32 1, i64 %idxprom
  %tmp17 = load %struct.block** %arrayidx16, align 8
  %startaddr = getelementptr inbounds %struct.block* %tmp17, i64 0, i32 0
  %tmp19 = load i64* %startaddr, align 8
  %cmp21 = icmp ugt i64 %tmp19, %pc
  br i1 %cmp21, label %while.cond.outer, label %while.cond

while.cond28:                                     ; preds = %while.cond28.preheader, %if.end44
  %indvar = phi i64 [ 0, %while.cond28.preheader ], [ %indvar.next, %if.end44 ]
  %tmp7 = sub i64 %tmp6, %indvar
  %dec1 = trunc i64 %tmp7 to i32
  %cmp30 = icmp sgt i32 %dec1, -1
  br i1 %cmp30, label %while.body31, label %return

while.body31:                                     ; preds = %while.cond28
  %tmp10 = sub i64 %tmp9, %indvar
  %arrayidx36 = getelementptr %struct.blockvector* %tmp1, i64 0, i32 1, i64 %tmp10
  %tmp37 = load %struct.block** %arrayidx36, align 8
  %endaddr = getelementptr inbounds %struct.block* %tmp37, i64 0, i32 1
  %tmp39 = load i64* %endaddr, align 8
  %cmp41 = icmp ugt i64 %tmp39, %pc
  br i1 %cmp41, label %return, label %if.end44

if.end44:                                         ; preds = %while.body31
  %indvar.next = add i64 %indvar, 1
  br label %while.cond28

return:                                           ; preds = %while.body31, %while.cond28
  %storemerge = phi %struct.blockvector* [ null, %while.cond28 ], [ %tmp1, %while.body31 ]
  ret %struct.blockvector* %storemerge
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
