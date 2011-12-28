; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011126-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"aab\00", align 1

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
  %out = alloca [4 x i8], align 1
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [4 x i8]* %out, i32 0, i32 0
  %call = call i8* @test(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %arraydecay)
  ret i32 0
}

define internal i8* @test(i8* %in, i8* %out) nounwind uwtable {
entry:
  %in.addr = alloca i8*, align 8
  %out.addr = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i8* %in, i8** %in.addr, align 8
  store i8* %out, i8** %out.addr, align 8
  br label %while.body

while.body:                                       ; preds = %entry, %if.end32
  %tmp = load i8** %in.addr, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp eq i32 %conv, 97
  br i1 %cmp, label %if.then, label %if.end32

if.then:                                          ; preds = %while.body
  %tmp4 = load i8** %in.addr, align 8
  %add.ptr = getelementptr inbounds i8* %tmp4, i64 1
  store i8* %add.ptr, i8** %p, align 8
  br label %while.cond5

while.cond5:                                      ; preds = %while.body11, %if.then
  %tmp6 = load i8** %p, align 8
  %tmp7 = load i8* %tmp6
  %conv8 = sext i8 %tmp7 to i32
  %cmp9 = icmp eq i32 %conv8, 120
  br i1 %cmp9, label %while.body11, label %while.end

while.body11:                                     ; preds = %while.cond5
  %tmp12 = load i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp12, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  br label %while.cond5

while.end:                                        ; preds = %while.cond5
  %tmp13 = load i8** %p, align 8
  %tmp14 = load i8* %tmp13
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp eq i32 %conv15, 98
  br i1 %cmp16, label %if.then18, label %if.end

if.then18:                                        ; preds = %while.end
  %tmp19 = load i8** %p, align 8
  ret i8* %tmp19

if.end:                                           ; preds = %while.end
  br label %while.cond20

while.cond20:                                     ; preds = %while.body25, %if.end
  %tmp21 = load i8** %in.addr, align 8
  %tmp22 = load i8** %p, align 8
  %cmp23 = icmp ult i8* %tmp21, %tmp22
  br i1 %cmp23, label %while.body25, label %while.end31

while.body25:                                     ; preds = %while.cond20
  %tmp26 = load i8** %in.addr, align 8
  %incdec.ptr27 = getelementptr inbounds i8* %tmp26, i32 1
  store i8* %incdec.ptr27, i8** %in.addr, align 8
  %tmp28 = load i8* %tmp26
  %tmp29 = load i8** %out.addr, align 8
  %incdec.ptr30 = getelementptr inbounds i8* %tmp29, i32 1
  store i8* %incdec.ptr30, i8** %out.addr, align 8
  store i8 %tmp28, i8* %tmp29
  br label %while.cond20

while.end31:                                      ; preds = %while.cond20
  br label %if.end32

if.end32:                                         ; preds = %while.end31, %while.body
  br label %while.body
}
