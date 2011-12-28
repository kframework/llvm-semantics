; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011126-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"aab\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %out = alloca [4 x i8], align 1
  %arraydecay = getelementptr inbounds [4 x i8]* %out, i64 0, i64 0
  br label %while.body.outer.i.outer

while.body25.i.while.cond20.while.body.loopexit_crit_edge.i_crit_edge: ; preds = %while.body25.while.body25_crit_edge.i
  %scevgep = getelementptr i8* %incdec.ptr271.ph.i.ph, i64 %scevgep2223.i
  br label %while.cond20.while.body.loopexit_crit_edge.i

while.cond20.while.body.loopexit_crit_edge.i:     ; preds = %while.body25.i.while.cond20.while.body.loopexit_crit_edge.i_crit_edge, %while.body25.lr.ph.i
  %incdec.ptr27.i.lcssa = phi i8* [ %scevgep, %while.body25.i.while.cond20.while.body.loopexit_crit_edge.i_crit_edge ], [ %incdec.ptr27.i4, %while.body25.lr.ph.i ]
  %scevgep14.sum.i = add i64 %scevgep21.sum.i, %smax13.i
  %scevgep17.i = getelementptr i8* %incdec.ptr303.ph.i.ph, i64 %scevgep14.sum.i
  br label %while.body.outer.i.outer

while.body.outer.i.outer:                         ; preds = %while.cond20.while.body.loopexit_crit_edge.i, %entry
  %incdec.ptr303.ph.i.ph = phi i8* [ %arraydecay, %entry ], [ %scevgep17.i, %while.cond20.while.body.loopexit_crit_edge.i ]
  %incdec.ptr271.ph.i.ph = phi i8* [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr27.i.lcssa, %while.cond20.while.body.loopexit_crit_edge.i ]
  %incdec.ptr271.ph15.i = ptrtoint i8* %incdec.ptr271.ph.i.ph to i64
  %tmp1.i = load i8* %incdec.ptr271.ph.i.ph, align 1
  %cmp.i = icmp eq i8 %tmp1.i, 97
  br i1 %cmp.i, label %while.cond5.i, label %while.body.i

while.body.i:                                     ; preds = %while.body.outer.i.outer, %while.body.i
  br label %while.body.i

while.cond5.i:                                    ; preds = %while.body.outer.i.outer, %while.cond20.loopexit.i, %while.cond5.i
  %0 = phi i64 [ %tmp20, %while.cond5.i ], [ 0, %while.cond20.loopexit.i ], [ 0, %while.body.outer.i.outer ]
  %tmp20 = add i64 %0, 1
  %storemerge.i = getelementptr i8* %incdec.ptr271.ph.i.ph, i64 %tmp20
  %tmp7.i = load i8* %storemerge.i, align 1
  switch i8 %tmp7.i, label %while.cond20.loopexit.i [
    i8 120, label %while.cond5.i
    i8 98, label %test.exit
  ]

while.cond20.loopexit.i:                          ; preds = %while.cond5.i
  %tmp4.pn.i = getelementptr i8* %incdec.ptr271.ph.i.ph, i64 %0
  %cmp236.i = icmp ult i8* %incdec.ptr271.ph.i.ph, %storemerge.i
  br i1 %cmp236.i, label %while.body25.lr.ph.i, label %while.cond5.i

while.body25.lr.ph.i:                             ; preds = %while.cond20.loopexit.i
  %tmp12.i = icmp sgt i8* %incdec.ptr271.ph.i.ph, %tmp4.pn.i
  %smax.i = select i1 %tmp12.i, i8* %incdec.ptr271.ph.i.ph, i8* %tmp4.pn.i
  %smax13.i = ptrtoint i8* %smax.i to i64
  %scevgep21.sum.i = sub i64 1, %incdec.ptr271.ph15.i
  %scevgep22.i = getelementptr i8* %smax.i, i64 %scevgep21.sum.i
  %scevgep2223.i = ptrtoint i8* %scevgep22.i to i64
  %incdec.ptr27.i4 = getelementptr inbounds i8* %incdec.ptr271.ph.i.ph, i64 1
  store i8 %tmp1.i, i8* %incdec.ptr303.ph.i.ph, align 1
  %exitcond.i5 = icmp eq i8* %scevgep22.i, inttoptr (i64 1 to i8*)
  br i1 %exitcond.i5, label %while.cond20.while.body.loopexit_crit_edge.i, label %while.body25.while.body25_crit_edge.i.lr.ph

while.body25.while.body25_crit_edge.i.lr.ph:      ; preds = %while.body25.lr.ph.i
  %tmp = add i64 %scevgep2223.i, -1
  br label %while.body25.while.body25_crit_edge.i

while.body25.while.body25_crit_edge.i:            ; preds = %while.body25.while.body25_crit_edge.i.lr.ph, %while.body25.while.body25_crit_edge.i
  %indvar = phi i64 [ 0, %while.body25.while.body25_crit_edge.i.lr.ph ], [ %tmp13, %while.body25.while.body25_crit_edge.i ]
  %tmp13 = add i64 %indvar, 1
  %incdec.ptr3047.i = getelementptr i8* %incdec.ptr303.ph.i.ph, i64 %tmp13
  %incdec.ptr2728.phi.trans.insert.i = getelementptr i8* %incdec.ptr271.ph.i.ph, i64 %tmp13
  %tmp28.pre.i = load i8* %incdec.ptr2728.phi.trans.insert.i, align 1
  store i8 %tmp28.pre.i, i8* %incdec.ptr3047.i, align 1
  %exitcond = icmp eq i64 %tmp13, %tmp
  br i1 %exitcond, label %while.body25.i.while.cond20.while.body.loopexit_crit_edge.i_crit_edge, label %while.body25.while.body25_crit_edge.i

test.exit:                                        ; preds = %while.cond5.i
  ret i32 0
}
