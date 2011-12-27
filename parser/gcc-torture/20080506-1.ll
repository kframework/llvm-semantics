; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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
  %u = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* %i, align 4
  %tmp = load i32* %i, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %i, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ 0, %cond.false ]
  %cmp2 = icmp ugt i32 %cond, 1
  br i1 %cmp2, label %cond.true3, label %cond.false11

cond.true3:                                       ; preds = %cond.end
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp sgt i32 %tmp4, 0
  br i1 %cmp5, label %cond.true6, label %cond.false8

cond.true6:                                       ; preds = %cond.true3
  %tmp7 = load i32* %i, align 4
  br label %cond.end9

cond.false8:                                      ; preds = %cond.true3
  br label %cond.end9

cond.end9:                                        ; preds = %cond.false8, %cond.true6
  %cond10 = phi i32 [ %tmp7, %cond.true6 ], [ 0, %cond.false8 ]
  br label %cond.end12

cond.false11:                                     ; preds = %cond.end
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.end9
  %cond13 = phi i32 [ %cond10, %cond.end9 ], [ 1, %cond.false11 ]
  store i32 %cond13, i32* %u, align 4
  %tmp14 = load i32* %u, align 4
  %cmp15 = icmp ne i32 %tmp14, 1
  br i1 %cmp15, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end12
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end12
  %tmp16 = load i32* %i, align 4
  %cmp17 = icmp sgt i32 %tmp16, 0
  br i1 %cmp17, label %cond.true18, label %cond.false20

cond.true18:                                      ; preds = %if.end
  %tmp19 = load i32* %i, align 4
  br label %cond.end21

cond.false20:                                     ; preds = %if.end
  br label %cond.end21

cond.end21:                                       ; preds = %cond.false20, %cond.true18
  %cond22 = phi i32 [ %tmp19, %cond.true18 ], [ 0, %cond.false20 ]
  %tmp23 = load i32* %i, align 4
  %cmp24 = icmp ult i32 %cond22, %tmp23
  br i1 %cmp24, label %cond.true25, label %cond.false33

cond.true25:                                      ; preds = %cond.end21
  %tmp26 = load i32* %i, align 4
  %cmp27 = icmp sgt i32 %tmp26, 0
  br i1 %cmp27, label %cond.true28, label %cond.false30

cond.true28:                                      ; preds = %cond.true25
  %tmp29 = load i32* %i, align 4
  br label %cond.end31

cond.false30:                                     ; preds = %cond.true25
  br label %cond.end31

cond.end31:                                       ; preds = %cond.false30, %cond.true28
  %cond32 = phi i32 [ %tmp29, %cond.true28 ], [ 0, %cond.false30 ]
  br label %cond.end35

cond.false33:                                     ; preds = %cond.end21
  %tmp34 = load i32* %i, align 4
  br label %cond.end35

cond.end35:                                       ; preds = %cond.false33, %cond.end31
  %cond36 = phi i32 [ %cond32, %cond.end31 ], [ %tmp34, %cond.false33 ]
  store i32 %cond36, i32* %u, align 4
  %tmp37 = load i32* %u, align 4
  %cmp38 = icmp ne i32 %tmp37, 0
  br i1 %cmp38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %cond.end35
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %cond.end35
  ret i32 0
}

declare void @abort() noreturn nounwind
