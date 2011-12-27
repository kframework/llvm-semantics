; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/930628-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define void @f(double* %x, double* %y) nounwind uwtable {
entry:
  %cmp = icmp eq double* %x, %y
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc87, %entry
  %indvar22 = phi i64 [ %indvar.next23, %for.inc87 ], [ 0, %entry ]
  %tmp76 = shl i64 %indvar22, 6
  %tmp7788 = or i64 %tmp76, 16
  %storemerge = trunc i64 %indvar22 to i32
  %cmp = icmp slt i32 %storemerge, 4
  br i1 %cmp, label %for.cond2, label %for.end90

for.cond2:                                        ; preds = %for.cond, %for.inc83
  %indvar19 = phi i64 [ %indvar.next20, %for.inc83 ], [ 0, %for.cond ]
  %tmp = add i64 %indvar22, %indvar19
  %storemerge1 = trunc i64 %tmp to i32
  %tmp75 = shl i64 %indvar19, 6
  %tmp78 = add i64 %tmp7788, %tmp75
  %cmp4 = icmp slt i32 %storemerge1, 4
  br i1 %cmp4, label %for.cond6.preheader, label %for.inc87

for.cond6.preheader:                              ; preds = %for.cond2
  %cmp16 = icmp eq i32 %storemerge1, %storemerge
  br label %for.cond6

for.cond6:                                        ; preds = %for.cond6.preheader, %for.inc79
  %indvar33 = phi i64 [ 0, %for.cond6.preheader ], [ %indvar.next34, %for.inc79 ]
  %tmp84 = shl i64 %indvar33, 5
  %tmp85 = add i64 %tmp7788, %tmp84
  %storemerge2 = trunc i64 %indvar33 to i32
  %cmp8 = icmp slt i32 %storemerge2, 2
  br i1 %cmp8, label %for.cond10, label %for.inc83

for.cond10:                                       ; preds = %for.cond6, %for.inc75
  %indvar16 = phi i64 [ %indvar.next17, %for.inc75 ], [ 0, %for.cond6 ]
  %tmp74 = shl i64 %indvar16, 5
  %tmp79 = add i64 %tmp78, %tmp74
  %storemerge3 = trunc i64 %indvar16 to i32
  %cmp12 = icmp slt i32 %storemerge3, 2
  br i1 %cmp12, label %for.body13, label %for.inc79

for.body13:                                       ; preds = %for.cond10
  %cmp19 = icmp eq i32 %storemerge2, %storemerge3
  %or.cond = and i1 %cmp16, %cmp19
  br i1 %or.cond, label %for.inc75, label %for.cond30

for.cond30:                                       ; preds = %for.body13, %for.inc59
  %indvar30 = phi i64 [ %indvar.next31, %for.inc59 ], [ 0, %for.body13 ]
  %tmp83 = shl i64 %indvar30, 4
  %arraydecay.offs10 = add i64 %tmp85, %tmp83
  %storemerge4 = trunc i64 %indvar30 to i32
  %cmp32 = icmp slt i32 %storemerge4, 1
  br i1 %cmp32, label %for.cond34, label %for.inc75

for.cond34:                                       ; preds = %for.cond30, %f.exit
  %indvar = phi i64 [ %indvar.next, %f.exit ], [ 0, %for.cond30 ]
  %storemerge5 = trunc i64 %indvar to i32
  %cmp36 = icmp slt i32 %storemerge5, 1
  br i1 %cmp36, label %for.body37, label %for.inc59

for.body37:                                       ; preds = %for.cond34
  %tmp73 = shl i64 %indvar, 4
  %arraydecay57.offs15 = add i64 %tmp79, %tmp73
  %cmp.i = icmp eq i64 %arraydecay.offs10, %arraydecay57.offs15
  br i1 %cmp.i, label %if.then.i, label %f.exit

if.then.i:                                        ; preds = %for.body37
  call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %for.body37
  %indvar.next = add i64 %indvar, 1
  br label %for.cond34

for.inc59:                                        ; preds = %for.cond34
  %indvar.next31 = add i64 %indvar30, 1
  br label %for.cond30

for.inc75:                                        ; preds = %for.cond30, %for.body13
  %indvar.next17 = add i64 %indvar16, 1
  br label %for.cond10

for.inc79:                                        ; preds = %for.cond10
  %indvar.next34 = add i64 %indvar33, 1
  br label %for.cond6

for.inc83:                                        ; preds = %for.cond6
  %indvar.next20 = add i64 %indvar19, 1
  br label %for.cond2

for.inc87:                                        ; preds = %for.cond2
  %indvar.next23 = add i64 %indvar22, 1
  br label %for.cond

for.end90:                                        ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
