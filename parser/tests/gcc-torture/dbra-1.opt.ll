; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/dbra-1.ll'
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

define i32 @f1(i64 %a) nounwind uwtable readnone {
entry:
  %tmp3 = icmp ult i64 %a, 10
  %0 = trunc i64 %a to i32
  %tmp5 = select i1 %tmp3, i32 %0, i32 10
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp eq i64 %indvar, %a
  br i1 %cmp2, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %tmp5, %for.body ]
  ret i32 %storemerge1
}

define i32 @f2(i64 %a) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp eq i64 %indvar, %a
  br i1 %cmp2, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %storemerge, %for.body ]
  ret i32 %storemerge1
}

define i32 @f3(i64 %a) nounwind uwtable readnone {
entry:
  %tmp = sub i64 0, %a
  %tmp3 = icmp ugt i64 %tmp, -11
  %tmp.op = add i64 %a, 4294967295
  %0 = trunc i64 %tmp.op to i32
  %tmp5 = select i1 %tmp3, i32 %0, i32 10
  %tmp7 = add i64 %a, -1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp eq i64 %tmp7, %indvar
  br i1 %cmp2, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %tmp5, %for.body ]
  ret i32 %storemerge1
}

define i32 @f4(i64 %a) nounwind uwtable readnone {
entry:
  %phitmp = add i64 %a, -1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %dec2 = phi i64 [ %phitmp, %entry ], [ -1, %for.inc ]
  %0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp eq i64 %dec2, 0
  br i1 %cmp2, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %0, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %0, %for.body ]
  ret i32 %storemerge1
}

define i32 @f5(i64 %a) nounwind uwtable readnone {
entry:
  %tmp = icmp ugt i64 %a, -11
  %a.op = xor i64 %a, 4294967295
  %0 = trunc i64 %a.op to i32
  %tmp4 = select i1 %tmp, i32 %0, i32 10
  %tmp5 = add i64 %a, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %inc = sub i64 0, %indvar
  %cmp2 = icmp eq i64 %tmp5, %inc
  br i1 %cmp2, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %tmp4, %for.body ]
  ret i32 %storemerge1
}

define i32 @f6(i64 %a) nounwind uwtable readnone {
entry:
  %phitmp = add i64 %a, 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %inc2 = phi i64 [ %phitmp, %entry ], [ 1, %for.inc ]
  %0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc ]
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %cmp2 = icmp eq i64 %inc2, 0
  br i1 %cmp2, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %inc5 = add nsw i32 %0, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ -1, %for.cond ], [ %0, %for.body ]
  ret i32 %storemerge1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %0 = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %entry ]
  %storemerge.i = trunc i64 %0 to i32
  %cmp.i = icmp slt i32 %storemerge.i, 10
  br i1 %cmp.i, label %for.body.i, label %if.then

for.body.i:                                       ; preds = %for.cond.i
  %cmp2.i = icmp eq i64 %0, 5
  br i1 %cmp2.i, label %for.cond.i53, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i64 %0, 1
  br label %for.cond.i

if.then:                                          ; preds = %for.cond.i
  tail call void @abort() noreturn nounwind
  unreachable

for.cond.i53:                                     ; preds = %for.body.i, %for.inc.i57
  %1 = phi i64 [ %indvar.next.i56, %for.inc.i57 ], [ 0, %for.body.i ]
  %storemerge.i51 = trunc i64 %1 to i32
  %cmp.i52 = icmp slt i32 %storemerge.i51, 10
  br i1 %cmp.i52, label %for.body.i55, label %if.then7

for.body.i55:                                     ; preds = %for.cond.i53
  %cmp2.i54 = icmp eq i64 %1, 0
  br i1 %cmp2.i54, label %for.inc.i57, label %for.cond.i44

for.inc.i57:                                      ; preds = %for.body.i55
  %indvar.next.i56 = add i64 %1, 1
  br label %for.cond.i53

if.then7:                                         ; preds = %for.cond.i53
  tail call void @abort() noreturn nounwind
  unreachable

for.cond.i44:                                     ; preds = %for.body.i55, %for.inc.i48
  %2 = phi i64 [ %indvar.next.i47, %for.inc.i48 ], [ 0, %for.body.i55 ]
  %storemerge.i42 = trunc i64 %2 to i32
  %cmp.i43 = icmp slt i32 %storemerge.i42, 10
  br i1 %cmp.i43, label %for.body.i46, label %if.then11

for.body.i46:                                     ; preds = %for.cond.i44
  %cmp2.i45 = icmp eq i64 %2, 4
  br i1 %cmp2.i45, label %for.body.i36, label %for.inc.i48

for.inc.i48:                                      ; preds = %for.body.i46
  %indvar.next.i47 = add i64 %2, 1
  br label %for.cond.i44

if.then11:                                        ; preds = %for.cond.i44
  tail call void @abort() noreturn nounwind
  unreachable

for.body.i36:                                     ; preds = %for.body.i36, %for.body.i46
  %dec2.i32 = phi i1 [ true, %for.body.i46 ], [ false, %for.body.i36 ]
  br i1 %dec2.i32, label %for.body.i36, label %for.cond.i19

for.cond.i19:                                     ; preds = %for.body.i36, %for.inc.i23
  %indvar.i16 = phi i64 [ %indvar.next.i22, %for.inc.i23 ], [ 0, %for.body.i36 ]
  %storemerge.i17 = trunc i64 %indvar.i16 to i32
  %cmp.i18 = icmp slt i32 %storemerge.i17, 10
  br i1 %cmp.i18, label %for.body.i21, label %if.then23

for.body.i21:                                     ; preds = %for.cond.i19
  %inc.i = sub i64 0, %indvar.i16
  %cmp2.i20 = icmp eq i64 %inc.i, -4
  br i1 %cmp2.i20, label %for.body.i11, label %for.inc.i23

for.inc.i23:                                      ; preds = %for.body.i21
  %indvar.next.i22 = add i64 %indvar.i16, 1
  br label %for.cond.i19

if.then23:                                        ; preds = %for.cond.i19
  tail call void @abort() noreturn nounwind
  unreachable

for.body.i11:                                     ; preds = %for.body.i11, %for.body.i21
  %inc2.i7 = phi i1 [ true, %for.body.i21 ], [ false, %for.body.i11 ]
  br i1 %inc2.i7, label %for.body.i11, label %if.end32

if.end32:                                         ; preds = %for.body.i11
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
