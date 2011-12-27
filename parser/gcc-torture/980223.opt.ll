; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/980223.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.object = type { i8*, i64 }

@nil = common global i32 0, align 4
@cons1 = global [2 x %struct.object] [%struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@cons2 = global [2 x %struct.object] [%struct.object { i8* bitcast ([2 x %struct.object]* @cons1 to i8*), i64 64 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16

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

define %struct.object @bar(i8* %blah.coerce0, i64 %blah.coerce1) noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define %struct.object @foo(i8* %x.coerce0, i64 %x.coerce1, i8* %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %tmp7.0 = bitcast i8* %x.coerce0 to i8**
  %tmp8 = load i8** %tmp7.0, align 8
  %tmp7.1 = getelementptr inbounds i8* %x.coerce0, i64 8
  %0 = bitcast i8* %tmp7.1 to i64*
  %tmp11 = load i64* %0, align 8
  %and = and i64 %tmp11, 64
  %tobool = icmp eq i64 %and, 0
  br i1 %tobool, label %if.end17, label %if.then

if.then:                                          ; preds = %entry
  %add.ptr = getelementptr inbounds i8* %tmp8, i64 16
  %add.ptr15.0 = bitcast i8* %add.ptr to i8**
  %tmp16 = load i8** %add.ptr15.0, align 8
  %add.ptr15.1 = getelementptr inbounds i8* %tmp8, i64 24
  %1 = bitcast i8* %add.ptr15.1 to i64*
  %tmp17 = load i64* %1, align 8
  %tmp91.1 = getelementptr inbounds i8* %tmp8, i64 8
  %2 = bitcast i8* %tmp91.1 to i64*
  %tmp4 = load i64* %2, align 8
  %and14 = and i64 %tmp4, 64
  %tobool15 = icmp eq i64 %and14, 0
  br i1 %tobool15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.then
  %call = tail call %struct.object @bar(i8* %tmp16, i64 %tmp17)
  unreachable

if.end17:                                         ; preds = %if.then, %entry
  %y.coerce123 = phi i64 [ %tmp17, %if.then ], [ %y.coerce1, %entry ]
  %y.coerce022 = phi i8* [ %tmp16, %if.then ], [ %y.coerce0, %entry ]
  %insert = insertvalue %struct.object undef, i8* %y.coerce022, 0
  %insert21 = insertvalue %struct.object %insert, i64 %y.coerce123, 1
  ret %struct.object %insert21
}

define i32 @main() nounwind uwtable {
entry:
  %tmp8.i = load i8** getelementptr inbounds ([2 x %struct.object]* @cons2, i64 0, i64 0, i32 0), align 16
  %tmp11.i = load i64* getelementptr inbounds ([2 x %struct.object]* @cons2, i64 0, i64 0, i32 1), align 8
  %and.i = and i64 %tmp11.i, 64
  %tobool.i = icmp eq i64 %and.i, 0
  br i1 %tobool.i, label %foo.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %tmp91.1.i = getelementptr inbounds i8* %tmp8.i, i64 8
  %0 = bitcast i8* %tmp91.1.i to i64*
  %tmp4.i = load i64* %0, align 8
  %and14.i = and i64 %tmp4.i, 64
  %tobool15.i = icmp eq i64 %and14.i, 0
  br i1 %tobool15.i, label %foo.exit, label %if.then16.i

if.then16.i:                                      ; preds = %if.then.i
  %add.ptr15.1.i = getelementptr inbounds i8* %tmp8.i, i64 24
  %add.ptr.i = getelementptr inbounds i8* %tmp8.i, i64 16
  %1 = bitcast i8* %add.ptr15.1.i to i64*
  %add.ptr15.0.i = bitcast i8* %add.ptr.i to i8**
  %tmp16.i = load i8** %add.ptr15.0.i, align 8
  %tmp17.i = load i64* %1, align 8
  %call.i = tail call %struct.object @bar(i8* %tmp16.i, i64 %tmp17.i) nounwind
  unreachable

foo.exit:                                         ; preds = %entry, %if.then.i
  ret i32 0
}
