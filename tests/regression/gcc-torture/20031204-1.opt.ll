; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031204-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.addr = internal global [19 x i8] c"10.11.12.13:/hello\00", align 16

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

define i64 @in_aton(i8* nocapture %x) nounwind uwtable readnone {
entry:
  ret i64 168496141
}

define i64 @root_nfs_parse_addr(i8* %name) nounwind uwtable {
entry:
  br label %while.cond

while.cond:                                       ; preds = %if.end, %if.then37, %entry
  %tmp698 = phi i8* [ %name, %entry ], [ %incdec.ptr39, %if.then37 ], [ %incdec.ptr, %if.end ]
  %tmp433 = phi i32 [ 0, %entry ], [ %tmp432, %if.then37 ], [ %tmp432, %if.end ]
  %cmp = icmp slt i32 %tmp433, 4
  br i1 %cmp, label %while.cond2.preheader, label %while.end42

while.cond2.preheader:                            ; preds = %while.cond
  %tmp411 = load i8* %tmp698, align 1
  %tmp4.off12 = add i8 %tmp411, -48
  %0 = icmp ult i8 %tmp4.off12, 10
  br i1 %0, label %while.body12, label %while.end42

while.body12:                                     ; preds = %while.cond2.preheader, %while.body12
  %indvar = phi i64 [ %tmp, %while.body12 ], [ 0, %while.cond2.preheader ]
  %tmp = add i64 %indvar, 1
  %incdec.ptr = getelementptr i8* %tmp698, i64 %tmp
  %tmp4 = load i8* %incdec.ptr, align 1
  %tmp4.off = add i8 %tmp4, -48
  %1 = icmp ult i8 %tmp4.off, 10
  br i1 %1, label %while.body12, label %while.end

while.end:                                        ; preds = %while.body12
  %cmp16 = icmp eq i8* %incdec.ptr, %tmp698
  br i1 %cmp16, label %while.end42, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %incdec.ptr.offs = add i64 %indvar, 1
  %cmp20 = icmp sgt i64 %incdec.ptr.offs, 3
  br i1 %cmp20, label %while.end42, label %if.end

if.end:                                           ; preds = %lor.lhs.false
  %cmp25 = icmp eq i8 %tmp4, 46
  %cmp29 = icmp eq i32 %tmp433, 3
  %or.cond10 = or i1 %cmp25, %cmp29
  %inc = zext i1 %or.cond10 to i32
  %tmp432 = add nsw i32 %inc, %tmp433
  %cmp35 = icmp slt i32 %tmp432, 4
  br i1 %cmp35, label %if.then37, label %while.cond

if.then37:                                        ; preds = %if.end
  %incdec.ptr.sum = add i64 %indvar, 2
  %incdec.ptr39 = getelementptr inbounds i8* %tmp698, i64 %incdec.ptr.sum
  br label %while.cond

while.end42:                                      ; preds = %while.cond2.preheader, %while.end, %lor.lhs.false, %while.cond
  %tmp695 = phi i8* [ %incdec.ptr, %while.end ], [ %incdec.ptr, %lor.lhs.false ], [ %tmp698, %while.cond ], [ %tmp698, %while.cond2.preheader ]
  %cmp44 = icmp eq i32 %tmp433, 4
  br i1 %cmp44, label %land.lhs.true, label %if.end71

land.lhs.true:                                    ; preds = %while.end42
  %tmp47 = load i8* %tmp695, align 1
  switch i8 %tmp47, label %if.end71 [
    i8 58, label %if.then63
    i8 0, label %if.end66
  ]

if.then63:                                        ; preds = %land.lhs.true
  %incdec.ptr65 = getelementptr inbounds i8* %tmp695, i64 1
  store i8 0, i8* %tmp695, align 1
  br label %if.end66

if.end66:                                         ; preds = %land.lhs.true, %if.then63
  %tmp694 = phi i8* [ %incdec.ptr65, %if.then63 ], [ %tmp695, %land.lhs.true ]
  %call70 = tail call i8* @strcpy(i8* %name, i8* %tmp694) nounwind
  br label %if.end71

if.end71:                                         ; preds = %land.lhs.true, %while.end42, %if.end66
  %tmp721 = phi i64 [ 168496141, %if.end66 ], [ -1, %while.end42 ], [ -1, %land.lhs.true ]
  ret i64 %tmp721
}

