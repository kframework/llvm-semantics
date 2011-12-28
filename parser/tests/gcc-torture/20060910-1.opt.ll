; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060910-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.input_ty = type { i8*, i8* }

@b = common global [6 x i8] zeroinitializer, align 1
@s = common global %struct.input_ty zeroinitializer, align 8

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

define i32 @input_getc_complicated(%struct.input_ty* nocapture %x) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @check_header(%struct.input_ty* %deeper) nounwind uwtable {
entry:
  %buffer_position = getelementptr inbounds %struct.input_ty* %deeper, i64 0, i32 0
  %buffer_end = getelementptr inbounds %struct.input_ty* %deeper, i64 0, i32 1
  %tmp4 = load i8** %buffer_end, align 8
  %buffer_position.promoted = load i8** %buffer_position, align 8
  %cmp5 = icmp ult i8* %buffer_position.promoted, %tmp4
  %incdec.ptr = getelementptr inbounds i8* %buffer_position.promoted, i64 1
  %incdec.ptr3 = select i1 %cmp5, i8* %incdec.ptr, i8* %buffer_position.promoted
  %cmp5.1 = icmp ult i8* %incdec.ptr3, %tmp4
  %incdec.ptr.1 = getelementptr inbounds i8* %incdec.ptr3, i64 1
  %incdec.ptr3.1 = select i1 %cmp5.1, i8* %incdec.ptr.1, i8* %incdec.ptr3
  %cmp5.2 = icmp ult i8* %incdec.ptr3.1, %tmp4
  %incdec.ptr.2 = getelementptr inbounds i8* %incdec.ptr3.1, i64 1
  %incdec.ptr3.2 = select i1 %cmp5.2, i8* %incdec.ptr.2, i8* %incdec.ptr3.1
  %cmp5.3 = icmp ult i8* %incdec.ptr3.2, %tmp4
  %incdec.ptr.3 = getelementptr inbounds i8* %incdec.ptr3.2, i64 1
  %incdec.ptr3.3 = select i1 %cmp5.3, i8* %incdec.ptr.3, i8* %incdec.ptr3.2
  %cmp5.4 = icmp ult i8* %incdec.ptr3.3, %tmp4
  %incdec.ptr.4 = getelementptr inbounds i8* %incdec.ptr3.3, i64 1
  %incdec.ptr3.4 = select i1 %cmp5.4, i8* %incdec.ptr.4, i8* %incdec.ptr3.3
  %cmp5.5 = icmp ult i8* %incdec.ptr3.4, %tmp4
  %incdec.ptr.5 = getelementptr inbounds i8* %incdec.ptr3.4, i64 1
  %incdec.ptr3.5 = select i1 %cmp5.5, i8* %incdec.ptr.5, i8* %incdec.ptr3.4
  store i8* %incdec.ptr3.5, i8** %buffer_position, align 8
  ret i32 1
}

define i32 @main() nounwind uwtable {
if.end3:
  store i8* getelementptr inbounds ([6 x i8]* @b, i64 1, i64 0), i8** getelementptr inbounds (%struct.input_ty* @s, i64 0, i32 1), align 8
  store i8* getelementptr inbounds ([6 x i8]* @b, i64 1, i64 0), i8** getelementptr inbounds (%struct.input_ty* @s, i64 0, i32 0), align 8
  ret i32 0
}
