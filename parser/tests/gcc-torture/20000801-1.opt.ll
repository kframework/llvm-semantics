; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000801-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i8* %bp, i32 %n) nounwind uwtable {
entry:
  %idx.ext = zext i32 %n to i64
  %add.ptr = getelementptr inbounds i8* %bp, i64 %idx.ext
  %cmp2 = icmp eq i32 %n, 0
  br i1 %cmp2, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %tmp = shl i64 %indvar, 2
  %add.ptr2513 = getelementptr i8* %bp, i64 %tmp
  %tmp48 = or i64 %tmp, 3
  %add.ptr6 = getelementptr i8* %bp, i64 %tmp48
  %tmp59 = or i64 %tmp, 1
  %incdec.ptr = getelementptr i8* %bp, i64 %tmp59
  %tmp610 = or i64 %tmp, 2
  %add.ptr15 = getelementptr i8* %bp, i64 %tmp610
  %tmp7 = add i64 %tmp, 4
  %add.ptr25 = getelementptr i8* %bp, i64 %tmp7
  %tmp8 = load i8* %add.ptr6, align 1
  %tmp10 = load i8* %add.ptr2513, align 1
  store i8 %tmp10, i8* %add.ptr6, align 1
  store i8 %tmp8, i8* %add.ptr2513, align 1
  %tmp17 = load i8* %add.ptr15, align 1
  %tmp19 = load i8* %incdec.ptr, align 1
  store i8 %tmp19, i8* %add.ptr15, align 1
  store i8 %tmp17, i8* %incdec.ptr, align 1
  %cmp = icmp ult i8* %add.ptr25, %add.ptr
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %one = alloca i32, align 4
  store i32 1, i32* %one, align 4
  %add.ptr.i = getelementptr inbounds i32* %one, i64 1
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %indvar.i = phi i64 [ %tmp31, %while.body.i ], [ 0, %entry ]
  %tmp31 = add i64 %indvar.i, 1
  %scevgep32 = getelementptr i32* %one, i64 %tmp31
  %scevgep34 = getelementptr i32* %one, i64 %indvar.i
  %scevgep3435 = bitcast i32* %scevgep34 to i8*
  %add.ptr15.i = getelementptr i8* %scevgep3435, i64 2
  %incdec.ptr.i = getelementptr i8* %scevgep3435, i64 1
  %add.ptr6.i = getelementptr i8* %scevgep3435, i64 3
  %tmp8.i = load i8* %add.ptr6.i, align 1
  %0 = bitcast i32* %scevgep34 to i16*
  %1 = load i16* %0, align 4
  %tmp10.i = load i32* %scevgep34, align 4
  %2 = trunc i32 %tmp10.i to i8
  store i8 %2, i8* %add.ptr6.i, align 1
  store i8 %tmp8.i, i8* %scevgep3435, align 4
  %tmp42 = lshr i32 %tmp10.i, 16
  %tmp43 = trunc i32 %tmp42 to i8
  %tmp44 = lshr i16 %1, 8
  %tmp45 = trunc i16 %tmp44 to i8
  store i8 %tmp45, i8* %add.ptr15.i, align 2
  store i8 %tmp43, i8* %incdec.ptr.i, align 1
  %cmp.i = icmp ult i32* %scevgep32, %add.ptr.i
  br i1 %cmp.i, label %while.body.i, label %while.body.i19

while.body.i19:                                   ; preds = %while.body.i, %while.body.i19
  %indvar.i2 = phi i64 [ %tmp21, %while.body.i19 ], [ 0, %while.body.i ]
  %tmp21 = add i64 %indvar.i2, 1
  %scevgep = getelementptr i32* %one, i64 %tmp21
  %scevgep23 = getelementptr i32* %one, i64 %indvar.i2
  %scevgep2324 = bitcast i32* %scevgep23 to i8*
  %add.ptr15.i10 = getelementptr i8* %scevgep2324, i64 2
  %incdec.ptr.i8 = getelementptr i8* %scevgep2324, i64 1
  %add.ptr6.i6 = getelementptr i8* %scevgep2324, i64 3
  %tmp8.i13 = load i8* %add.ptr6.i6, align 1
  %3 = bitcast i32* %scevgep23 to i16*
  %4 = load i16* %3, align 4
  %tmp10.i14 = load i32* %scevgep23, align 4
  %5 = trunc i32 %tmp10.i14 to i8
  store i8 %5, i8* %add.ptr6.i6, align 1
  store i8 %tmp8.i13, i8* %scevgep2324, align 4
  %tmp46 = lshr i32 %tmp10.i14, 16
  %tmp47 = trunc i32 %tmp46 to i8
  %tmp48 = lshr i16 %4, 8
  %tmp49 = trunc i16 %tmp48 to i8
  store i8 %tmp49, i8* %add.ptr15.i10, align 2
  store i8 %tmp47, i8* %incdec.ptr.i8, align 1
  %cmp.i17 = icmp ult i32* %scevgep, %add.ptr.i
  br i1 %cmp.i17, label %while.body.i19, label %foo.exit20

foo.exit20:                                       ; preds = %while.body.i19
  %tmp = load i32* %one, align 4
  %cmp = icmp eq i32 %tmp, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit20
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit20
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
