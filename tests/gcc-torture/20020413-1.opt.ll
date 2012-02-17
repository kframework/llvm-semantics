; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020413-1.ll'
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

define void @test(x86_fp80 %val, i32* %eval) nounwind uwtable {
entry:
  %cmp = fcmp olt x86_fp80 %val, 0xK00000000000000000000
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = fsub x86_fp80 0xK80000000000000000000, %val
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp201 = phi x86_fp80 [ %sub, %if.then ], [ %val, %entry ]
  %cmp6 = fcmp ult x86_fp80 %tmp201, 0xK3FFF8000000000000000
  br i1 %cmp6, label %if.else, label %while.cond

while.cond:                                       ; preds = %if.end, %while.body
  %0 = phi i32 [ %inc, %while.body ], [ 0, %if.end ]
  %div3 = phi x86_fp80 [ %mul, %while.body ], [ 0xK3FFF8000000000000000, %if.end ]
  %cmp10 = fcmp olt x86_fp80 %div3, %tmp201
  br i1 %cmp10, label %while.body, label %if.end32

while.body:                                       ; preds = %while.cond
  %mul = fmul x86_fp80 %div3, 0xK40008000000000000000
  %inc = add nsw i32 %0, 1
  %cmp13 = icmp sgt i32 %0, 9
  br i1 %cmp13, label %if.then14, label %while.cond

if.then14:                                        ; preds = %while.body
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %if.end
  %cmp17 = fcmp une x86_fp80 %tmp201, 0xK00000000000000000000
  br i1 %cmp17, label %while.cond19, label %if.end32

while.cond19:                                     ; preds = %if.else, %while.body23
  %1 = phi i32 [ %inc26, %while.body23 ], [ 0, %if.else ]
  %div2 = phi x86_fp80 [ %div, %while.body23 ], [ 0xK3FFF8000000000000000, %if.else ]
  %cmp22 = fcmp olt x86_fp80 %tmp201, %div2
  br i1 %cmp22, label %while.body23, label %if.end32

while.body23:                                     ; preds = %while.cond19
  %div = fdiv x86_fp80 %div2, 0xK40008000000000000000
  %inc26 = add nsw i32 %1, 1
  %cmp27 = icmp sgt i32 %1, 9
  br i1 %cmp27, label %if.then28, label %while.cond19

if.then28:                                        ; preds = %while.body23
  tail call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %while.cond19, %while.cond, %if.else
  %tmp334 = phi i32 [ 0, %if.else ], [ %0, %while.cond ], [ %1, %while.cond19 ]
  store i32 %tmp334, i32* %eval, align 4
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end.i:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %if.end.i
  %div3.i = phi x86_fp80 [ %mul.i, %while.body.i ], [ 0xK3FFF8000000000000000, %if.end.i ]
  %cmp10.i = fcmp olt x86_fp80 %div3.i, 0xK4000C000000000000000
  br i1 %cmp10.i, label %while.body.i, label %while.cond.i6

while.body.i:                                     ; preds = %while.cond.i
  %mul.i = fmul x86_fp80 %div3.i, 0xK40008000000000000000
  br label %while.cond.i

while.cond.i6:                                    ; preds = %while.body.i10, %while.cond.i
  %div3.i4 = phi x86_fp80 [ %mul.i7, %while.body.i10 ], [ 0xK3FFF8000000000000000, %while.cond.i ]
  %cmp10.i5 = fcmp olt x86_fp80 %div3.i4, 0xK4000E000000000000000
  br i1 %cmp10.i5, label %while.body.i10, label %while.cond.i29

while.body.i10:                                   ; preds = %while.cond.i6
  %mul.i7 = fmul x86_fp80 %div3.i4, 0xK40008000000000000000
  br label %while.cond.i6

while.cond.i29:                                   ; preds = %while.body.i33, %while.cond.i6
  %div3.i27 = phi x86_fp80 [ %mul.i30, %while.body.i33 ], [ 0xK3FFF8000000000000000, %while.cond.i6 ]
  %cmp10.i28 = fcmp olt x86_fp80 %div3.i27, 0xK40018000000000000000
  br i1 %cmp10.i28, label %while.body.i33, label %while.cond.i52

while.body.i33:                                   ; preds = %while.cond.i29
  %mul.i30 = fmul x86_fp80 %div3.i27, 0xK40008000000000000000
  br label %while.cond.i29

while.cond.i52:                                   ; preds = %while.body.i56, %while.cond.i29
  %div3.i50 = phi x86_fp80 [ %mul.i53, %while.body.i56 ], [ 0xK3FFF8000000000000000, %while.cond.i29 ]
  %cmp10.i51 = fcmp olt x86_fp80 %div3.i50, 0xK4001A000000000000000
  br i1 %cmp10.i51, label %while.body.i56, label %test.exit69

while.body.i56:                                   ; preds = %while.cond.i52
  %mul.i53 = fmul x86_fp80 %div3.i50, 0xK40008000000000000000
  br label %while.cond.i52

test.exit69:                                      ; preds = %while.cond.i52
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