declare i8* @strcpy(i8*, i8* nocapture) nounwind

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.then37.i, %if.end.i, %entry
  %tmp698.i = phi i8* [ getelementptr inbounds ([19 x i8]* @main.addr, i64 0, i64 0), %entry ], [ %incdec.ptr39.i, %if.then37.i ], [ %incdec.ptr.i, %if.end.i ]
  %tmp433.i = phi i32 [ 0, %entry ], [ %tmp432.i, %if.then37.i ], [ %tmp432.i, %if.end.i ]
  %cmp.i = icmp slt i32 %tmp433.i, 4
  br i1 %cmp.i, label %while.cond2.preheader.i, label %while.end42.i

while.cond2.preheader.i:                          ; preds = %while.cond.i
  %tmp411.i = load i8* %tmp698.i, align 1
  %tmp4.off12.i = add i8 %tmp411.i, -48
  %0 = icmp ult i8 %tmp4.off12.i, 10
  br i1 %0, label %while.body12.i, label %while.end42.i

while.body12.i:                                   ; preds = %while.cond2.preheader.i, %while.body12.i
  %1 = phi i64 [ %tmp.i, %while.body12.i ], [ 0, %while.cond2.preheader.i ]
  %tmp.i = add i64 %1, 1
  %incdec.ptr.i = getelementptr i8* %tmp698.i, i64 %tmp.i
  %tmp4.i = load i8* %incdec.ptr.i, align 1
  %tmp4.off.i = add i8 %tmp4.i, -48
  %2 = icmp ult i8 %tmp4.off.i, 10
  br i1 %2, label %while.body12.i, label %while.end.i

while.end.i:                                      ; preds = %while.body12.i
  %cmp16.i = icmp eq i8* %incdec.ptr.i, %tmp698.i
  %cmp20.i = icmp sgt i64 %tmp.i, 3
  %or.cond = or i1 %cmp16.i, %cmp20.i
  br i1 %or.cond, label %while.end42.i, label %if.end.i

if.end.i:                                         ; preds = %while.end.i
  %cmp25.i = icmp eq i8 %tmp4.i, 46
  %cmp29.i = icmp eq i32 %tmp433.i, 3
  %or.cond10.i = or i1 %cmp25.i, %cmp29.i
  %inc.i = zext i1 %or.cond10.i to i32
  %tmp432.i = add nsw i32 %inc.i, %tmp433.i
  %cmp35.i = icmp slt i32 %tmp432.i, 4
  br i1 %cmp35.i, label %if.then37.i, label %while.cond.i

if.then37.i:                                      ; preds = %if.end.i
  %incdec.ptr.sum.i = add i64 %1, 2
  %incdec.ptr39.i = getelementptr inbounds i8* %tmp698.i, i64 %incdec.ptr.sum.i
  br label %while.cond.i

while.end42.i:                                    ; preds = %while.end.i, %while.cond2.preheader.i, %while.cond.i
  %tmp695.i = phi i8* [ %incdec.ptr.i, %while.end.i ], [ %tmp698.i, %while.cond.i ], [ %tmp698.i, %while.cond2.preheader.i ]
  %cmp44.i = icmp eq i32 %tmp433.i, 4
  br i1 %cmp44.i, label %land.lhs.true.i, label %if.then

land.lhs.true.i:                                  ; preds = %while.end42.i
  %tmp47.i = load i8* %tmp695.i, align 1
  switch i8 %tmp47.i, label %if.then [
    i8 58, label %if.then63.i
    i8 0, label %if.end
  ]

if.then63.i:                                      ; preds = %land.lhs.true.i
  %incdec.ptr65.i = getelementptr inbounds i8* %tmp695.i, i64 1
  store i8 0, i8* %tmp695.i, align 1
  br label %if.end

if.then:                                          ; preds = %while.end42.i, %land.lhs.true.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then63.i, %land.lhs.true.i
  %tmp694.i = phi i8* [ %incdec.ptr65.i, %if.then63.i ], [ %tmp695.i, %land.lhs.true.i ]
  %call70.i = tail call i8* @strcpy(i8* getelementptr inbounds ([19 x i8]* @main.addr, i64 0, i64 0), i8* %tmp694.i) nounwind
  ret i32 0
}

declare void @abort() noreturn nounwind
