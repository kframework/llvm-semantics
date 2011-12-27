; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030224-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.jint16_t = type <{ i16 }>
%struct.node = type <{ %struct.jint16_t, %struct.jint16_t, i32 }>

@node = common global %struct.node zeroinitializer, align 1
@node_p = global %struct.node* @node, align 8

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
  %marker = alloca %struct.node, align 1
  %.compoundliteral = alloca %struct.jint16_t, align 1
  %.compoundliteral2 = alloca %struct.jint16_t, align 1
  store i32 0, i32* %retval
  %magic = getelementptr inbounds %struct.node* %marker, i32 0, i32 0
  %v16 = getelementptr inbounds %struct.jint16_t* %.compoundliteral, i32 0, i32 0
  store i16 6533, i16* %v16, align 1
  %tmp = bitcast %struct.jint16_t* %magic to i8*
  %tmp1 = bitcast %struct.jint16_t* %.compoundliteral to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* %tmp1, i64 2, i32 1, i1 false)
  %nodetype = getelementptr inbounds %struct.node* %marker, i32 0, i32 1
  %v163 = getelementptr inbounds %struct.jint16_t* %.compoundliteral2, i32 0, i32 0
  store i16 8195, i16* %v163, align 1
  %tmp4 = bitcast %struct.jint16_t* %nodetype to i8*
  %tmp5 = bitcast %struct.jint16_t* %.compoundliteral2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* %tmp5, i64 2, i32 1, i1 false)
  %totlen = getelementptr inbounds %struct.node* %marker, i32 0, i32 2
  %tmp6 = load %struct.node** @node_p, align 8
  %totlen7 = getelementptr inbounds %struct.node* %tmp6, i32 0, i32 2
  %tmp8 = load i32* %totlen7, align 1
  store i32 %tmp8, i32* %totlen, align 1
  %magic9 = getelementptr inbounds %struct.node* %marker, i32 0, i32 0
  %v1610 = getelementptr inbounds %struct.jint16_t* %magic9, i32 0, i32 0
  %tmp11 = load i16* %v1610, align 1
  %conv = sext i16 %tmp11 to i32
  %cmp = icmp ne i32 %conv, 6533
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %nodetype13 = getelementptr inbounds %struct.node* %marker, i32 0, i32 1
  %v1614 = getelementptr inbounds %struct.jint16_t* %nodetype13, i32 0, i32 0
  %tmp15 = load i16* %v1614, align 1
  %conv16 = sext i16 %tmp15 to i32
  %cmp17 = icmp ne i32 %conv16, 8195
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
