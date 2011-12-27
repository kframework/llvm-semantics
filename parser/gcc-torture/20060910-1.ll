; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.input_ty = type { i8*, i8* }

@b = common global [6 x i8] zeroinitializer, align 1
@s = common global %struct.input_ty zeroinitializer, align 8

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

define i32 @input_getc_complicated(%struct.input_ty* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.input_ty*, align 8
  store %struct.input_ty* %x, %struct.input_ty** %x.addr, align 8
  ret i32 0
}

define i32 @check_header(%struct.input_ty* %deeper) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %deeper.addr = alloca %struct.input_ty*, align 8
  %len = alloca i32, align 4
  store %struct.input_ty* %deeper, %struct.input_ty** %deeper.addr, align 8
  store i32 0, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %len, align 4
  %cmp = icmp ult i32 %tmp, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_position = getelementptr inbounds %struct.input_ty* %tmp1, i32 0, i32 0
  %tmp2 = load i8** %buffer_position, align 8
  %tmp3 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_end = getelementptr inbounds %struct.input_ty* %tmp3, i32 0, i32 1
  %tmp4 = load i8** %buffer_end, align 8
  %cmp5 = icmp ult i8* %tmp2, %tmp4
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %tmp6 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_position7 = getelementptr inbounds %struct.input_ty* %tmp6, i32 0, i32 0
  %tmp8 = load i8** %buffer_position7, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp8, i32 1
  store i8* %incdec.ptr, i8** %buffer_position7, align 8
  %tmp9 = load i8* %tmp8
  %conv = zext i8 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %tmp10 = load %struct.input_ty** %deeper.addr, align 8
  %call = call i32 @input_getc_complicated(%struct.input_ty* %tmp10)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %cmp11 = icmp slt i32 %cond, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %cond.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp13 = load i32* %len, align 4
  %inc = add i32 %tmp13, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([6 x i8]* @b, i32 0, i32 0), i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 0), align 8
  store i8* getelementptr inbounds ([6 x i8]* @b, i64 1, i64 0), i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 1), align 8
  %call = call i32 @check_header(%struct.input_ty* @s)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp = load i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 0), align 8
  %tmp1 = load i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 1), align 8
  %cmp = icmp ne i8* %tmp, %tmp1
  br i1 %cmp, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
