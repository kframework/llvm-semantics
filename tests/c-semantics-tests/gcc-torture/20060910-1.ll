; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060910-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.input_ty = type { i8*, i8* }

@b = common global [6 x i8] zeroinitializer, align 1
@s = common global %struct.input_ty zeroinitializer, align 8

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
  %0 = load i32* %len, align 4
  %cmp = icmp ult i32 %0, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_position = getelementptr inbounds %struct.input_ty* %1, i32 0, i32 0
  %2 = load i8** %buffer_position, align 8
  %3 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_end = getelementptr inbounds %struct.input_ty* %3, i32 0, i32 1
  %4 = load i8** %buffer_end, align 8
  %cmp1 = icmp ult i8* %2, %4
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %5 = load %struct.input_ty** %deeper.addr, align 8
  %buffer_position2 = getelementptr inbounds %struct.input_ty* %5, i32 0, i32 0
  %6 = load i8** %buffer_position2, align 8
  %incdec.ptr = getelementptr inbounds i8* %6, i32 1
  store i8* %incdec.ptr, i8** %buffer_position2, align 8
  %7 = load i8* %6, align 1
  %conv = zext i8 %7 to i32
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %8 = load %struct.input_ty** %deeper.addr, align 8
  %call = call i32 @input_getc_complicated(%struct.input_ty* %8)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %call, %cond.false ]
  %cmp3 = icmp slt i32 %cond, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %cond.end
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32* %len, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %10 = load i32* %retval
  ret i32 %10
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
  %0 = load i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 0), align 8
  %1 = load i8** getelementptr inbounds (%struct.input_ty* @s, i32 0, i32 1), align 8
  %cmp = icmp ne i8* %0, %1
  br i1 %cmp, label %if.then1, label %if.end2

if.then1:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end2:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
